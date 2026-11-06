"""跨域关联的运行摘要的表结构。

采集侧（`oskm/collectors/arkts_links、component_links`）与查询侧（`agentic/`）共用这一份。
放在中立包而不是采集器包里，是为了让 `agentic/` 能独立发布——
理由与被否掉的软链方案见 `agentic/docs/standalone-packaging.md` §5。
"""
from .base import Column, Index, Table


ARKTS_LINKS_RUN = Table(
    'arkts_links_run',
    columns=(
        Column('linked', 'INTEGER', nullable=False),
        Column('unresolved', 'INTEGER', nullable=False),
        Column('ambiguous', 'INTEGER', nullable=False),
    ),
    surrogate=True,
)


COMPONENT_LINKS_RUN = Table(
    'component_links_run',
    columns=(
        Column('linked_features', 'INTEGER', nullable=False),
        Column('unresolved_features', 'INTEGER', nullable=False),
        Column('linked_innerapis', 'INTEGER', nullable=False),
        Column('unresolved_innerapis', 'INTEGER', nullable=False),
    ),
    surrogate=True,
)


TABLES = (ARKTS_LINKS_RUN, COMPONENT_LINKS_RUN,)
