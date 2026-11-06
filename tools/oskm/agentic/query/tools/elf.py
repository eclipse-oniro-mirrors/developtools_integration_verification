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
    vals.append(limit)
    rows = session.sql(
        f"SELECT e.id, t.dest, e.soname, e.file_name, e.partition, "
        f"c.name AS component FROM elf_modules e "
        f"JOIN install_targets t ON t.scan_id = e.scan_id AND t.id = e.install_target_id "
        f"LEFT JOIN components c ON c.scan_id = e.scan_id AND c.id = e.component_id "
        f"WHERE {' AND '.join(clauses)} ORDER BY e.file_name LIMIT ?", tuple(vals))
    return {'results': [dict(r) for r in rows], 'total': len(rows)}


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
def elf_dependencies(params, manager):
    """可达节点的闭包，每个节点一行，距离取最短。

    原实现用 `UNION ALL` + 累加 path 字符串做**路径枚举**，而工具名与描述
    说的是"闭包"。两者的差距实测很大：根 libace_engine_pa_ark.z.so、
    max_distance=3 时返回 3,586 行却只有 297 个不同节点（92% 重复），
    耗时 90.6 秒、1.27 MB——没有哪个上下文装得下，而且 AGENTS.md 推荐的
    正是这个调用。

    改成节点级闭包后，递归里不再带 path（那串东西正是组合爆炸的来源），
    `via` 改为出 CTE 后用边表在内存里回溯一条最短路径，语义不变。
    顺带去掉了逐行查部件名的 N+1。
    """
    session = manager.get_active()
    dest = params['dest']
    direction = params.get('direction', 'forward')
    max_dist = params.get('max_distance')
    depth = _MAX_DEPTH if max_dist is None else max(0, int(max_dist))
    # 显式判 None，不用 `or`：`limit=0` 是假值，会被静默当成"没传"而变成 200，
    # 而 `limit=-5` 又会落到下面的校验报错——同一个参数两种行为。
    raw = params.get('limit')
    limit = _DEFAULT_LIMIT if raw is None else int(raw)
    if limit < 1:
        raise ToolError('INVALID_PARAM', 'limit must be >= 1')
    limit = min(limit, _MAX_LIMIT)

    root = session.sql(
        'SELECT e.id, t.dest, e.soname, e.partition, e.component_id '
        'FROM elf_modules e '
        'JOIN install_targets t ON t.scan_id = e.scan_id '
        'AND t.id = e.install_target_id '
        'WHERE e.scan_id = ? AND t.dest = ?', (session.scan_id, dest))
    if not root:
        raise ToolError('NOT_FOUND', f'ELF module not found: {dest}')
    root_id = root[0]['id']

    if direction == 'reverse':
        caller_col, callee_col = 'callee_id', 'caller_id'
    else:
        caller_col, callee_col = 'caller_id', 'callee_id'

    distance = _bfs(session, root_id, depth, caller_col, callee_col)

    meta = {}
    if distance:
        ids = list(distance)
        marks = ','.join('?' for _ in ids)
        # 一次 JOIN 取齐元数据与部件名。原来是逐行 SELECT components，
        # 3,586 行就是 3,586 次查询。
        for r in session.sql(
                f'SELECT e.id, t.dest, e.soname, e.partition, e.component_id, '
                f'c.name AS component FROM elf_modules e '
                f'JOIN install_targets t ON t.scan_id = e.scan_id '
                f'AND t.id = e.install_target_id '
                f'LEFT JOIN components c ON c.id = e.component_id '
                f'WHERE e.scan_id = ? AND e.id IN ({marks})',
                (session.scan_id, *ids)):
            meta[r['id']] = dict(r)

    reachable = [dict(meta[i], distance=d) for i, d in distance.items() if i in meta]
    reachable.sort(key=lambda r: (r['distance'], r['dest']))
    total = len(reachable)
    truncated = total > limit
    reachable = reachable[:limit]

    for row in reachable:
        row['via'] = ' → '.join(_shortest_path(
            session, row['id'], root_id, distance, meta, dest, caller_col, callee_col))
        row.pop('id', None)

    unresolved = session.sql(
        'SELECT d.needed_name, t.dest AS caller_dest '
        'FROM elf_module_dependencies d '
        'JOIN elf_modules caller ON caller.scan_id = d.scan_id AND caller.id = d.caller_id '
        'JOIN install_targets t ON t.scan_id = caller.scan_id '
        'AND t.id = caller.install_target_id '
        'WHERE d.scan_id = ? AND d.caller_id = ? '
        'AND d.callee_id IS NULL',
        (session.scan_id, root_id)) if direction == 'forward' else []

    return {
        'root': dest,
        'direction': direction,
        'max_distance': depth,
        'total': total,
        'truncated': truncated,
        'reachable': reachable,
        'unresolved': [dict(r) for r in unresolved],
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


def _bfs(session, root_id, depth, caller_col, callee_col):
    """从根逐层展开，返回 {节点: 最短距离}，不含根本身。

    逐层而不是递归 CTE：节点一旦定距就不再展开，所以是 O(边) 而非
    O(深度 × 边)。有环也自然终止——已访问过的节点不入队。
    """
    succ, _ = _adjacency(session, caller_col, callee_col)
    distance, frontier = {}, [root_id]
    seen = {root_id}
    for step in range(1, depth + 1):
        nxt = []
        for node in frontier:
            for target in succ.get(node, ()):
                if target not in seen:
                    seen.add(target)
                    distance[target] = step
                    nxt.append(target)
        if not nxt:
            break
        frontier = nxt
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
