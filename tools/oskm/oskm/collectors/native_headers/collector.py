"""Map installed Native SDK ELF modules to SDK header files.

The preferred source is ``interface/sdk_c/**/BUILD.gn``. The GN template's
``system_capability_headers`` declaration is authoritative for the mapping.
When a library has no such declaration, the ``@library`` Doxygen tag in each
SDK header is used. Exported symbols are only a last-resort fallback for
upstream libraries such as libuv.
"""
from __future__ import annotations

from collections import defaultdict
from pathlib import Path
import re

from ..elf_modules.elf import BoundedReader, ElfFormatError, read_elf
from ...core.framework import BaseCollector, ScanContext, register
from ...core.io import InputFailure
from oskm_schema.native import NATIVE_HEADERS
from .models import NativeHeaderResult, NativeHeaderScanRequest


_LIBRARY_TAG = re.compile(r"^\s*\*\s*@library\s+([A-Za-z0-9_.+-]+)", re.MULTILINE)
_SDK_HEADERS_OUT_DIR = re.compile(
    r"^(?:\$\{?(?:ndk|native)_headers_out_dir\}?/?)")
_LIBRARY_TEMPLATES = ("ohos_ndk_library", "ohos_native_library")
_HEADER_TEMPLATES = ("ohos_ndk_headers", "ohos_native_headers")


def _gn_block_end(text, start):
    depth = 0
    for match in re.finditer(r'"(?:\\.|[^"\\])*"|[{}]', text[start:]):
        token = match.group(0)
        if token == '{':
            depth += 1
        elif token == '}':
            depth -= 1
            if depth == 0:
                return start + match.start()
    return None


def _gn_blocks(text, keyword):
    blocks = []
    pattern = rf'{keyword}\s*\(\s*"([^"]+)"\s*\)\s*\{{'
    for match in re.finditer(pattern, text):
        start = match.end() - 1
        end = _gn_block_end(text, start)
        if end is not None:
            blocks.append((match.group(1), text[start + 1:end - 1]))
    return blocks


def _gn_scalar(body, key):
    match = re.search(rf'^\s*{re.escape(key)}\s*=\s*"([^"]*)"', body, re.MULTILINE)
    return match.group(1) if match else None


def _gn_strings(body, key):
    match = re.search(rf'^\s*{re.escape(key)}\s*=\s*\[(.*?)\]', body,
                      re.MULTILINE | re.DOTALL)
    return re.findall(r'"([^"]*)"', match.group(1)) if match else []


def _normalize_dest_dir(value):
    return _SDK_HEADERS_OUT_DIR.sub('', value or '').strip('/')


class NativeHeadersContext(ScanContext):
    """No domain-specific state; roots are resolved on demand."""

    def setup(self):
        pass


    @staticmethod
    def _version_key(path: Path):
        version = path.parent.name
        parts = version.split(".")
        if parts and all(part.isdigit() for part in parts):
            return (1, tuple(int(part) for part in parts), path.name)
        return (0, version, path.name)


    def sdk_native_root(self) -> Path | None:
        configured = self.request.option("native_headers", "sdk_native_root")
        if configured is not None:
            path = Path(configured)
            if not path.is_absolute():
                path = self.workspace / path
            try:
                resolved = path.resolve()
                if not resolved.is_relative_to(self.workspace):
                    raise ValueError()
                if not resolved.is_dir():
                    raise ValueError()
            except (TypeError, ValueError, OSError, RuntimeError):
                self.issue(self.workspace, "Native SDK_SDK_ROOT_INVALID", advisory=True,
                           details={"path": str(configured)})
                return None
            return resolved

        root = self.workspace / "prebuilts/ohos-sdk/linux"
        try:
            candidates = tuple(sorted(
                path for path in root.glob("*/native")
                if path.is_dir() and path.resolve().is_relative_to(self.workspace)
            ))
        except (OSError, RuntimeError):
            candidates = ()
        if not candidates:
            self.issue(root, "Native SDK_SDK_ROOT_UNAVAILABLE", advisory=True)
            return None
        if len(candidates) == 1:
            return candidates[0]
        best = max(candidates, key=self._version_key)
        if sum(self._version_key(path) == self._version_key(best)
               for path in candidates) > 1:
            self.issue(root, "Native SDK_SDK_ROOT_AMBIGUOUS", advisory=True,
                       details={"candidates": [str(path) for path in candidates]})
            return None
        return best


    def read_sdk_elf(self, path: Path):
        self.check()
        try:
            resolved = path.resolve()
            if not resolved.is_relative_to(self.workspace):
                raise ElfFormatError("ELF_OUTSIDE_PACKAGE")
            stat = path.stat()
            if stat.st_size > self.limits.file_bytes:
                raise ElfFormatError("ELF_SIZE_LIMIT")
            handle = path.open("rb")
        except ElfFormatError:
            raise
        except (OSError, RuntimeError):
            raise ElfFormatError("ELF_UNREADABLE")

        self.track((path,))
        self.scan_directories.add(str(path.parent))
        reader = BoundedReader(handle, self.limits.file_bytes,
                               self.limits.total_bytes, self.used_bytes)
        try:
            return read_elf(reader)
        finally:
            self.used_bytes = reader.used
            handle.close()



@register
class NativeHeadersCollector(BaseCollector):
    NAME = "native_headers"
    DESCRIPTION = "Map Native SDK ELF modules to SDK header files"
    DEPENDS_ON = ("elf_modules",)
    SCHEMA_VERSION = "1.2.0"
    TABLES = (NATIVE_HEADERS,)
    CONTEXT_TYPE = NativeHeadersContext
    REQUEST_TYPE = NativeHeaderScanRequest
    REQUEST_TYPE_ERROR = "EXPECTED_SCAN_REQUEST"
    RESULT_TYPE = NativeHeaderResult
    RESULT_FIELD = "native_headers"
    EXPORT_ORDER = "elf_module_id, header_path"
    ISSUE_FIELDS = ("path", "pointer", "code", "severity", "advisory", "details")
    ISSUE_ORDER = ("path", "pointer", "code")

    def collect(self, ctx):
        if ctx.upstream.failed("elf_modules"):
            ctx.issue(ctx.workspace, "Native SDK_ELF_MODULES_UNAVAILABLE", advisory=True)
            return
        if not ctx.upstream.ran("elf_modules"):
            return

        rows = ctx.connection.execute(
            "SELECT id, file_name, soname FROM elf_modules "
            "WHERE scan_id = ? AND json_extract(category, '$') LIKE '%native%' "
            "ORDER BY id", (ctx.scan_id,)).fetchall()
        if not rows:
            return

        sdk_root = ctx.sdk_native_root()
        if sdk_root is None:
            return
        include = sdk_root / "sysroot/usr/include"
        if not include.is_dir():
            ctx.issue(sdk_root, "Native SDK_HEADER_ROOT_UNAVAILABLE", advisory=True)
            return

        build_mappings, source_headers = self._parse_build_gn(ctx)
        library_headers = self._scan_headers(ctx, include)

        unresolved = []
        for row in rows:
            so_name = row["soname"] or row["file_name"]
            mapping = build_mappings.get(so_name)
            if mapping is not None:
                self._emit(ctx, row["id"], mapping, "build_gn")
                continue

            headers = library_headers.get(so_name, ())
            if headers:
                headers = tuple(self._source_header(source_headers, header)
                                for header in headers)
                if all(headers):
                    self._emit(ctx, row["id"], headers, "header_library")
                continue

            headers, symbols = self._symbol_headers(ctx, sdk_root, include, so_name)
            if headers:
                headers = tuple(self._source_header(source_headers, header)
                                for header in headers)
                if all(headers):
                    self._emit(ctx, row["id"], headers, "symbol")
                continue
            unresolved.append(so_name)

        if unresolved:
            ctx.issue(ctx.workspace, "Native SDK_HEADER_MAPPING_UNRESOLVED", advisory=True,
                      severity="info",
                      details={"libraries": sorted(set(unresolved))[:100],
                               "total_count": len(set(unresolved))})


    @staticmethod
    def _gn_source_path(build_dir, source, workspace):
        if source.startswith("//"):
            path = (workspace / source[2:]).resolve()
        else:
            path = (build_dir / source).resolve()
        return path.relative_to(workspace).as_posix()


    @staticmethod
    def _source_header(source_headers, installed):
        exact = source_headers["by_output"].get(installed)
        if exact is not None:
            return exact
        matches = source_headers["by_name"].get(Path(installed).name, [])
        return matches[0] if len(matches) == 1 else None


    def scope(self, ctx):
        return "elf_modules(category contains native) -> interface/sdk_c headers"


    @staticmethod
    def _header_outputs(source_path, resolved, dest, workspace):
        source_name = Path(source_path).name
        if not resolved.is_dir():
            installed = (Path(dest) / source_name).as_posix() if dest else source_name
            return [(installed, source_path)]
        outputs = []
        for file in sorted(resolved.rglob("*")):
            if not file.is_file():
                continue
            relative = file.relative_to(resolved)
            installed = ((Path(dest) / source_name / relative).as_posix()
                         if dest else (source_name / relative).as_posix())
            outputs.append((installed, file.relative_to(workspace).as_posix()))
        return outputs


    @staticmethod
    def _record_outputs(outputs, source_headers):
        for installed, source_path in outputs:
            source_headers["by_output"][installed] = source_path
            source_headers["by_name"][Path(source_path).name].append(source_path)


    @staticmethod
    def _declared_headers(declared, outputs):
        headers = set()
        for item in declared:
            item = _SDK_HEADERS_OUT_DIR.sub('', item)
            match = next((source for output, source in outputs
                          if output == item), None)
            if match is not None:
                headers.add(match)
                continue
            matches = [source for output, source in outputs
                       if Path(output).name == Path(item).name]
            if len(matches) == 1:
                headers.add(matches[0])
        return headers


    def _scan_headers(self, ctx, include):
        library_headers = defaultdict(set)
        for path in sorted(include.rglob("*.h")):
            try:
                data = ctx.read_bytes(path, ctx.workspace)
                text = data.decode("utf-8")
            except (InputFailure, UnicodeError) as exc:
                ctx.issue(path, "Native SDK_HEADER_READ_FAILED", advisory=True,
                          details={"reason": str(exc)})
                continue
            ctx.scan_directories.add(str(path.parent))
            relative = path.relative_to(include)
            for library in _LIBRARY_TAG.findall(text):
                if library != "NA":
                    library_headers[library].add(relative)
        return library_headers


    def _parse_build_gn(self, ctx):
        root = ctx.workspace / "interface/sdk_c"
        mappings = {}
        source_headers = {"by_output": {}, "by_name": defaultdict(list)}
        if not root.is_dir():
            ctx.issue(root, "Native SDK_BUILD_GN_ROOT_UNAVAILABLE", advisory=True)
            return mappings, source_headers
        for path in sorted(root.rglob("BUILD.gn")):
            try:
                text = ctx.read_bytes(path, ctx.workspace).decode("utf-8")
            except (InputFailure, UnicodeError) as exc:
                ctx.issue(path, "Native SDK_BUILD_GN_READ_FAILED", advisory=True,
                          details={"reason": str(exc)})
                continue
            ctx.scan_directories.add(str(path.parent))
            text = "\n".join(line.split("#", 1)[0] for line in text.splitlines())
            outputs = self._collect_header_outputs(ctx, path, text)
            self._record_outputs(outputs, source_headers)
            for template in _LIBRARY_TEMPLATES:
                for target, body in _gn_blocks(text, template):
                    declared = _gn_strings(body, "system_capability_headers")
                    if not declared:
                        continue
                    output_name = _gn_scalar(body, "output_name") or target
                    output_extension = (
                        _gn_scalar(body, "output_extension") or "z.so")
                    so_name = f"lib{output_name}.{output_extension}"
                    mappings[so_name] = tuple(sorted(
                        self._declared_headers(declared, outputs)))
        return mappings, source_headers


    def _collect_header_outputs(self, ctx, path, text):
        outputs = []
        for template in _HEADER_TEMPLATES:
            for _, body in _gn_blocks(text, template):
                dest = _normalize_dest_dir(_gn_scalar(body, "dest_dir"))
                for source in _gn_strings(body, "sources"):
                    source_path = self._gn_source_path(path.parent, source,
                                                       ctx.workspace)
                    resolved = ctx.workspace / source_path
                    outputs.extend(self._header_outputs(
                        source_path, resolved, dest, ctx.workspace))
        return outputs


    def _symbol_headers(self, ctx, sdk_root, include, so_name):
        library = sdk_root / "sysroot/usr/lib/x86_64-linux-ohos" / so_name
        if not library.is_file():
            return (), ()
        try:
            info = ctx.read_sdk_elf(library)
        except (ElfFormatError, InputFailure) as exc:
            ctx.issue(library, "Native SDK_SYMBOL_SOURCE_READ_FAILED", advisory=True,
                      details={"reason": str(exc)})
            return (), ()
        symbols = tuple(dict.fromkeys(info.get("exported_symbols", ())))
        if not symbols:
            return (), ()

        scores = {}
        matched_by_header = {}
        call_pattern = re.compile(r"\b([A-Za-z_]\w*)\s*\(")
        for path in sorted(include.rglob("*.h")):
            try:
                text = ctx.read_bytes(path, ctx.workspace).decode("utf-8")
            except (InputFailure, UnicodeError):
                continue
            calls = set(call_pattern.findall(text))
            found = tuple(symbol for symbol in symbols if symbol in calls)
            score = len(found)
            if score:
                relative = path.relative_to(include)
                scores[relative] = score
                matched_by_header[relative] = found
        if not scores:
            return (), symbols

        best_score = max(scores.values())
        best = {path for path, score in scores.items() if score == best_score}
        minimum = min(3, len(symbols))
        if best_score < minimum or len(best) != 1:
            ctx.issue(ctx.workspace, "Native SDK_SYMBOL_MATCH_AMBIGUOUS", advisory=True,
                      details={"library": so_name, "score": best_score,
                               "headers": sorted(path.as_posix() for path in best)[:20]})
            return (), symbols
        selected = next(iter(best))
        selected_headers = matched_by_header.get(selected)
        if selected_headers is None:
            return (), symbols
        return (selected,), selected_headers


    def _emit(self, ctx, elf_module_id, headers, strategy):
        for header in sorted(headers):
            row = {
                "elf_module_id": elf_module_id,
                "header_path": header,
                "match_strategy": strategy,
            }
            ctx.emit("native_headers", row)
