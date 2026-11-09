/* 运行视图的数据模型。
 *
 * 库里没有"进程"表——但 services.id 已被 sas.service_id / hdis.service_id 引用，
 * 所以一条 service 声明就是一个运行单元，内容由外键给出。不另造实体。
 * 见 docs/ux-design.md §4.1
 */
import { useDatabase } from '../composables/useDatabase.js'

/** JSON 列在库里声明为 TEXT（schema.py 刻意如此，以保住 Decimal 原文），
 *  PRAGMA 分辨不出来，所以按字面量形状判断。services.args 就是这种列。 */
export function unjson(value) {
  if (typeof value !== 'string') return value
  const head = value[0]
  if (head !== '"' && head !== '{' && head !== '[') return value
  try { return JSON.parse(value) } catch { return value }
}

export const KINDS = {
  sa:      { label: 'SA 宿主',  glyph: '⬢', entity: 'sa' },
  hdf:     { label: '驱动宿主', glyph: '⬡', entity: 'hdi' },
  daemon:  { label: '守护进程', glyph: '⬜', entity: 'service' },
  unknown: { label: '未分类',   glyph: '◌', entity: 'repo' },
}

/* record 里还有 21 个字段（permission / caps / apl / critical …）没有成列。
   它们不进列表——一行摊二十几格反而什么都看不清——只在运行单元详情页展开。 */
const SERVICES = `
  SELECT s.id, s.name, s.cfg, s.type, s.executable, s.args, s.component_id, s.record,
         s.uid, s.gid, s.start_mode, s.ondemand, s.secon, s.sandbox, s.importance,
         c.name AS component, c.subsystem, c.repo_id,
         r.name AS repo,
         m.label AS install_label
    FROM services s
    LEFT JOIN components c ON c.id = s.component_id AND c.scan_id = s.scan_id
    LEFT JOIN repos r ON r.id = c.repo_id
    LEFT JOIN install_modules m ON m.id = s.install_module_id
   WHERE s.scan_id = ?`

const SAS = `
  SELECT a.id, a.service_id, a.sa_id, a.libpath, c.name AS component
    FROM sas a LEFT JOIN components c ON c.id = a.component_id
   WHERE a.scan_id = ? AND a.service_id IS NOT NULL`

const HDIS = `
  SELECT h.id, h.service_id, h.service_name, h.module_name, c.name AS component
    FROM hdis h LEFT JOIN components c ON c.id = h.component_id
   WHERE h.scan_id = ? AND h.service_id IS NOT NULL`

/** hdf 宿主的真实进程名写在 cfg 的 `-n <host>` 参数里，不是服务名。 */
function hostName(service) {
  const args = unjson(service.args)
  if (!Array.isArray(args)) return null
  const at = args.indexOf('-n')
  return at >= 0 && typeof args[at + 1] === 'string' ? args[at + 1] : null
}

function kindOf(type) {
  if (type === 'sa') return 'sa'
  if (type === 'hdf') return 'hdf'
  if (type === 'default') return 'daemon'
  return 'unknown'
}

export function loadRuntimeUnits(scanId) {
  const { rawQuery } = useDatabase()
  if (!scanId) return []

  const contents = new Map()
  const add = (serviceId, item) => {
    if (!contents.has(serviceId)) contents.set(serviceId, [])
    contents.get(serviceId).push(item)
  }
  for (const row of rawQuery(SAS, [scanId])) {
    add(row.service_id, {
      kind: 'sa', table: 'sas', id: row.id,
      title: String(row.sa_id ?? '—'), subtitle: row.libpath || '',
      component: row.component,
    })
  }
  for (const row of rawQuery(HDIS, [scanId])) {
    add(row.service_id, {
      kind: 'hdi', table: 'hdis', id: row.id,
      title: row.service_name || '—', subtitle: row.module_name || '',
      component: row.component,
    })
  }

  const issues = new Map()
  for (const row of rawQuery(
    `SELECT path, COUNT(*) n FROM issues
      WHERE scan_id = ? AND collector = 'services' AND advisory = 0 GROUP BY path`,
    [scanId])) {
    issues.set(row.path, row.n)
  }

  return rawQuery(SERVICES, [scanId]).map(service => {
    const items = contents.get(service.id) || []
    const parts = [...new Set(items.map(i => i.component).filter(Boolean))]
    const kind = kindOf(service.type)
    return {
      id: service.id,
      name: service.name || '(未命名)',
      kind,
      host: kind === 'hdf' ? hostName(service) : service.name,
      cfg: service.cfg,
      executable: service.executable,
      args: unjson(service.args),
      argsText: Array.isArray(unjson(service.args)) ? unjson(service.args).join(' ') : '',
      component: service.component,
      componentId: service.component_id,
      repo: service.repo,
      repoId: service.repo_id,
      subsystem: service.subsystem,
      installLabel: service.install_label,
      /* 运行身份与安全。null 与 0 是两回事（sandbox=0 是显式关闭，
         null 是没声明），所以一律原样带过来，不要在这里兜底成默认值。 */
      uid: service.uid,
      gid: unjson(service.gid),              // 库里是 JSON 数组存成 TEXT
      startMode: service.start_mode,
      ondemand: service.ondemand,
      secon: service.secon,
      sandbox: service.sandbox,
      importance: service.importance,
      record: service.record,
      contents: items,
      contentCount: items.length,
      components: parts,
      partCount: parts.length,
      // 内容来自多个部件：改动影响面、崩溃定位、内存归因都卡在这上面，
      // 所以它是卡片上的一等信息，而不是详情里的一行。
      mixed: parts.length > 1,
      unattributed: !service.component,
      issues: [...issues.entries()]
        .filter(([path]) => service.cfg && path.endsWith(service.cfg))
        .reduce((sum, [, n]) => sum + n, 0),
    }
  })
}

export const SORTS = {
  contents: { label: '内容多优先', compare: (a, b) => b.contents.length - a.contents.length || a.name.localeCompare(b.name) },
  mixed:    { label: '混装优先',   compare: (a, b) => (b.mixed - a.mixed) || b.components.length - a.components.length || a.name.localeCompare(b.name) },
  issues:   { label: '有问题优先', compare: (a, b) => (b.issues - a.issues) || a.name.localeCompare(b.name) },
  name:     { label: '名称',       compare: (a, b) => a.name.localeCompare(b.name) },
}
