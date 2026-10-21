/* InnerAPI（innerapis，~1743 行）。 */
export const GROUPS = ['声明', '归属']

export const COLUMNS = [
  { key: 'external_name', label: '引用名', group: '声明', type: 'text', min: 220,
    fixed: true, show: true, primary: true, full: 64,
    meaning: 'external_deps 中使用的引用名（component:target 格式）。',
    reading: '不是所有 innerapi 都有 external_name；没有的只在源码内部使用。' },
  { key: 'name', label: 'GN label', group: '声明', type: 'text', min: 300,
    show: true, full: 64,
    meaning: 'inner_kits / inner_api 中声明的 GN target label。',
    reading: '其他部件通过 external_deps 引用这个 label 来使用接口。' },
  { key: 'field', label: '类型', group: '声明', type: 'text', width: 120, show: true,
    meaning: '声明来源：inner_kits 还是 inner_api。',
    reading: 'inner_kits 是传统接口声明，inner_api 是新的统一接口声明方式。' },
  { key: 'source_index', label: '序号', group: '声明', type: 'num', width: 80, align: 'right',
    meaning: '在部件 bundle.json 的 inner_kits/inner_api 数组中的下标。',
    reading: '定位用。' },

  { key: 'component', label: '归属部件', group: '归属', type: 'text', min: 200, show: true,
    link: r => (r.component_id ? { path: `/e/components/${r.component_id}` } : null),
    meaning: '这个接口属于哪个部件。',
    reading: '按 component_id 外键关联。' },
  { key: 'repo', label: '代码仓', group: '归属', type: 'text', min: 180, show: true,
    link: r => (r.repo_id ? { path: `/e/repos/${r.repo_id}` } : null),
    meaning: '归属部件所在的代码仓。',
    reading: '按 component.repo_id 关联。' },
  { key: 'elf_module', label: 'ELF 模块', group: '归属', type: 'text', width: 160, show: true,
    link: r => (r.elf_module_id ? { entity: 'elf_modules', id: r.elf_module_id } : null),
    value: r => r.elf_dest ? String(r.elf_dest).split('/').pop() : null,
    meaning: '安装模块对应的 ELF 文件（.so）。',
    reading: '从 elf_modules 按 install_module_id 匹配。' },
]
