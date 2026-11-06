"""编译参数的表结构。

采集侧（`oskm/collectors/args`）与查询侧（`agentic/`）共用这一份。
放在中立包而不是采集器包里，是为了让 `agentic/` 能独立发布——
理由与被否掉的软链方案见 `agentic/docs/standalone-packaging.md` §5。
"""
from .base import Column, Index, Table


GN_ARGS = Table(
    'gn_args',
    columns=(
        Column('name', nullable=False),
        Column('component_id', 'INTEGER', references='components(id)'),
        Column('decl_file', nullable=False),
        Column('decl_line', 'INTEGER', nullable=False),
        Column('default_value', 'JSON'),
        Column('has_override', 'INTEGER', nullable=False, default='0'),
        Column('current_value', 'JSON'),
        Column('comment'),
        Column('value_type', nullable=False),
    ),
    primary_key=('name',),
    surrogate=True,
    indexes=(
        Index('idx_gn_args_component', ('scan_id', 'component_id')),
        Index('idx_gn_args_file', ('scan_id', 'decl_file')),
    ),
)


TABLES = (GN_ARGS,)
