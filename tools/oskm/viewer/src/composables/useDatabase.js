import { ref } from 'vue'

let SQL = null
const db = ref(null)

export function useDatabase() {
  async function loadDatabase(file) {
    return openBuffer(await file.arrayBuffer())
  }

  /** 从同目录的 .db 直接打开：?db=knowledge.db
   *  既是分享用法（把 .db 和静态站点放一起），也是无头验证的入口。 */
  async function loadDatabaseFromUrl(url) {
    const response = await fetch(url)
    if (!response.ok) throw new Error(`无法读取 ${url}：HTTP ${response.status}`)
    return openBuffer(await response.arrayBuffer())
  }

  async function openBuffer(buffer) {
    if (!SQL) {
      SQL = await initSqlJs({ locateFile: () => './sql-wasm.wasm' })
    }
    db.value = new SQL.Database(new Uint8Array(buffer))
    return db.value
  }

  function rawQuery(sql, params = []) {
    if (!db.value) return []
    try {
      const stmt = db.value.prepare(sql)
      stmt.bind(params)
      const rows = []
      while (stmt.step()) rows.push(stmt.getAsObject())
      stmt.free()
      return rows
    } catch (e) {
      console.warn('SQL error:', e.message, sql)
      return []
    }
  }

  function query(sql, params = []) {
    if (!db.value) return []
    return rawQuery(sql, params)
  }

  function queryWithScan(sql, scanId, params = []) {
    if (!db.value || !scanId) return []
    return rawQuery(sql.replace(/__SCAN__/g, scanId), params)
  }

  function queryOne(sql, params = []) {
    const rows = rawQuery(sql, params)
    return rows.length ? rows[0] : null
  }

  function hasColumn(table, column) {
    const info = rawQuery(`PRAGMA table_info(${table})`)
    return info.some(c => c.name === column)
  }

  return { db, loadDatabase, loadDatabaseFromUrl, rawQuery, query, queryWithScan, queryOne, hasColumn }
}
