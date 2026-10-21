"""Component links collector: post-processing enrichment via SQL UPDATE.

Runs after components, args, and install_modules. Reads their committed rows
and UPDATEs features.gn_arg_id and innerapis.install_module_id on the components
side tables, linking features to their gn_arg values and innerapis to the
install_modules that built them.

Owns a single audit table (component_links_run) with one row per scan recording
hit/miss counts. The actual link data lives as columns on features/innerapis,
written via post_insert() within the runner's transaction -- the same mechanism
install_modules uses for install_targets.link_target_id.
"""
from ...core.framework import BaseCollector, ScanContext, register
from ...core.schema import Column, Index, Table

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


class ComponentLinksContext(ScanContext):
    """No domain-specific setup; reads only from the database."""

    def setup(self):
        pass


@register
class ComponentLinksCollector(BaseCollector):
    NAME = 'component_links'
    DESCRIPTION = 'Link features to gn_args and innerapis to install_modules'
    DEPENDS_ON = ('components', 'args', 'install_modules')
    SCHEMA_VERSION = '1.0.0'
    TABLES = (COMPONENT_LINKS_RUN,)
    CONTEXT_TYPE = ComponentLinksContext
    EXPORT_ORDER = 'id'

    def collect(self, ctx):
        scan_id = ctx.scan_id
        connection = ctx.connection

        args_ran = ctx.upstream.ran('args')
        args_failed = ctx.upstream.failed('args')
        install_ran = ctx.upstream.ran('install_modules')
        install_failed = ctx.upstream.failed('install_modules')

        if args_failed:
            ctx.issue(ctx.workspace, 'ARGS_UNAVAILABLE', advisory=True,
                      details=dict(reason='args collector failed'))
        if install_failed:
            ctx.issue(ctx.workspace, 'INSTALL_INDEX_INCOMPLETE', advisory=True,
                      details=dict(reason='install_modules collector failed'))

        linked_features = unresolved_features = 0
        if args_ran and not args_failed:
            total = connection.execute(
                'SELECT COUNT(*) AS n FROM features WHERE scan_id = ?',
                (scan_id,)).fetchone()['n']
            linked = connection.execute(
                'SELECT COUNT(*) AS n FROM features f '
                'JOIN gn_args g ON g.scan_id = f.scan_id AND g.name = f.value '
                'WHERE f.scan_id = ?', (scan_id,)).fetchone()['n']
            unresolved_features = total - linked
            linked_features = linked
            if unresolved_features:
                self._report_unresolved_features(ctx, connection, scan_id)

        linked_innerapis = unresolved_innerapis = 0
        if install_ran and not install_failed:
            total = connection.execute(
                'SELECT COUNT(*) AS n FROM innerapis WHERE scan_id = ?',
                (scan_id,)).fetchone()['n']
            linked = connection.execute(
                'SELECT COUNT(*) AS n FROM innerapis i '
                'JOIN install_modules m ON m.scan_id = i.scan_id '
                'AND m.label = i.name '
                'WHERE i.scan_id = ?', (scan_id,)).fetchone()['n']
            unresolved_innerapis = total - linked
            linked_innerapis = linked
            if unresolved_innerapis:
                self._report_unresolved_innerapis(ctx, connection, scan_id)

        ctx.emit('component_links_run', dict(
            linked_features=linked_features,
            unresolved_features=unresolved_features,
            linked_innerapis=linked_innerapis,
            unresolved_innerapis=unresolved_innerapis))

    @staticmethod
    def _report_unresolved_features(ctx, connection, scan_id):
        rows = connection.execute(
            'SELECT f.value, c.name AS component FROM features f '
            'LEFT JOIN gn_args g ON g.scan_id = f.scan_id AND g.name = f.value '
            'LEFT JOIN components c ON c.id = f.component_id '
            'WHERE f.scan_id = ? AND g.id IS NULL '
            'ORDER BY c.name, f.value', (scan_id,)).fetchall()
        by_component = {}
        for row in rows:
            by_component.setdefault(row['component'] or '', []).append(row['value'])
        for component, names in by_component.items():
            ctx.issue(ctx.workspace, 'FEATURE_VALUE_UNRESOLVED', '',
                      severity='info', advisory=True, component=component,
                      details=dict(features=names, count=len(names)))

    @staticmethod
    def _report_unresolved_innerapis(ctx, connection, scan_id):
        rows = connection.execute(
            'SELECT i.name, c.name AS component FROM innerapis i '
            'LEFT JOIN install_modules m ON m.scan_id = i.scan_id '
            'AND m.label = i.name '
            'LEFT JOIN components c ON c.id = i.component_id '
            'WHERE i.scan_id = ? AND m.id IS NULL '
            'ORDER BY c.name, i.name', (scan_id,)).fetchall()
        by_component = {}
        for row in rows:
            by_component.setdefault(row['component'] or '', []).append(row['name'])
        for component, items in by_component.items():
            ctx.issue(ctx.workspace, 'INNERAPI_MODULE_UNRESOLVED', '',
                      severity='warning', advisory=True, component=component,
                      details=dict(innerapis=items, count=len(items)))

    @classmethod
    def post_insert(cls, connection, scan_id):
        # Reset: defend against stale links from a previous run.
        connection.execute(
            'UPDATE features SET gn_arg_id = NULL WHERE scan_id = ?', (scan_id,))
        connection.execute(
            'UPDATE innerapis SET install_module_id = NULL WHERE scan_id = ?',
            (scan_id,))
        # Link features → gn_args by name equality.
        connection.execute(
            'UPDATE features SET gn_arg_id = '
            '(SELECT g.id FROM gn_args g '
            ' WHERE g.scan_id = features.scan_id AND g.name = features.value) '
            'WHERE scan_id = ?', (scan_id,))
        # Link innerapis → install_modules by name equality.
        connection.execute(
            'UPDATE innerapis SET install_module_id = '
            '(SELECT m.id FROM install_modules m '
            ' WHERE m.scan_id = innerapis.scan_id '
            ' AND m.label = innerapis.name) '
            'WHERE scan_id = ?', (scan_id,))

    def scope(self, ctx):
        return 'features->gn_args, innerapis->install_modules'

    @classmethod
    def export_record(cls, row, connection, scan_id):
        from ...core.export import record_from_row
        return record_from_row(row, cls.TABLES[0])
