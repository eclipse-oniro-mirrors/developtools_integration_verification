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

from agentic import db_download, runtime


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
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.root = Path(self.temp.name)
        self.environment = mock.patch.dict(db_download.os.environ, {
            db_download.YELLOW_DB_BASE_ENV:
                'https://yellow-db.example.invalid',
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
        source = self.root / 'source.db'
        return self.sqlite_bytes(source)

    def payload(self):
        archive = self.root / 'source.tar.gz'
        source = self.root / 'source.db'
        self.sqlite_bytes(source)
        with tarfile.open(archive, 'w:gz') as bundle:
            bundle.add(source, arcname='knowledge.db')
        return archive.read_bytes()

    def runtime_payload(self):
        source = self.root / 'runtime-source.db'
        self.sqlite_bytes(source)
        js_source = self.root / 'declaration.d.ts'
        js_source.write_text('export interface RuntimeMarker {}', encoding='utf-8')
        c_source = self.root / 'runtime.h'
        c_source.write_text('#define RUNTIME_MARKER 1\n', encoding='utf-8')
        archive = self.root / 'runtime.tar.gz'
        with tarfile.open(archive, 'w:gz') as bundle:
            # ``tar czf knowledge.tar.gz .`` includes these container entries.
            for name in (
                    '.', 'interface', 'interface/sdk-js', 'interface/sdk_c'):
                info = tarfile.TarInfo(name)
                info.type = tarfile.DIRTYPE
                info.mode = 0o755
                bundle.addfile(info)
            bundle.add(source, arcname='knowledge.db')
            bundle.add(
                js_source, arcname='interface/sdk-js/api/runtime.d.ts')
            bundle.add(c_source, arcname='interface/sdk_c/runtime.h')
        return archive.read_bytes()

    def assert_sqlite_marker(self, path):
        connection = sqlite3.connect(path)
        try:
            self.assertEqual(
                connection.execute('SELECT value FROM marker').fetchone()[0], 'ok')
        finally:
            connection.close()

    def test_yellow_uses_exact_requested_date_and_creates_parent(self):
        output = self.root / 'nested' / 'knowledge_20261102.db'
        requests = []

        def open_url(request, timeout):
            requests.append((request, timeout))
            return FakeResponse(self.payload(), url=request.full_url)

        with mock.patch.object(db_download, 'urlopen', side_effect=open_url):
            result = db_download.download_database(
                zone='yellow', date='20261102', output=output)

        self.assertEqual(result, output.resolve())
        self.assertTrue(output.is_file())
        self.assert_sqlite_marker(output)
        self.assertEqual(requests[0][0].full_url,
                         'https://yellow-db.example.invalid/20261102')
        self.assertNotIn('/latest', requests[0][0].full_url)

    def test_yellow_requires_configured_base_url_before_network(self):
        output = self.root / 'knowledge.db'
        with mock.patch.dict(
                db_download.os.environ,
                {db_download.YELLOW_DB_BASE_ENV: ''}), \
                mock.patch.object(db_download, 'urlopen') as open_url:
            with self.assertRaisesRegex(
                    db_download.DownloadError,
                    db_download.YELLOW_DB_BASE_ENV):
                db_download.download_database(
                    zone='yellow', date='20261102', output=output)
        open_url.assert_not_called()

    def test_blue_posts_the_date_range_and_downloads_obs_path(self):
        archive = self.root / 'knowledge_20261102.zip'
        with zipfile.ZipFile(archive, 'w') as bundle:
            bundle.writestr('bundle/knowledge.db', self.sqlite_payload())
        requests = []

        def open_url(request, timeout):
            requests.append(request)
            if request.full_url == db_download.BLUE_BUILD_API:
                return FakeResponse(json.dumps({
                    'data': {'list': {'dataList': [
                        {'obsPath': 'https://obs.example/build/db.zip?token=abc'}
                    ]}}
                }).encode(), url=request.full_url)
            return FakeResponse(archive.read_bytes(), url=request.full_url)

        output = self.root / 'history.db'
        with mock.patch.object(db_download, 'urlopen', side_effect=open_url):
            db_download.download_database(
                zone='blue', date='20261102', output=output,
                component='dayu600_7885_ai')

        api_request = requests[0]
        body = json.loads(api_request.data.decode('utf-8'))
        self.assertEqual(api_request.full_url, db_download.BLUE_BUILD_API)
        self.assertEqual(api_request.get_method(), 'POST')
        self.assertEqual(body['component'], 'dayu600_7885_ai')
        self.assertEqual(body['startTime'], '2026110200000000')
        self.assertEqual(body['endTime'], '20261102235959')
        self.assertEqual(body['buildStatus'], 'success')
        self.assertEqual(requests[1].full_url,
                         'https://obs.example/build/db.zip?token=abc')
        self.assert_sqlite_marker(output)

    def test_runtime_bundle_extracts_database_and_both_sdk_trees(self):
        output = self.root / 'runtime'
        requests = []

        def open_url(request, timeout):
            requests.append((request, timeout))
            return FakeResponse(self.runtime_payload(), url=request.full_url)

        with mock.patch.object(db_download, 'urlopen', side_effect=open_url):
            result = db_download.download_runtime_bundle(
                zone='yellow', date='20261102', output=output)

        self.assertEqual(result, output.resolve())
        self.assert_sqlite_marker(output / 'knowledge.db')
        self.assertTrue(
            (output / 'interface/sdk-js/api/runtime.d.ts').is_file())
        self.assertTrue((output / 'interface/sdk_c/runtime.h').is_file())
        self.assertEqual(requests[0][0].full_url,
                         'https://yellow-db.example.invalid/20261102')

    def test_db_zip_and_tar_downloads_are_supported(self):
        payload = self.sqlite_payload()
        cases = {}

        direct = self.root / 'knowledge.db'
        direct.write_bytes(payload)
        cases['knowledge.db'] = direct.read_bytes()

        zipped = self.root / 'knowledge.zip'
        with zipfile.ZipFile(zipped, 'w') as bundle:
            bundle.writestr('build/knowledge.db', payload)
        cases['knowledge.zip'] = zipped.read_bytes()

        tarball = self.root / 'knowledge.tar.gz'
        source = self.root / 'archive-source.db'
        source.write_bytes(payload)
        with tarfile.open(tarball, 'w:gz') as bundle:
            bundle.add(source, arcname='build/knowledge.db')
        cases['knowledge.tar.gz'] = tarball.read_bytes()

        for name, response_body in cases.items():
            with self.subTest(name=name):
                output = self.root / f'out-{name}.db'

                def open_url(request, timeout):
                    if request.full_url == db_download.BLUE_BUILD_API:
                        return FakeResponse(json.dumps({
                            'data': {'list': {'dataList': [
                                {'obsPath': f'https://obs.example/build/{name}'}
                            ]}}
                        }).encode(), url=request.full_url)
                    return FakeResponse(response_body, url=request.full_url)

                with mock.patch.object(
                        db_download, 'urlopen', side_effect=open_url):
                    db_download.download_database(
                        zone='blue', date='20261102', output=output,
                        component='component')
                self.assert_sqlite_marker(output)

    def test_archives_must_contain_exactly_one_knowledge_db(self):
        archive = self.root / 'duplicates.zip'
        payload = self.payload()
        with zipfile.ZipFile(archive, 'w') as bundle:
            bundle.writestr('a/knowledge.db', payload)
            bundle.writestr('b/knowledge.db', payload)

        output = self.root / 'history.db'
        output.write_bytes(b'keep-me')
        api = FakeResponse(json.dumps({
            'data': {'list': {'dataList': [
                {'obsPath': 'https://obs.example/build/duplicates.zip'}
            ]}}
        }).encode())
        with mock.patch.object(
                db_download, 'urlopen',
                side_effect=[api, FakeResponse(archive.read_bytes())]):
            with self.assertRaisesRegex(
                    db_download.DownloadError, '恰有一个 knowledge.db'):
                db_download.download_database(
                    zone='blue', date='20261102', output=output,
                    component='component')
        self.assertEqual(output.read_bytes(), b'keep-me')

    def test_yellow_rejects_component_before_network(self):
        output = self.root / 'history.db'
        with mock.patch.object(db_download, 'urlopen') as open_url:
            with self.assertRaisesRegex(
                    db_download.DownloadError, '黄区不接受 --component'):
                db_download.download_database(
                    zone='yellow', date='20261102', output=output,
                    component='component')
        open_url.assert_not_called()

    def test_blue_requires_component_before_network(self):
        output = self.root / 'history.db'
        with mock.patch.object(db_download, 'urlopen') as open_url:
            with self.assertRaisesRegex(
                    db_download.DownloadError, '蓝区必须指定 --component'):
                db_download.download_database(
                    zone='blue', date='20261102', output=output)
        open_url.assert_not_called()

    def test_invalid_zone_and_date_fail_before_network(self):
        output = self.root / 'history.db'
        cases = (
            (dict(zone='red', date='20261102'), '--zone'),
            (dict(zone='yellow', date='2026110'), '--date'),
            (dict(zone='yellow', date='2026-11-02'), '--date'),
            (dict(zone='yellow', date='20260231'), '--date'),
        )
        for kwargs, message in cases:
            with self.subTest(kwargs=kwargs):
                with mock.patch.object(db_download, 'urlopen') as open_url:
                    with self.assertRaisesRegex(
                            db_download.DownloadError, message):
                        db_download.download_database(output=output, **kwargs)
                open_url.assert_not_called()

    def test_http_failure_preserves_existing_output(self):
        output = self.root / 'history.db'
        output.write_bytes(b'keep-me')
        with mock.patch.object(
                db_download, 'urlopen',
                side_effect=URLError('proxy connection refused')):
            with self.assertRaisesRegex(
                    db_download.DownloadError, '网络或代理'):
                db_download.download_database(
                    zone='yellow', date='20261102', output=output, attempts=1)
        self.assertEqual(output.read_bytes(), b'keep-me')
        self.assertEqual(list(self.root.glob('.oskm-db-download.*')), [])

    def test_http_status_failure_reports_uri_and_status(self):
        output = self.root / 'history.db'
        error = HTTPError(
            'https://yellow-db.example.invalid/20261102', 503,
            'unavailable', {}, None)
        with mock.patch.object(db_download, 'urlopen', side_effect=error):
            with self.assertRaisesRegex(
                    db_download.DownloadError, 'HTTP 503'):
                db_download.download_database(
                    zone='yellow', date='20261102', output=output, attempts=1)
        self.assertFalse(output.exists())

    def test_invalid_sqlite_and_unknown_suffix_preserve_existing_output(self):
        output = self.root / 'history.db'
        output.write_bytes(b'keep-me')

        invalid_archive = self.root / 'invalid.tar.gz'
        invalid_db = self.root / 'invalid.db'
        invalid_db.write_bytes(b'not a sqlite database')
        with tarfile.open(invalid_archive, 'w:gz') as bundle:
            bundle.add(invalid_db, arcname='knowledge.db')

        with mock.patch.object(
                db_download, 'urlopen',
                side_effect=lambda *args, **kwargs: FakeResponse(
                    invalid_archive.read_bytes())):
            with self.assertRaisesRegex(
                    db_download.DownloadError, 'SQLite integrity_check'):
                db_download.download_database(
                    zone='yellow', date='20261102', output=output)
        self.assertEqual(output.read_bytes(), b'keep-me')

        api = json.dumps({
            'data': {'list': {'dataList': [
                {'obsPath': 'https://obs.example/build/knowledge.7z'}
            ]}}
        }).encode()
        with mock.patch.object(
                db_download, 'urlopen',
                side_effect=lambda *args, **kwargs: FakeResponse(api)):
            with self.assertRaisesRegex(
                    db_download.DownloadError, '无法识别的 DB 下载后缀'):
                db_download.download_database(
                    zone='blue', date='20261102', output=output,
                    component='component')
        self.assertEqual(output.read_bytes(), b'keep-me')

    def test_missing_blue_build_reports_date_and_component(self):
        output = self.root / 'history.db'
        response = FakeResponse(json.dumps({'data': {'list': {
            'dataList': []}}}).encode())
        with mock.patch.object(db_download, 'urlopen', return_value=response):
            with self.assertRaisesRegex(
                    db_download.DownloadError,
                    '20261102.*missing-component.*obsPath'):
                db_download.download_database(
                    zone='blue', date='20261102', output=output,
                    component='missing-component')

    def test_cli_download_uses_the_same_implementation(self):
        output = self.root / 'history.db'
        with mock.patch.object(
                runtime, 'download_database',
                return_value=output.resolve()) as download:
            code = runtime.main([
                'download-db', '--zone', 'yellow', '--date', '20261102',
                '--output', str(output),
            ])
        self.assertEqual(code, 0)
        download.assert_called_once_with(
            zone='yellow', date='20261102', output=output.resolve(),
            component=None)


if __name__ == '__main__':
    unittest.main()
