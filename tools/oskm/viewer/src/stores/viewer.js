import { defineStore } from 'pinia'
import { ref } from 'vue'
import { useDatabase } from '../composables/useDatabase.js'

export const useViewerStore = defineStore('viewer', () => {
  const { rawQuery, hasColumn } = useDatabase()

  const dbLoaded = ref(false)
  const scanId = ref(null)
  const scans = ref([])
  const hasRepoId = ref(false)
  const tableCounts = ref({})
  /* 这个快照里实际存在哪些表。rawQuery 捕获异常后返回 []，所以查一张不存在的表
     会渲染成一个正常的空表格——看起来像"这个产品没有数据"，其实是"这个库没采过"。
     开库时读一次 sqlite_master，让视图能把两者分开。 */
  const tables = ref(new Set())
  const hasTable = name => tables.value.has(name)
  /* 本次扫描跑过哪些采集器。用来区分"库太旧，整个域都没有"和
     "采集器跑过但 schema 变了"——后者 collector_runs 有行、表却对不上。 */
  const collectorsRun = ref([])

  const COUNTED = ['repos', 'components', 'services', 'sas', 'hdis', 'install_modules',
                   'install_targets', 'elf_modules', 'elf_module_dependencies', 'issues',
                   'arkts_modules', 'arkts_kits', 'arkts_sources']

  /** @param preferred URL 里的 ?scan=，命中就用它，否则取最新一次扫描 */
  function loadScans(preferred = null) {
    tables.value = new Set(rawQuery(
      "SELECT name FROM sqlite_master WHERE type = 'table'").map(r => r.name))
    scans.value = rawQuery('SELECT * FROM scans ORDER BY id DESC')
    hasRepoId.value = hasColumn('components', 'repo_id')
    if (!scans.value.length) return
    const wanted = scans.value.find(s => String(s.id) === String(preferred))
    selectScan((wanted || scans.value[0]).id)
  }

  function selectScan(id) {
    scanId.value = id
    collectorsRun.value = rawQuery(
      'SELECT collector FROM collector_runs WHERE scan_id = ? ORDER BY collector', [id])
      .map(r => r.collector)
    refreshCounts()
  }

  function refreshCounts() {
    if (!scanId.value) return
    const counts = {}
    /* 只数存在的表：缺表时留 undefined，菜单据此不显示计数徽标——
       显示 0 会把"没采过"说成"采到 0 条"。 */
    for (const t of COUNTED.filter(hasTable)) {
      const r = rawQuery(`SELECT COUNT(*) as c FROM ${t} WHERE scan_id = ?`, [scanId.value])
      counts[t] = r[0]?.c ?? 0
    }
    tableCounts.value = counts
  }

  function getScanSummary(scan) {
    if (!scan) return ''
    const runs = rawQuery('SELECT status, COUNT(*) as c FROM collector_runs WHERE scan_id = ? GROUP BY status', [scan.id])
    return runs.map(r => `${r.c} ${r.status}`).join(' · ')
  }

  return {
    dbLoaded, scanId, scans, hasRepoId, tableCounts, tables, collectorsRun,
    hasTable, loadScans, selectScan, refreshCounts, getScanSummary,
  }
})
