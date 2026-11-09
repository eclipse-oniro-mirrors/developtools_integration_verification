"""Link ArkTS modules to the ELF that implements them.

`arkts` records the implementing .so as a per-scan image path
(`arkts_modules.impl_so_path`), with its library root already aligned to the
scan's `cpu_arch`. Turning that path into an `elf_modules` id has to happen
here instead: arkts runs second and elf_modules runs last, so arkts cannot
reference ids that do not exist yet. Adding elf_modules to its DEPENDS_ON would
be a cycle.

The link is written as an UPDATE on `arkts_modules.impl_elf_id`, the same
mechanism component_links uses for features.gn_arg_id.
"""
from ...core.framework import BaseCollector, ScanContext, register
from oskm_schema.links import ARKTS_LINKS_RUN


_CANDIDATES = f"""
    SELECT e.id AS elf_id FROM elf_modules e
      JOIN install_targets t ON t.id = e.install_target_id AND t.scan_id = e.scan_id
     WHERE e.scan_id = i.scan_id AND t.dest = i.impl_so_path
"""


class ArktsLinksContext(ScanContext):
    """No domain-specific setup; reads only from the database."""

    def setup(self):
        pass


@register
class ArktsLinksCollector(BaseCollector):
    NAME = 'arkts_links'
    DESCRIPTION = 'Resolve ArkTS module implementation paths to ELF modules'
    DEPENDS_ON = ('arkts', 'elf_modules')
    SCHEMA_VERSION = '2.0.0'
    TABLES = (ARKTS_LINKS_RUN,)
    CONTEXT_TYPE = ArktsLinksContext
    EXPORT_ORDER = 'id'

    def collect(self, ctx):
        connection, scan_id = ctx.connection, ctx.scan_id
        for name in ('arkts', 'elf_modules'):
            if ctx.upstream.failed(name):
                ctx.issue(ctx.workspace, 'ARKTS_LINK_UPSTREAM_UNAVAILABLE', advisory=True,
                          details=dict(collector=name))
        if not (ctx.upstream.ran('arkts') and ctx.upstream.ran('elf_modules')):
            ctx.emit('arkts_links_run', dict(linked=0, unresolved=0, ambiguous=0))
            return

        rows = connection.execute(
            f'SELECT i.id, i.impl_so_path, '
            f'       (SELECT COUNT(*) FROM ({_CANDIDATES})) AS matches '
            f'FROM arkts_modules i WHERE i.scan_id = ? AND i.impl_so_path IS NOT NULL',
            (scan_id,)).fetchall()
        linked = sum(1 for r in rows if r['matches'] == 1)
        ambiguous = [r for r in rows if r['matches'] > 1]
        unresolved = [r for r in rows if r['matches'] == 0]

        if unresolved:
            ctx.issue(ctx.workspace, 'ARKTS_IMPL_SO_MISSING', severity='info', advisory=True,
                      details=dict(paths=sorted({r['impl_so_path'] for r in unresolved})[:100],
                                   total_count=len(unresolved)))
        if ambiguous:
            ctx.issue(ctx.workspace, 'ARKTS_IMPL_SO_AMBIGUOUS', severity='warning', advisory=True,
                      details=dict(paths=sorted({r['impl_so_path'] for r in ambiguous})[:100],
                                   total_count=len(ambiguous)))
        ctx.emit('arkts_links_run', dict(linked=linked, unresolved=len(unresolved),
                                         ambiguous=len(ambiguous)))

    @classmethod
    def post_insert(cls, connection, scan_id):
        # Reset first: a re-run must not leave a stale link behind.
        connection.execute(
            'UPDATE arkts_modules SET impl_elf_id = NULL WHERE scan_id = ?', (scan_id,))
        tables = {r[0] for r in connection.execute(
            "SELECT name FROM sqlite_master WHERE type='table'")}
        if not {'elf_modules', 'install_targets'} <= tables:
            return
        # Assign only when the path identifies exactly one ELF row; an
        # ambiguous path stays NULL and is reported rather than guessed.
        connection.execute(
            f'UPDATE arkts_modules AS i SET impl_elf_id = ({_CANDIDATES} LIMIT 1) '
            f'WHERE i.scan_id = ? AND i.impl_so_path IS NOT NULL '
            f'AND (SELECT COUNT(*) FROM ({_CANDIDATES})) = 1', (scan_id,))

    def scope(self, ctx):
        return 'arkts_modules.impl_so_path -> elf_modules'

    @classmethod
    def export_record(cls, row, connection, scan_id):
        from ...core.export import record_from_row
        return record_from_row(row, cls.TABLES[0])
