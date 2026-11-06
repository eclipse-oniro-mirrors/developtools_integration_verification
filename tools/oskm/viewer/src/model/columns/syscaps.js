/* SysCap（syscaps，~306 行）。 */
export const GROUPS = ['声明', '归属']

export const COLUMNS = [
  { key: 'value', label: '能力名', group: '声明', type: 'text', min: 320,
    fixed: true, show: true, primary: true, full: 64,
    meaning: 'bundle.json 中 component.syscap / system_capabilities 数组的一项。',
    reading: '格式为 SystemCapability.X.Y.Z，声明这个部件提供了什么 SysCap。' },
  { key: 'source_index', label: '序号', group: '声明', type: 'num', width: 80, align: 'right',
    meaning: '在部件 syscap 数组中的下标。' },

  { key: 'component', label: '归属部件', group: '归属', type: 'text', min: 200, show: true,
    link: r => (r.component_id ? { path: `/e/components/${r.component_id}` } : null),
    meaning: '声明这个 SysCap 的部件。' },
  { key: 'repo', label: '代码仓', group: '归属', type: 'text', min: 180, show: true,
    link: r => (r.repo_id ? { path: `/e/repos/${r.repo_id}` } : null),
    meaning: '归属部件所在的代码仓。' },
]
