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

  /** @param preferred URL 里的 ?scan=，命中就用它，否则取最新一次扫描 */
  function loadScans(preferred = null) {
    scans.value = rawQuery('SELECT * FROM scans ORDER BY id DESC')
    hasRepoId.value = hasColumn('components', 'repo_id')
    if (!scans.value.length) return
    const wanted = scans.value.find(s => String(s.id) === String(preferred))
    selectScan((wanted || scans.value[0]).id)
  }

  function selectScan(id) {
    scanId.value = id
    refreshCounts()
  }

  function refreshCounts() {
    if (!scanId.value) return
    const counts = {}
    for (const t of ['repos', 'components', 'services', 'sas', 'hdis', 'install_modules', 'install_targets', 'elf_modules', 'elf_module_dependencies', 'issues']) {
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
    dbLoaded, scanId, scans, hasRepoId, tableCounts,
    loadScans, selectScan, refreshCounts, getScanSummary,
  }
})
