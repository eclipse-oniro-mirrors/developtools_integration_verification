"""SQL safety checks for the sql_query escape hatch.

Enforces read-only access, table whitelist, scan_id injection, and limits.
"""
from __future__ import annotations

import re
import sqlite3
import time
from pathlib import Path

_FORBIDDEN = re.compile(
    r'\b(PRAGMA|INSERT|UPDATE|DELETE|DROP|ALTER|CREATE|ATTACH|DETACH|VACUUM|REINDEX)\b',
    re.I)

_TABLE_PATTERN = re.compile(r'(?:FROM|JOIN)\s+([\w.]+)', re.I)

# 开头的空白 + 行注释 + 块注释。只用来定位"第一个关键字"，
# 真正执行的仍是原文。
_LEADING_NOISE = re.compile(r'^(?:\s+|--[^\n]*\n?|/\*.*?\*/)+', re.S)


def _first_keyword(sql):
    """跳过开头的注释再取第一个关键字。

    SQL 走文件传进来时，开头几乎总有一段说明注释——而原实现直接
    `sql.strip().split()[0]`，拿到的是 `--`，于是任何带头注释的查询
    都被判成 NOT_READ_ONLY。命令行里手写 SQL 碰不到这个，
    一改成 `--sql-file` 就天天碰到。

    **不放松校验**：剥掉的只是开头的注释，剥完之后第一个词仍然必须是
    SELECT/WITH。`-- SELECT\nDROP TABLE x` 剥完是 DROP，照样拒绝。
    """
    stripped = _LEADING_NOISE.sub('', sql).strip()
    return (stripped.split() or [''])[0].upper()


class SecurityError(Exception):
    def __init__(self, code: str, message: str = ''):
        self.code = code
        self.message = message or code


def _quote_identifier(value: str) -> str:
    return '"' + value.replace('"', '""') + '"'


def _prepare_scan_sources(connection, sources):
    allowed_by_db = {}
    for index, (alias, db_path, scan_id, allowed_tables) in enumerate(sources):
        source_alias = f'__oskmsrc{index}'
        uri = Path(db_path).expanduser().resolve().as_uri() + '?mode=ro'
        connection.execute(
            f'ATTACH DATABASE ? AS {_quote_identifier(source_alias)}', (uri,))
        target_db = 'main' if alias is None else alias
        if alias is not None:
            connection.execute(
                f'ATTACH DATABASE ":memory:" AS {_quote_identifier(alias)}')
        allowed_by_db[target_db] = set(allowed_tables)
        for table in sorted(allowed_tables):
            connection.execute(
                f'CREATE TABLE {_quote_identifier(target_db)}.'
                f'{_quote_identifier(table)} AS '
                f'SELECT * FROM {_quote_identifier(source_alias)}.'
                f'{_quote_identifier(table)} WHERE scan_id = ?',
                (scan_id,))
        connection.execute(
            f'DETACH DATABASE {_quote_identifier(source_alias)}')
    return allowed_by_db


def _readonly_authorizer(allowed_by_db):
    def authorizer(action, arg1, arg2, db_name, trigger):
        if action in (sqlite3.SQLITE_SELECT, sqlite3.SQLITE_RECURSIVE):
            return sqlite3.SQLITE_OK
        if action == sqlite3.SQLITE_FUNCTION:
            if (arg2 or '').lower() in {'load_extension', 'readfile', 'writefile'}:
                return sqlite3.SQLITE_DENY
            return sqlite3.SQLITE_OK
        if action == sqlite3.SQLITE_READ:
            if db_name is None:
                return sqlite3.SQLITE_OK
            if arg1 in allowed_by_db.get(db_name, ()):
                return sqlite3.SQLITE_OK
        return sqlite3.SQLITE_DENY
    return authorizer


def _sql_error(exc, allowed_by_db):
    message = str(exc)
    if 'interrupted' in message.lower():
        return SecurityError('TIMEOUT', 'SQL execution exceeded 5 seconds')
    if 'no such table' in message.lower():
        table = message.split(':', 1)[-1].strip().strip('"`[]')
        database, separator, _ = table.partition('.')
        if separator and database not in allowed_by_db:
            return SecurityError(
                'ALIAS_NOT_ATTACHED', f'alias "{database}" is not attached')
        return SecurityError('TABLE_NOT_ALLOWED', message)
    if 'not authorized' in message.lower():
        return SecurityError('TABLE_NOT_ALLOWED', message)
    return SecurityError('SQL_ERROR', message)


def execute_readonly_sql(sources, sql: str, params=(), *, limit: int = 1000,
                         timeout_seconds: float = 5.0):
    """Execute SQL against private copies of approved scan snapshots."""
    if (not isinstance(limit, int) or isinstance(limit, bool)
            or not 1 <= limit <= 1000):
        raise SecurityError('INVALID_PARAM', 'limit must be between 1 and 1000')
    stripped = sql.strip()
    if not stripped:
        raise SecurityError('EMPTY_SQL', 'empty SQL statement')
    first = _first_keyword(stripped)
    if first not in ('SELECT', 'WITH'):
        raise SecurityError('NOT_READ_ONLY', f'first keyword: {first or "(empty)"}')
    connection = sqlite3.connect(':memory:', uri=True, isolation_level=None)
    connection.row_factory = sqlite3.Row
    allowed_by_db = {}
    try:
        allowed_by_db = _prepare_scan_sources(connection, sources)
        connection.set_authorizer(_readonly_authorizer(allowed_by_db))
        deadline = time.monotonic() + timeout_seconds
        connection.set_progress_handler(
            lambda: int(time.monotonic() >= deadline), 1000)
        rows = connection.execute(stripped, tuple(params)).fetchmany(limit + 1)
        return [dict(row) for row in rows[:limit]], len(rows) > limit
    except sqlite3.OperationalError as exc:
        raise _sql_error(exc, allowed_by_db) from exc
    except sqlite3.Error as exc:
        raise SecurityError('SQL_ERROR', str(exc)) from exc
    finally:
        connection.close()


def check_sql(sql: str, allowed_tables: set[str], attached_aliases: set[str],
              scan_id: int) -> tuple[str, tuple]:
    """Validate and sanitize a SQL query.

    Returns (safe_sql, extra_params) where extra_params are prepended to
    the caller's params (currently just scan_id if injected).

    Raises SecurityError on violation.
    """
    stripped = sql.strip()
    if not stripped:
        raise SecurityError('EMPTY_SQL', 'empty SQL statement')

    # 尾部 `;` 只是语句终止符，注入 scan_id/LIMIT 前先剥掉。
    # 否则 `SELECT ...;` 会被拼成 `...; WHERE scan_id = ?`，sqlite3 报
    # "You can only execute one statement at a time"。`; -- 注释` 这类
    # 分号后跟尾注释的写法一并处理。中间的 `;` 不动——多语句要么被
    # _FORBIDDEN 拦（写操作），要么由 sqlite3 拒绝。
    m = re.search(r';\s*(?:(?:--[^\n]*)|(?:/\*.*?\*/))?\s*$', stripped, re.S)
    if m:
        stripped = stripped[:m.start()].rstrip()

    # 1. Read-only check
    first = _first_keyword(stripped)
    if first not in ('SELECT', 'WITH'):
        raise SecurityError('NOT_READ_ONLY', f'first keyword: {first or "(empty)"}')

    # 2. Forbidden keywords
    if _FORBIDDEN.search(stripped):
        raise SecurityError('FORBIDDEN_KEYWORD', 'SQL contains forbidden operation')

    # 3. Table whitelist (supports alias.table format)
    # Extract CTE aliases so WITH ... AS (...) references aren't flagged.
    cte_aliases = set()
    if first == 'WITH':
        cte_pattern = re.compile(r'\b(\w+)\s+AS\s*\(', re.I)
        cte_aliases = set(cte_pattern.findall(stripped))
    effective_allowed = allowed_tables | cte_aliases

    table_refs = _TABLE_PATTERN.findall(stripped)
    for ref in table_refs:
        if '.' in ref:
            alias, table = ref.split('.', 1)
            if alias not in attached_aliases:
                raise SecurityError('ALIAS_NOT_ATTACHED', f'alias "{alias}" not attached')
            if table not in effective_allowed:
                raise SecurityError('TABLE_NOT_ALLOWED', f'table: {table}')
        else:
            if ref not in effective_allowed:
                raise SecurityError('TABLE_NOT_ALLOWED', f'table: {ref}')

    # 4. scan_id injection
    has_scan_id = 'scan_id' in stripped.lower()
    extra_params = ()
    if not has_scan_id:
        insert = f' WHERE scan_id = ? '
        if re.search(r'\bWHERE\b', stripped, re.I):
            safe_sql = re.sub(r'\bWHERE\b', 'WHERE scan_id = ? AND', stripped, count=1, flags=re.I)
        else:
            # 没有 WHERE 时，在**最早出现**的子句关键字前注入。固定按
            # ORDER BY/GROUP BY/LIMIT 的顺序挑，会在 GROUP BY 之后插入
            # WHERE（`GROUP BY x WHERE ...` 非法）；按文本位置取最早出现
            # 的 GROUP BY/ORDER BY/LIMIT/HAVING，注入点必然合法。
            m = re.search(r'\b(GROUP BY|ORDER BY|LIMIT|HAVING)\b', stripped, re.I)
            if m:
                safe_sql = stripped[:m.start()] + 'WHERE scan_id = ? ' + stripped[m.start():]
            else:
                safe_sql = stripped + ' WHERE scan_id = ?'
        extra_params = (scan_id,)
    else:
        safe_sql = stripped

    # 5. LIMIT enforcement
    if 'LIMIT' not in safe_sql.upper():
        safe_sql += ' LIMIT 1000'

    return safe_sql, extra_params
