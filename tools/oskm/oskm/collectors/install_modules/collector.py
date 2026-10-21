"""Install-module collector: the image install manifest, attributed to components.

system_module_info.json is the only bridge from an image path back to the source
component that produced it. Three tables: one row per declaration, one per
install target (a row may install several), one per innerapi tag.
"""
from .models import InstallModuleScanRequest, InstallModuleResult
from .ownership import attribute
from .records import SHAPE
from . import quality, targets
from .lookup import InstallIndex
from ...core.framework import (READ_ERRORS, ElementCollector, ScanContext, register)
from ...core.provenance import strip_label
from ...core.models import RequestError, ScanFatalError
from ...core.schema import Column, Index, Table

MANIFEST = 'system_module_info.json'

# column, declared key, how the column holds it. part_name / subsystem_name are
# deliberately absent: attribution is component_id alone (see ownership.py).
# `label` is absent too -- its column holds the stripped value, not the
# declaration, so enrich() sets it and OVERLAY restores it on export.
FIELDS = (('label_name', 'label_name', 'text'), ('type', 'type', 'text'),
          ('source', 'source', 'text'), ('install_enable', 'install_enable', 'bool'),
          ('shlib_type', 'shlib_type', 'text'))

INSTALL_MODULES = Table(
    'install_modules',
    columns=(
        Column('ordinal', 'INTEGER', nullable=False),
        # Derived, not projected: the GN label with its toolchain suffix removed.
        Column('label'),
        Column('label_name'),
        Column('type'),
        Column('shlib_type'),
        Column('source'),
        Column('install_enable', 'INTEGER'),
        Column('component_id', 'INTEGER', references='components(id)'),
        # The SMI row exactly as declared, including dest, part_name and
        # subsystem_name -- none of which have columns.
        Column('record', 'JSON', nullable=False),
    ),
    primary_key=('ordinal',),
    surrogate=True,
    # Not unique: rk3568 happens to build every target with one toolchain, but
    # the same target built for two toolchains strips to one label, and that is
    # exactly the case services' ORIGIN_LABEL_AMBIGUOUS exists for.
    indexes=(Index('idx_install_modules_label', ('scan_id', 'label')),
             Index('idx_install_modules_type', ('scan_id', 'type')),
             Index('idx_install_modules_component', ('scan_id', 'component_id'))),
)

INSTALL_TARGETS = Table(
    'install_targets',
    columns=(
        Column('module_id', 'INTEGER', nullable=False, references='install_modules(id)'),
        # The Nth thing this module puts in the image, counting dest[] first and
        # then symlink_file[]. Not a subscript into either array -- nothing maps
        # it back, and both arrays start at 0.
        Column('dest_index', 'INTEGER', nullable=False),
        Column('dest', nullable=False),
        # 1 when the declaration ended in '/': the whole directory belongs to
        # this module, so an exact-path lookup is not enough (see targets.py).
        Column('directory', 'INTEGER', nullable=False, default='0'),
        Column('partition'),
        Column('file_name'),
        # Observed from the package, not declared in SMI -- so deliberately
        # absent from `record`, which stays the verbatim declaration.
        # (Precedent: repos.head_commit is the same kind of observation.)
        #
        # Bytes this entry itself occupies: lstat, never following links.
        # Following them would double-count -- rk3568's one symlink
        # (system/etc/etsstdlib.abc -> ../framework/etsstdlib_bootabc.abc)
        # points at a file that is *also* installed in its own right, so a
        # followed size would add its 1.9 MB to the image total twice.
        # For a directory install it is the sum over the tree below.
        Column('size', 'INTEGER'),
        # The link_target resolved to a full image-relative path (same format
        # as `dest`), so consumers can JOIN on it without resolving ../.
        # For non-symlinks, NULL. `is_symlink` is derivable from it being
        # non-NULL, so no separate column.
        Column('link_target_path'),
        # The install_targets.id of the row whose dest == link_target_path,
        # so consumers can follow the link by row id instead of by path.
        # NULL when the target is not in the same scan (or not a symlink).
        Column('link_target_id', 'INTEGER', references='install_targets(id)'),
    ),
    surrogate=True,
    # (module, path) is the natural key: a module puts one thing at one path.
    # dest_index cannot carry it any more -- dest[] and symlink_file[] are both
    # numbered from 0, so it is now a running ordinal over the two
    # (see symlink-design.md §3.4). Measured: zero duplicate paths within a module.
    indexes=(Index('idx_install_targets_key', ('scan_id', 'module_id', 'dest'),
                   unique=True),
             Index('idx_install_targets_dest', ('scan_id', 'dest')),
             Index('idx_install_targets_partition', ('scan_id', 'partition')),
             Index('idx_install_targets_name', ('scan_id', 'file_name'))),
)

INSTALL_MODULE_TAGS = Table(
    'install_module_tags',
    columns=(
        Column('module_id', 'INTEGER', nullable=False, references='install_modules(id)'),
        Column('source_index', 'INTEGER', nullable=False),
        Column('value', nullable=False),
    ),
    surrogate=True,
    indexes=(Index('idx_install_module_tags_value', ('scan_id', 'value')),
             Index('idx_install_module_tags_module', ('scan_id', 'module_id'))),
)


class InstallModulesContext(ScanContext):
    def setup(self):
        if not self.package.is_dir():
            raise RequestError('INPUT_ROOT_MISSING')
        self.manifest = self.package / MANIFEST


@register
class InstallModulesCollector(ElementCollector):
    NAME = 'install_modules'
    DESCRIPTION = 'Extract the OpenHarmony image install manifest and attribute it'
    DEPENDS_ON = ('components',)
    SCHEMA_VERSION = '1.0.0'
    TABLES = (INSTALL_MODULES, INSTALL_TARGETS, INSTALL_MODULE_TAGS)
    CONTEXT_TYPE = InstallModulesContext
    REQUEST_TYPE = InstallModuleScanRequest
    REQUEST_TYPE_ERROR = 'EXPECTED_SCAN_REQUEST'
    RESULT_TYPE = InstallModuleResult
    RESULT_FIELD = 'install_modules'
    ROLE = 'install_index'
    COMPONENT_COLUMN = 'component_id'
    EXPORT_ORDER = 'ordinal'
    # Attribution findings need their severity and both disputed values to be
    # actionable, so this domain publishes the full issue shape like components.
    ISSUE_FIELDS = ('component', 'path', 'pointer', 'code', 'severity', 'advisory', 'details')
    SHAPE = SHAPE
    FIELDS = FIELDS
    LINK_COLUMNS = ('component_id',)
    OVERLAY = ('label',)
    # Attribution gaps do not make the install inventory itself incomplete: a
    # module whose owning component cannot be named is still a known install.
    # Everything else non-advisory does -- an unreadable manifest or a row that
    # could not be expanded means entries are missing, and consumers that match
    # by path must be told rather than shown a hole.
    ATTRIBUTION_PREFIXES = ('COMPONENT_',)

    def sources(self, ctx):
        return [ctx.manifest]

    def elements(self, ctx, path):
        try:
            rows = ctx.read_json(path, ctx.package)
        except READ_ERRORS as exc:
            # The manifest is the collector's only input: unreadable means no
            # inventory at all, so this degrades the scan rather than crashing
            # it, and every consumer sees an empty, explicitly incomplete index.
            ctx.issue(path, 'MODULE_INFO_UNAVAILABLE',
                      details=dict(reason=getattr(exc, 'code', type(exc).__name__)))
            return
        if not isinstance(rows, list):
            ctx.issue(path, 'MODULE_INFO_NOT_ARRAY')
            return
        if len(rows) > ctx.limits.input_files:
            raise ScanFatalError('MODULE_INPUT_LIMIT')
        for ordinal, raw in enumerate(rows):
            ctx.progress('modules', ordinal, len(rows))
            if not isinstance(raw, dict):
                ctx.issue(path, 'MODULE_ROW_INVALID', f'/{ordinal}')
                continue
            yield (ordinal,), {}, raw, f'/{ordinal}'

    def enrich(self, ctx, records):
        index = ctx.component_index(location=ctx.manifest)
        attribute(ctx, records, None if index is False else index, ctx.manifest)
        targets.expand(ctx, records, ctx.manifest)
        self.expand_tags(ctx, records)

    def expand_tags(self, ctx, records):
        """innerapi_tags names the release class of a built artifact. Expanded
        because json_each can never use an index and "every chipsetsdk module"
        is a real query."""
        for position, (record, _) in enumerate(records):
            tags = (record.get('config') or {}).get('innerapi_tags')
            if not isinstance(tags, list):
                continue
            for index, value in enumerate(tags):
                if isinstance(value, str) and value:
                    ctx.emit('install_module_tags', dict(
                        module_position=position, source_index=index, value=value))

    def columns(self, ctx, record):
        """The label column holds the *stripped* GN label, which is derived, so
        it cannot come from FIELDS -- that would store the declaration's
        toolchain suffix. The record keeps the declaration untouched; a label
        that will not parse leaves the column NULL rather than being indexed as
        though it were a target."""
        label = record.get('label')
        return {'label': strip_label(label) if isinstance(label, str) else None}

    def quality(self, ctx, records):
        quality.check(ctx, records, ctx.manifest)

    @classmethod
    def lookup(cls, connection, scan_id):
        """Index consumers join against: one build per scan, shared by all."""
        rows = lambda table: [dict(r) for r in connection.execute(
            f'SELECT * FROM {table} WHERE scan_id = ?', (scan_id,))]
        return InstallIndex(rows('install_modules'), rows('install_targets'))

    @classmethod
    def resolve_rows(cls, table, rows, keys):
        """Child rows carry the parent's array position; swap it for the real id
        once install_modules has been inserted and its ids exist."""
        if table == 'install_modules':
            return rows
        index = keys.get('install_modules', {})
        return [dict({k: v for k, v in row.items() if k != 'module_position'},
                     module_id=index[row['module_position']]) for row in rows]

    @classmethod
    def post_insert(cls, connection, scan_id):
        """After all install_targets rows are inserted, resolve link_target_id
        by matching link_target_path against dest in the same scan."""
        connection.execute(
            'UPDATE install_targets SET link_target_id = '
            '(SELECT t2.id FROM install_targets t2 '
            ' WHERE t2.scan_id = ? AND t2.dest = install_targets.link_target_path) '
            'WHERE scan_id = ? AND link_target_path IS NOT NULL',
            (scan_id, scan_id))

    def scope(self, ctx):
        return [MANIFEST]
