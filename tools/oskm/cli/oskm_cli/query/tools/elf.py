"""ELF module: dependency graph BFS and reverse lookup."""
from __future__ import annotations

from ..tools import register, ToolError


@register('search_elf_modules', '模糊搜索 ELF 模块', {
    'type': 'object',
    'properties': {
        'query': {'type': 'string'},
        'partition': {'type': 'string'},
        'component': {'type': 'string'},
        'limit': {'type': 'integer', 'default': 20},
    },
    'required': ['query'],
})
def search_elf_modules(params, manager):
    session = manager.get_active()
    limit = min(params.get('limit', 20), 100)
    pattern = f'%{params["query"]}%'
    clauses = ['e.scan_id = ?', '(e.soname LIKE ? OR e.file_name LIKE ?)']
    vals = [session.scan_id, pattern, pattern]
    if params.get('partition'):
        clauses.append('e.partition = ?')
        vals.append(params['partition'])
    if params.get('component'):
        clauses.append('e.component_id IN (SELECT id FROM components WHERE scan_id = ? AND name = ?)')
        vals.extend([session.scan_id, params['component']])
    total_rows = session.sql(
        f"SELECT COUNT(*) AS total FROM elf_modules e "
        f"JOIN install_targets t ON t.scan_id = e.scan_id AND t.id = e.install_target_id "
        f"LEFT JOIN components c ON c.scan_id = e.scan_id AND c.id = e.component_id "
        f"WHERE {' AND '.join(clauses)}", tuple(vals))
    total = int(total_rows[0]['total'])

    rows = session.sql(
        f"SELECT e.id, t.dest, e.soname, e.file_name, e.partition, "
        f"c.name AS component FROM elf_modules e "
        f"JOIN install_targets t ON t.scan_id = e.scan_id AND t.id = e.install_target_id "
        f"LEFT JOIN components c ON c.scan_id = e.scan_id AND c.id = e.component_id "
        f"WHERE {' AND '.join(clauses)} ORDER BY e.file_name LIMIT ?", tuple(vals + [limit]))
    return {
        'results': [dict(r) for r in rows],
        'total': total,
        'truncated': total > len(rows),
    }


# 不给 max_distance 时的硬顶。依赖图理论上可能有环（本产品实测无自环、
# 无双向边，但长环没法先验排除），(id, distance) 去重只能保证不重复产出
# 同一对，挡不住距离一路加上去。
_MAX_DEPTH = 16
_DEFAULT_LIMIT, _MAX_LIMIT = 200, 1000


@register('elf_dependencies', 'ELF 依赖闭包（按最短距离去重的可达节点，不是路径枚举）', {
    'type': 'object',
    'properties': {
        'dest': {'type': 'string', 'description': 'Image ELF file path'},
        'direction': {'type': 'string', 'default': 'forward',
                      'description': 'forward or reverse'},
        'max_distance': {'type': 'integer',
                         'description': f'跳数上限，省略时按 {_MAX_DEPTH} 封顶。'
                                        '规模涨得很快：1 跳 27 个节点、2 跳 169、3 跳 297'},
        'limit': {'type': 'integer', 'default': _DEFAULT_LIMIT,
                  'description': f'最多返回几个节点，上限 {_MAX_LIMIT}；截断时置 truncated'},
    },
    'required': ['dest'],
})
def _elf_arguments(params):
    dest = params['dest']
    direction = params.get('direction', 'forward')
    max_dist = params.get('max_distance')
    depth = _MAX_DEPTH if max_dist is None else max(0, int(max_dist))
    raw = params.get('limit')
    limit = _DEFAULT_LIMIT if raw is None else int(raw)
    if limit < 1:
        raise ToolError('INVALID_PARAM', 'limit must be >= 1')
    return dest, direction, depth, min(limit, _MAX_LIMIT)


def _root_elf(session, dest):
    root = session.sql(
        'SELECT e.id, t.dest, e.soname, e.partition, e.component_id '
        'FROM elf_modules e '
        'JOIN install_targets t ON t.scan_id = e.scan_id '
        'AND t.id = e.install_target_id '
        'WHERE e.scan_id = ? AND t.dest = ?', (session.scan_id, dest))
    if not root:
        raise ToolError('NOT_FOUND', f'ELF module not found: {dest}')
    return root[0]['id']


def _dependency_meta(session, distance):
    if not distance:
        return {}
    ids = list(distance)
    marks = ','.join('?' for _ in ids)
    meta = {}
    for row in session.sql(
            f'SELECT e.id, t.dest, e.soname, e.partition, e.component_id, '
            f'c.name AS component FROM elf_modules e '
            f'JOIN install_targets t ON t.scan_id = e.scan_id '
            f'AND t.id = e.install_target_id '
            f'LEFT JOIN components c ON c.id = e.component_id '
            f'WHERE e.scan_id = ? AND e.id IN ({marks})',
            (session.scan_id, *ids)):
        meta[row['id']] = dict(row)
    return meta


def _unresolved_forward(session, root_id, direction):
    if direction != 'forward':
        return []
    return session.sql(
        'SELECT d.needed_name, t.dest AS caller_dest '
        'FROM elf_module_dependencies d '
        'JOIN elf_modules caller ON caller.scan_id = d.scan_id AND caller.id = d.caller_id '
        'JOIN install_targets t ON t.scan_id = caller.scan_id '
        'AND t.id = caller.install_target_id '
        'WHERE d.scan_id = ? AND d.caller_id = ? '
        'AND d.callee_id IS NULL', (session.scan_id, root_id))


def _reachable_rows(session, root_id, distance, meta, dest, caller_col, callee_col, limit):
    reachable = [dict(meta[node], distance=value)
                 for node, value in distance.items() if node in meta]
    reachable.sort(key=lambda row: (row['distance'], row['dest']))
    total = len(reachable)
    truncated = total > limit
    reachable = reachable[:limit]
    for row in reachable:
        row['via'] = ' → '.join(_shortest_path(
            session, row['id'], root_id, distance, meta, dest,
            caller_col, callee_col))
        row.pop('id', None)
    return reachable, total, truncated


def elf_dependencies(params, manager):
    """可达节点的闭包，每个节点一行，距离取最短。"""
    session = manager.get_active()
    dest, direction, depth, limit = _elf_arguments(params)
    root_id = _root_elf(session, dest)
    if direction == 'reverse':
        caller_col, callee_col = 'callee_id', 'caller_id'
    else:
        caller_col, callee_col = 'caller_id', 'callee_id'
    distance = _bfs(session, root_id, depth, caller_col, callee_col)
    meta = _dependency_meta(session, distance)
    reachable, total, truncated = _reachable_rows(
        session, root_id, distance, meta, dest, caller_col, callee_col, limit)
    unresolved = _unresolved_forward(session, root_id, direction)
    return {
        'root': dest,
        'direction': direction,
        'max_distance': depth,
        'total': total,
        'truncated': truncated,
        'reachable': reachable,
        'unresolved': [dict(row) for row in unresolved],
    }


def _adjacency(session, caller_col, callee_col):
    """整张已解析的边表，正反两个索引，一次查完缓存在 session 上。

    为什么整张取：全图只有 33,360 条边（实测），一次查 ~50 ms；
    而闭包本身最多 387 个节点。递归 CTE 的写法要在每个距离上重新
    join 一遍边表，不带 max_distance 时实测 41 秒——同样的结果，
    内存里 BFS 是 0.1 秒。正反索引共用这一次查询，回溯路径也不再回表。
    """
    key = f'_elf_adj_{caller_col}'
    cached = getattr(session, key, None)
    if cached is None:
        succ, pred = {}, {}
        for row in session.sql(
                f'SELECT {caller_col} AS src, {callee_col} AS dst '
                f'FROM elf_module_dependencies '
                f'WHERE scan_id = ? AND {callee_col} IS NOT NULL', (session.scan_id,)):
            succ.setdefault(row['src'], []).append(row['dst'])
            pred.setdefault(row['dst'], []).append(row['src'])
        cached = (succ, pred)
        setattr(session, key, cached)
    return cached


def _expand_frontier(successors, frontier, seen, distance, step):
    next_frontier = []
    for node in frontier:
        for target in successors.get(node, ()):
            if target not in seen:
                seen.add(target)
                distance[target] = step
                next_frontier.append(target)
    return next_frontier


def _bfs(session, root_id, depth, caller_col, callee_col):
    """从根逐层展开，返回 {节点: 最短距离}，不含根本身。"""
    successors, _ = _adjacency(session, caller_col, callee_col)
    distance, frontier = {}, [root_id]
    seen = {root_id}
    for step in range(1, depth + 1):
        frontier = _expand_frontier(successors, frontier, seen, distance, step)
        if not frontier:
            break
    return distance


def _shortest_path(session, node, root_id, distance, meta, root_dest, caller_col, callee_col):
    """从 node 回溯到根的一条最短路径，返回 dest 列表（含根，不含重复）。

    距离已知，所以"最短路径的前驱"就是任何 distance 恰好小 1 的直接前驱——
    不需要再搜一遍图。多条同样短时取一条，不声称唯一。
    """
    _, predecessors = _adjacency(session, caller_col, callee_col)
    chain, current = [], node
    seen = set()
    while current != root_id and current not in seen:
        seen.add(current)
        row = meta.get(current)
        chain.append(row['dest'] if row else str(current))
        want = distance.get(current, 0) - 1
        nxt = next((p for p in predecessors.get(current, ())
                    if (p == root_id and want == 0) or distance.get(p) == want), None)
        if nxt is None:
            break
        current = nxt
    chain.append(root_dest)
    return list(reversed(chain))


@register('elf_dependents', '直接反向依赖', {
    'type': 'object',
    'properties': {'dest': {'type': 'string'}},
    'required': ['dest'],
})
def elf_dependents(params, manager):
    session = manager.get_active()
    dest = params['dest']
    root = session.sql(
        'SELECT e.id FROM elf_modules e '
        'JOIN install_targets t ON t.scan_id = e.scan_id '
        'AND t.id = e.install_target_id '
        'WHERE e.scan_id = ? AND t.dest = ?',
        (session.scan_id, dest))
    if not root:
        raise ToolError('NOT_FOUND', f'ELF module not found: {dest}')
    rows = session.sql(
        'SELECT caller.id, t.dest, caller.soname, caller.partition, '
        'caller.component_id, c.name AS component '
        'FROM elf_module_dependencies d '
        'JOIN elf_modules caller ON caller.scan_id = d.scan_id AND caller.id = d.caller_id '
        'JOIN install_targets t ON t.scan_id = caller.scan_id '
        'AND t.id = caller.install_target_id '
        'LEFT JOIN components c ON c.scan_id = caller.scan_id AND c.id = caller.component_id '
        'WHERE d.scan_id = ? AND d.callee_id = ?',
        (session.scan_id, root[0]['id']))
    return {'dest': dest, 'dependents': [dict(r) for r in rows]}
