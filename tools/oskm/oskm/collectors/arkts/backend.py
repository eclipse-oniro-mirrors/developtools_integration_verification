"""Bounded JSONL subprocess transport and strict P1 IR validation."""
import base64
import hashlib
import json
import os
from pathlib import Path
import selectors
import shutil
import signal
import subprocess
import time

from ...core.models import RequestError, ScanFatalError
from ...core.io import parse_json
from .models import BackendLimits, IR_VERSION, PROFILE, PROFILE_CAPABILITIES
from .ir import _require, validate_result

NODE_ROOT = Path(__file__).parent / 'node'


class Backend:
    def __init__(self, package_root, node=None, *, limits=None, check=lambda: None, profile=PROFILE):
        _require(profile in PROFILE_CAPABILITIES, 'PROFILE_UNSUPPORTED')
        self.profile = profile
        self.package_root = Path(package_root).resolve()
        self.node = shutil.which(str(node or 'node'))
        self.limits = limits or BackendLimits()
        self.check = check
        self.process = None
        self.selector = None
        self.buffer = bytearray()
        self.stderr = bytearray()
        self.sequence = 0
        self.lock = json.loads((NODE_ROOT / 'backend-lock.json').read_text())
        self.identity = None

    def __enter__(self):
        if not self.node or not self.package_root.is_dir():
            raise ScanFatalError('BACKEND_UNAVAILABLE')
        try:
            for relative, expected in self.lock['files'].items():
                self.check()
                path = self.package_root / relative
                # package.json is exempt from the byte-for-byte hash: the build
                # rewrites it (npm injects _args/_from/_integrity fields), but its
                # semantic identity (name/version) is still pinned via
                # ohos_ts.cjs. The byte hash would otherwise flake on every
                # rebuild that touches the metadata.
                if relative == 'package.json':
                    continue
                if not path.resolve().is_relative_to(self.package_root) or hashlib.sha256(path.read_bytes()).hexdigest() != expected:
                    raise ScanFatalError('BACKEND_IDENTITY_MISMATCH')
        except OSError as exc:
            raise ScanFatalError('BACKEND_UNAVAILABLE') from exc
        env = {key: val for key, val in os.environ.items() if key not in ('NODE_PATH', 'NODE_OPTIONS')}
        try:
            self.process = subprocess.Popen([str(Path(self.node).resolve()),
                f'--max-old-space-size={self.limits.heap_mb}', str(NODE_ROOT / 'bridge.cjs'),
                str(self.package_root)], stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                stderr=subprocess.PIPE, env=env, start_new_session=True, bufsize=0)
            self.selector = selectors.DefaultSelector()
            for stream in (self.process.stdin, self.process.stdout, self.process.stderr):
                os.set_blocking(stream.fileno(), False)
            for stream in (self.process.stdout, self.process.stderr):
                self.selector.register(stream, selectors.EVENT_READ)
            ready = self._exchange(None, self.limits.startup_seconds)
            _require(set(ready) == {'type', 'protocol_version', 'ir_schema_version', 'adapter_version',
                'node_version', 'backend', 'profiles', 'capabilities'})
            _require(ready['type'] == 'ready')
            for key in ('protocol_version', 'ir_schema_version', 'adapter_version'):
                _require(ready[key] == self.lock[key], 'BACKEND_IDENTITY_MISMATCH')
            _require(ready['node_version'] in self.lock['node_versions'], 'BACKEND_IDENTITY_MISMATCH')
            _require(ready['backend'] == {key: self.lock[key] for key in (
                'package_name', 'package_version', 'compiler_version', 'entry_sha256')}, 'BACKEND_IDENTITY_MISMATCH')
            _require(type(ready['profiles']) is list and all(type(p) is str for p in ready['profiles']) and self.profile in ready['profiles'])
            _require(type(ready['capabilities']) is list)
            capabilities = {}
            for item in ready['capabilities']:
                _require(type(item) is dict and set(item) == {'id', 'version'} and
                         type(item['id']) is str and type(item['version']) is str and item['id'] not in capabilities)
                capabilities[item['id']] = item['version']
            _require(all(capabilities.get(name) == version for name, version in PROFILE_CAPABILITIES[self.profile].items()),
                     'BACKEND_CAPABILITY_MISSING')
            self.identity = ready
            return self
        except (KeyError, TypeError, ValueError) as exc:
            self.close()
            raise ScanFatalError('BACKEND_PROTOCOL_INVALID') from exc
        except BaseException:
            self.close()
            raise

    def _exchange(self, message, timeout):
        outgoing = b'' if message is None else (json.dumps(message, ensure_ascii=True, separators=(',', ':')) + '\n').encode()
        _require(len(outgoing) <= self.limits.request_bytes, 'BACKEND_REQUEST_LIMIT')
        if outgoing:
            self.selector.register(self.process.stdin, selectors.EVENT_WRITE)
        sent = 0
        deadline = time.monotonic() + timeout
        while True:
            self.check()
            if b'\n' in self.buffer:
                line, _, rest = self.buffer.partition(b'\n')
                self.buffer = bytearray(rest)
                _require(not rest and sent == len(outgoing), 'BACKEND_UNEXPECTED_FRAME')
                try:
                    value, duplicates = parse_json(bytes(line))
                    _require(not duplicates and type(value) is dict)
                except (ValueError, UnicodeError, RecursionError) as exc:
                    raise ScanFatalError('BACKEND_PROTOCOL_INVALID') from exc
                if value.get('type') == 'fatal':
                    raise ScanFatalError('BACKEND_FATAL: ' + str(value.get('code', 'unknown'))[:300])
                return value
            remaining = deadline - time.monotonic()
            if remaining <= 0:
                raise ScanFatalError('BACKEND_TIMEOUT')
            for key, event in self.selector.select(min(remaining, 0.1)):
                stream = key.fileobj
                if event & selectors.EVENT_WRITE:
                    try:
                        sent += os.write(stream.fileno(), outgoing[sent:sent + 65536])
                    except BlockingIOError:
                        continue
                    except BrokenPipeError as exc:
                        raise ScanFatalError('BACKEND_EXITED') from exc
                    if sent == len(outgoing):
                        self.selector.unregister(stream)
                else:
                    try:
                        chunk = os.read(stream.fileno(), 65536)
                    except BlockingIOError:
                        continue
                    if not chunk:
                        self.selector.unregister(stream)
                        if stream is self.process.stdout:
                            raise ScanFatalError('BACKEND_EXITED_OR_TRUNCATED')
                        continue
                    if stream is self.process.stderr:
                        self.stderr.extend(chunk)
                        del self.stderr[:-self.limits.stderr_bytes]
                    else:
                        self.buffer.extend(chunk)
                        _require(len(self.buffer) <= self.limits.response_bytes, 'BACKEND_RESPONSE_LIMIT')

    def parse(self, path, role, data, *, depth=128, references=20000):
        data.decode('utf-8', 'strict')
        _require(len(data) <= self.limits.file_bytes, 'BACKEND_INPUT_LIMIT')
        self.sequence += 1
        request = dict(type='parse', id=self.sequence, profile=self.profile, file_role=role,
            ir_schema_version=IR_VERSION, path=path, byte_length=len(data),
            sha256=hashlib.sha256(data).hexdigest(), content_b64=base64.b64encode(data).decode('ascii'),
            limits=dict(depth=min(depth, 128), references=min(references, 20000)))
        try:
            return validate_result(self._exchange(request, self.limits.file_seconds), request, data)
        except (KeyError, TypeError, ValueError, RecursionError) as exc:
            raise ScanFatalError('BACKEND_PROTOCOL_INVALID') from exc

    def close(self):
        if self.selector:
            self.selector.close()
        if self.process:
            if self.process.poll() is None:
                try:
                    os.killpg(self.process.pid, signal.SIGTERM)
                except ProcessLookupError:
                    pass
                try:
                    self.process.wait(timeout=1)
                except subprocess.TimeoutExpired:
                    try:
                        os.killpg(self.process.pid, signal.SIGKILL)
                    except ProcessLookupError:
                        pass
                    self.process.wait(timeout=2)
            for stream in (self.process.stdin, self.process.stdout, self.process.stderr):
                stream.close()

    def __exit__(self, exc_type, exc, traceback):
        try:
            if exc_type is None:
                self.sequence += 1
                result = self._exchange({'type': 'shutdown', 'id': self.sequence}, 2)
                _require(result == {'type': 'closed', 'id': self.sequence})
                try:
                    _require(self.process.wait(timeout=2) == 0, 'BACKEND_EXITED')
                except subprocess.TimeoutExpired as error:
                    raise ScanFatalError('BACKEND_SHUTDOWN_TIMEOUT') from error
        finally:
            self.close()
