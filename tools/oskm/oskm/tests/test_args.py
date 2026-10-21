"""Tests for the args collector: gn_args parsing, JSON extraction, value classification."""
import json
import os
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch, MagicMock

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(__file__))))

from oskm.collectors.args.gn_args import (
    find_gn, run_gn_args, extract_json, parse_gn_value, classify_value,
    GN_PATHS,
)


class TestParseGnValue(unittest.TestCase):
    def test_bool_true(self):
        self.assertEqual(parse_gn_value('true'), True)

    def test_bool_false(self):
        self.assertEqual(parse_gn_value('false'), False)

    def test_string(self):
        self.assertEqual(parse_gn_value('"hello"'), 'hello')

    def test_empty_string(self):
        self.assertEqual(parse_gn_value('""'), '')

    def test_int(self):
        self.assertEqual(parse_gn_value('42'), 42)

    def test_negative_int(self):
        self.assertEqual(parse_gn_value('-1'), -1)

    def test_list(self):
        self.assertEqual(parse_gn_value('["a", "b"]'), ['a', 'b'])

    def test_non_string(self):
        self.assertEqual(parse_gn_value(42), 42)

    def test_complex_expression(self):
        result = parse_gn_value('some_complex_expr')
        self.assertEqual(result, 'some_complex_expr')


class TestClassifyValue(unittest.TestCase):
    def test_bool(self):
        self.assertEqual(classify_value(True), 'bool')
        self.assertEqual(classify_value(False), 'bool')

    def test_str(self):
        self.assertEqual(classify_value('hello'), 'str')

    def test_int(self):
        self.assertEqual(classify_value(42), 'int')

    def test_list(self):
        self.assertEqual(classify_value([1, 2]), 'list')

    def test_other(self):
        self.assertEqual(classify_value(None), 'other')
        self.assertEqual(classify_value(3.14), 'other')


class TestExtractJson(unittest.TestCase):
    def test_clean_json(self):
        output = '[{"name": "test", "default": {"file": "//a.gni", "line": 1, "value": "true"}}]'
        data = extract_json(output)
        self.assertEqual(len(data), 1)
        self.assertEqual(data[0]['name'], 'test')

    def test_mixed_with_noise(self):
        output = 'some print output\nmore noise\n[{"name": "x", "default": {"file": "//b.gni", "line": 2, "value": "false"}}]'
        data = extract_json(output)
        self.assertEqual(len(data), 1)
        self.assertEqual(data[0]['name'], 'x')
        self.assertEqual(data[0]['default']['file'], '//b.gni')

    def test_multiple_items(self):
        output = 'noise\n[{"name": "a", "default": {"file": "//1.gni", "line": 1, "value": "true"}}, {"name": "b", "default": {"file": "//2.gni", "line": 2, "value": "false"}}]'
        data = extract_json(output)
        self.assertEqual(len(data), 2)
        self.assertEqual(data[0]['name'], 'a')
        self.assertEqual(data[1]['name'], 'b')

    def test_empty_output(self):
        self.assertEqual(extract_json(''), [])

    def test_no_json(self):
        self.assertEqual(extract_json('just text, no json'), [])

    def test_with_override_and_comment(self):
        output = '[{"name": "feat", "default": {"file": "//x.gni", "line": 10, "value": "true"}, "current": {"file": "//out/p/args.gn", "line": 5, "value": "false"}, "comment": "Enable feature"}]'
        data = extract_json(output)
        self.assertEqual(len(data), 1)
        self.assertIn('current', data[0])
        self.assertIn('comment', data[0])
        self.assertEqual(data[0]['comment'], 'Enable feature')


class TestFindGn(unittest.TestCase):
    def test_not_found(self):
        with tempfile.TemporaryDirectory() as tmp:
            self.assertIsNone(find_gn(tmp))

    def test_found(self):
        with tempfile.TemporaryDirectory() as tmp:
            arch = 'aarch64' if __import__('platform').machine().lower() == 'aarch64' else 'x86_64'
            gn_rel = GN_PATHS[arch]
            gn_path = os.path.join(tmp, gn_rel)
            os.makedirs(os.path.dirname(gn_path), exist_ok=True)
            Path(gn_path).touch()
            self.assertEqual(find_gn(tmp), gn_path)


class TestCollectorRegistration(unittest.TestCase):
    def test_registered(self):
        from oskm.core.framework import discover, names
        discover()
        self.assertIn('args', names())

    def test_schema(self):
        from oskm.core.framework import discover, get
        discover()
        collector = get('args')
        self.assertEqual(collector.NAME, 'args')
        self.assertEqual(collector.SCHEMA_VERSION, '1.0.0')
        self.assertEqual(collector.DEPENDS_ON, ('components',))
        self.assertEqual(len(collector.TABLES), 1)
        self.assertEqual(collector.TABLES[0].name, 'gn_args')


if __name__ == '__main__':
    unittest.main()
