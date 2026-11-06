/* 库自带的元数据就是关系图——档案页据此自动工作，新增采集器不改这里。
   见 docs/ux-design.md §11：
     collector_runs.collector  -> 本次扫描有哪些域
     PRAGMA table_info         -> 列与类型
     PRAGMA foreign_key_list   -> 表之间怎么关联（双向，全自动） */
import { useDatabase } from '../composables/useDatabase.js'

let cache = null
export function resetMetadata() { cache = null }

export function metadata() {
  if (cache) return cache
  const { rawQuery } = useDatabase()
  const tables = rawQuery(
    `SELECT name FROM sqlite_master WHERE type = 'table' AND name NOT LIKE 'sqlite_%'
      ORDER BY name`).map(r => r.name)

  const columns = {}, outgoing = {}, incoming = {}
  for (const t of tables) {
    columns[t] = rawQuery(`PRAGMA table_info(${t})`)
    outgoing[t] = rawQuery(`PRAGMA foreign_key_list(${t})`)
      .filter(f => f.table !== 'scans')
      .map(f => ({ column: f.from, table: f.table, to: f.to || 'id' }))
  }
  for (const t of tables) {
    for (const fk of outgoing[t]) {
      (incoming[fk.table] ||= []).push({ table: t, column: fk.column, to: fk.to })
    }
  }
  cache = { tables, columns, outgoing, incoming: Object.fromEntries(
    tables.map(t => [t, incoming[t] || []])) }
  return cache
}

export const hasTable = t => metadata().tables.includes(t)
export const columnsOf = t => metadata().columns[t] || []
export const columnNames = t => columnsOf(t).map(c => c.name)

/* elf_modules 不再保存 dest / engine，依赖边不再保存 callee_dest。
   档案页和关联区需要展示这些字段时，一律在这里通过外键 JOIN 重建，
   不允许各视图各自写一份散落 SQL。 */
const ROW_SQL = {
  elf_modules: `
    SELECT e.*, t.dest
      FROM elf_modules e
      JOIN install_targets t
        ON t.scan_id = e.scan_id AND t.id = e.install_target_id
     WHERE e.id = ?`,
  elf_module_dependencies: `
    SELECT d.*, caller_t.dest AS caller_dest, callee_t.dest AS callee_dest
      FROM elf_module_dependencies d
      JOIN elf_modules caller
        ON caller.scan_id = d.scan_id AND caller.id = d.caller_id
      JOIN install_targets caller_t
        ON caller_t.scan_id = caller.scan_id
       AND caller_t.id = caller.install_target_id
      LEFT JOIN elf_modules callee
        ON callee.scan_id = d.scan_id AND callee.id = d.callee_id
      LEFT JOIN install_targets callee_t
        ON callee_t.scan_id = callee.scan_id
       AND callee_t.id = callee.install_target_id
     WHERE d.id = ?`,
}

function relatedSQL(table, column) {
  if (table === 'elf_modules') {
    return `
      SELECT e.*, t.dest
        FROM elf_modules e
        JOIN install_targets t
          ON t.scan_id = e.scan_id AND t.id = e.install_target_id
       WHERE e.scan_id = ? AND e.${column} = ?
       LIMIT ? OFFSET ?`
  }
  if (table === 'elf_module_dependencies') {
    return `
      SELECT d.*, caller_t.dest AS caller_dest, callee_t.dest AS callee_dest
        FROM elf_module_dependencies d
        JOIN elf_modules caller
          ON caller.scan_id = d.scan_id AND caller.id = d.caller_id
        JOIN install_targets caller_t
          ON caller_t.scan_id = caller.scan_id
         AND caller_t.id = caller.install_target_id
        LEFT JOIN elf_modules callee
          ON callee.scan_id = d.scan_id AND callee.id = d.callee_id
        LEFT JOIN install_targets callee_t
          ON callee_t.scan_id = callee.scan_id
         AND callee_t.id = callee.install_target_id
       WHERE d.scan_id = ? AND d.${column} = ?
       LIMIT ? OFFSET ?`
  }
  return `SELECT * FROM ${table}
            WHERE scan_id = ? AND ${column} = ? LIMIT ? OFFSET ?`
}

export function rowSQL(table) {
  return ROW_SQL[table] || `SELECT * FROM ${table} WHERE id = ?`
}

/** 本次扫描实际跑过的采集器（不是所有建过的表） */
export function collectorsInScan(scanId) {
  const { rawQuery } = useDatabase()
  return rawQuery('SELECT collector, status, record_count FROM collector_runs WHERE scan_id = ?',
                  [scanId])
}

/** 一行记录的全部关联：正向跟自己的外键走，反向扫描指向自己的外键。 */
export function relationsOf(table, row, scanId) {
  const { rawQuery } = useDatabase()
  const meta = metadata()
  const out = []

  for (const fk of meta.outgoing[table] || []) {
    const value = row[fk.column]
    if (value == null) continue
    const target = rawQuery(rowSQL(fk.table), [value])
    if (target.length) out.push({ dir: 'to', table: fk.table, via: fk.column, rows: target })
  }
  for (const fk of meta.incoming[table] || []) {
    const n = rawQuery(
      `SELECT COUNT(*) c FROM ${fk.table} WHERE scan_id = ? AND ${fk.column} = ?`,
      [scanId, row.id])[0]?.c ?? 0
    if (n) out.push({ dir: 'from', table: fk.table, via: fk.column, count: n })
  }
  return out
}

/** 反向关联的具体行，分页取 */
export function relatedRows(table, column, id, scanId, limit = 50, offset = 0) {
  const { rawQuery } = useDatabase()
  return rawQuery(
    relatedSQL(table, column),
    [scanId, id, limit, offset])
}
