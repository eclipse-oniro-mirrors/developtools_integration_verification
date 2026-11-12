"""Shared access to the real knowledge.db used by query-layer tests.

`OSKM_TEST_DB` selects the database. Paths and library roots in this module are
derived from installed targets. Scan source metadata is not architecture
evidence and never chooses a path.
"""
import os
import sqlite3
from pathlib import Path


# oskm_testing/testdb.py -> packages/oskm -> packages -> <repo root>
OSKM = Path(__file__).resolve().parents[1]
ROOT = OSKM.parents[1]
DEFAULT_DB = ROOT / 'artifacts/wukong100/knowledge.db'
DB = Path(os.environ.get('OSKM_TEST_DB', DEFAULT_DB)).expanduser().resolve()


def connect(db_path=None):
    connection = sqlite3.connect(str(db_path or DB))
    connection.row_factory = sqlite3.Row
    return connection


def latest_scan(db_path=None):
    """Return the newest finished scan's persisted metadata."""
    if not Path(db_path or DB).is_file():
        return None
    try:
        connection = connect(db_path)
        try:
            row = connection.execute(
                'SELECT id, product, cpu_arch, workspace_root, started_at, '
                'finished_at FROM scans '
                'WHERE finished_at IS NOT NULL ORDER BY id DESC LIMIT 1').fetchone()
            return dict(row) if row else None
        finally:
            connection.close()
    except sqlite3.OperationalError as exc:
        message = str(exc)
        if ('no such table: scans' in message
                or 'no such column:' in message):
            raise RuntimeError(
                'knowledge.db has an incompatible scans schema; rescan it '
                'with the current oskm') from exc
        raise


def is_wukong100(db_path=None):
    scan = latest_scan(db_path)
    return bool(scan and scan.get('product') == 'wukong100')


def preferred_library_root(db_path=None):
    """The dominant library root backed by the selected scan's ELF evidence."""
    scan = latest_scan(db_path)
    if not scan:
        return None
    try:
        connection = connect(db_path)
        try:
            rows = connection.execute(
                'SELECT t.dest FROM elf_modules e '
                'JOIN install_targets t ON t.scan_id=e.scan_id '
                'AND t.id=e.install_target_id WHERE e.scan_id=?',
                (scan['id'],)).fetchall()
            if not rows:
                rows = connection.execute(
                    'SELECT dest FROM install_targets WHERE scan_id=?',
                    (scan['id'],)).fetchall()
        finally:
            connection.close()
    except sqlite3.Error:
        return None
    counts = {'system/lib/': 0, 'system/lib64/': 0}
    for row in rows:
        for root in counts:
            if row['dest'].startswith(root):
                counts[root] += 1
                break
    observed = [(count, root) for root, count in counts.items() if count]
    return max(observed, key=lambda item: (item[0], item[1]))[1] if observed else None


def elf_dest(file_name, db_path=None, fallback=None):
    """Resolve an ELF basename to its scan's actual `install_targets.dest`."""
    scan = latest_scan(db_path)
    if not scan:
        return fallback
    try:
        connection = connect(db_path)
        try:
            row = connection.execute(
                'SELECT t.dest FROM elf_modules e '
                'JOIN install_targets t ON t.scan_id=e.scan_id '
                'AND t.id=e.install_target_id '
                'WHERE e.scan_id=? AND e.file_name=? '
                'ORDER BY t.dest LIMIT 1', (scan['id'], file_name)).fetchone()
            if row:
                return row['dest']
            # ELF collection may be degraded while install_targets is complete.
            row = connection.execute(
                "SELECT dest FROM install_targets "
                "WHERE scan_id=? AND dest LIKE ? ORDER BY dest LIMIT 1",
                (scan['id'], '%/' + file_name)).fetchone()
            return row['dest'] if row else fallback
        finally:
            connection.close()
    except sqlite3.Error:
        return fallback


def system_library_dests(db_path=None):
    """Return all install destinations under either system library root."""
    scan = latest_scan(db_path)
    if not scan:
        return []
    try:
        connection = connect(db_path)
        try:
            rows = connection.execute(
                "SELECT DISTINCT dest FROM install_targets "
                "WHERE scan_id=? AND (dest LIKE 'system/lib/%' "
                "OR dest LIKE 'system/lib64/%') ORDER BY dest",
                (scan['id'],)).fetchall()
            return [row['dest'] for row in rows]
        finally:
            connection.close()
    except sqlite3.OperationalError:
        return []


# ---------------------------------------------------------------------------
# 样本选择器：把"测试用什么实体"这件事交还给数据库
#
# **为什么要有这一层**：功能测试原来写死了 wukong100 的实体名
# （`ace_engine` / `image_framework` / `foundation` / `libimage.z.so` /
# `ace_engine_feature_enable_web` / `@kit.AbilityKit`）。换一个库、或者同一个库
# 重扫一次，这些名字可能就不在了——测试红，但产品没坏。
#
# 规则很简单：
#   · **功能测试**验的是"工具行为对不对"，输入必须从库里现取（本文件）。
#   · **示例文档**（SKILL.md / examples）可以点名真实实体；skill 测试会把它们
#     映射到合成库，不把真实库内容当作门禁基线。eval 只看运行时分发流程。
#
# 每个选择器都返回 `None` 表示"这个库里没有满足条件的样本"，调用方应当
# `skipTest` 而不是失败——库的采集是允许降级的（`status=degraded`），
# 某一域为空不等于产品有 bug。
#
# 全部用 `ORDER BY … LIMIT 1` 且带稳定 tiebreak，否则同一个库两次跑会取到
# 不同样本，失败就无法复现。
# ---------------------------------------------------------------------------

def _one(sql, params=(), db_path=None):
    """First column of the first row, or ``None``."""
    try:
        connection = connect(db_path)
        try:
            row = connection.execute(sql, params).fetchone()
            return row[0] if row else None
        finally:
            connection.close()
    except sqlite3.Error:
        return None


def _scan_id(db_path=None):
    scan = latest_scan(db_path)
    return scan['id'] if scan else None


def sample_component(db_path=None, *, with_features=False, with_innerapis=False,
                     with_syscaps=False, with_dependents=False, with_repo=False):
    """A component name that satisfies the requested preconditions."""
    scan = _scan_id(db_path)
    if scan is None:
        return None
    joins, conditions = [], []
    if with_features:
        joins.append('JOIN features f ON f.scan_id=c.scan_id AND f.component_id=c.id')
    if with_innerapis:
        joins.append('JOIN innerapis i ON i.scan_id=c.scan_id AND i.component_id=c.id')
    if with_syscaps:
        joins.append('JOIN syscaps s ON s.scan_id=c.scan_id AND s.component_id=c.id')
    if with_repo:
        joins.append('JOIN repos r ON r.scan_id=c.scan_id AND r.id=c.repo_id')
        conditions.append('r.path IS NOT NULL')
    if with_dependents:
        # deps 是 JSON 数组文本；按名字出现即算被依赖，够挑样本用。
        conditions.append("EXISTS (SELECT 1 FROM components d "
                          "WHERE d.scan_id=c.scan_id AND d.deps LIKE '%\"' || c.name || '\"%')")
    where = ' AND '.join(['c.scan_id=?'] + conditions)
    return _one(
        f"SELECT c.name FROM components c {' '.join(joins)} "
        f'WHERE {where} GROUP BY c.id ORDER BY COUNT(*) DESC, c.name LIMIT 1',
        (scan,), db_path)


def sample_repo(db_path=None):
    """``(name, path)`` of a repo that has a manifest path."""
    scan = _scan_id(db_path)
    if scan is None:
        return None
    try:
        connection = connect(db_path)
        try:
            row = connection.execute(
                'SELECT name, path FROM repos WHERE scan_id=? AND path IS NOT NULL '
                'ORDER BY name LIMIT 1', (scan,)).fetchone()
            return (row['name'], row['path']) if row else None
        finally:
            connection.close()
    except sqlite3.Error:
        return None


def sample_gn_arg(db_path=None, *, with_features=False):
    """A GN argument name, optionally one that actually controls features."""
    scan = _scan_id(db_path)
    if scan is None:
        return None
    if with_features:
        return _one(
            'SELECT g.name FROM gn_args g JOIN features f '
            'ON f.scan_id=g.scan_id AND f.gn_arg_id=g.id '
            'WHERE g.scan_id=? GROUP BY g.id ORDER BY COUNT(*) DESC, g.name LIMIT 1',
            (scan,), db_path)
    return _one('SELECT name FROM gn_args WHERE scan_id=? ORDER BY name LIMIT 1',
                (scan,), db_path)


def sample_service(db_path=None):
    """A service name (usable directly as a `search_services` query)."""
    return _one('SELECT name FROM services WHERE scan_id=? AND name IS NOT NULL '
                'ORDER BY name LIMIT 1', (_scan_id(db_path),), db_path)


def sample_service_with_sa(db_path=None):
    """A service name that hosts at least one SystemAbility."""
    scan = _scan_id(db_path)
    if scan is None:
        return None
    return _one(
        'SELECT sv.name FROM services sv JOIN sas sa '
        'ON sa.scan_id=sv.scan_id AND sa.service_id=sv.id '
        'WHERE sv.scan_id=? GROUP BY sv.id ORDER BY COUNT(*) DESC, sv.name LIMIT 1',
        (scan,), db_path)


def sample_sa_id(db_path=None):
    return _one('SELECT sa_id FROM sas WHERE scan_id=? AND sa_id IS NOT NULL '
                'ORDER BY sa_id LIMIT 1', (_scan_id(db_path),), db_path)


def sample_install_dest(db_path=None):
    return _one('SELECT dest FROM install_targets WHERE scan_id=? AND dest IS NOT NULL '
                'ORDER BY dest LIMIT 1', (_scan_id(db_path),), db_path)


def sample_install_label(db_path=None):
    return _one('SELECT label FROM install_modules WHERE scan_id=? AND label IS NOT NULL '
                'ORDER BY label LIMIT 1', (_scan_id(db_path),), db_path)


def sample_elf(db_path=None, *, with_dependencies=False, with_dependents=False):
    """An ELF install dest, optionally one that has graph edges."""
    scan = _scan_id(db_path)
    if scan is None:
        return None
    if not (with_dependencies or with_dependents):
        return _one(
            'SELECT t.dest FROM elf_modules e JOIN install_targets t '
            'ON t.scan_id=e.scan_id AND t.id=e.install_target_id '
            'WHERE e.scan_id=? ORDER BY t.dest LIMIT 1', (scan,), db_path)
    column = 'caller_id' if with_dependencies else 'callee_id'
    return _one(
        f'SELECT t.dest FROM elf_module_dependencies d '
        f'JOIN elf_modules e ON e.scan_id=d.scan_id AND e.id=d.{column} '
        f'JOIN install_targets t ON t.scan_id=e.scan_id AND t.id=e.install_target_id '
        f'WHERE d.scan_id=? AND d.{column} IS NOT NULL '
        f'GROUP BY d.{column} ORDER BY COUNT(*) DESC, t.dest LIMIT 1',
        (scan,), db_path)


def sample_ndk_library(db_path=None):
    """An ELF file name that has at least one NDK header mapping."""
    scan = _scan_id(db_path)
    if scan is None:
        return None
    return _one(
        'SELECT e.file_name FROM ndk_headers n JOIN elf_modules e '
        'ON e.scan_id=n.scan_id AND e.id=n.elf_module_id '
        'WHERE n.scan_id=? GROUP BY e.id ORDER BY COUNT(*) DESC, e.file_name LIMIT 1',
        (scan,), db_path)


def sample_arkts_kit(db_path=None, *, entry_backed=False):
    scan = _scan_id(db_path)
    if scan is None:
        return None
    extra = "AND origin='entry_backed' " if entry_backed else ''
    return _one(f'SELECT kit_key FROM arkts_kits WHERE scan_id=? {extra}'
                'ORDER BY kit_key LIMIT 1', (scan,), db_path)


def sample_arkts_module(db_path=None):
    scan = _scan_id(db_path)
    if scan is None:
        return None
    return _one(
        'SELECT module_key FROM arkts_modules WHERE scan_id=? '
        'ORDER BY module_key LIMIT 1', (scan,), db_path)


def count(table, db_path=None):
    """Row count of one table in the selected scan (0 when unavailable)."""
    scan = _scan_id(db_path)
    if scan is None:
        return 0
    return _one(f'SELECT COUNT(*) FROM {table} WHERE scan_id=?', (scan,), db_path) or 0


def sample_names(table, limit=3, column='name', db_path=None):
    """Up to ``limit`` distinct values of one column, in a stable order.

    给"需要几个不同实体"的用例用（比如 diff：要注入已知差异，就得先有几个
    真名字）。返回的条数可能少于 ``limit``——库小的时候就是这样，调用方
    应当按需 `skipTest`，而不是假设一定有 3 个。
    """
    scan = _scan_id(db_path)
    if scan is None:
        return []
    try:
        connection = connect(db_path)
        try:
            rows = connection.execute(
                f'SELECT DISTINCT {column} FROM {table} '
                f'WHERE scan_id=? AND {column} IS NOT NULL '
                f'ORDER BY {column} LIMIT ?', (scan, limit)).fetchall()
            return [row[0] for row in rows]
        finally:
            connection.close()
    except sqlite3.Error:
        return []


def sample_ndk_mapping(db_path=None, *, match_strategy=None):
    """One real NDK header mapping, with everything a test needs to re-find it.

    返回 `{dest, file_name, header_path, match_strategy, component}`，
    取不到则为 None。NDK 映射表在部分库里为空（采集降级），那是正常状态。
    """
    scan = _scan_id(db_path)
    if scan is None:
        return None
    extra = 'AND n.match_strategy=?' if match_strategy else ''
    params = (scan, match_strategy) if match_strategy else (scan,)
    try:
        connection = connect(db_path)
        try:
            row = connection.execute(
                'SELECT t.dest AS dest, e.file_name AS file_name, '
                '       n.header_path AS header_path, '
                '       n.match_strategy AS match_strategy, '
                '       c.name AS component '
                'FROM ndk_headers n '
                'JOIN elf_modules e ON e.scan_id=n.scan_id AND e.id=n.elf_module_id '
                'JOIN install_targets t ON t.scan_id=e.scan_id '
                '     AND t.id=e.install_target_id '
                'LEFT JOIN components c ON c.scan_id=e.scan_id '
                '     AND c.id=e.component_id '
                f'WHERE n.scan_id=? {extra} '
                'ORDER BY n.id LIMIT 1', params).fetchone()
            return dict(row) if row else None
        finally:
            connection.close()
    except sqlite3.Error:
        return None


def ndk_strategies(db_path=None):
    """``{match_strategy: row_count}`` observed in the selected database."""
    scan = _scan_id(db_path)
    if scan is None:
        return {}
    connection = None
    try:
        connection = connect(db_path)
        return {row['match_strategy']: row['n'] for row in connection.execute(
            'SELECT match_strategy, COUNT(*) AS n FROM ndk_headers '
            'WHERE scan_id=? GROUP BY match_strategy', (scan,))}
    except sqlite3.Error:
        return {}
    finally:
        if connection is not None:
            connection.close()
