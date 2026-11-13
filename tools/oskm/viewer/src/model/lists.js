/* 六个列表视图的取数。每个返回一个扁平数组，直接喂给 EntityTable。

   一条纪律：**所有关联字段都在 SQL 里 JOIN 出来**，不在前端逐行查。
   5804 行 × 一次查询 = 5804 次 sql.js 调用，比一条 JOIN 慢两个数量级。

   还有一条：**相关子查询必须把 `scan_id` 一起写进 WHERE**。这个库里每张表的索引都以
   `scan_id` 打头（`idx_xxx_component (scan_id, component_id)` 之类），子查询只写
   外键那一半就没法 seek，planner 只能扫整个索引——每个外层行扫一次。
   实测（sql.js，382 个部件）：部件列表 7 个计数子查询 264 ms → 补上 scan_id 后 9.2 ms，
   结果逐行逐列一致。ELF 列表那次更狠，见 loadElfModules 上的注释。

   另一条：SA / HDI 的宿主进程必须经 `service_id → services.name` 取，
   **不能读 `sas.process` / `hdis.process`**——扫描器当前 schema 里已经没有这两列
   （本地 knowledge.db 是旧的还留着，照它写会做出一个新库打不开的视图）。 */
import { useDatabase } from '../composables/useDatabase.js'
import { unjson } from './runtime.js'
import { fileSource } from './gitlink.js'

const rows = (sql, id) => (id ? useDatabase().rawQuery(sql, [id]) : [])

/* ------------------------------------------------------------ 3.2 ELF 模块 */
/* 度数不能写成 SELECT 列表里的相关子查询：那会让每行 ELF 各回表一次。
   先按 callee 聚合成派生表再 JOIN，计划与统计信息无关。 */
export function loadElfModules(scanId) {
  if (!scanId) {
    return []
  }
  return useDatabase().rawQuery(`
    WITH in_degree AS (
           SELECT callee_id AS id, COUNT(*) AS n
             FROM elf_module_dependencies
            WHERE scan_id = ? AND callee_id IS NOT NULL
           GROUP BY callee_id)
    SELECT e.id, t.dest, e.partition, e.file_name, e.soname, e.format,
           e.api_type, e.category, e.type, e.machine,
           e.dynamic, e.needed, e.install_target_id, e.install_module_id,
           e.component_id, c.name AS component, c.subsystem, m.label,
           m.type AS module_type,
           /* COALESCE 不能省：LEFT JOIN 没命中时给 NULL，而排序需要 0。 */
           COALESCE(i.n, 0) AS dependents
      FROM elf_modules e
      JOIN install_targets t ON t.scan_id = e.scan_id AND t.id = e.install_target_id
      LEFT JOIN components c ON c.scan_id = e.scan_id AND c.id = e.component_id
      LEFT JOIN install_modules m ON m.scan_id = e.scan_id AND m.id = e.install_module_id
      LEFT JOIN in_degree i ON i.id = e.id
     WHERE e.scan_id = ?
     ORDER BY dependents DESC`, [scanId, scanId])
}

/* ------------------------------------------------------------ Native SDK 头文件 */
/* 映射表本身只有库外键和头文件路径；所有可读字段都经 ELF 一次 JOIN 出来。 */
export function loadNativeHeaders(scanId) {
  if (!scanId) {
    return []
  }
  return useDatabase().rawQuery(`
    SELECT n.id, n.elf_module_id, n.header_path, n.match_strategy,
           e.soname, e.file_name, e.partition,
           e.install_module_id, e.component_id,
           t.dest, c.name AS component, c.subsystem,
           m.label
      FROM native_headers n
      JOIN elf_modules e
             ON e.scan_id = n.scan_id AND e.id = n.elf_module_id
      JOIN install_targets t
             ON t.scan_id = e.scan_id AND t.id = e.install_target_id
      LEFT JOIN components c
             ON c.scan_id = e.scan_id AND c.id = e.component_id
      LEFT JOIN install_modules m
             ON m.scan_id = e.scan_id AND m.id = e.install_module_id
     WHERE n.scan_id = ?
     ORDER BY n.header_path, t.dest`, [scanId])
    /* fileSource 统一处理各托管站的文件链接：codehub 开源仓用 files 格式
       （ref 用分支名），公开托管仓保持 blob + 扫描提交号。 */
    .map(r => ({ ...r, sourceUrl: fileSource(scanId, r.header_path)?.url || null }))
}

/* ------------------------------------------------------------ 1.2 SA服务 */
export function loadSas(scanId) {
  return rows(`
    SELECT a.id, a.sa_id, a.libpath, a.profile, a.run_on_create, a.distributed,
           a.dump_level, a.auto_restart, a.service_id, a.component_id,
           s.name AS host, s.cfg AS host_cfg,
           c.name AS component, c.subsystem, c.repo_id,
           r.name AS repo,
           m.label AS install_label
      FROM sas a
      LEFT JOIN services s ON s.id = a.service_id
      LEFT JOIN components c ON c.id = a.component_id AND c.scan_id = a.scan_id
      LEFT JOIN repos r ON r.id = c.repo_id
      LEFT JOIN install_modules m ON m.id = a.install_module_id
     WHERE a.scan_id = ?`, scanId)
}

/* ------------------------------------------------------------ 1.3 HDI服务 */
export function loadHdis(scanId) {
  return rows(`
    SELECT h.id, h.service_name, h.module_name, h.library, h.node, h.hcb,
           h.policy, h.preload, h.priority, h.permission, h.device_match_attr,
           h.service_id, h.component_id,
           s.name AS host, s.cfg AS host_cfg,
           c.name AS component, c.subsystem, c.repo_id,
           r.name AS repo,
           m.label AS install_label
      FROM hdis h
      LEFT JOIN services s ON s.id = h.service_id
      LEFT JOIN components c ON c.id = h.component_id AND c.scan_id = h.scan_id
      LEFT JOIN repos r ON r.id = c.repo_id
      LEFT JOIN install_modules m ON m.id = h.install_module_id
     WHERE h.scan_id = ?`, scanId)
}

/* ------------------------------------------------------------ 2.1 代码仓 */
/* 旧实现用 7 个相关子查询（525 行 × 7 = 3675 次子查询执行，每次都 JOIN components），
   在 sql.js 上偏慢。改为 8 个独立 GROUP BY 聚合查询 + JS 端合并，
   每个查询只做一次全表扫描，总计 9 次 prepare+execute。 */
export function loadRepos(scanId) {
  if (!scanId) {
    return []
  }
  const { rawQuery } = useDatabase()

  const repos = rawQuery(
    'SELECT id, name, path, remote, remote_url, revision, groups, clone_depth, head_commit FROM repos WHERE scan_id = ?',
    [scanId])

  /* 按 repo_id 聚合：先建 components 基表，再逐个子表 JOIN 补字段 */
  const compCounts = rawQuery(
    'SELECT repo_id, COUNT(*) AS n FROM components WHERE scan_id = ? AND repo_id IS NOT NULL GROUP BY repo_id',
    [scanId])
  const stats = new Map(compCounts.map(r => [r.repo_id,
    { components: r.n, innerapis: 0, syscaps: 0, features: 0, modules: 0, services: 0, sas: 0, hdis: 0 }]))

  const fill = (sql, field) => {
    for (const r of rawQuery(sql, [scanId])) {
      const s = stats.get(r.repo_id)
      if (s) s[field] = r.n
    }
  }
  fill(`SELECT c.repo_id, COUNT(*) AS n FROM innerapis i JOIN components c ON c.id = i.component_id AND c.scan_id = i.scan_id WHERE i.scan_id = ? GROUP BY c.repo_id`, 'innerapis')
  fill(`SELECT c.repo_id, COUNT(*) AS n FROM syscaps s JOIN components c ON c.id = s.component_id AND c.scan_id = s.scan_id WHERE s.scan_id = ? GROUP BY c.repo_id`, 'syscaps')
  fill(`SELECT c.repo_id, COUNT(*) AS n FROM features f JOIN components c ON c.id = f.component_id AND c.scan_id = f.scan_id WHERE f.scan_id = ? GROUP BY c.repo_id`, 'features')
  fill(`SELECT c.repo_id, COUNT(*) AS n FROM install_modules m JOIN components c ON c.id = m.component_id AND c.scan_id = m.scan_id WHERE m.scan_id = ? GROUP BY c.repo_id`, 'modules')
  fill(`SELECT c.repo_id, COUNT(*) AS n FROM services s JOIN components c ON c.id = s.component_id AND c.scan_id = s.scan_id WHERE s.scan_id = ? GROUP BY c.repo_id`, 'services')
  fill(`SELECT c.repo_id, COUNT(*) AS n FROM sas x JOIN components c ON c.id = x.component_id AND c.scan_id = x.scan_id WHERE x.scan_id = ? GROUP BY c.repo_id`, 'sas')
  fill(`SELECT c.repo_id, COUNT(*) AS n FROM hdis h JOIN components c ON c.id = h.component_id AND c.scan_id = h.scan_id WHERE h.scan_id = ? GROUP BY c.repo_id`, 'hdis')

  return repos.map(r => {
    const s = stats.get(r.id)
    return {
      ...r,
      components: s?.components ?? 0,
      innerapis: s?.innerapis ?? 0,
      syscaps: s?.syscaps ?? 0,
      features: s?.features ?? 0,
      modules: s?.modules ?? 0,
      services: s?.services ?? 0,
      sas: s?.sas ?? 0,
      hdis: s?.hdis ?? 0,
      groupList: String(r.groups || '').split(',').filter(Boolean),
    }
  })
}

/* ------------------------------------------------------------ 2.2 部件 */
export function loadComponents(scanId) {
  const out = rows(`
    SELECT c.id, c.name, c.subsystem, c.manifest, c.deps, c.repo_id,
           r.name AS repo,
           (SELECT COUNT(*) FROM innerapis a WHERE a.scan_id = c.scan_id AND a.component_id = c.id) AS apis,
           (SELECT COUNT(*) FROM syscaps y WHERE y.scan_id = c.scan_id AND y.component_id = c.id) AS syscaps,
           (SELECT COUNT(*) FROM features f WHERE f.scan_id = c.scan_id AND f.component_id = c.id) AS features,
           (SELECT COUNT(*) FROM install_modules m WHERE m.scan_id = c.scan_id AND m.component_id = c.id) AS modules,
           (SELECT COUNT(*) FROM services s WHERE s.scan_id = c.scan_id AND s.component_id = c.id) AS services,
           (SELECT COUNT(*) FROM sas x WHERE x.scan_id = c.scan_id AND x.component_id = c.id) AS sas,
           (SELECT COUNT(*) FROM hdis h WHERE h.scan_id = c.scan_id AND h.component_id = c.id) AS hdis
      FROM components c
      LEFT JOIN repos r ON r.id = c.repo_id
     WHERE c.scan_id = ?`, scanId)

  /* 入度：被多少个部件依赖。整图 5913 条边，一次算完比逐个查快得多。 */
  const names = new Set(out.map(c => c.name))
  const deg = new Map()
  for (const c of out) {
    let list = []
    try { list = JSON.parse(c.deps || '{}').components || [] } catch { /* 声明可能不规范 */ }
    for (const d of list) if (names.has(d)) deg.set(d, (deg.get(d) || 0) + 1)
  }
  return out.map(c => {
    let list = []
    try { list = JSON.parse(c.deps || '{}').components || [] } catch { /* 同上 */ }
    return { ...c, dependents: deg.get(c.name) || 0, depends: list.length, depList: list.join(' ') }
  })
}

/* ------------------------------------------------------------ 3.1 安装产物
   一行 = 一个装进镜像的文件，同时带上它所属安装模块的信息。
   实测 5501 个模块装出 5804 个文件，95% 的模块只装 1 个、最多 3 个——
   所以以目标为行、模块字段并进来最实用，1:N 由"同模块文件数"列与展开行体现。 */
export function loadTargets(scanId) {
  const out = rows(`
    SELECT t.id, t.dest, t.partition, t.file_name, t.directory, t.dest_index,
           t.size, t.link_target_path, t.link_target_id,
           m.id AS module_id, m.label, m.label_name, m.type AS module_type,
           m.source, m.install_enable, m.ordinal,
           c.id AS component_id, c.name AS component, c.subsystem, c.repo_id,
           r.name AS repo
      FROM install_targets t
      JOIN install_modules m ON m.id = t.module_id
      LEFT JOIN components c ON c.id = m.component_id AND c.scan_id = m.scan_id
      LEFT JOIN repos r ON r.id = c.repo_id
     WHERE t.scan_id = ?`, scanId)
  const fan = new Map()
  for (const t of out) fan.set(t.module_id, (fan.get(t.module_id) || 0) + 1)
  return out.map(t => ({
    ...t,
    siblings: fan.get(t.module_id) || 1,
    depth: String(t.dest || '').split('/').length,
  }))
}

/** 某个安装模块装出的全部文件，给展开行用 */
export function targetsOfModule(scanId, moduleId) {
  return useDatabase().rawQuery(
    `SELECT id, dest, partition, file_name, directory FROM install_targets
      WHERE scan_id = ? AND module_id = ? ORDER BY dest_index`, [scanId, moduleId])
}

/* ------------------------------------------------------------ 安装产物详情 */
export function loadTargetDetail(scanId, targetId) {
  if (!scanId || !targetId) return null
  return useDatabase().rawQuery(`
    SELECT t.id, t.dest, t.partition, t.file_name, t.directory, t.dest_index,
           t.size, t.link_target_path, t.link_target_id,
           m.id AS module_id, m.label, m.label_name, m.type AS module_type,
           m.source, m.install_enable, m.ordinal,
           c.id AS component_id, c.name AS component_name, c.subsystem, c.repo_id,
           r.name AS repo_name
      FROM install_targets t
      JOIN install_modules m ON m.id = t.module_id
      LEFT JOIN components c ON c.id = m.component_id AND c.scan_id = m.scan_id
      LEFT JOIN repos r ON r.id = c.repo_id
     WHERE t.scan_id = ? AND t.id = ?`, [scanId, targetId])[0] || null
}

export { unjson }

/* ------------------------------------------------------------ 编译参数 */
export function loadGnArgs(scanId) {
  return rows(`
    SELECT a.id, a.name, a.component_id, a.decl_file, a.decl_line,
           a.default_value, a.has_override, a.current_value,
           a.comment, a.value_type,
           c.name AS component, c.repo_id,
           r.name AS repo, r.remote_url, r.head_commit, r.revision, r.path AS repo_path
      FROM gn_args a
      LEFT JOIN components c ON c.id = a.component_id AND c.scan_id = a.scan_id
      LEFT JOIN repos r ON r.id = c.repo_id
     WHERE a.scan_id = ?
     ORDER BY a.name`, scanId)
}

/* ------------------------------------------------------------ 系统服务详情 */
export function loadServiceDetail(scanId, serviceId) {
  if (!scanId || !serviceId) return null
  const { rawQuery } = useDatabase()

  const svc = rawQuery(`
    SELECT s.id, s.name, s.cfg, s.type, s.executable, s.args, s.component_id,
           s.record, s.uid, s.gid, s.start_mode, s.ondemand, s.secon, s.sandbox,
           s.importance, s.install_module_id,
           c.name AS component_name, c.subsystem, c.repo_id,
           r.name AS repo_name,
           m.label AS install_label
      FROM services s
      LEFT JOIN components c ON c.id = s.component_id AND c.scan_id = s.scan_id
      LEFT JOIN repos r ON r.id = c.repo_id
      LEFT JOIN install_modules m ON m.id = s.install_module_id
     WHERE s.scan_id = ? AND s.id = ?`, [scanId, serviceId])[0]
  if (!svc) return null

  svc.sas = rawQuery(
    'SELECT id, sa_id, libpath, component_id FROM sas WHERE scan_id = ? AND service_id = ?',
    [scanId, serviceId])
  svc.hdis = rawQuery(
    'SELECT id, service_name, module_name, component_id FROM hdis WHERE scan_id = ? AND service_id = ?',
    [scanId, serviceId])
  return svc
}

/* ------------------------------------------------------------ SA 详情 */
export function loadSaDetail(scanId, saId) {
  if (!scanId || !saId) return null
  return useDatabase().rawQuery(`
    SELECT a.id, a.sa_id, a.libpath, a.profile, a.run_on_create, a.distributed,
           a.auto_restart, a.dump_level, a.record, a.component_id, a.install_module_id, a.service_id,
           s.name AS host, s.cfg AS host_cfg,
           c.name AS component_name, c.repo_id,
           r.name AS repo_name,
           m.label AS install_label
      FROM sas a
      LEFT JOIN services s ON s.id = a.service_id
      LEFT JOIN components c ON c.id = a.component_id AND c.scan_id = a.scan_id
      LEFT JOIN repos r ON r.id = c.repo_id
      LEFT JOIN install_modules m ON m.id = a.install_module_id
     WHERE a.scan_id = ? AND a.id = ?`, [scanId, saId])[0] || null
}

/* ------------------------------------------------------------ HDI 详情 */
export function loadHdiDetail(scanId, hdiId) {
  if (!scanId || !hdiId) return null
  return useDatabase().rawQuery(`
    SELECT h.id, h.service_name, h.module_name, h.library, h.node, h.hcb,
           h.policy, h.preload, h.priority, h.permission, h.device_match_attr,
           h.record, h.component_id, h.install_module_id, h.service_id,
           s.name AS host, s.cfg AS host_cfg,
           c.name AS component_name, c.repo_id,
           r.name AS repo_name,
           m.label AS install_label
      FROM hdis h
      LEFT JOIN services s ON s.id = h.service_id
      LEFT JOIN components c ON c.id = h.component_id AND c.scan_id = h.scan_id
      LEFT JOIN repos r ON r.id = c.repo_id
      LEFT JOIN install_modules m ON m.id = h.install_module_id
     WHERE h.scan_id = ? AND h.id = ?`, [scanId, hdiId])[0] || null
}

/* ------------------------------------------------------------ InnerAPI 详情 */
export function loadInnerApiDetail(scanId, innerapiId) {
  if (!scanId || !innerapiId) return null
  const { rawQuery } = useDatabase()

  const ia = rawQuery(`
    SELECT i.id, i.name, i.external_name, i.field, i.source_index,
           i.install_module_id, i.record, i.component_id,
           c.name AS component_name, c.repo_id,
           r.name AS repo_name, r.remote_url, r.head_commit, r.revision, r.path AS repo_path,
           m.label AS install_label
      FROM innerapis i
      LEFT JOIN components c ON c.id = i.component_id AND c.scan_id = i.scan_id
      LEFT JOIN repos r ON r.id = c.repo_id
      LEFT JOIN install_modules m ON m.id = i.install_module_id
     WHERE i.scan_id = ? AND i.id = ?`, [scanId, innerapiId])[0]
  if (!ia) return null

  /* ELF 模块：按 component_id 查全部，JS 端按 install_module_id 匹配
     （与列表页/部件详情页同一模式，避免 SQL NULL = NULL 不匹配的问题） */
  const elfMods = rawQuery(
    'SELECT id, dest, install_module_id FROM elf_modules WHERE scan_id = ? AND component_id = ?',
    [scanId, ia.component_id])
  const elfByModule = new Map()
  for (const e of elfMods) {
    if (e.install_module_id != null && !elfByModule.has(e.install_module_id)) elfByModule.set(e.install_module_id, e)
  }
  const elf = elfByModule.get(ia.install_module_id)
  ia.elf_module_id = elf?.id || null
  ia.elf_dest = elf?.dest || null

  return ia
}

/* ------------------------------------------------------------ InnerAPI 列表 */
export function loadInnerApis(scanId) {
  if (!scanId) {
    return []
  }
  const { rawQuery } = useDatabase()

  const innerapis = rawQuery(`
    SELECT i.id, i.name, i.external_name, i.field, i.source_index,
           i.component_id, i.install_module_id, i.record,
           c.name AS component, c.repo_id,
           r.name AS repo,
           m.label AS install_label
      FROM innerapis i
      LEFT JOIN components c ON c.id = i.component_id AND c.scan_id = i.scan_id
      LEFT JOIN repos r ON r.id = c.repo_id
      LEFT JOIN install_modules m ON m.id = i.install_module_id
     WHERE i.scan_id = ?
     ORDER BY i.name`, [scanId])

  /* ELF 模块：单独查询后按 install_module_id 匹配（避免相关子查询在 sql.js 上的性能问题） */
  const elfMods = rawQuery(
    `SELECT e.install_module_id, e.id AS elf_module_id, t.dest AS elf_dest
       FROM elf_modules e
       JOIN install_targets t ON t.scan_id = e.scan_id AND t.id = e.install_target_id
      WHERE e.scan_id = ? AND e.install_module_id IS NOT NULL`,
    [scanId])
  const elfByModule = new Map()
  for (const e of elfMods) {
    if (!elfByModule.has(e.install_module_id)) elfByModule.set(e.install_module_id, e)
  }
  innerapis.forEach(ia => {
    const elf = elfByModule.get(ia.install_module_id)
    ia.elf_module_id = elf?.elf_module_id || null
    ia.elf_dest = elf?.elf_dest || null
  })

  return innerapis
}

/* ------------------------------------------------------------ 特性 */
export function loadFeatures(scanId) {
  return rows(`
    SELECT f.id, f.value, f.source_index, f.component_id, f.gn_arg_id,
           g.name AS gn_arg_name, g.current_value AS gn_arg_value, g.value_type AS gn_arg_type,
           c.name AS component, c.repo_id,
           r.name AS repo
      FROM features f
      LEFT JOIN components c ON c.id = f.component_id AND c.scan_id = f.scan_id
      LEFT JOIN repos r ON r.id = c.repo_id
      LEFT JOIN gn_args g ON g.id = f.gn_arg_id
     WHERE f.scan_id = ?
     ORDER BY f.value`, scanId)
}

/* ------------------------------------------------------------ 特性详情 */
export function loadFeatureDetail(scanId, featureId) {
  if (!scanId || !featureId) return null
  return useDatabase().rawQuery(`
    SELECT f.id, f.value, f.source_index, f.component_id, f.gn_arg_id,
           g.name AS gn_arg_name, g.current_value AS gn_arg_value, g.value_type AS gn_arg_type,
           c.name AS component_name, c.repo_id,
           r.name AS repo_name
      FROM features f
      LEFT JOIN components c ON c.id = f.component_id AND c.scan_id = f.scan_id
      LEFT JOIN repos r ON r.id = c.repo_id
      LEFT JOIN gn_args g ON g.id = f.gn_arg_id
     WHERE f.scan_id = ? AND f.id = ?`, [scanId, featureId])[0] || null
}

/* ------------------------------------------------------------ SysCap */
export function loadSyscaps(scanId) {
  return rows(`
    SELECT s.id, s.value, s.source_index, s.component_id,
           c.name AS component, c.repo_id,
           r.name AS repo
      FROM syscaps s
      LEFT JOIN components c ON c.id = s.component_id AND c.scan_id = s.scan_id
      LEFT JOIN repos r ON r.id = c.repo_id
     WHERE s.scan_id = ?
     ORDER BY s.value`, scanId)
}

/* ------------------------------------------------------------ SysCap 详情 */
export function loadSyscapDetail(scanId, syscapId) {
  if (!scanId || !syscapId) return null
  return useDatabase().rawQuery(`
    SELECT s.id, s.value, s.source_index, s.component_id,
           c.name AS component_name, c.repo_id,
           r.name AS repo_name
      FROM syscaps s
      LEFT JOIN components c ON c.id = s.component_id AND c.scan_id = s.scan_id
      LEFT JOIN repos r ON r.id = c.repo_id
     WHERE s.scan_id = ? AND s.id = ?`, [scanId, syscapId])[0] || null
}

/* ------------------------------------------------------------ 编译参数详情 */
export function loadGnArgDetail(scanId, gnArgId) {
  if (!scanId || !gnArgId) return null
  return useDatabase().rawQuery(`
    SELECT a.id, a.name, a.default_value, a.has_override, a.current_value,
           a.comment, a.value_type, a.decl_file, a.decl_line, a.component_id,
           c.name AS component_name, c.repo_id,
           r.name AS repo_name, r.remote_url, r.head_commit, r.revision, r.path AS repo_path
      FROM gn_args a
      LEFT JOIN components c ON c.id = a.component_id AND c.scan_id = a.scan_id
      LEFT JOIN repos r ON r.id = c.repo_id
     WHERE a.scan_id = ? AND a.id = ?`, [scanId, gnArgId])[0] || null
}

/* ------------------------------------------------------------ 部件详情 */
/* 一次取完部件详情页 8 个 Tab 所需的全部数据。
    所有子查询都带 scan_id 前缀以走索引（lists.js 顶部注释的纪律）。 */
export function loadComponentDetail(scanId, componentId) {
  if (!scanId || !componentId) return null
  const { rawQuery } = useDatabase()

  const comp = rawQuery(`
    SELECT c.id, c.name, c.subsystem, c.manifest, c.repo_id, c.deps, c.record,
           r.name AS repo, r.path AS repo_path,
           r.remote_url, r.head_commit, r.revision
      FROM components c
      LEFT JOIN repos r ON r.id = c.repo_id
     WHERE c.scan_id = ? AND c.id = ?`, [scanId, componentId])[0]
  if (!comp) return null

  let record = {}
  try { record = JSON.parse(comp.record) } catch { /* record 可能不是合法 JSON */ }
  let deps = {}
  try { deps = JSON.parse(comp.deps || '{}') } catch { /* deps 可能不是合法 JSON */ }

  const innerapis = rawQuery(`
    SELECT i.id, i.name, i.external_name, i.field, i.source_index,
           i.install_module_id, i.record, m.label AS install_label
      FROM innerapis i
      LEFT JOIN install_modules m ON m.id = i.install_module_id
     WHERE i.scan_id = ? AND i.component_id = ?
     ORDER BY i.source_index`, [scanId, componentId])

  const features = rawQuery(`
    SELECT f.id, f.value, f.source_index, f.gn_arg_id,
           g.name AS gn_arg_name, g.current_value AS gn_arg_value
      FROM features f
      LEFT JOIN gn_args g ON g.id = f.gn_arg_id
     WHERE f.scan_id = ? AND f.component_id = ?
     ORDER BY f.source_index`, [scanId, componentId])

  const syscaps = rawQuery(`
    SELECT id, value, source_index
      FROM syscaps
     WHERE scan_id = ? AND component_id = ?
     ORDER BY source_index`, [scanId, componentId])

  const gnArgs = rawQuery(`
    SELECT id, name, default_value, has_override, current_value,
           comment, value_type, decl_file, decl_line
      FROM gn_args
     WHERE scan_id = ? AND component_id = ?
     ORDER BY name`, [scanId, componentId])

  const modules = rawQuery(`
    SELECT m.id, m.label, m.label_name, m.type, m.source, m.ordinal, m.install_enable,
           (SELECT COUNT(*) FROM install_targets t
             WHERE t.scan_id = m.scan_id AND t.module_id = m.id) AS target_count
      FROM install_modules m
     WHERE m.scan_id = ? AND m.component_id = ?
     ORDER BY m.ordinal`, [scanId, componentId])

  const targets = modules.length
    ? rawQuery(`
        SELECT t.id, t.dest, t.partition, t.file_name, t.directory,
               t.size, t.link_target_path, t.dest_index, t.module_id
          FROM install_targets t
          JOIN install_modules m ON m.id = t.module_id
         WHERE t.scan_id = ? AND m.component_id = ?
         ORDER BY m.ordinal, t.dest_index`, [scanId, componentId])
    : []

  const services = rawQuery(`
    SELECT id, name, cfg, path
      FROM services
     WHERE scan_id = ? AND component_id = ?
     ORDER BY name`, [scanId, componentId])

  const sas = rawQuery(`
    SELECT a.id, a.sa_id, a.libpath, a.profile, a.run_on_create,
           s.name AS host
      FROM sas a
      LEFT JOIN services s ON s.id = a.service_id
     WHERE a.scan_id = ? AND a.component_id = ?`, [scanId, componentId])

  const hdis = rawQuery(`
    SELECT h.id, h.service_name, h.module_name, h.library, h.node,
           s.name AS host
      FROM hdis h
      LEFT JOIN services s ON s.id = h.service_id
     WHERE h.scan_id = ? AND h.component_id = ?`, [scanId, componentId])

  /* 反向依赖：扫全部部件的 deps.components，看谁引用了这个部件名。
     和 loadComponents 一样的客户端算法（整图 5913 条边，一次算完）。 */
  const allComps = rawQuery('SELECT id, name, deps FROM components WHERE scan_id = ?', [scanId])
  const depMap = new Map(allComps.map(c => [c.name, c.id]))
  const dependents = allComps
    .filter(c => {
      try { return (JSON.parse(c.deps || '{}').components || []).includes(comp.name) } catch { return false }
    })
    .map(c => ({ name: c.name, id: c.id }))

  const forwardDeps = (deps.components || []).map(name => ({
    name, id: depMap.get(name) || null, resolved: depMap.has(name),
  }))
  const thirdParty = deps.third_party || []

  /* ELF 模块：按 install_module_id 匹配到 innerapis，供 InnerAPI Tab 加链接列 */
  const elfMods = rawQuery(`
    SELECT e.id, t.dest, e.install_module_id
      FROM elf_modules e
      JOIN install_targets t ON t.scan_id = e.scan_id AND t.id = e.install_target_id
     WHERE e.scan_id = ? AND e.component_id = ?`, [scanId, componentId])
  const elfByModule = new Map()
  for (const e of elfMods) {
    if (e.install_module_id != null && !elfByModule.has(e.install_module_id)) elfByModule.set(e.install_module_id, e)
  }
  innerapis.forEach(ia => {
    const elf = elfByModule.get(ia.install_module_id)
    ia.elf_module_id = elf?.id || null
    ia.elf_dest = elf?.dest || null
  })

  return {
    comp, record, deps,
    innerapis, features, syscaps, gnArgs,
    modules, targets, services, sas, hdis,
    dependents, forwardDeps, thirdParty,
  }
}

/* ------------------------------------------------------------ 代码仓详情 */
/* 取完代码仓详情页 8 个 Tab 所需的全部数据。
    与 loadComponentDetail 类似，但以 repo_id 为过滤条件，
    所有子表都 JOIN components 获取归属部件名。 */
export function loadRepoDetail(scanId, repoId) {
  if (!scanId || !repoId) return null
  const { rawQuery } = useDatabase()

  const repo = rawQuery(`SELECT * FROM repos WHERE scan_id = ? AND id = ?`, [scanId, repoId])[0]
  if (!repo) return null

  /* 部件列表（同 loadComponents 但过滤 repo_id） */
  const components = rawQuery(`
    SELECT c.id, c.name, c.subsystem, c.manifest, c.deps, c.repo_id,
           (SELECT COUNT(*) FROM innerapis a WHERE a.scan_id = c.scan_id AND a.component_id = c.id) AS apis,
           (SELECT COUNT(*) FROM syscaps y WHERE y.scan_id = c.scan_id AND y.component_id = c.id) AS syscaps,
           (SELECT COUNT(*) FROM features f WHERE f.scan_id = c.scan_id AND f.component_id = c.id) AS features,
           (SELECT COUNT(*) FROM install_modules m WHERE m.scan_id = c.scan_id AND m.component_id = c.id) AS modules,
           (SELECT COUNT(*) FROM services s WHERE s.scan_id = c.scan_id AND s.component_id = c.id) AS services,
           (SELECT COUNT(*) FROM sas x WHERE x.scan_id = c.scan_id AND x.component_id = c.id) AS sas,
           (SELECT COUNT(*) FROM hdis h WHERE h.scan_id = c.scan_id AND h.component_id = c.id) AS hdis
      FROM components c
     WHERE c.scan_id = ? AND c.repo_id = ?`, [scanId, repoId])

  /* 入度（被依赖）：同 loadComponents 客户端算法 */
  const allComps = rawQuery('SELECT id, name, deps FROM components WHERE scan_id = ?', [scanId])
  const names = new Set(components.map(c => c.name))
  const deg = new Map()
  for (const c of allComps) {
    let list = []
    try { list = JSON.parse(c.deps || '{}').components || [] } catch { }
    for (const dn of list) if (names.has(dn)) deg.set(dn, (deg.get(dn) || 0) + 1)
  }
  components.forEach(c => {
    let list = []
    try { list = JSON.parse(c.deps || '{}').components || [] } catch { }
    c.dependents = deg.get(c.name) || 0
    c.depends = list.length
  })

  const innerapis = rawQuery(`
    SELECT i.id, i.name, i.external_name, i.field, i.source_index,
           i.install_module_id, i.record, i.component_id, c.name AS component_name,
           m.label AS install_label
      FROM innerapis i
      JOIN components c ON c.id = i.component_id AND c.scan_id = i.scan_id
      LEFT JOIN install_modules m ON m.id = i.install_module_id
     WHERE i.scan_id = ? AND c.repo_id = ?
     ORDER BY c.name, i.source_index`, [scanId, repoId])

  const features = rawQuery(`
    SELECT f.id, f.value, f.source_index, f.gn_arg_id,
           f.component_id, g.name AS gn_arg_name, g.current_value AS gn_arg_value,
           c.name AS component_name
      FROM features f
      JOIN components c ON c.id = f.component_id AND c.scan_id = f.scan_id
      LEFT JOIN gn_args g ON g.id = f.gn_arg_id
     WHERE f.scan_id = ? AND c.repo_id = ?
     ORDER BY c.name, f.source_index`, [scanId, repoId])

  const syscaps = rawQuery(`
    SELECT s.id, s.value, s.source_index, s.component_id, c.name AS component_name
      FROM syscaps s
      JOIN components c ON c.id = s.component_id AND c.scan_id = s.scan_id
     WHERE s.scan_id = ? AND c.repo_id = ?
     ORDER BY c.name, s.source_index`, [scanId, repoId])

  const gnArgs = rawQuery(`
    SELECT a.id, a.name, a.default_value, a.has_override, a.current_value,
           a.comment, a.value_type, a.decl_file, a.decl_line,
           a.component_id, c.name AS component_name
      FROM gn_args a
      JOIN components c ON c.id = a.component_id AND c.scan_id = a.scan_id
     WHERE a.scan_id = ? AND c.repo_id = ?
     ORDER BY a.name`, [scanId, repoId])

  const modules = rawQuery(`
    SELECT m.id, m.label, m.type, m.source, m.ordinal,
           m.component_id, c.name AS component_name,
           (SELECT COUNT(*) FROM install_targets t WHERE t.scan_id = m.scan_id AND t.module_id = m.id) AS target_count
      FROM install_modules m
      JOIN components c ON c.id = m.component_id AND c.scan_id = m.scan_id
     WHERE m.scan_id = ? AND c.repo_id = ?
     ORDER BY c.name, m.ordinal`, [scanId, repoId])

  const targets = modules.length
    ? rawQuery(`
        SELECT t.id, t.dest, t.partition, t.file_name, t.directory,
               t.size, t.link_target_path, t.dest_index, t.module_id,
               c.name AS component_name
          FROM install_targets t
          JOIN install_modules m ON m.id = t.module_id
          JOIN components c ON c.id = m.component_id
         WHERE t.scan_id = ? AND c.repo_id = ?
         ORDER BY c.name, m.ordinal, t.dest_index`, [scanId, repoId])
    : []

  const services = rawQuery(`
    SELECT s.id, s.name, s.cfg, s.path, s.component_id, c.name AS component_name
      FROM services s
      JOIN components c ON c.id = s.component_id AND c.scan_id = s.scan_id
     WHERE s.scan_id = ? AND c.repo_id = ?
     ORDER BY c.name, s.name`, [scanId, repoId])

  const sas = rawQuery(`
    SELECT a.id, a.sa_id, a.libpath, a.profile, a.run_on_create,
           a.component_id, s.name AS host, c.name AS component_name
      FROM sas a
      JOIN components c ON c.id = a.component_id AND c.scan_id = a.scan_id
      LEFT JOIN services s ON s.id = a.service_id
     WHERE a.scan_id = ? AND c.repo_id = ?`, [scanId, repoId])

  const hdis = rawQuery(`
    SELECT h.id, h.service_name, h.module_name, h.library, h.node,
           h.component_id, s.name AS host, c.name AS component_name
      FROM hdis h
      JOIN components c ON c.id = h.component_id AND c.scan_id = h.scan_id
      LEFT JOIN services s ON s.id = h.service_id
     WHERE h.scan_id = ? AND c.repo_id = ?`, [scanId, repoId])

  /* ELF 模块：按 install_module_id 匹配到 innerapis */
  const elfMods = rawQuery(`
    SELECT e.id, t.dest, e.install_module_id
      FROM elf_modules e
      JOIN install_targets t ON t.scan_id = e.scan_id AND t.id = e.install_target_id
      JOIN components c ON c.id = e.component_id AND c.scan_id = e.scan_id
     WHERE e.scan_id = ? AND c.repo_id = ?`, [scanId, repoId])
  const elfByModule = new Map()
  for (const e of elfMods) {
    if (e.install_module_id != null && !elfByModule.has(e.install_module_id)) elfByModule.set(e.install_module_id, e)
  }
  innerapis.forEach(ia => {
    const elf = elfByModule.get(ia.install_module_id)
    ia.elf_module_id = elf?.id || null
    ia.elf_dest = elf?.dest || null
  })

  return {
    repo, components,
    innerapis, features, syscaps, gnArgs,
    modules, targets, services, sas, hdis,
  }
}

/* ------------------------------------------------------------ 4.1 SDK 模块 */
/* 子查询里的 `s.scan_id = m.scan_id` 不能省。实测（sqlite3，1319 行）：
   带上 7.7 ms，去掉 456.5 ms——59 倍。与本文件开头记录的部件列表 264→9.2 ms
   是同一个坑：索引以 scan_id 打头，少了它 planner 只能扫整个索引。 */
export function loadArktsModules(scanId) {
  return rows(`
    SELECT m.id, m.module_key, m.module_name, m.declaration_scope,
           m.implementation_kind, m.language_coverage,
           (SELECT COUNT(*) FROM arkts_sources s
             WHERE s.scan_id = m.scan_id AND s.module_id = m.id) AS files,
           (SELECT COUNT(DISTINCT r.kit_id) FROM arkts_kit_relations r
             WHERE r.scan_id = m.scan_id AND r.module_id = m.id
               AND r.relation_type = 'declared_membership') AS kits,
           m.impl_so_path, m.impl_napi_name, m.impl_match, m.impl_elf_id,
           t.dest AS installed_at, c.name AS component, c.id AS component_id
      FROM arkts_modules m
      LEFT JOIN elf_modules e ON e.id = m.impl_elf_id
      LEFT JOIN install_targets t ON t.id = e.install_target_id
      LEFT JOIN components c ON c.id = e.component_id
     WHERE m.scan_id = ?
     ORDER BY m.module_key`, scanId)
}

/* Kit：entry_backed 的来源是入口文件，label_only 根本没有入口文件——
   它只出现在模块的 @kit 标签里。两者的"来源"不是一回事，所以分两列算，
   有入口的 mentioned_in 留空，而不是把两个数字合并。 */
export function loadArktsKits(scanId) {
  return rows(`
    SELECT k.id, k.kit_key, k.name, k.import_name, k.origin,
           (SELECT COUNT(*) FROM arkts_sources s
             WHERE s.scan_id = k.scan_id AND s.kit_id = k.id) AS entries,
           (SELECT COUNT(DISTINCT r.module_id) FROM arkts_kit_relations r
             WHERE r.scan_id = k.scan_id AND r.kit_id = k.id
               AND r.resolution_status = 'resolved') AS modules,
           (SELECT COUNT(*) FROM arkts_kit_relations r
             WHERE r.scan_id = k.scan_id AND r.kit_id = k.id
               AND r.resolution_status != 'resolved') AS unresolved,
           CASE WHEN EXISTS (SELECT 1 FROM arkts_sources s
                              WHERE s.scan_id = k.scan_id AND s.kit_id = k.id)
                THEN NULL
                ELSE (SELECT COUNT(DISTINCT r.source_id) FROM arkts_kit_relations r
                       WHERE r.scan_id = k.scan_id AND r.kit_id = k.id) END AS mentioned_in
      FROM arkts_kits k
     WHERE k.scan_id = ?
     ORDER BY k.kit_key`, scanId)
}

/* 声明文件列表。表里只有 sdk-js 的声明文件：采集过程用到的参考数据
   （napi-map.json）不入库，它的摘要记在 collector_runs.scope.napi_map。
   源码 URL 按仓的 remote_url 与宿主规则在这里拼好，行上不存 repo_id。 */
export function loadArktsSources(scanId) {
  return rows(`
    SELECT s.id, s.source_path, s.role, s.declaration_format,
           s.language_variant, s.file_condition, s.condition_evidence,
           s.read_status, s.header_status, s.coverage, s.header_span,
           s.byte_size, s.module_id, s.kit_id,
           m.module_key, k.kit_key
      FROM arkts_sources s
      LEFT JOIN arkts_modules m ON m.scan_id = s.scan_id AND m.id = s.module_id
      LEFT JOIN arkts_kits k ON k.scan_id = s.scan_id AND k.id = s.kit_id
     WHERE s.scan_id = ?
     ORDER BY s.source_path`, scanId)
    /* JSON 列解开成可读文本：表格里 {"a":"b"} 这种原样显示没人看得懂 */
    .map(r => ({ ...r,
      source_url: fileSource(scanId, r.source_path)?.url || null,
      coverage: capText(r.coverage),
      condition_evidence: conditionText(r.condition_evidence),
      header_span: spanText(r.header_span) }))
}

/* 能力状态 {"file.header":"complete",...} → "文件头 ok · 引用 未请求 …" */
const CAP_LABEL = { 'file.header': '文件头', 'kit.references': '引用',
                    'condition.top_level': '条件', 'source.utf8_spans': '位置' }
const CAP_STATE = { complete: '完整', partial: '部分', failed: '失败',
                    unsupported: '不支持', not_requested: '未请求' }
export function capText(json) {
  const v = unjson(json)
  if (!v || typeof v !== 'object') return ''
  return Object.entries(v).map(([k, st]) => `${CAP_LABEL[k] || k} ${CAP_STATE[st] || st}`).join(' · ')
}
/* 条件证据 → "静态后缀 · use static @12" */
export function conditionText(json) {
  const v = Array.isArray(json) ? json : unjson(json)
  if (!Array.isArray(v) || !v.length) return ''
  return v.map(e => (e.kind === 'static_suffix' ? '静态后缀'
                   : e.kind === 'use_static' ? `use static @${e.span?.[0] ?? '?'}`
                   : `${e.kind}${e.span ? ' @' + e.span[0] : ''}`)).join(' · ')
}
export function spanText(json) {
  const v = Array.isArray(json) ? json : unjson(json)
  return Array.isArray(v) ? `0–${v[1]}` : ''
}

/* 声明文件详情：一次取齐本体 + 它声明的实体 + 它承载的关系证据。
   证据按关系类型分组展示，不混成一张表——归属声明与入口引用含义不同。 */
export function loadArktsSourceDetail(scanId, id) {
  if (!scanId || !id) return null
  const { rawQuery } = useDatabase()
  const self = rawQuery(`
    SELECT s.*, m.module_key, m.module_name, m.implementation_kind, m.language_coverage,
           k.kit_key, k.name AS kit_name, k.origin AS kit_origin
      FROM arkts_sources s
      LEFT JOIN arkts_modules m ON m.scan_id = s.scan_id AND m.id = s.module_id
      LEFT JOIN arkts_kits k ON k.scan_id = s.scan_id AND k.id = s.kit_id
     WHERE s.scan_id = ? AND s.id = ?`, [scanId, id])[0]
  if (!self) return null
  /* JSON 列解成对象，详情页才能逐项渲染（列表走的是 capText 之类的文本化） */
  for (const key of ['coverage', 'condition_evidence', 'header_span']) self[key] = unjson(self[key])
  const evidence = rawQuery(`
    SELECT e.id, e.relation_type, e.statement_kind, e.evidence_state, e.line, e.column,
           e.start_byte, e.end_byte, e.target_text, e.target_kind, e.resolution_status,
           e.resolution_method, e.condition_state, e.record,
           k.kit_key, e.kit_id, m.module_key AS target_module, e.module_id
      FROM arkts_kit_relations e
      LEFT JOIN arkts_kits k ON k.scan_id = e.scan_id AND k.id = e.kit_id
      LEFT JOIN arkts_modules m ON m.scan_id = e.scan_id AND m.id = e.module_id
     WHERE e.scan_id = ? AND e.source_id = ?
     ORDER BY e.start_byte`, [scanId, id])
  /* 同一个模块的另一份语言版本声明——双声明是这个域的核心事实，
     从文件页能一眼跳过去 */
  const siblings = self.module_id ? rawQuery(`
    SELECT id, source_path, language_variant, declaration_format, read_status
      FROM arkts_sources
     WHERE scan_id = ? AND module_id = ? AND id != ?
     ORDER BY source_path`, [scanId, self.module_id, id]) : []
  return { ...self, evidence, siblings }
}

/* 模块详情：本体 + 实现链 + 声明文件 + 两类 Kit 关系。

   两类关系必须分开取、分开展示，不能合成一张"所属 Kit"表：
   `declared_membership` 是**模块自己**在文件头写的 `@kit` 标签，
   `entry_reference` 是**某个 Kit 入口**把它 import 进去。两者会不一致——
   模块可以声称属于 ArkUI 却不被 @kit.ArkUI.d.ts 引用，反之亦然。
   合并显示就把"谁说的"这个关键信息抹掉了。 */
export function loadArktsModuleDetail(scanId, id) {
  if (!scanId || !id) return null
  const { rawQuery } = useDatabase()
  const self = rawQuery(`
    SELECT m.*, t.dest AS installed_at, t.size AS so_size, t.partition,
           e.id AS elf_id, e.component_id, c.name AS component, c.subsystem
      FROM arkts_modules m
      LEFT JOIN elf_modules e ON e.id = m.impl_elf_id
      LEFT JOIN install_targets t ON t.id = e.install_target_id
      LEFT JOIN components c ON c.id = e.component_id
     WHERE m.scan_id = ? AND m.id = ?`, [scanId, id])[0]
  if (!self) return null
  const sources = rawQuery(`
    SELECT id, source_path, language_variant, declaration_format, role,
           read_status, header_status, byte_size, file_condition
      FROM arkts_sources
     WHERE scan_id = ? AND module_id = ?
     ORDER BY language_variant, source_path`, [scanId, id])
    .map(r => ({ ...r, source_url: fileSource(scanId, r.source_path)?.url || null }))
  /* 模块自己声明的归属：证据在**这个模块的**文件头里 */
  const declares = rawQuery(`
    SELECT r.id, r.kit_id, r.line, r.column, r.record, r.evidence_state,
           r.condition_state, k.kit_key, k.name AS kit_name, k.origin,
           r.source_id, s.source_path
      FROM arkts_kit_relations r
      JOIN arkts_kits k ON k.scan_id = r.scan_id AND k.id = r.kit_id
      LEFT JOIN arkts_sources s ON s.scan_id = r.scan_id AND s.id = r.source_id
     WHERE r.scan_id = ? AND r.module_id = ? AND r.relation_type = 'declared_membership'
     ORDER BY k.kit_key`, [scanId, id])
  /* 被 Kit 入口引用：证据在**入口文件**里，不在这个模块的文件里 */
  const referencedBy = rawQuery(`
    SELECT r.id, r.kit_id, r.line, r.column, r.record, r.statement_kind,
           r.condition_state, r.resolution_method, k.kit_key, k.name AS kit_name,
           r.source_id, s.source_path
      FROM arkts_kit_relations r
      JOIN arkts_kits k ON k.scan_id = r.scan_id AND k.id = r.kit_id
      LEFT JOIN arkts_sources s ON s.scan_id = r.scan_id AND s.id = r.source_id
     WHERE r.scan_id = ? AND r.module_id = ? AND r.relation_type = 'entry_reference'
     ORDER BY k.kit_key, r.start_byte`, [scanId, id])
  return { ...self, sources, declares, referencedBy }
}

/* Kit 详情：本体 + 入口文件 + 两条成员路径 + 逐条引用证据。

   `entries` 为空不是缺陷：label_only 的 Kit 根本没有入口文件，它只是某个模块
   头上写了个对不上入口的标签。那种情况下唯一能给的答案是"在哪里被提到过"，
   所以另取 mentionedIn。 */
export function loadArktsKitDetail(scanId, id) {
  if (!scanId || !id) return null
  const { rawQuery } = useDatabase()
  const self = rawQuery('SELECT * FROM arkts_kits WHERE scan_id = ? AND id = ?',
                        [scanId, id])[0]
  if (!self) return null
  const entries = rawQuery(`
    SELECT id, source_path, language_variant, declaration_format,
           read_status, header_status, byte_size
      FROM arkts_sources
     WHERE scan_id = ? AND kit_id = ?
     ORDER BY source_path`, [scanId, id])
    .map(r => ({ ...r, source_url: fileSource(scanId, r.source_path)?.url || null }))
  /* 两条成员路径各取一份，前端再比对差集——差集本身就是结论 */
  const member = (type) => rawQuery(`
    SELECT DISTINCT m.id, m.module_key, m.module_name, m.implementation_kind,
           m.language_coverage, m.impl_elf_id
      FROM arkts_kit_relations r
      JOIN arkts_modules m ON m.scan_id = r.scan_id AND m.id = r.module_id
     WHERE r.scan_id = ? AND r.kit_id = ? AND r.relation_type = ?
     ORDER BY m.module_key`, [scanId, id, type])
  const declared = member('declared_membership')
  const imported = member('entry_reference')
  const references = rawQuery(`
    SELECT r.id, r.statement_kind, r.line, r.column, r.target_text, r.record,
           r.condition_state, r.resolution_status, r.resolution_method,
           r.module_id, m.module_key, r.source_id, s.source_path
      FROM arkts_kit_relations r
      LEFT JOIN arkts_modules m ON m.scan_id = r.scan_id AND m.id = r.module_id
      LEFT JOIN arkts_sources s ON s.scan_id = r.scan_id AND s.id = r.source_id
     WHERE r.scan_id = ? AND r.kit_id = ? AND r.relation_type = 'entry_reference'
     ORDER BY r.start_byte`, [scanId, id])
  /* 只有没有入口文件时才问"在哪被提到" */
  const mentionedIn = entries.length ? [] : rawQuery(`
    SELECT DISTINCT s.id, s.source_path, m.id AS module_id, m.module_key
      FROM arkts_kit_relations r
      JOIN arkts_sources s ON s.scan_id = r.scan_id AND s.id = r.source_id
      LEFT JOIN arkts_modules m ON m.scan_id = r.scan_id AND m.id = r.module_id
     WHERE r.scan_id = ? AND r.kit_id = ?
     ORDER BY s.source_path`, [scanId, id])
  return { ...self, entries, declared, imported, references, mentionedIn }
}
