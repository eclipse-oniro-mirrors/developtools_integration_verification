/* 首页四段式导航图的数据。

   四段 = 顶栏的四个一级分组 = 概念模型的四段（源码 → 镜像 → 运行 → 接口）。
   **不是巧合**：目录结构本来就按这条链分的。所以这张图既是数据模型
   也是导航——每个方块就是一个二级视图的入口，不会再出现"首页的入口
   和实际视图各自维护成两套"（上一轮漏改过 5 个链接）。
   SDK 接口段讲的是应用开发者看到的接口面，不随产品裁剪而变。
   见 docs/home-options.md §2。 */
import { useDatabase } from '../composables/useDatabase.js'

const one = (sql, id) => {
  const r = useDatabase().rawQuery(sql, [id])
  return r[0]?.c ?? null
}

/** 一个进程里装了多个部件的内容——运行视图最想让人看见的那个结论 */
const MIXED = `
  SELECT COUNT(*) c FROM (
    SELECT x.service_id FROM (
        SELECT service_id, component_id FROM sas  WHERE scan_id = ? AND service_id IS NOT NULL
        UNION ALL
        SELECT service_id, component_id FROM hdis WHERE scan_id = ? AND service_id IS NOT NULL) x
     GROUP BY x.service_id HAVING COUNT(DISTINCT x.component_id) > 1)`

export function overview(scanId) {
  if (!scanId) return null
  const { rawQuery } = useDatabase()
  const c = sql => one(sql, scanId)
  const mixed = rawQuery(MIXED, [scanId, scanId])[0]?.c ?? 0
  return {
    repos: c('SELECT COUNT(*) c FROM repos WHERE scan_id = ?'),
    reposUsed: c('SELECT COUNT(DISTINCT repo_id) c FROM components WHERE scan_id = ? AND repo_id IS NOT NULL'),
    components: c('SELECT COUNT(*) c FROM components WHERE scan_id = ?'),
    innerapis: c('SELECT COUNT(*) c FROM innerapis WHERE scan_id = ?'),
    syscaps: c('SELECT COUNT(*) c FROM syscaps WHERE scan_id = ?'),
    features: c('SELECT COUNT(*) c FROM features WHERE scan_id = ?'),
    modules: c('SELECT COUNT(*) c FROM install_modules WHERE scan_id = ?'),
    modulesUnowned: c('SELECT COUNT(*) c FROM install_modules WHERE scan_id = ? AND component_id IS NULL'),
    targets: c('SELECT COUNT(*) c FROM install_targets WHERE scan_id = ?'),
    elfModules: c('SELECT COUNT(*) c FROM elf_modules WHERE scan_id = ?'),
    elfEdges: c('SELECT COUNT(*) c FROM elf_module_dependencies WHERE scan_id = ?'),
    partitions: c('SELECT COUNT(DISTINCT partition) c FROM install_targets WHERE scan_id = ?'),
    services: c('SELECT COUNT(*) c FROM services WHERE scan_id = ?'),
    servicesUnowned: c('SELECT COUNT(*) c FROM services WHERE scan_id = ? AND component_id IS NULL'),
    sas: c('SELECT COUNT(*) c FROM sas WHERE scan_id = ?'),
    hdis: c('SELECT COUNT(*) c FROM hdis WHERE scan_id = ?'),
    hdisUnowned: c('SELECT COUNT(*) c FROM hdis WHERE scan_id = ? AND component_id IS NULL'),
    gnArgs: c('SELECT COUNT(*) c FROM gn_args WHERE scan_id = ?'),
    gnArgsOverride: c('SELECT COUNT(*) c FROM gn_args WHERE scan_id = ? AND has_override = 1'),
    symlinks: c('SELECT COUNT(*) c FROM install_targets WHERE scan_id = ? AND link_target_path IS NOT NULL'),
    elfResolved: c(`SELECT COUNT(*) c FROM elf_module_dependencies WHERE scan_id = ? AND resolution != 'unresolved'`),
    arktsModules: c('SELECT COUNT(*) c FROM arkts_modules WHERE scan_id = ?'),
    arktsKits: c('SELECT COUNT(*) c FROM arkts_kits WHERE scan_id = ?'),
    arktsSources: c('SELECT COUNT(*) c FROM arkts_sources WHERE scan_id = ?'),
    ndkHeaders: c('SELECT COUNT(*) c FROM ndk_headers WHERE scan_id = ?'),
    ndkLibraries: c('SELECT COUNT(DISTINCT elf_module_id) c FROM ndk_headers WHERE scan_id = ?'),
    mixed,
  }
}

/** 扫描本身可不可信：degraded 的采集器数、扫描层问题数 */
export function health(scanId) {
  if (!scanId) return null
  const { rawQuery } = useDatabase()
  const runs = rawQuery(
    'SELECT collector, status FROM collector_runs WHERE scan_id = ? ORDER BY collector', [scanId])
  return {
    runs,
    total: runs.length,
    complete: runs.filter(r => r.status === 'complete').length,
    degraded: runs.filter(r => r.status !== 'complete').length,
    /* 扫描层问题（advisory = 0）才影响"数字能不能信"；
       一致性问题反映的是产品现状，不是扫描的毛病。见 model/issues.js */
    blocking: one('SELECT COUNT(*) c FROM issues WHERE scan_id = ? AND advisory = 0', scanId),
  }
}
