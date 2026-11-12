"""ArkTS implementation and install paths are reported without rewriting.

The collector writes ``impl_so_path`` using the scan request's ``cpu_arch``:
``arm`` uses ``system/lib`` and ``arm64`` uses ``system/lib64``. Query answering
reports that stored fact and the linked ``install_targets.dest``; it does not
rewrite either path during querying.
"""
# cli/tests -> cli (oskm_cli) / packages/oskm (oskm_schema, oskm_testing)。
# `unittest discover -s cli/tests` 把测试模块当顶层加载，所以这里手工补路径。
import sys as _sys
from pathlib import Path as _Path
_HERE = _Path(__file__).resolve().parent
for _p in (str(_HERE.parents[0]), str(_HERE.parents[1])):
    if _p not in _sys.path:
        _sys.path.insert(0, _p)
import sqlite3
import unittest

from oskm_cli.query.arkts import ArktsQuery


class ArktsImplementationPathTest(unittest.TestCase):
    def resolve(self, impl_so_path, installed_at=None):
        connection = sqlite3.connect(':memory:')
        self.addCleanup(connection.close)
        connection.row_factory = sqlite3.Row
        connection.executescript('''
            CREATE TABLE elf_modules (
                id INTEGER PRIMARY KEY,
                install_target_id INTEGER,
                file_name TEXT,
                partition TEXT
            );
            CREATE TABLE install_targets (
                id INTEGER PRIMARY KEY,
                dest TEXT NOT NULL
            );
        ''')
        if installed_at is not None:
            connection.execute(
                'INSERT INTO install_targets (id, dest) VALUES (1, ?)', (installed_at,))
            connection.execute(
                "INSERT INTO elf_modules (id, install_target_id, file_name, partition) "
                "VALUES (1, 1, 'libimage.z.so', 'system')")

        query = ArktsQuery.__new__(ArktsQuery)
        query.connection = connection
        query._available = lambda *tables: True
        return query._implementations({
            'impl_so_path': impl_so_path,
            'impl_napi_name': '@ohos.multimedia.image',
            'impl_match': 'module_name',
            'impl_elf_id': 1 if installed_at is not None else None,
        })

    def test_arm_reports_the_actual_lib_path(self):
        path = 'system/lib/module/multimedia/libimage.z.so'
        result = self.resolve(path, path)
        self.assertEqual(result['impl_so_path'],
                         path)
        self.assertEqual(result['installed_at'], path)

    def test_arm64_reports_the_actual_lib64_path(self):
        path = 'system/lib64/module/multimedia/libimage.z.so'
        result = self.resolve(path, path)
        self.assertEqual(result['impl_so_path'],
                         path)
        self.assertEqual(result['installed_at'], path)

    def test_unlinked_declaration_has_no_installed_path(self):
        path = 'system/lib/module/multimedia/libimage.z.so'
        result = self.resolve(path)
        self.assertEqual(result['impl_so_path'],
                         path)
        self.assertNotIn('installed_at', result)


if __name__ == '__main__':
    unittest.main()
