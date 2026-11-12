# tests -> skill root（oskm_runtime）-> skills -> packages/oskm。
# `unittest discover` 把测试模块当顶层加载，所以这里手工补路径。
import sys as _sys
from pathlib import Path as _Path
_HERE = _Path(__file__).resolve().parent
for _p in (str(_HERE.parent), str(_HERE.parents[2])):
    if _p not in _sys.path:
        _sys.path.insert(0, _p)
import tempfile
import unittest
from pathlib import Path
from unittest import mock

from oskm_runtime import environment


class EnvironmentFileTests(unittest.TestCase):
    def test_loads_supported_values_without_overriding_process_environment(self):
        with tempfile.TemporaryDirectory(prefix='oskm env ') as temp:
            path = Path(temp) / '.env'
            path.write_text(
                '# local only\n'
                f'{environment.SOURCE_ENV}=HARMONYOS_CI\n'
                f'export {environment.ENDPOINT_ENV}='
                "'https://mirror.example.invalid/daily' # archive prefix\n",
                encoding='utf-8',
            )
            with mock.patch.dict(environment.os.environ, {
                environment.ENDPOINT_ENV: 'https://existing.invalid',
            }, clear=True):
                self.assertEqual(environment.load_env_file(path), path)
                self.assertEqual(
                    environment.os.environ[environment.SOURCE_ENV],
                    'HARMONYOS_CI')
                self.assertEqual(
                    environment.os.environ[environment.ENDPOINT_ENV],
                    'https://existing.invalid')

    def test_missing_file_is_a_noop(self):
        with tempfile.TemporaryDirectory(prefix='oskm env ') as temp:
            self.assertIsNone(
                environment.load_env_file(Path(temp) / 'missing.env'))

    def test_rejects_unknown_and_malformed_configuration(self):
        with tempfile.TemporaryDirectory(prefix='oskm env ') as temp:
            path = Path(temp) / '.env'
            bodies = (
                'OTHER_SETTING=value\n',
                'OSKM_BAD_LINE\n',
            )
            for body in bodies:
                with self.subTest(body=body):
                    path.write_text(body, encoding='utf-8')
                    with self.assertRaisesRegex(ValueError, str(path)):
                        environment.load_env_file(path)

    def test_source_defaults_to_openharmony_ci(self):
        with mock.patch.dict(environment.os.environ, {}, clear=True):
            self.assertEqual(
                environment.download_source(),
                environment.OPENHARMONY_CI)

    def test_source_accepts_only_supported_values(self):
        for source in environment.DOWNLOAD_SOURCES:
            with self.subTest(source=source), mock.patch.dict(
                    environment.os.environ, {
                        environment.SOURCE_ENV: source,
                    }, clear=True):
                self.assertEqual(environment.download_source(), source)

        with mock.patch.dict(environment.os.environ, {
            environment.SOURCE_ENV: 'PUBLIC_CI',
        }, clear=True):
            with self.assertRaisesRegex(
                    ValueError, environment.SOURCE_ENV):
                environment.download_source()

    def test_download_config_reads_source_and_endpoint(self):
        with mock.patch.dict(environment.os.environ, {
            environment.SOURCE_ENV: environment.HARMONYOS_CI,
            environment.ENDPOINT_ENV: 'https://mirror.example.invalid/daily/',
        }, clear=True):
            config = environment.download_config()

        self.assertEqual(config.source, environment.HARMONYOS_CI)
        self.assertEqual(
            config.endpoint, 'https://mirror.example.invalid/daily')

    def test_download_config_requires_a_valid_http_endpoint(self):
        cases = ('', 'not-a-url', 'ftp://mirror.example.invalid/daily')
        for endpoint in cases:
            with self.subTest(endpoint=endpoint), mock.patch.dict(
                    environment.os.environ, {
                        environment.ENDPOINT_ENV: endpoint,
                    }, clear=True):
                with self.assertRaisesRegex(
                        ValueError, environment.ENDPOINT_ENV):
                    environment.download_config()

    def test_configuration_summary_masks_endpoint(self):
        with mock.patch.dict(environment.os.environ, {
            environment.ENDPOINT_ENV:
                'https://mirror.internal.invalid/private',
        }, clear=True):
            valid, state = environment.download_configuration()

        self.assertTrue(valid)
        self.assertIn(f'{environment.SOURCE_ENV}=OPENHARMONY_CI', state)
        self.assertIn(f'{environment.ENDPOINT_ENV}=已配置', state)
        self.assertNotIn('internal.invalid', state)

    def test_configuration_summary_reports_incomplete_settings(self):
        with mock.patch.dict(environment.os.environ, {}, clear=True):
            valid, state = environment.download_configuration()

        self.assertFalse(valid)
        self.assertIn(f'{environment.ENDPOINT_ENV}=未配置', state)


if __name__ == '__main__':
    unittest.main()
