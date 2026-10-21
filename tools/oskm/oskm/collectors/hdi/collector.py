"""HDI collector: installed HDF device declarations, joined to their host service
and owning component.

Both dependencies arrive through the database: services rows for host matching,
components rows for attribution. Neither is re-scanned.
"""
from .discovery import discover, read_records
from .records import make_record, raw_hdi
from .linking import link_services
from .ownership import Ownership, link_installs
from . import quality
from .models import HDIScanRequest, HDIResult
from ...core.framework import (BaseCollector, ScanContext, project_columns,
                               projection, register)
from ...core.models import RequestError
from ...core.export import rejoin_component, rejoin_install, rejoin_service
from ...core.schema import Column, Index, Table

FIELDS = (('hcb', 'hcb', 'text'), ('node', 'node', 'text'),
          ('service_name', 'serviceName', 'text'), ('module_name', 'moduleName', 'text'),
          ('library', 'library', 'text'),
          ('policy', 'policy', 'int'),
          ('preload', 'preload', 'int'))

HDIS = Table(
    'hdis',
    columns=(
        Column('position', 'INTEGER', nullable=False),
        # Projections of the verbatim record: they make filtering and joining
        # cheap, but `record` stays authoritative (see core.framework.projection).
        Column('hcb', nullable=False),
        Column('node', nullable=False),
        Column('service_name'),
        Column('module_name'),
        Column('library'),
        Column('policy', 'INTEGER'),
        Column('preload', 'INTEGER'),
        Column('device_match_attr'),
        Column('permission', 'INTEGER'),
        Column('priority', 'INTEGER'),
        Column('service_id', 'INTEGER', references='services(id)'),
        Column('component_id', 'INTEGER', references='components(id)'),
        # Which build target installed `library`. Resolved from the install
        # index by that path, so `label` above and this row agree.
        Column('install_module_id', 'INTEGER', references='install_modules(id)'),
        # The device node's own attributes, exactly as declared in the HCB.
        # The columns above only project it; the host name is resolved from
        # the linked service via service_id.
        Column('record', 'JSON', nullable=False),
    ),
    primary_key=('position',),
    surrogate=True,
    indexes=(Index('idx_hdis_component', ('scan_id', 'component_id')),
             Index('idx_hdis_install', ('scan_id', 'install_module_id')),
             Index('idx_hdis_host', ('scan_id', 'service_id')),
             Index('idx_hdis_node', ('scan_id', 'hcb', 'node'))),
)


class HDIContext(ScanContext):
    def setup(self):
        if not self.package.is_dir():
            raise RequestError('INPUT_ROOT_MISSING')


@register
class HDICollector(BaseCollector):
    NAME = 'hdi'
    DESCRIPTION = 'Extract OpenHarmony HDI device service declarations'
    DEPENDS_ON = ('services', 'components', 'install_modules')
    SCHEMA_VERSION = '2.1.0'
    TABLES = (HDIS,)
    CONTEXT_TYPE = HDIContext
    REQUEST_TYPE = HDIScanRequest
    REQUEST_TYPE_ERROR = 'EXPECTED_HDI_SCAN_REQUEST'
    RESULT_TYPE = HDIResult
    RESULT_FIELD = 'hdis'
    COMPONENT_COLUMN = 'component_id'
    SERVICE_COLUMN = 'service_id'
    INSTALL_COLUMN = 'install_module_id'
    EXPORT_ORDER = 'position'

    def collect(self, ctx):
        ctx.progress('hdi-discovery', 0)
        paths = discover(ctx)
        ctx.hcb_scope = [p.relative_to(ctx.package).as_posix() for p in paths]
        records = read_records(ctx, paths)
        link_services(ctx, records)
        if records:
            # Label and library resolution run regardless; only the binding to a
            # component needs the dependency.
            # Explicit: an empty index means "ran, found nothing" and must still
            # report unregistered names; only False (deselected) becomes None.
            index = ctx.component_index(location=ctx.package)
            index = None if index is False else index
            ownership = Ownership(ctx, records, index)
            for i, record in enumerate(records):
                ctx.progress('hdi-ownership', i, len(records), record['hcb'])
                ownership.apply(record)
        link_installs(ctx, records)
        quality.check(ctx, records)
        for position, record in enumerate(records):
            config = record.get('config') or {}
            ctx.emit('hdis', dict(
                position=position,
                install_module_id=record.pop('install_module_id', None),
                service_id=record.pop('service_id', None),
                component_id=record.pop('component_id', None),
                device_match_attr=projection(config.get('deviceMatchAttr')),
                permission=projection(config.get('permission'), 'int'),
                priority=projection(config.get('priority'), 'int'),
                record=raw_hdi(record), **project_columns(record, FIELDS)))

    def scope(self, ctx):
        return getattr(ctx, 'hcb_scope', [])



    @classmethod
    def export_record(cls, row, connection, scan_id):
        """Published record, regenerated from the declaration plus the derived
        columns -- the same transformation the scan applied."""
        from ...core.io import parse_json
        raw = parse_json(row['record'].encode())[0]
        # The host's name comes from the linked service, not a stored column.
        host = {}
        if row['service_id'] is not None:
            svc = connection.execute(
                'SELECT name FROM services WHERE scan_id = ? AND id = ?',
                (scan_id, row['service_id'])).fetchone()
            if svc and svc['name']:
                host = {'hostName': svc['name']}
        record = make_record(row['hcb'], row['node'], host, raw)
        if row['library'] is not None:
            record['library'] = row['library']
        rejoin_install(record, row, cls, connection, scan_id)
        rejoin_service(record, row, cls, connection, scan_id)
        rejoin_component(record, row, cls, connection, scan_id)
        return record
