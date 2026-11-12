"""NDK headers: map installed native libraries to SDK source headers."""
from __future__ import annotations

from oskm_schema.ndk import NDK_HEADERS
from ..gitlink import git_url
from ..tools import register, ToolError


_STRATEGIES = {'build_gn', 'header_library', 'symbol'}


def _limit(params):
    limit = params.get('limit', 20)
    limit = min(limit, 100)
    if limit < 1:
        raise ToolError('INVALID_PARAM', 'limit must be >= 1')
    return limit


def _strategy(params):
    strategy = params.get('match_strategy')
    if strategy is not None and strategy not in _STRATEGIES:
        raise ToolError(
            'INVALID_PARAM',
            'match_strategy must be one of build_gn/header_library/symbol')
    return strategy


@register('search_ndk_headers', '模糊搜索 NDK 库与头文件映射', {
    'type': 'object',
    'properties': {
        'query': {'type': 'string',
                  'description': '匹配头文件路径、镜像库路径、SONAME、文件名或部件名'},
        'match_strategy': {'type': 'string', 'enum': ['build_gn', 'header_library', 'symbol']},
        'component': {'type': 'string'},
        'limit': {'type': 'integer', 'default': 20},
    },
    'required': ['query'],
})
def search_ndk_headers(params, manager):
    session = manager.get_active()
    limit = _limit(params)
    strategy = _strategy(params)
    pattern = f"%{params['query']}%"
    clauses = [
        'n.scan_id = ?',
        '(n.header_path LIKE ? OR t.dest LIKE ? OR e.soname LIKE ? '
        'OR e.file_name LIKE ? OR c.name LIKE ?)',
    ]
    values = [session.scan_id, pattern, pattern, pattern, pattern, pattern]
    if strategy:
        clauses.append('n.match_strategy = ?')
        values.append(strategy)
    if params.get('component'):
        clauses.append('c.name = ?')
        values.append(params['component'])
    total_rows = session.sql(
        'SELECT COUNT(*) AS total '
        'FROM ndk_headers n '
        'JOIN elf_modules e ON e.scan_id = n.scan_id AND e.id = n.elf_module_id '
        'JOIN install_targets t ON t.scan_id = e.scan_id AND t.id = e.install_target_id '
        'LEFT JOIN components c ON c.scan_id = e.scan_id AND c.id = e.component_id '
        f"WHERE {' AND '.join(clauses)}", tuple(values))
    total = int(total_rows[0]['total'])

    rows = session.sql(
        'SELECT n.id, n.elf_module_id, n.header_path, n.match_strategy, '
        '       e.soname, e.file_name, e.partition, e.component_id, '
        '       t.dest, c.name AS component '
        'FROM ndk_headers n '
        'JOIN elf_modules e ON e.scan_id = n.scan_id AND e.id = n.elf_module_id '
        'JOIN install_targets t ON t.scan_id = e.scan_id AND t.id = e.install_target_id '
        'LEFT JOIN components c ON c.scan_id = e.scan_id AND c.id = e.component_id '
        f"WHERE {' AND '.join(clauses)} "
        'ORDER BY n.header_path, t.dest LIMIT ?', tuple(values + [limit]))
    return {
        'results': [dict(row) for row in rows],
        'total': total,
        'truncated': total > len(rows),
    }


@register('get_ndk_headers', '按镜像库路径查 NDK 头文件清单', {
    'type': 'object',
    'properties': {
        'dest': {'type': 'string', 'description': 'Image ELF file path'},
    },
    'required': ['dest'],
})
def get_ndk_headers(params, manager):
    session = manager.get_active()
    rows = session.sql(
        'SELECT n.id, n.elf_module_id, n.header_path, n.match_strategy, '
        '       e.id AS elf_id, e.soname, e.file_name, e.partition, '
        '       e.component_id, c.name AS component '
        'FROM ndk_headers n '
        'JOIN elf_modules e ON e.scan_id = n.scan_id AND e.id = n.elf_module_id '
        'JOIN install_targets t ON t.scan_id = e.scan_id AND t.id = e.install_target_id '
        'LEFT JOIN components c ON c.scan_id = e.scan_id AND c.id = e.component_id '
        'WHERE n.scan_id = ? AND t.dest = ? '
        'ORDER BY n.header_path',
        (session.scan_id, params['dest']))
    if not rows:
        raise ToolError('NOT_FOUND', f'NDK headers not found for dest: {params["dest"]}')
    first = dict(rows[0])
    headers = []
    for row in rows:
        header = dict(row)
        link = git_url(session, header['header_path'])
        header['source_url'] = link['url'] if link else None
        headers.append(header)
    return {
        'dest': params['dest'],
        'elf_module_id': first['elf_module_id'],
        'soname': first['soname'],
        'file_name': first['file_name'],
        'partition': first['partition'],
        'component': first['component'],
        'component_id': first['component_id'],
        'total': len(headers),
        'headers': headers,
    }
