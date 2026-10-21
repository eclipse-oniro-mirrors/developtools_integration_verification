/* 显示清单：新增一个域只改这里，约 8 行。
   没有条目的表也能工作——档案页用通用模板（标题取主键、关联靠外键），
   只是没有图标、不进任何视角。见 docs/ux-design.md §11。

   parent：面包屑沿哪条外键往上走。只在出边有多条、取第一条不对时才需要声明
   （sas/hdis/services 的第一条出边是 install_module_id，但归属该看部件）。
   其余表的主链 install_targets → install_modules → components → repos 天然正确。 */
export const ENTITIES = {
  repos: {
    label: '仓', icon: 'box', accent: 'repo', lenses: ['build'],
    title: r => r.name, subtitle: r => r.path,
  },
  components: {
    label: '部件', icon: 'build', accent: 'component', lenses: ['build'],
    title: r => r.name, subtitle: r => r.manifest,
  },
  innerapis: {
    label: 'InnerAPI', icon: 'node', accent: 'component', lenses: ['build'],
    title: r => r.external_name || r.name, subtitle: r => r.name,
  },
  syscaps:  { label: 'syscap',  icon: 'node', accent: 'component', title: r => r.value },
  features: { label: 'feature', icon: 'node', accent: 'component', title: r => r.value },
  install_modules: {
    label: '安装模块', icon: 'box', accent: 'module', lenses: ['image'],
    title: r => r.label || `#${r.ordinal}`, subtitle: r => r.source,
  },
  install_targets: {
    label: '安装产物', icon: 'image', accent: 'module', lenses: ['image'],
    title: r => r.dest, subtitle: r => r.partition,
    /* schema 后来加了 link_target_id，外键顺序不再保证 module_id 在前；
       面包屑必须固定沿安装模块这条主链走。 */
    parent: 'module_id',
  },
  install_module_tags: { label: 'innerapi 标记', icon: 'node', accent: 'module', title: r => r.value },
  elf_modules: {
    label: 'ELF 模块', icon: 'chip', accent: 'module', lenses: ['image'],
    title: r => r.dest, subtitle: r => r.soname || r.file_name,
    parent: 'component_id',
  },
  elf_module_dependencies: {
    label: '依赖边', icon: 'node', accent: 'module',
    title: r => `${r.needed_name} → ${r.callee_dest || '(未命中)'}`,
    viaLabel: { caller_id: '我依赖的', callee_id: '依赖我的' },
  },
  services: {
    label: '服务', icon: 'runtime', accent: 'service', lenses: ['runtime'],
    title: r => r.name || r.cfg, subtitle: r => r.cfg,
    runtimeId: r => r.id, parent: 'component_id',
  },
  sas: {
    label: 'SA', icon: 'runtime', accent: 'sa', lenses: ['runtime'],
    title: r => `SA ${r.sa_id ?? '—'}`, subtitle: r => r.libpath,
    runtimeId: r => r.service_id, parent: 'component_id',
  },
  hdis: {
    label: 'HDI 设备', icon: 'chip', accent: 'hdi', lenses: ['runtime'],
    title: r => r.service_name || r.node, subtitle: r => r.library,
    runtimeId: r => r.service_id, parent: 'component_id',
  },
}

const FALLBACK = { label: '记录', icon: 'node', accent: 'repo', title: r => r.id, subtitle: () => '' }
export const entityOf = table => ENTITIES[table] || FALLBACK
export const isKnown = table => table in ENTITIES

/** 这些列是数据库内务，档案页的属性表不显示 */
export const INTERNAL = new Set(['id', 'scan_id', 'record'])
