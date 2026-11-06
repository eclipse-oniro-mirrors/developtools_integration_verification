"""HDI 设备的表结构。

采集侧（`oskm/collectors/hdi`）与查询侧（`agentic/`）共用这一份。
放在中立包而不是采集器包里，是为了让 `agentic/` 能独立发布——
理由与被否掉的软链方案见 `agentic/docs/standalone-packaging.md` §5。
"""
from .base import Column, Index, Table


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


TABLES = (HDIS,)
