"""Repos collector: parse repo manifest and collect git metadata per repository.

Root-level collector with no dependencies. Reads .repo/manifests/ (XML include
chain) for project declarations, then runs git commands per repo for runtime
metadata (HEAD commit, describe, dirty, remote URL).

The lookup interface supports label/path matching with longest-path-first
for nested repos.
"""
from pathlib import Path

from . import manifest as manifest_parser
from .git_info import collect_all
from .lookup import RepoIndex
from .models import RepoFilter
from .query import RepoQuery
from ...core.framework import BaseCollector, ScanContext, register
from ...core.io import canonical
from ...core.models import RequestError, ScanResult, ScanRequest
from ...core.schema import Column, Index, Table

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


class ReposContext(ScanContext):

    def setup(self):
        self.repo_dir = self.workspace / '.repo'
        self.manifests_dir = self.repo_dir / 'manifests'
        self.manifest_entry = self.repo_dir / 'manifest.xml'
        self.repo_available = self.manifests_dir.is_dir()
        if self.repo_available:
            self.inputs.add(str(self.manifest_entry))


@register
class ReposCollector(BaseCollector):
    NAME = 'repos'
    DESCRIPTION = 'Parse repo manifest and collect git metadata per repository'
    DEPENDS_ON = ()
    SCHEMA_VERSION = '1.0.0'
    TABLES = (REPOS,)
    CONTEXT_TYPE = ReposContext
    EXPORT_ORDER = 'name'
    RESULT_FIELD = 'repos'
    ROLE = 'repo'

    def collect(self, ctx):
        if not ctx.repo_available:
            return  # not a repo workspace; produce zero rows, stay complete
        projects, remotes = manifest_parser.parse(ctx.manifests_dir)
        project_list_path = ctx.repo_dir / 'project.list'
        listed = set()
        if project_list_path.is_file():
            listed = set(line.strip() for line in project_list_path.read_text().splitlines() if line.strip())
        ctx.progress('manifest', len(projects), len(projects))

        git_data = collect_all(ctx.workspace, [p['path'] for p in projects.values()])

        for name, attrs in sorted(projects.items()):
            ctx.check()
            path = attrs.get('path', name)
            pointer = '/' + name
            record = dict(attrs)

            if listed and path not in listed:
                ctx.issue(ctx.repo_dir, 'REPO_NOT_IN_LIST', pointer)

            info = git_data.get(path, {})
            if info.get('head_commit') is None:
                ctx.issue(ctx.workspace / path, 'GIT_HEAD_UNAVAILABLE', pointer)
            if info.get('remote_url') is None:
                ctx.issue(ctx.workspace / path, 'REMOTE_URL_UNAVAILABLE', pointer)

            clone_depth = attrs.get('clone-depth')
            row = dict(
                name=name,
                path=path,
                remote=attrs.get('remote'),
                remote_url=info.get('remote_url'),
                revision=attrs.get('revision'),
                groups=attrs.get('groups'),
                clone_depth=int(clone_depth) if clone_depth and clone_depth.isdigit() else None,
                head_commit=info.get('head_commit'),
            )
            ctx.emit('repos', row)

    def scope(self, ctx):
        return '.repo/manifests'

    @classmethod
    def export_record(cls, row, connection, scan_id):
        from ...core.export import record_from_row
        return record_from_row(row, cls.TABLES[0])
