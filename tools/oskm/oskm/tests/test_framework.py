"""Registry enforcement, schema generation and the SQLite scan lifecycle."""
import sqlite3
import sys
import tempfile
import unittest
from decimal import Decimal
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from oskm.core import db, framework
from oskm.core.db import Database, StoreError
from oskm.core.framework import BaseCollector, RegistryError, projection, register
from oskm.core.models import ScanCancelled, ScanFatalError, ScanLimits, ScanRequest
from oskm.core.runner import run
from oskm.core.schema import Column, Index, SchemaError, Table


def table(name, *columns, **kwargs):
    return Table(name, columns=columns, **kwargs)


class SchemaTest(unittest.TestCase):
    def test_real_columns_are_rejected_to_protect_decimal_fidelity(self):
        # Scans keep JSON number literals exact (parsed as Decimal); an IEEE-754
        # double would silently truncate them, so REAL must be unreachable.
        with self.assertRaises(SchemaError):
            Column('size', 'REAL')
        self.assertEqual(Column('raw', 'JSON').ddl(), 'raw TEXT')

    def test_json_columns_store_as_text_to_keep_affinity_off(self):
        # SQLite has no JSON type. A column declared `JSON` matches none of
        # INT/CHAR/CLOB/TEXT/BLOB/REAL/FLOA/DOUB, so it would get NUMERIC
        # affinity and coerce the documents `3` and `1.5` into a number --
        # the same precision loss the REAL ban prevents.
        self.assertIn('raw TEXT', Column('raw', 'JSON').ddl())
        store = Database(':memory:')
        document = table('docs', Column('value', 'JSON'), primary_key=(), scan_scoped=False)
        with store.connect() as connection:
            connection.execute(document.ddl())
            connection.execute('CREATE TABLE loose (value JSON)')
            for text in ('3', '1.5'):
                connection.execute('INSERT INTO docs VALUES (?)', (text,))
                connection.execute('INSERT INTO loose VALUES (?)', (text,))
            self.assertEqual([r[0] for r in connection.execute('SELECT typeof(value) FROM docs')],
                             ['text', 'text'])
            self.assertEqual([r[0] for r in connection.execute('SELECT typeof(value) FROM loose')],
                             ['integer', 'real'])

    def test_projection_degrades_to_null_instead_of_coercing(self):
        # A promoted column is an index over the record, never the record: a value
        # the column cannot hold projects to NULL rather than being converted.
        self.assertEqual(projection('x'), 'x')
        self.assertEqual((projection(3, 'int'), projection(True, 'bool')), (3, 1))
        self.assertEqual(projection(False, 'bool'), 0)
        # bool is a subclass of int but a distinct value in a scan result
        self.assertIsNone(projection(True, 'int'))
        self.assertIsNone(projection(1, 'bool'))
        # wrong type, and an integer wider than SQLite's 8 bytes
        for value in (3, [1], {'a': 1}, None, Decimal('1.5')):
            self.assertIsNone(projection(value), value)
        self.assertIsNone(projection(2 ** 80, 'int'))
        self.assertEqual(projection(2 ** 62, 'int'), 2 ** 62)
        with self.assertRaises(ValueError):
            projection('x', 'nope')

    def test_surrogate_table_is_keyed_by_rowid_with_a_unique_business_key(self):
        t = table('things', Column('name', nullable=False), primary_key=('name',), surrogate=True)
        self.assertEqual((t.key, t.unique_key), (('id',), ('scan_id', 'name')))
        ddl = t.ddl()
        self.assertIn('id INTEGER PRIMARY KEY NOT NULL', ddl)
        self.assertIn('UNIQUE (scan_id, name)', ddl)

    def test_identifier_and_reference_validation(self):
        for bad in ('', '1bad', 'has space', 'drop;table'):
            with self.subTest(bad=bad), self.assertRaises(SchemaError):
                Column(bad)
        with self.assertRaises(SchemaError):
            table('t', Column('a'), primary_key=('missing',))
        with self.assertRaises(SchemaError):
            table('t', Column('a'), indexes=(Index('i', ('missing',)),))
        with self.assertRaises(SchemaError):
            table('t', Column('a'), Column('a'))

    def test_scan_scoped_tables_gain_cascading_scan_id_in_the_key(self):
        t = table('widgets', Column('name', nullable=False), primary_key=('name',))
        self.assertEqual(t.key, ('scan_id', 'name'))
        ddl = t.ddl()
        self.assertIn('scan_id INTEGER NOT NULL REFERENCES scans(id) ON DELETE CASCADE', ddl)
        self.assertIn('PRIMARY KEY (scan_id, name)', ddl)
        self.assertEqual(t.delete_sql(), 'DELETE FROM widgets WHERE scan_id = ?')

    def test_standalone_table_inlines_integer_primary_key(self):
        t = table('things', Column('id', 'INTEGER'), Column('x'),
                  primary_key=('id',), scan_scoped=False)
        self.assertIn('id INTEGER PRIMARY KEY NOT NULL', t.ddl())
        self.assertNotIn('scan_id', t.ddl())
        with self.assertRaises(SchemaError):
            t.delete_sql()


WIDGETS = table('widgets', Column('name', nullable=False), Column('owner'),
                Column('raw', 'JSON'), primary_key=('name',))
GADGETS = table('gadgets', Column('name', nullable=False), Column('widget'),
                primary_key=('name',))


class RegistryTest(unittest.TestCase):
    def setUp(self):
        self._saved = dict(framework._COLLECTORS)
        framework._COLLECTORS.clear()
        def restore():
            framework._COLLECTORS.clear()
            framework._COLLECTORS.update(self._saved)
        self.addCleanup(restore)

    def define(self, name, depends=(), tables=(WIDGETS,), version='1.0.0'):
        @register
        class Defined(BaseCollector):
            NAME = name
            DEPENDS_ON = depends
            SCHEMA_VERSION = version
            TABLES = tables

            def collect(self, ctx):
                pass
        return Defined

    def test_abstract_collect_cannot_be_skipped(self):
        # The decisive difference from the previous convention-based base class:
        # a collector that does not implement collect() is not instantiable.
        class Incomplete(BaseCollector):
            NAME, SCHEMA_VERSION, TABLES = 'incomplete', '1.0.0', (WIDGETS,)
        with self.assertRaises(TypeError):
            Incomplete()

    def test_registration_rejects_incomplete_declarations(self):
        def attempt(attrs):
            body = dict(NAME='x', SCHEMA_VERSION='1.0.0', TABLES=(WIDGETS,),
                        collect=lambda self, ctx: None)
            body.update(attrs)
            register(type('Bad', (BaseCollector,), body))
        for attrs in (dict(NAME=None), dict(NAME=''), dict(SCHEMA_VERSION=None),
                      dict(TABLES=()), dict(TABLES=('widgets',)),
                      dict(DEPENDS_ON=['a']), dict(DEPENDS_ON=('x',))):
            with self.subTest(attrs=attrs), self.assertRaises(RegistryError):
                attempt(attrs)

    def test_duplicate_name_is_rejected_but_reregistration_is_idempotent(self):
        first = self.define('dup')
        with self.assertRaises(RegistryError):
            self.define('dup')
        self.assertIs(register(first), first)

    def test_order_is_topological_deterministic_and_pulls_in_dependencies(self):
        self.define('components')
        self.define('services', depends=('components',))
        self.define('hdi', depends=('services', 'components'))
        self.define('sas', depends=('services', 'components'))
        self.assertEqual(framework.resolve_order(), ('components', 'services', 'hdi', 'sas'))
        # Selecting a leaf still runs its transitive dependencies, in order.
        self.assertEqual(framework.resolve_order(['hdi']), ('components', 'services', 'hdi'))
        self.assertEqual(framework.resolve_order(['hdi']), framework.resolve_order(['hdi']))

    def test_unknown_and_cyclic_dependencies_are_reported(self):
        self.define('a', depends=('ghost',))
        with self.assertRaises(RegistryError):
            framework.resolve_order(['a'])
        with self.assertRaises(RegistryError):
            framework.resolve_order(['nope'])
        framework._COLLECTORS.clear()
        self.define('x', depends=('y',))
        self.define('y', depends=('x',))
        with self.assertRaises(RegistryError):
            framework.resolve_order()

    def test_tables_are_deduplicated_across_collectors(self):
        self.define('one', tables=(WIDGETS,))
        self.define('two', tables=(WIDGETS, GADGETS))
        self.assertEqual({t.name for t in framework.tables()}, {'widgets', 'gadgets'})
        self.assertEqual(len(framework.tables()), 2)


class ScanTest(unittest.TestCase):
    def setUp(self):
        temp = tempfile.TemporaryDirectory()
        self.addCleanup(temp.cleanup)
        self.root = Path(temp.name)
        self.database = Database(self.root / 'knowledge.db')
        self.request = ScanRequest(self.root, 'test')
        self._saved = dict(framework._COLLECTORS)
        framework._COLLECTORS.clear()
        def restore():
            framework._COLLECTORS.clear()
            framework._COLLECTORS.update(self._saved)
        self.addCleanup(restore)
        # discover() must not re-register the real collectors during these tests.
        self._discover = framework.discover
        framework.discover = lambda package=None: framework.names()
        self.addCleanup(lambda: setattr(framework, 'discover', self._discover))

    def rows(self, statement, *parameters):
        with self.database.connect() as connection:
            return [dict(r) for r in connection.execute(statement, parameters)]

    def upstream_collectors(self):
        @register
        class Widgets(BaseCollector):
            NAME, SCHEMA_VERSION, TABLES = 'widgets', '1.0.0', (WIDGETS,)

            def collect(self, ctx):
                ctx.emit('widgets', dict(name='w1', owner='alice',
                                         raw=dict(exact=Decimal('1.1234567890123456789'))))
                ctx.emit('widgets', dict(name='w2', owner='bob', raw=None))

            def scope(self, ctx):
                return ['widgets']

        @register
        class Gadgets(BaseCollector):
            NAME, SCHEMA_VERSION, TABLES = 'gadgets', '2.0.0', (GADGETS,)
            DEPENDS_ON = ('widgets',)

            def collect(self, ctx):
                # The dependency arrives through the database, not in memory.
                for name in sorted(ctx.upstream.index('widgets', 'name')):
                    ctx.emit('gadgets', dict(name='g-' + name, widget=name))
        return Widgets, Gadgets

    def test_dependency_flows_through_the_database_and_scan_is_recorded(self):
        self.upstream_collectors()
        result = run(self.database, self.request, only=['gadgets'])
        self.assertEqual(result.status, 'complete')
        self.assertEqual([r.collector for r in result.runs], ['widgets', 'gadgets'])
        self.assertEqual([r['name'] for r in self.rows('SELECT name FROM gadgets ORDER BY name')],
                         ['g-w1', 'g-w2'])
        scan = self.rows('SELECT * FROM scans')[0]
        self.assertEqual(scan['product'], 'test')
        self.assertIsNotNone(scan['finished_at'])
        runs = self.rows('SELECT * FROM collector_runs ORDER BY collector')
        self.assertEqual([(r['collector'], r['schema_version'], r['record_count']) for r in runs],
                         [('gadgets', '2.0.0', 2), ('widgets', '1.0.0', 2)])
        self.assertEqual(runs[1]['scope'], '["widgets"]')

    def test_decimal_literals_survive_the_round_trip(self):
        self.upstream_collectors()
        run(self.database, self.request, only=['widgets'])
        raw = self.rows("SELECT raw FROM widgets WHERE name = 'w1'")[0]['raw']
        self.assertEqual(raw, '{"exact":1.1234567890123456789}')

    def test_issues_dedupe_on_insert_key_and_drive_degraded_status(self):
        @register
        class Noisy(BaseCollector):
            NAME, SCHEMA_VERSION, TABLES = 'noisy', '1.0.0', (WIDGETS,)

            def collect(self, ctx):
                ctx.issue(ctx.workspace / 'a.json', 'BROKEN')
                ctx.issue(ctx.workspace / 'a.json', 'BROKEN', severity='info')  # deduped
                ctx.issue(ctx.workspace / 'b.json', 'NOTED', severity='info')
        seen = []
        result = run(self.database, self.request, only=['noisy'], on_diagnostic=seen.append)
        self.assertEqual(result.status, 'degraded')
        self.assertEqual(len(seen), 2)
        issues = self.rows('SELECT path, code, severity FROM issues ORDER BY path')
        self.assertEqual(issues, [dict(path='a.json', code='BROKEN', severity='error'),
                                  dict(path='b.json', code='NOTED', severity='info')])

    def test_advisory_issues_never_degrade_or_break_the_inventory(self):
        @register
        class Picky(BaseCollector):
            NAME, SCHEMA_VERSION, TABLES = 'picky', '1.0.0', (WIDGETS,)

            def collect(self, ctx):
                ctx.emit('widgets', dict(name='w1'))
                # Read fine, says something questionable: error severity, but the
                # scan itself fell short of nothing.
                ctx.issue(ctx.workspace / 'a.json', 'VALUE_INVALID', '/x',
                          advisory=True, details=dict(saw=1))
        seen = []
        result = run(self.database, self.request, only=['picky'], on_diagnostic=seen.append)
        self.assertEqual(result.status, 'complete')
        self.assertTrue(framework.get('picky').inventory_complete(
            *self._scan_handle(result.scan_id)))
        self.assertEqual(self.rows('SELECT advisory, severity FROM issues'),
                         [dict(advisory=1, severity='error')])
        # the live callback and the stored document agree, advisory shown only when true
        self.assertEqual(dict(seen[0]),
                         dict(path='a.json', pointer='/x', code='VALUE_INVALID', advisory=True))

    def _scan_handle(self, scan_id):
        context = self.database.connect()
        connection = context.__enter__()
        self.addCleanup(lambda: context.__exit__(None, None, None))
        return connection, scan_id

    def test_info_only_issues_stay_complete(self):
        @register
        class Mild(BaseCollector):
            NAME, SCHEMA_VERSION, TABLES = 'mild', '1.0.0', (WIDGETS,)

            def collect(self, ctx):
                ctx.issue(ctx.workspace / 'a.json', 'FYI', severity='info')
        self.assertEqual(run(self.database, self.request, only=['mild']).status, 'complete')

    def test_rerunning_one_collector_reuses_upstream_and_rewrites_only_its_rows(self):
        _, Gadgets = self.upstream_collectors()
        first = run(self.database, self.request, only=['gadgets'])
        Gadgets.collect = lambda self, ctx: ctx.emit('gadgets', dict(name='only', widget='w1'))
        second = run(self.database, self.request, only=['gadgets'],
                     scan_id=first.scan_id, reuse_upstream=True)
        self.assertEqual(second.scan_id, first.scan_id)
        self.assertEqual([r.collector for r in second.runs], ['gadgets'])
        self.assertEqual([r['name'] for r in self.rows('SELECT name FROM gadgets')], ['only'])
        # Upstream rows were left untouched, and only one scan exists.
        self.assertEqual(len(self.rows('SELECT name FROM widgets')), 2)
        self.assertEqual(len(self.rows('SELECT id FROM scans')), 1)

    def test_reuse_upstream_requires_an_existing_scan(self):
        self.upstream_collectors()
        with self.assertRaises(RegistryError):
            run(self.database, self.request, only=['gadgets'], reuse_upstream=True)

    def test_failed_collector_leaves_no_partial_rows_and_scan_unfinished(self):
        @register
        class Exploding(BaseCollector):
            NAME, SCHEMA_VERSION, TABLES = 'boom', '1.0.0', (WIDGETS,)

            def collect(self, ctx):
                ctx.emit('widgets', dict(name='ghost', owner=None, raw=None))
                raise ScanFatalError('BOOM')
        with self.assertRaises(ScanFatalError):
            run(self.database, self.request, only=['boom'])
        self.assertEqual(self.rows('SELECT name FROM widgets'), [])
        self.assertIsNone(self.rows('SELECT finished_at FROM scans')[0]['finished_at'])

    def test_emitting_an_undeclared_table_is_rejected(self):
        @register
        class Sloppy(BaseCollector):
            NAME, SCHEMA_VERSION, TABLES = 'sloppy', '1.0.0', (WIDGETS,)

            def collect(self, ctx):
                ctx.emit('gadgets', dict(name='x', widget='y'))
        with self.assertRaises(RegistryError):
            run(self.database, self.request, only=['sloppy'])

    def test_unknown_column_and_missing_scan_id_are_rejected(self):
        with self.database.connect() as connection:
            self.database.create_all(connection, (WIDGETS,))
            with self.assertRaises(StoreError):
                db.insert(connection, WIDGETS, [dict(nope=1)], scan_id=1)
            with self.assertRaises(StoreError):
                db.insert(connection, WIDGETS, [dict(name='x')])

    def test_cascade_delete_is_enabled_on_every_connection(self):
        self.upstream_collectors()
        result = run(self.database, self.request, only=['gadgets'])
        with self.database.connect() as connection:
            with db.transaction(connection):
                connection.execute('DELETE FROM scans WHERE id = ?', (result.scan_id,))
        for table in ('widgets', 'gadgets', 'issues', 'collector_runs'):
            self.assertEqual(self.rows(f'SELECT * FROM {table}'), [], table)

    def test_latest_scan_ignores_unfinished_runs(self):
        self.upstream_collectors()
        done = run(self.database, self.request, only=['widgets'])
        with self.database.connect() as connection:
            with db.transaction(connection):
                db.begin_scan(connection, 'test', self.root)
            self.assertEqual(db.latest_scan(connection, 'test'), done.scan_id)
            self.assertNotEqual(db.latest_scan(connection, 'test', complete_only=False), done.scan_id)
            self.assertIsNone(db.latest_scan(connection, 'other'))

    def test_cancellation_and_callback_failures_surface_as_scan_errors(self):
        @register
        class Slow(BaseCollector):
            NAME, SCHEMA_VERSION, TABLES = 'slow', '1.0.0', (WIDGETS,)

            def collect(self, ctx):
                ctx.progress('phase', 0, 1)
        with self.assertRaises(ScanCancelled):
            run(self.database, self.request, only=['slow'], cancelled=lambda: True)
        with self.assertRaises(ScanFatalError):
            run(self.database, self.request, only=['slow'], on_progress=lambda p: 1 / 0)

    def test_scan_request_options_are_frozen_and_scoped_per_collector(self):
        request = ScanRequest(self.root, 'test', options=dict(hdi=dict(engine='internal')))
        self.assertEqual(request.option('hdi', 'engine'), 'internal')
        self.assertIsNone(request.option('hdi', 'missing'))
        self.assertIsNone(request.option('absent', 'engine'))
        with self.assertRaises(TypeError):
            request.options['hdi'] = {}
        self.assertEqual(ScanLimits().input_files, 100_000)


if __name__ == '__main__':
    unittest.main()
