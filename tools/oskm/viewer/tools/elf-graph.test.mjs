import test from 'node:test'
import assert from 'node:assert/strict'

import { clearElfGraphCache, elfReachable, reachableFromEdges } from '../src/model/elfGraph.js'

const edge = (caller_id, callee_id) => ({ caller_id, callee_id })

test('forward traversal follows indirect dependencies and keeps the shortest path', () => {
  const result = reachableFromEdges([
    edge(1, 2), edge(2, 3), edge(1, 4), edge(4, 3),
  ], { startId: 1, direction: 'forward' })
  const byId = new Map(result.nodes.map(n => [n.id, n]))

  assert.equal(byId.get(2).distance, 1)
  assert.equal(byId.get(3).distance, 2)
  assert.deepEqual(result.pathOf(3), [1, 2, 3])
})

test('reverse traversal follows indirect dependents', () => {
  const result = reachableFromEdges([
    edge(1, 2), edge(2, 3),
  ], { startId: 3, direction: 'reverse' })
  const byId = new Map(result.nodes.map(n => [n.id, n]))

  assert.equal(byId.get(2).distance, 1)
  assert.equal(byId.get(1).distance, 2)
  assert.deepEqual(result.pathOf(1), [3, 2, 1])
})

test('cycles terminate and the start node is not returned as reachable', () => {
  const result = reachableFromEdges([
    edge(1, 2), edge(2, 1), edge(2, 3),
  ], { startId: 1, direction: 'forward' })

  assert.deepEqual(result.nodes.map(n => n.id).sort((a, b) => a - b), [2, 3])
})

test('unresolved edges are ignored', () => {
  const result = reachableFromEdges([
    edge(1, null), edge(1, 2),
  ], { startId: 1, direction: 'forward' })

  assert.deepEqual(result.nodes.map(n => n.id), [2])
})

test('maxDistance bounds the closure', () => {
  const result = reachableFromEdges([
    edge(1, 2), edge(2, 3), edge(3, 4),
  ], { startId: 1, direction: 'forward', maxDistance: 2 })

  assert.deepEqual(result.nodes.map(n => n.id), [2, 3])
})

test('duplicate parallel edges do not duplicate reachable nodes', () => {
  const result = reachableFromEdges([
    edge(1, 2), edge(1, 2), edge(2, 3),
  ], { startId: 1, direction: 'forward' })

  assert.equal(result.count, 2)
  assert.equal(new Set(result.pathOf(3)).size, 3)
})

test('numeric and string IDs describe the same graph node', () => {
  const result = reachableFromEdges([
    edge('1', 2),
  ], { startId: 1, direction: 'forward' })

  assert.deepEqual(result.nodes.map(n => n.id), [2])
})

test('elfReachable joins records, filters by scan, and reuses the cached graph', async () => {
  clearElfGraphCache()
  const db = { name: 'fake-db' }
  const edges = [edge(1, 2), edge(2, 3)]
  const records = [
    { id: 1, dest: 'a.so' }, { id: 2, dest: 'b.so' }, { id: 3, dest: 'c.so' },
  ]
  const queries = []
  const rawQuery = (sql, params = []) => {
    queries.push({ sql, params })
    if (sql.includes('elf_module_dependencies')) return params[0] === 1 ? edges : []
    if (sql.includes('elf_modules')) return params[0] === 1 ? records : []
    return []
  }

  const result = elfReachable({ db, rawQuery, scanId: 1, startId: 1, direction: 'forward' })
  assert.deepEqual(result.nodes, [
    { id: 2, dest: 'b.so', distance: 1 },
    { id: 3, dest: 'c.so', distance: 2 },
  ])
  assert.deepEqual(result.pathOf(3), [1, 2, 3])
  assert.equal(result.recordOf(3).dest, 'c.so')

  const before = queries.length
  const cached = elfReachable({ db, rawQuery, scanId: 1, startId: 3, direction: 'reverse' })
  assert.equal(queries.length, before)
  assert.deepEqual(cached.nodes.map(n => n.id), [2, 1])

  assert.equal(elfReachable({ db, rawQuery, scanId: 2, startId: 1 }).count, 0)
  clearElfGraphCache()
})
