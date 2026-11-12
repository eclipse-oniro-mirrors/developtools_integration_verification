"""SA 服务的表结构。

采集侧（`oskm/collectors/system_abilities`）与查询侧（`cli/oskm_cli/`）共用这一份。
放在中立包而不是采集器包里，是为了让 `cli/oskm_cli/` 能独立发布——
理由与被否掉的软链方案见 `docs/architecture/standalone-packaging.md` §5。
"""
from .base import Column, Index, Table


SAS = Table(
    'sas',
    columns=(
        Column('position', 'INTEGER', nullable=False),
        # Projections of the verbatim record: they make filtering and joining
        # cheap, but `record` stays authoritative (see core.framework.projection).
        Column('profile', nullable=False),
        Column('sa_id', 'INTEGER'),
        Column('libpath'),
        Column('run_on_create', 'INTEGER'),
        Column('distributed', 'INTEGER'),
        Column('dump_level', 'INTEGER'),
        Column('auto_restart', 'INTEGER'),
        Column('service_id', 'INTEGER', references='services(id)'),
        Column('component_id', 'INTEGER', references='components(id)'),
        # Which build target installed `libpath`, the SA's implementation
        # library. Not the profile's installer: that is a label-less sa_info
        # aggregate, so it could never be reached by label (see ownership.py).
        Column('install_module_id', 'INTEGER', references='install_modules(id)'),
        # The systemability element's own fields, exactly as declared. The
        # columns above only project it; the profile's file-level process
        # is resolved from the linked service via service_id.
        Column('record', 'JSON', nullable=False),
    ),
    primary_key=('position',),
    surrogate=True,
    indexes=(Index('idx_sas_component', ('scan_id', 'component_id')),
             Index('idx_sas_install', ('scan_id', 'install_module_id')),
             Index('idx_sas_host', ('scan_id', 'service_id')),
             Index('idx_sas_identity', ('scan_id', 'sa_id'))),
)


TABLES = (SAS,)
