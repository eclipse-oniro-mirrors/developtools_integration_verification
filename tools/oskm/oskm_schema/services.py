"""系统服务的表结构。

采集侧（`oskm/collectors/services`）与查询侧（`cli/oskm_cli/`）共用这一份。
放在中立包而不是采集器包里，是为了让 `cli/oskm_cli/` 能独立发布——
理由与被否掉的软链方案见 `docs/architecture/standalone-packaging.md` §5。
"""
from .base import Column, Index, Table


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


TABLES = (SERVICES,)
