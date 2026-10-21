/* 反查：从一条现场线索（路径 / so 名 / 进程 / label / 部件 / 仓）回到归属链。
   逐级回退，命中即停；多命中则全部列出。见 docs/ux-design.md §6 */
import { useDatabase } from '../composables/useDatabase.js'

const OWNER = `
  SELECT t.dest, t.partition, t.file_name, t.directory,
         m.id AS module_id, m.label, m.type AS module_type, m.source,
         c.id AS component_id, c.name AS component, c.subsystem,
         r.name AS repo
    FROM install_targets t
    JOIN install_modules m ON m.id = t.module_id
    LEFT JOIN components c ON c.id = m.component_id
    LEFT JOIN repos r ON r.id = c.repo_id
   WHERE t.scan_id = ?`

export function lookup(scanId, raw) {
  const { rawQuery, hasColumn } = useDatabase()
  const q = (raw || '').trim()
  if (!scanId || !q) return { query: q, groups: [] }

  const sql = hasColumn('components', 'repo_id')
    ? OWNER
    : OWNER.replace('LEFT JOIN repos r ON r.id = c.repo_id', '').replace(', r.name AS repo', ', NULL AS repo')

  /* 按证据强度从强到弱全部查一遍，而不是命中即停——
     一个词可能同时是部件名和服务名（accessibility 就是），
     只给其中一种会让人以为另一种不存在。 */
  const groups = []
  const push = (kind, hits) => { if (hits.length) groups.push({ kind, hits }) }

  push('dest',  decorate(scanId, rawQuery(`${sql} AND t.dest = ?`, [scanId, q.replace(/^\//, '')])))
  if (!groups.length) {
    const base = q.split('/').pop()
    push('file_name', decorate(scanId, rawQuery(`${sql} AND t.file_name = ?`, [scanId, base])))
  }
  push('label',   decorate(scanId, rawQuery(`${sql} AND m.label = ?`, [scanId, q])))
  push('process', runtimeHits(scanId, q))
  push('component', rawQuery(
    `SELECT id AS component_id, name AS component, subsystem, manifest
       FROM components WHERE scan_id = ? AND name = ?`, [scanId, q]))
  push('repo', rawQuery(
    `SELECT id AS repo_id, name AS repo, path FROM repos
      WHERE scan_id = ? AND (name = ? OR path = ?)`, [scanId, q, q]))

  return { query: q, groups }
}

/** 这个安装产物在运行时扮演什么角色 */
function decorate(scanId, hits) {
  const { rawQuery } = useDatabase()
  for (const hit of hits) {
    hit.roles = []
    for (const r of rawQuery(
      `SELECT s.id, s.name, s.cfg FROM services s
        WHERE s.scan_id = ? AND s.install_module_id = ?`, [scanId, hit.module_id])) {
      hit.roles.push({ kind: 'service', id: r.id, text: `服务 ${r.name}`, sub: r.cfg })
    }
    for (const r of rawQuery(
      `SELECT a.id, a.sa_id, a.service_id, v.name AS host FROM sas a
         LEFT JOIN services v ON v.id = a.service_id
        WHERE a.scan_id = ? AND a.install_module_id = ?`, [scanId, hit.module_id])) {
      hit.roles.push({ kind: 'sa', id: r.service_id,
                       text: `SA ${r.sa_id}`, sub: r.host ? `宿主进程 ${r.host}` : '' })
    }
    for (const r of rawQuery(
      `SELECT h.id, h.service_name, h.service_id, v.name AS host FROM hdis h
         LEFT JOIN services v ON v.id = h.service_id
        WHERE h.scan_id = ? AND h.install_module_id = ?`, [scanId, hit.module_id])) {
      hit.roles.push({ kind: 'hdi', id: r.service_id,
                       text: `驱动 ${r.service_name}`, sub: r.host ? `宿主 ${r.host}` : '' })
    }
  }
  return hits
}

function runtimeHits(scanId, q) {
  const { rawQuery } = useDatabase()
  // SA 宿主的进程名就是服务名；hdf 宿主的写在 cfg 的 `-n <host>` 参数里。
  // sas/hdis 不再有 process 列——进程名由 service 这一侧承载，只此一处。
  return rawQuery(
    `SELECT id, name, cfg, type FROM services
      WHERE scan_id = ? AND (name = ? OR (type = 'hdf' AND args LIKE ?))
      ORDER BY name`,
    [scanId, q, `%"-n","${q}"%`])
}

export const KIND_LABEL = {
  dest: '安装路径精确匹配', file_name: '文件名匹配', label: 'GN label 匹配',
  process: '进程 / 服务名匹配', component: '部件名匹配', repo: '仓匹配',
}
