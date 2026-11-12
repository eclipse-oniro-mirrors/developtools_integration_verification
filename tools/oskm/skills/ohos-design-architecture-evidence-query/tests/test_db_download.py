# tests -> skill root（oskm_runtime）-> skills -> packages/oskm。
# `unittest discover` 把测试模块当顶层加载，所以这里手工补路径。
import sys as _sys
from pathlib import Path as _Path
_HERE = _Path(__file__).resolve().parent
for _p in (str(_HERE.parent), str(_HERE.parents[2])):
    if _p not in _sys.path:
        _sys.path.insert(0, _p)
import io
import json
import sqlite3
import tarfile
import tempfile
import unittest
import zipfile
from pathlib import Path
from unittest import mock
from urllib.error import HTTPError, URLError

from oskm_runtime import db_download
from oskm_testing.fixture import write_minimal_pyz


class FakeResponse(io.BytesIO):
    def __init__(self, payload=b'', *, status=200, headers=None, url=''):
        super().__init__(payload)
        self.status = status
        self.headers = headers or {}
        self.url = url

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc, traceback):
        self.close()


class DownloadDatabaseTests(unittest.TestCase):
    endpoint = (
        'https://ci.example.invalid/api/daily_build/build/list/component')

    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.root = Path(self.temp.name)
        self.environment = mock.patch.dict(db_download.os.environ, {
            'OSKM_DOWNLOAD_SOURCE': 'OPENHARMONY_CI',
            'OSKM_DOWNLOAD_ENDPOINT': self.endpoint,
        })
        self.environment.start()
        self.addCleanup(self.environment.stop)

    def tearDown(self):
        self.temp.cleanup()

    @staticmethod
    def sqlite_bytes(path):
        connection = sqlite3.connect(path)
        connection.execute('CREATE TABLE marker(value TEXT)')
        connection.execute("INSERT INTO marker VALUES ('ok')")
        connection.commit()
        connection.close()
        return Path(path).read_bytes()

    def sqlite_payload(self):
        return self.sqlite_bytes(self.root / 'source.db')

    def payload(self):
        archive = self.root / 'source.tar.gz'
        source = self.root / 'source.db'
        self.sqlite_bytes(source)
        with tarfile.open(archive, 'w:gz') as bundle:
            bundle.add(source, arcname='knowledge.db')
        return archive.read_bytes()

    def runtime_payload(self, extra_files=None):
        source = self.root / 'runtime-source.db'
        self.sqlite_bytes(source)
        js_source = self.root / 'declaration.d.ts'
        js_source.write_text('export interface RuntimeMarker {}', encoding='utf-8')
        c_source = self.root / 'runtime.h'
        c_source.write_text('#define RUNTIME_MARKER 1\n', encoding='utf-8')
        cli_source = write_minimal_pyz(self.root / 'runtime-oskm-cli.pyz')
        archive = self.root / 'runtime.tar.gz'
        with tarfile.open(archive, 'w:gz') as bundle:
            for name in (
                    '.', 'interface', 'interface/sdk-js', 'interface/sdk_c'):
                info = tarfile.TarInfo(name)
                info.type = tarfile.DIRTYPE
                info.mode = 0o755
                bundle.addfile(info)
            bundle.add(source, arcname='knowledge.db')
            bundle.add(cli_source, arcname='oskm-cli.pyz')
            bundle.add(
                js_source, arcname='interface/sdk-js/api/runtime.d.ts')
            bundle.add(c_source, arcname='interface/sdk_c/runtime.h')
            for name, content in (extra_files or {}).items():
                payload = content.encode('utf-8')
                info = tarfile.TarInfo(name)
                info.size = len(payload)
                bundle.addfile(info, io.BytesIO(payload))
        return archive.read_bytes()

    def zip_payload(self):
        archive = self.root / 'knowledge.zip'
        with zipfile.ZipFile(archive, 'w') as bundle:
            bundle.writestr('build/knowledge.db', self.sqlite_payload())
        return archive.read_bytes()

    def assert_sqlite_marker(self, path):
        connection = sqlite3.connect(path)
        try:
            self.assertEqual(
                connection.execute('SELECT value FROM marker').fetchone()[0], 'ok')
        finally:
            connection.close()

    def openharmony_response(self, archive):
        def open_url(request, timeout):
            if request.full_url == self.endpoint:
                return FakeResponse(json.dumps({
                    'data': {'list': {'dataList': [
                        {'obsPath': 'https://obs.example/build/db.zip'}
                    ]}}
                }).encode(), url=request.full_url)
            return FakeResponse(archive, url=request.full_url)
        return open_url

    def test_openharmony_posts_fixed_component_and_exact_date_range(self):
        requests = []
        archive = self.zip_payload()

        def open_url(request, timeout):
            requests.append(request)
            return self.openharmony_response(archive)(request, timeout)

        output = self.root / 'nested' / 'knowledge_20261102.db'
        with mock.patch.object(db_download, 'urlopen', side_effect=open_url):
            result = db_download.download_database(
                date='20261102', output=output)

        self.assertEqual(result, output.resolve())
        self.assert_sqlite_marker(output)
        api_request, archive_request = requests
        body = json.loads(api_request.data.decode('utf-8'))
        self.assertEqual(api_request.full_url, self.endpoint)
        self.assertEqual(api_request.get_method(), 'POST')
        self.assertEqual(body['component'], 'dayu600_7885_ai')
        self.assertEqual(body['startTime'], '2026110200000000')
        self.assertEqual(body['endTime'], '20261102235959')
        self.assertEqual(body['buildStatus'], 'success')
        self.assertIsNone(api_request.get_header('Authorization'))
        self.assertEqual(archive_request.get_method(), 'GET')
        self.assertIsNone(archive_request.get_header('Authorization'))

    def test_openharmony_is_the_default_source(self):
        requests = []
        archive = self.zip_payload()

        def open_url(request, timeout):
            requests.append(request)
            return self.openharmony_response(archive)(request, timeout)

        with mock.patch.dict(
                db_download.os.environ, {'OSKM_DOWNLOAD_SOURCE': ''}), \
                mock.patch.object(db_download, 'urlopen', side_effect=open_url):
            db_download.download_database(
                date='20261102', output=self.root / 'knowledge.db')

        self.assertEqual(requests[0].get_method(), 'POST')
        self.assertEqual(
            json.loads(requests[0].data)['component'], 'dayu600_7885_ai')

    def test_harmonyos_gets_exact_date(self):
        requests = []
        archive = self.payload()
        endpoint = 'https://harmony.example.invalid/mirror'

        def open_url(request, timeout):
            requests.append(request)
            return FakeResponse(archive, url=request.full_url)

        output = self.root / 'knowledge.db'
        with mock.patch.dict(db_download.os.environ, {
                'OSKM_DOWNLOAD_SOURCE': 'HARMONYOS_CI',
                'OSKM_DOWNLOAD_ENDPOINT': endpoint,
        }), mock.patch.object(db_download, 'urlopen', side_effect=open_url):
            result = db_download.download_database(
                date='20261102', output=output)

        self.assertEqual(result, output.resolve())
        self.assertEqual(len(requests), 1)
        self.assertEqual(requests[0].get_method(), 'GET')
        self.assertEqual(
            requests[0].full_url, f'{endpoint}/20261102')
        self.assertNotIn('/latest', requests[0].full_url)
        self.assertIsNone(requests[0].get_header('Authorization'))
        self.assert_sqlite_marker(output)

    def test_invalid_source_and_date_fail_before_network(self):
        output = self.root / 'knowledge.db'
        cases = (
            ({'OSKM_DOWNLOAD_SOURCE': 'NOT_A_CI'},
             {'date': '20261102', 'output': output}, 'OSKM_DOWNLOAD_SOURCE'),
            ({}, {'date': '2026110', 'output': output}, '--date'),
            ({}, {'date': '2026-11-02', 'output': output}, '--date'),
            ({}, {'date': '20260231', 'output': output}, '--date'),
        )
        for environment, kwargs, message in cases:
            with self.subTest(environment=environment, kwargs=kwargs):
                with mock.patch.dict(db_download.os.environ, environment), \
                        mock.patch.object(db_download, 'urlopen') as open_url:
                    with self.assertRaisesRegex(
                            db_download.DownloadError, message):
                        db_download.download_database(**kwargs)
                open_url.assert_not_called()

    def test_invalid_endpoint_fails_before_network(self):
        output = self.root / 'knowledge.db'
        cases = (
            ({'OSKM_DOWNLOAD_ENDPOINT': ''}, 'OSKM_DOWNLOAD_ENDPOINT'),
            ({'OSKM_DOWNLOAD_ENDPOINT': 'not-a-url'},
             'OSKM_DOWNLOAD_ENDPOINT'),
        )
        for environment, message in cases:
            with self.subTest(environment=environment):
                with mock.patch.dict(db_download.os.environ, environment), \
                        mock.patch.object(db_download, 'urlopen') as open_url:
                    with self.assertRaisesRegex(
                            db_download.DownloadError, message):
                        db_download.download_database(
                            date='20261102', output=output)
                open_url.assert_not_called()

    def test_http_failure_preserves_existing_output(self):
        output = self.root / 'knowledge.db'
        output.write_bytes(b'keep-me')
        with mock.patch.dict(
                db_download.os.environ,
                {'OSKM_DOWNLOAD_SOURCE': 'HARMONYOS_CI'}), \
                mock.patch.object(
                    db_download, 'urlopen',
                    side_effect=URLError('proxy connection refused')):
            with self.assertRaisesRegex(
                    db_download.DownloadError, '网络或代理'):
                db_download.download_database(
                    date='20261102', output=output, attempts=1)
        self.assertEqual(output.read_bytes(), b'keep-me')
        self.assertEqual(list(self.root.glob('.oskm-db-download.*')), [])

    def test_http_status_failure_reports_uri_and_status(self):
        output = self.root / 'knowledge.db'
        error = HTTPError(
            f'{self.endpoint}/20261102', 503, 'unavailable', {}, None)
        with mock.patch.dict(
                db_download.os.environ,
                {'OSKM_DOWNLOAD_SOURCE': 'HARMONYOS_CI'}), \
                mock.patch.object(db_download, 'urlopen', side_effect=error):
            with self.assertRaisesRegex(
                    db_download.DownloadError, 'HTTP 503'):
                db_download.download_database(
                    date='20261102', output=output, attempts=1)
        self.assertFalse(output.exists())

    def test_invalid_sqlite_preserves_existing_output(self):
        output = self.root / 'knowledge.db'
        output.write_bytes(b'keep-me')
        invalid_archive = self.root / 'invalid.tar.gz'
        invalid_db = self.root / 'invalid.db'
        invalid_db.write_bytes(b'not a sqlite database')
        with tarfile.open(invalid_archive, 'w:gz') as bundle:
            bundle.add(invalid_db, arcname='knowledge.db')

        with mock.patch.dict(
                db_download.os.environ,
                {'OSKM_DOWNLOAD_SOURCE': 'HARMONYOS_CI'}), \
                mock.patch.object(
                    db_download, 'urlopen',
                    side_effect=lambda *args, **kwargs: FakeResponse(
                        invalid_archive.read_bytes())):
            with self.assertRaisesRegex(
                    db_download.DownloadError, 'SQLite integrity_check'):
                db_download.download_database(
                    date='20261102', output=output)
        self.assertEqual(output.read_bytes(), b'keep-me')

    def test_archives_must_contain_exactly_one_knowledge_db(self):
        archive = self.root / 'duplicates.zip'
        payload = self.payload()
        with zipfile.ZipFile(archive, 'w') as bundle:
            bundle.writestr('a/knowledge.db', payload)
            bundle.writestr('b/knowledge.db', payload)

        output = self.root / 'history.db'
        output.write_bytes(b'keep-me')
        with mock.patch.object(
                db_download, 'urlopen',
                side_effect=self.openharmony_response(archive.read_bytes())):
            with self.assertRaisesRegex(
                    db_download.DownloadError, '恰有一个 knowledge.db'):
                db_download.download_database(
                    date='20261102', output=output)
        self.assertEqual(output.read_bytes(), b'keep-me')

    def test_downloaded_runtime_extracts_database_and_both_sdk_trees(self):
        output = self.root / 'runtime'
        with mock.patch.object(
                db_download, 'urlopen',
                return_value=FakeResponse(self.runtime_payload())):
            result = db_download.download_runtime_bundle(
                source='HARMONYOS_CI', date='20261102', output=output)

        self.assertEqual(result, output.resolve())
        self.assert_sqlite_marker(output / 'knowledge.db')
        # 归档里有四样东西，解出来也应该是四样。
        self.assertTrue((output / 'oskm-cli.pyz').is_file(),
                        'knowledge.tar.gz 自带 oskm-cli.pyz')
        # 归档里的 0755 要保住，否则装完之后 `./oskm-cli.pyz` 会 permission denied。
        self.assertTrue((output / 'oskm-cli.pyz').stat().st_mode & 0o111,
                        'oskm-cli.pyz 解出来后必须仍是可执行的')
        self.assertTrue(
            (output / 'interface/sdk-js/api/runtime.d.ts').is_file())
        self.assertTrue((output / 'interface/sdk_c/runtime.h').is_file())

    def test_runtime_bundle_failure_preserves_existing_output(self):
        output = self.root / 'runtime'
        output.mkdir()
        marker = output / 'marker.txt'
        marker.write_text('keep-me', encoding='utf-8')
        invalid_db = self.root / 'invalid.db'
        invalid_db.write_bytes(b'not sqlite')
        cli_source = write_minimal_pyz(self.root / 'bad-runtime-cli.pyz')
        archive = self.root / 'runtime.tar.gz'
        with tarfile.open(archive, 'w:gz') as bundle:
            bundle.add(invalid_db, arcname='knowledge.db')
            bundle.add(cli_source, arcname='oskm-cli.pyz')
            for relative in db_download.RUNTIME_SDK_DIRS:
                source = self.root / relative.replace('/', '-')
                source.write_text('marker', encoding='utf-8')
                bundle.add(source, arcname=f'{relative}/marker.txt')

        with mock.patch.object(
                db_download, 'urlopen',
                return_value=FakeResponse(archive.read_bytes())):
            with self.assertRaisesRegex(
                    db_download.DownloadError, 'SQLite integrity_check'):
                db_download.download_runtime_bundle(
                    source='HARMONYOS_CI', date='20261102', output=output)

        self.assertEqual(marker.read_text(encoding='utf-8'), 'keep-me')
        self.assertEqual(
            sorted(path.name for path in output.iterdir()), ['marker.txt'])

if __name__ == '__main__':
    unittest.main()
