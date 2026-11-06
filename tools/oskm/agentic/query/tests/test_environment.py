import tempfile
import unittest
from pathlib import Path
from unittest import mock

from agentic import environment


class EnvironmentFileTests(unittest.TestCase):
    def test_loads_supported_values_without_overriding_process_environment(self):
        with tempfile.TemporaryDirectory(prefix='oskm env ') as temp:
            path = Path(temp) / '.env'
            path.write_text(
                '# local only\n'
                f'{environment.DEFAULT_ZONE_ENV}=blue\n'
                f'export {environment.YELLOW_DB_BASE_ENV}='
                "'https://yellow-db.example.invalid/base' # mirror\n",
                encoding='utf-8',
            )
            with mock.patch.dict(environment.os.environ, {
                environment.YELLOW_DB_BASE_ENV: 'https://existing.invalid',
            }, clear=True):
                self.assertEqual(environment.load_env_file(path), path)
                self.assertEqual(
                    environment.os.environ[environment.YELLOW_DB_BASE_ENV],
                    'https://existing.invalid')
                self.assertEqual(environment.default_zone(), 'blue')

    def test_missing_file_is_a_noop(self):
        with tempfile.TemporaryDirectory(prefix='oskm env ') as temp:
            self.assertIsNone(
                environment.load_env_file(Path(temp) / 'missing.env'))

    def test_rejects_unknown_or_malformed_configuration(self):
        with tempfile.TemporaryDirectory(prefix='oskm env ') as temp:
            path = Path(temp) / '.env'
            for body in ('OTHER_SETTING=value\n', 'OSKM_BAD_LINE\n'):
                path.write_text(body, encoding='utf-8')
                with self.assertRaisesRegex(ValueError, str(path)):
                    environment.load_env_file(path)

    def test_yellow_configuration_never_returns_values(self):
        with mock.patch.dict(environment.os.environ, {
            environment.YELLOW_DB_BASE_ENV:
                'https://yellow-db.internal.invalid/base',
        }, clear=True):
            valid, state = environment.yellow_configuration()

        self.assertTrue(valid)
        self.assertIn(f'{environment.YELLOW_DB_BASE_ENV}=已配置', state)
        self.assertNotIn('internal.invalid', state)

    def test_yellow_configuration_can_require_a_configured_url(self):
        with mock.patch.dict(environment.os.environ, {}, clear=True):
            optional_valid, _ = environment.yellow_configuration()
            required_valid, state = environment.yellow_configuration(
                required=True)

        self.assertTrue(optional_valid)
        self.assertFalse(required_valid)
        self.assertIn(f'{environment.YELLOW_DB_BASE_ENV}=未配置', state)

    def test_default_zone_defaults_to_blue_and_rejects_invalid_values(self):
        with mock.patch.dict(environment.os.environ, {}, clear=True):
            self.assertEqual(environment.default_zone(), 'blue')
        with mock.patch.dict(environment.os.environ, {
            environment.DEFAULT_ZONE_ENV: 'red',
        }, clear=True):
            with self.assertRaisesRegex(ValueError, 'blue 或 yellow'):
                environment.default_zone()


if __name__ == '__main__':
    unittest.main()
