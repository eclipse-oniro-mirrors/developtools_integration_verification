"""Link ArkTS modules to the ELF that implements them.

`arkts` records the implementing .so as a per-scan image path
(`arkts_modules.impl_so_path`). Turning that path into an `elf_modules` id has
to happen here instead: arkts runs second and elf_modules runs last, so arkts
cannot reference ids that do not exist yet. Adding elf_modules to its DEPENDS_ON
would be a cycle.

ArkUI has no exact library-to-module map in the bundled reference data. Its
architecture-based path is therefore only a fallback; when the build installed
exactly one ArkUI engine destination, that installation evidence replaces the
fallback before links are counted. Missing evidence keeps the fallback, while
multiple distinct destinations stay unresolved and are reported as ambiguous.

The link is written as an UPDATE on `arkts_modules.impl_elf_id`, the same
mechanism component_links uses for features.gn_arg_id.
"""
from ...core.framework import BaseCollector, ScanContext, register
from oskm_schema.links import ARKTS_LINKS_RUN


_ARKUI_ENGINE_FILE = 'libace_engine_pa_ark.z.so'

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
    SCHEMA_VERSION = '3.0.0'
    TABLES = (ARKTS_LINKS_RUN,)
    CONTEXT_TYPE = ArktsLinksContext
    EXPORT_ORDER = 'id'

    @staticmethod
    def _table_names(connection):
        return {row[0] for row in connection.execute(
            "SELECT name FROM sqlite_master WHERE type='table'")}

    @classmethod
    def _arkui_destinations(cls, connection, scan_id):
        """Distinct installed destinations for the ArkUI engine.

        Duplicate install targets that point at the same destination are one
        installation fact. Different destinations are genuinely ambiguous and
        must not make the fallback path look linked.
        """
        rows = connection.execute(
            'SELECT DISTINCT t.dest FROM install_targets t '
            'JOIN elf_modules e ON e.install_target_id = t.id '
            'AND e.scan_id = t.scan_id '
            'WHERE t.scan_id = ? '
            'AND (t.dest = ? OR substr(t.dest, -length(?) - 1) = ?) '
            'ORDER BY t.dest',
            (scan_id, _ARKUI_ENGINE_FILE, _ARKUI_ENGINE_FILE,
             '/' + _ARKUI_ENGINE_FILE)).fetchall()
        return tuple(row[0] for row in rows)

    @classmethod
    def _resolve_arkui_paths(cls, connection, scan_id):
        """Use unique installation evidence, or retain the architecture fallback."""
        destinations = cls._arkui_destinations(connection, scan_id)
        if len(destinations) == 1:
            connection.execute(
                'UPDATE arkts_modules SET impl_so_path = ? '
                "WHERE scan_id = ? AND impl_match = 'arkui_engine'",
                (destinations[0], scan_id))
        return destinations

    def collect(self, ctx):
        connection, scan_id = ctx.connection, ctx.scan_id
        for name in ('arkts', 'elf_modules'):
            if ctx.upstream.failed(name):
                ctx.issue(ctx.workspace, 'ARKTS_LINK_UPSTREAM_UNAVAILABLE', advisory=True,
                          details=dict(collector=name))
        if not (ctx.upstream.ran('arkts') and ctx.upstream.ran('elf_modules')):
            ctx.emit('arkts_links_run', dict(linked=0, unresolved=0, ambiguous=0))
            return

        arkui_destinations = self._resolve_arkui_paths(connection, scan_id)
        rows = connection.execute(
            f'SELECT i.impl_so_path, i.impl_match, '
            f'       (SELECT COUNT(*) FROM ({_CANDIDATES})) AS matches '
            f'FROM arkts_modules i WHERE i.scan_id = ? AND i.impl_so_path IS NOT NULL',
            (scan_id,)).fetchall()

        linked = ambiguous = 0
        unresolved = []
        for row in rows:
            path, match, count = row[0], row[1], row[2]
            if match == 'arkui_engine' and len(arkui_destinations) > 1:
                ambiguous += 1
            elif count == 1:
                linked += 1
            else:
                unresolved.append(path)

        if unresolved:
            ctx.issue(ctx.workspace, 'ARKTS_IMPL_SO_MISSING', severity='info', advisory=True,
                      details=dict(paths=sorted(set(unresolved))[:100],
                                   total_count=len(unresolved)))
        if ambiguous:
            ctx.issue(ctx.workspace, 'ARKTS_IMPL_SO_AMBIGUOUS', severity='warning', advisory=True,
                      details=dict(paths=list(arkui_destinations)[:100],
                                   total_count=ambiguous))
        ctx.emit('arkts_links_run', dict(linked=linked, unresolved=len(unresolved),
                                         ambiguous=ambiguous))

    @classmethod
    def post_insert(cls, connection, scan_id):
        tables = cls._table_names(connection)
        if 'arkts_modules' not in tables:
            return
        # Reset first: a re-run must not leave a stale link behind.
        connection.execute(
            'UPDATE arkts_modules SET impl_elf_id = NULL WHERE scan_id = ?', (scan_id,))
        if not {'elf_modules', 'install_targets'} <= tables:
            return
        cls._resolve_arkui_paths(connection, scan_id)
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
