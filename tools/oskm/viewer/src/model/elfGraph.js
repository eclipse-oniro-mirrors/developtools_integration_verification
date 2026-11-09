/* ELF 依赖闭包（viewer 侧）。

   Python 查询层已有 reachable()，但 viewer 是纯静态 sql.js 页面，不能调用
   Python。这里用同一张 elf_module_dependencies 边表在浏览器里做 BFS：
   forward 是“我依赖谁”，reverse 是“谁依赖我”。闭包不落库，打开 ELF 档案
   时才计算。 */

const keyOf = id => String(id)
const present = id => id !== null && id !== undefined && id !== ''
const emptyClosure = () => ({ nodes: [], count: 0, pathOf: () => [], recordOf: () => null })

/** 每个 Database 对象、每个 scan_id 只加载一次边表与节点，避免反复扫 3 万条边。 */
let graphCache = new WeakMap()

export function clearElfGraphCache() {
  graphCache = new WeakMap()
}

function addEdge(adjacency, fromValue, toValue) {
  const from = keyOf(fromValue)
  const to = keyOf(toValue)
  let next = adjacency.get(from)
  if (!next) adjacency.set(from, next = new Map())
  next.set(to, toValue)
}

function loadElfGraph(db, rawQuery, scanId) {
  let byScan = graphCache.get(db)
  if (!byScan) graphCache.set(db, byScan = new Map())
  if (byScan.has(scanId)) return byScan.get(scanId)

  const edges = rawQuery(
    `SELECT caller_id, callee_id
       FROM elf_module_dependencies
      WHERE scan_id = ? AND callee_id IS NOT NULL`, [scanId])
  const records = rawQuery(
    `SELECT e.id, t.dest, e.file_name, e.soname, e.api_type, e.category
       FROM elf_modules e
       LEFT JOIN install_targets t
              ON t.scan_id = e.scan_id AND t.id = e.install_target_id
      WHERE e.scan_id = ?`, [scanId])
  const forward = new Map()
  const reverse = new Map()
  const recordById = new Map()

  for (const edge of edges) {
    if (!present(edge.caller_id) || !present(edge.callee_id)) continue
    addEdge(forward, edge.caller_id, edge.callee_id)
    addEdge(reverse, edge.callee_id, edge.caller_id)
  }
  for (const record of records) recordById.set(keyOf(record.id), record)

  const graph = { forward, reverse, recordById }
  byScan.set(scanId, graph)
  return graph
}

function closureFromAdjacency(adjacency, startId, maxDistance = Infinity) {
  if (!present(startId)) return emptyClosure()

  const start = keyOf(startId)
  const distance = new Map([[start, 0]])
  const previous = new Map()
  const originalId = new Map([[start, startId]])
  const nodes = []
  const queue = [start]
  const limit = Number.isFinite(maxDistance) ? maxDistance : Infinity

  // BFS 保证距离最短；distance 同时是 visited，能切断 A→B→A 这类环。
  for (let cursor = 0; cursor < queue.length; cursor++) {
    const current = queue[cursor]
    const depth = distance.get(current)
    if (depth >= limit) continue
    for (const [next, nextId] of adjacency.get(current) || []) {
      if (distance.has(next)) continue
      distance.set(next, depth + 1)
      previous.set(next, current)
      originalId.set(next, nextId)
      queue.push(next)
      nodes.push({ id: nextId, distance: depth + 1 })
    }
  }

  return {
    nodes,
    get count() { return nodes.length },
    pathOf(id) {
      const target = keyOf(id)
      if (!distance.has(target)) return []
      const path = [originalId.get(target) ?? target]
      for (let at = target; previous.has(at); at = previous.get(at)) {
        path.unshift(originalId.get(previous.get(at)) ?? previous.get(at))
      }
      return path
    },
  }
}

/**
 * 在内存边集上计算可达闭包。
 *
 * 边的方向固定为 caller_id → callee_id：
 *   forward  沿 caller → callee，得到直接与间接依赖
 *   reverse  沿 callee → caller，得到直接与间接被依赖
 *
 * pathOf() 只为需要展示的节点按需重建，避免 2000+ 节点闭包一次性生成所有路径。
 */
export function reachableFromEdges(edges, {
  startId,
  direction = 'forward',
  maxDistance,
} = {}) {
  if (direction !== 'forward' && direction !== 'reverse') {
    throw new Error(`direction 必须是 forward 或 reverse：${direction}`)
  }

  const adjacency = new Map()
  for (const edge of edges || []) {
    if (!edge || !present(edge.caller_id) || !present(edge.callee_id)) continue
    if (direction === 'forward') addEdge(adjacency, edge.caller_id, edge.callee_id)
    else addEdge(adjacency, edge.callee_id, edge.caller_id)
  }
  return closureFromAdjacency(adjacency, startId, maxDistance)
}

/** 从当前数据库计算 ELF 依赖闭包，并把结果 JOIN 回可展示的模块记录。 */
export function elfReachable({
  db,
  rawQuery,
  scanId,
  startId,
  direction = 'forward',
  maxDistance,
} = {}) {
  if (!db || !rawQuery || !present(scanId) || !present(startId)) return emptyClosure()
  if (direction !== 'forward' && direction !== 'reverse') {
    throw new Error(`direction 必须是 forward 或 reverse：${direction}`)
  }

  const graph = loadElfGraph(db, rawQuery, scanId)
  const closure = closureFromAdjacency(graph[direction], startId, maxDistance)
  const nodes = closure.nodes.map(node => {
    const record = graph.recordById.get(keyOf(node.id))
    const shown = record
      ? Object.fromEntries(['dest', 'file_name', 'soname', 'api_type', 'category']
          .filter(key => record[key] !== null && record[key] !== undefined)
          .map(key => [key, record[key]]))
      : {}
    return { id: node.id, distance: node.distance, ...shown }
  })

  nodes.sort((a, b) => a.distance - b.distance
    || String(a.dest ?? a.file_name ?? a.id).localeCompare(String(b.dest ?? b.file_name ?? b.id),
                                                           'zh-Hans-CN'))
  return {
    nodes,
    get count() { return nodes.length },
    pathOf: id => closure.pathOf(id),
    recordOf: id => graph.recordById.get(keyOf(id)) || null,
  }
}
