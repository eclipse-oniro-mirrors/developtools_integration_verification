"""Service collector: init cfg declarations, attributed to components.

First consumer of the dependency graph: the components rows are already committed
under this scan_id, so ownership reads them from the database instead of
triggering a nested components scan.
"""
from .discovery import discover_configs, read_configs
from .records import make_record, raw_service
from .ownership import link_installs
from . import quality
from .models import ServiceScanRequest, ServiceResult
from ...core.framework import (BaseCollector, ScanContext, project_columns,
                               projection, register)
from ...core.models import RequestError
from ...core.export import rejoin_component, rejoin_install
from ...core.schema import Column, Index, Table

# column, key in the scanned record, how the column holds it
FIELDS = (('cfg', 'cfg', 'text'), ('name', 'name', 'text'), ('type', 'type', 'text'),
          ('executable', 'executable', 'text'), ('uid', 'uid', 'text'),
          ('start_mode', 'start-mode', 'text'), ('ondemand', 'ondemand', 'bool'),
          ('args', 'args', 'json'), ('gid', 'gid', 'json'))

SERVICES = Table(
    'services',
    columns=(
        Column('position', 'INTEGER', nullable=False),
        # Projections of the verbatim record: they make filtering and joining
        # cheap, but `record` stays authoritative (see core.framework.projection).
        Column('cfg', nullable=False),
        Column('name'),
        Column('type'),
        Column('executable'),
        Column('uid'),
        Column('start_mode'),
        Column('ondemand', 'INTEGER'),
        Column('args', 'JSON'),
        Column('gid', 'JSON'),
        Column('secon'),
        Column('sandbox', 'INTEGER'),
        Column('importance', 'INTEGER'),
        Column('component_id', 'INTEGER', references='components(id)'),
        # Which build target installed this cfg. Resolved from the install
        # index by dest, so `label` above and this row agree by construction.
        Column('install_module_id', 'INTEGER', references='install_modules(id)'),
        # The cfg declaration exactly as written. Every column above is a
        # projection of it, kept only for faster access; nothing the scanner
        # derived (cfg path, executable/args split, type, label) lives here.
        Column('record', 'JSON', nullable=False),
    ),
    primary_key=('position',),
    surrogate=True,
    indexes=(Index('idx_services_component', ('scan_id', 'component_id')),
             Index('idx_services_install', ('scan_id', 'install_module_id')),
             Index('idx_services_cfg', ('scan_id', 'cfg'))),
)


class ServicesContext(ScanContext):
    def setup(self):
        if not self.package.is_dir():
            raise RequestError('INPUT_ROOT_MISSING')
        self.scope = set()


@register
class ServicesCollector(BaseCollector):
    NAME = 'services'
    DESCRIPTION = 'Extract OpenHarmony init service declarations'
    DEPENDS_ON = ('components', 'install_modules')
    SCHEMA_VERSION = '4.1.0'
    TABLES = (SERVICES,)
    CONTEXT_TYPE = ServicesContext
    REQUEST_TYPE = ServiceScanRequest
    REQUEST_TYPE_ERROR = 'EXPECTED_SCAN_REQUEST'
    RESULT_TYPE = ServiceResult
    RESULT_FIELD = 'services'
    ROLE = 'service'
    COMPONENT_COLUMN = 'component_id'
    INSTALL_COLUMN = 'install_module_id'
    EXPORT_ORDER = 'position'
    # Attribution issues do not make the service inventory itself incomplete, so
    # HDI/SA host matching stays usable when a cfg simply has no owning component.
    ATTRIBUTION_PREFIXES = ('MODULE_', 'ORIGIN_', 'COMPONENT_', 'BUNDLE_')

    def collect(self, ctx):
        paths = discover_configs(ctx)
        records = list(read_configs(ctx, paths))
        if paths:
            # Ownership and the GN label both come from the module that
            # installed the cfg; nothing is re-derived here.
            link_installs(ctx, records)
        quality.check(ctx, records)
        for position, (record, _) in enumerate(records):
            config = record.get('config') or {}
            component_id = record.pop('component_id', None)
            ctx.emit('services', dict(
                position=position, component_id=component_id,
                install_module_id=record.pop('install_module_id', None),
                secon=projection(config.get('secon')),
                sandbox=projection(config.get('sandbox'), 'int'),
                importance=projection(config.get('importance'), 'int'),
                record=raw_service(record), **project_columns(record, FIELDS)))
        ctx.scan_directories.update(str(ctx.package / p) for p in ctx.scope)

    def scope(self, ctx):
        return sorted(ctx.scope)



    @classmethod
    def export_record(cls, row, connection, scan_id):
        """Published record, regenerated from the declaration plus the links --
        the same transformation the scan applied."""
        from ...core.io import parse_json
        record = make_record(row['cfg'], parse_json(row['record'].encode())[0])
        rejoin_install(record, row, cls, connection, scan_id)
        rejoin_component(record, row, cls, connection, scan_id)
        return record
