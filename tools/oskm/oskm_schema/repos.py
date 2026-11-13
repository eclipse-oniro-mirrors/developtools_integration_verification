"""代码仓的表结构。

采集侧（`oskm/collectors/repos`）与查询侧（`cli/oskm_cli/`）共用这一份。
放在中立包而不是采集器包里，是为了让 `cli/oskm_cli/` 能独立发布——
理由与被否掉的软链方案见 `docs/architecture/standalone-packaging.md` §5。
"""
from .base import Column, Index, Table


REPOS = Table(
    'repos',
    columns=(
        Column('name', nullable=False),
        Column('path', nullable=False),
        Column('remote'),
        Column('remote_url'),
        Column('revision'),
        Column('groups'),
        Column('clone_depth', 'INTEGER'),
        Column('head_commit'),
    ),
    primary_key=('name',),
    surrogate=True,
    indexes=(
        Index('idx_repos_path', ('scan_id', 'path')),
        Index('idx_repos_remote', ('scan_id', 'remote')),
        Index('idx_repos_revision', ('scan_id', 'revision')),
    ),
)


TABLES = (REPOS,)
