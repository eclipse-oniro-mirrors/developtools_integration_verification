"""SQL safety checks for the sql_query escape hatch.

Enforces read-only access, table whitelist, scan_id injection, and limits.
"""
from __future__ import annotations

import re

_FORBIDDEN = re.compile(
    r'\b(PRAGMA|INSERT|UPDATE|DELETE|DROP|ALTER|CREATE|ATTACH|DETACH|VACUUM|REINDEX)\b',
    re.I)

_TABLE_PATTERN = re.compile(r'(?:FROM|JOIN)\s+([\w.]+)', re.I)


class SecurityError(Exception):
    def __init__(self, code: str, message: str = ''):
        self.code = code
        self.message = message or code


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

    # 1. Read-only check
    first = stripped.split()[0].upper() if stripped.split() else ''
    if first not in ('SELECT', 'WITH'):
        raise SecurityError('NOT_READ_ONLY', f'first keyword: {first}')

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
        upper = stripped.upper()
        if ' WHERE ' in upper:
            safe_sql = re.sub(r'\bWHERE\b', 'WHERE scan_id = ? AND', stripped, count=1, flags=re.I)
        elif ' ORDER BY ' in upper or ' GROUP BY ' in upper or ' LIMIT ' in upper:
            for kw in ('ORDER BY', 'GROUP BY', 'LIMIT'):
                pattern = re.compile(rf'\b{kw}\b', re.I)
                safe_sql, n = pattern.subn(f'WHERE scan_id = ? {kw}', stripped, count=1)
                if n:
                    break
            else:
                safe_sql = stripped + ' WHERE scan_id = ?'
        else:
            safe_sql = stripped + ' WHERE scan_id = ?'
        extra_params = (scan_id,)
    else:
        safe_sql = stripped

    # 5. LIMIT enforcement
    if 'LIMIT' not in safe_sql.upper():
        safe_sql += ' LIMIT 1000'

    return safe_sql, extra_params
