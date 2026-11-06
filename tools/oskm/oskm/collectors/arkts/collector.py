"""Module/Kit collector: isolated parsing, evidence projection, exact linking."""
from dataclasses import replace, asdict
import hashlib
from pathlib import Path

from ...core.framework import BaseCollector, ScanContext, register
from ...core.io import canonical
from ...core.models import RequestError, ScanFatalError
from .backend import Backend, NODE_ROOT
from .discovery import discover
from .models import (BackendLimits, IR_VERSION, PROFILE, ArktsModulesResult,
                     SDK_PATH, NODE_PATH, TYPESCRIPT_PATH)
from . import napi
from .projection import Projection
import oskm_schema
import oskm_schema.arkts
from oskm_schema.arkts import TABLES

# Source files whose content defines what the stored projection means. A change
# here changes input_digest, which invalidates query cursors.
PROJECTION_SOURCES = ('collector.py', 'projection.py', 'discovery.py', 'linking.py',
                      'models.py', 'napi.py', 'quality.py', 'backend.py', 'ir.py')
# 表结构已移到中立包 oskm_schema（采集与查询共用，见
# agentic/docs/standalone-packaging.md §5）。它仍必须进 input_digest——
# 改一列就该让游标失效，这跟它放在哪个目录无关。
SCHEMA_SOURCES = (Path(oskm_schema.arkts.__file__), Path(oskm_schema.base.__file__))


class ArktsContext(ScanContext):
    def setup(self):
        options = self.request.options.get('arkts', {})
        if set(options) - {'startup_seconds', 'file_seconds'}:
            raise RequestError('ARKTS_OPTION_UNKNOWN')
        try:
            self.sdk_root = (self.workspace / SDK_PATH).resolve()
            if not self.sdk_root.is_relative_to(self.workspace):
                raise RequestError('ARKTS_ROOT_OUTSIDE_WORKSPACE')
            if not self.sdk_root.is_dir():
                raise RequestError('ARKTS_ROOT_MISSING')
            self.backend_root = self.workspace / TYPESCRIPT_PATH
            self.node = self.workspace / NODE_PATH
            self.backend_limits = BackendLimits()
            for option in ('startup_seconds', 'file_seconds'):
                if option in options:
                    if type(options[option]) is not int or not 1 <= options[option] <= 300:
                        raise RequestError('ARKTS_INVALID_LIMIT')
                    self.backend_limits = replace(self.backend_limits, **{option: options[option]})
        except (TypeError, ValueError, OSError, RuntimeError) as exc:
            raise RequestError('ARKTS_INVALID_OPTIONS') from exc
        self.limits = replace(self.limits, file_bytes=min(self.limits.file_bytes, self.backend_limits.file_bytes))
        self.scope_data = {}
        self.evidence_bytes = 0


def _digest(paths, root):
    return hashlib.sha256(canonical({p.relative_to(root).as_posix(): hashlib.sha256(p.read_bytes()).hexdigest()
                                     for p in paths})).hexdigest()


def _identity(ctx, projection, backend_identity, napi_map):
    """Everything that decides whether a re-scan would produce the same rows."""
    here = Path(__file__).parent
    identity = dict(
        backend=backend_identity,
        # Hash the adapter's complete implementation as well as the compiler package.
        adapter_digest=_digest(sorted(p for p in NODE_ROOT.rglob('*') if p.is_file() and 'tests' not in p.parts), NODE_ROOT),
        projection_digest=_digest([here / name for name in sorted(PROJECTION_SOURCES)], here),
        schema_digest=_digest(sorted(SCHEMA_SOURCES), Path(oskm_schema.__file__).parent),
        profile=PROFILE, ir_schema_version=IR_VERSION,
        sdk_root=ctx.relative(ctx.sdk_root), limits=asdict(ctx.backend_limits), scan_limits=asdict(ctx.limits),
        discovery=dict(complete=ctx.discovery_complete, issues=sorted(
            (i['path'], i['code']) for i in ctx.issues.values() if i['code'].startswith('ARKTS_DISCOVERY_'))),
        repos=projection.repo_snapshots,
        # Bundled reference data is pinned to the scanner, not to the scanned
        # tree, so a new map must change the scan identity.
        napi_map=dict(sha256=napi_map['sha256'], entries=len(napi_map['module_to_so'])),
        # Content identity of all discovered files. The per-file list itself is
        # not stored: those hashes are already columns on arkts_sources.
        files_digest=projection.files_digest())
    return {**identity, 'input_digest': hashlib.sha256(canonical(identity)).hexdigest(),
            'quality': projection.quality(), 'repos_status': ctx.upstream.status('repos'),
            'counts': projection.counts(), 'coverage': projection.coverage(),
            'evidence_bytes': ctx.evidence_bytes}


@register
class ArktsCollector(BaseCollector):
    NAME = 'arkts'
    DESCRIPTION = 'Collect SDK declaration modules, Kits and direct source evidence'
    DEPENDS_ON = ('repos',)
    SCHEMA_VERSION = '7.0.0'
    TABLES = TABLES
    CONTEXT_TYPE = ArktsContext
    RESULT_FIELD = 'modules'
    RESULT_TYPE = ArktsModulesResult
    EXPORT_ORDER = 'module_key'
    ISSUE_FIELDS = ('path', 'pointer', 'code', 'severity', 'advisory', 'details')
    ATTRIBUTION_PREFIXES = ('ARKTS_SOURCE_', 'ARKTS_LINK_')
    # Temporary business key carried on a row -> (table that owns it, FK column).
    REFERENCES = (('_kit_key', 'arkts_kits', 'kit_id'),
                  ('_module_key', 'arkts_modules', 'module_id'),
                  ('_source_file', 'arkts_sources', 'source_id'))

    def collect(self, ctx):
        files = discover(ctx)
        projection = Projection(ctx, files)
        with Backend(ctx.backend_root, ctx.node, limits=ctx.backend_limits, check=ctx.check) as backend:
            for position, item in enumerate(files):
                ctx.progress('arkts:parse', position, len(files), item.key)
                row = projection.declare(item)
                data = projection.read(item, row)
                if data is None:
                    continue
                projection.absorb(item, row, data, backend.parse(
                    item.key, 'kit' if item.role == 'kit_entry' else 'module', data,
                    depth=ctx.limits.tree_depth, references=ctx.limits.tree_items))
            backend_identity = backend.identity
        projection.link()
        # The implementation map is bundled reference data, not a downstream
        # collector's output, so arkts can consume it directly; only turning a
        # .so path into an elf_modules id has to wait for arkts_links.
        napi_map = napi.load()
        matched, unmatched = napi.match(napi_map['module_to_so'], projection.modules)
        projection.finalise(matched)
        projection.implementations(matched)
        if unmatched:
            # Anchored on the SDK root, not on the map: the map lives inside
            # the package, which need not be under the scanned workspace, and
            # the finding is about SDK modules anyway. Grouped by reason so
            # 'no public declaration' is not mixed with 'the name is ambiguous'.
            reasons = {}
            for name, reason in sorted(unmatched.items()):
                reasons.setdefault(reason, []).append(name)
            ctx.issue(ctx.sdk_root, 'ARKTS_NAPI_MODULE_UNMATCHED', severity='info', advisory=True,
                      details=dict(by_reason={k: v[:100] for k, v in reasons.items()},
                                   counts={k: len(v) for k, v in reasons.items()},
                                   total_count=len(unmatched), map_sha256=napi_map['sha256']))
        if not projection.repo_snapshots:
            ctx.issue(ctx.sdk_root, 'ARKTS_SOURCE_UNAVAILABLE', severity='info', advisory=True,
                      details={'upstream_status': ctx.upstream.status('repos')})
        projection.diagnostics.emit(ctx)
        ctx.scope_data = _identity(ctx, projection, backend_identity, napi_map)
        for table in TABLES:
            for row in projection.rows(table):
                ctx.emit(table.name, row)

    def scope(self, ctx):
        return ctx.scope_data

    @classmethod
    def resolve_rows(cls, table, rows, keys):
        for row in rows:
            row = dict(row)
            for temporary, target, column in cls.REFERENCES:
                if temporary in row:
                    key = row.pop(temporary)
                    if key not in keys[target]:
                        raise ScanFatalError('ARKTS_REFERENCE_INCONSISTENT')
                    row[column] = keys[target][key]
            yield row

    @classmethod
    def export_record(cls, row, connection, scan_id):
        from oskm_schema.arkts_records import publish
        return publish(row, cls.TABLES[0])

    @classmethod
    def post_insert(cls, connection, scan_id):
        # Evidence has to live in a declaration of the entity it is about:
        # a @kit tag in one of the module's own files, an import in one of the
        # Kit's own entry files.
        invalid = connection.execute(
            'SELECT 1 FROM arkts_kit_relations r JOIN arkts_kits k ON k.id=r.kit_id '
            'JOIN arkts_sources s ON s.id=r.source_id '
            'LEFT JOIN arkts_modules m ON m.id=r.module_id '
            'WHERE r.scan_id=? AND (k.scan_id!=r.scan_id OR s.scan_id!=r.scan_id OR m.scan_id!=r.scan_id '
            "OR (r.relation_type='declared_membership' AND s.module_id IS NOT r.module_id) "
            "OR (r.relation_type='entry_reference' AND s.kit_id IS NOT r.kit_id)) LIMIT 1", (scan_id,)).fetchone()
        if invalid:
            raise ScanFatalError('ARKTS_REFERENCE_INCONSISTENT')
