/* 特性（features，~1351 行）。 */
import { formatGnValue } from '../fields.js'

export const GROUPS = ['声明', '归属']

export const COLUMNS = [
  { key: 'value', label: '特性名', group: '声明', type: 'text', min: 300,
    fixed: true, show: true, primary: true, full: 64,
    meaning: 'bundle.json 中 component.features 数组的一项。',
    reading: '特性名通常与 gn_args.name 相同，对应一个 GN declare_args() 编译参数。' },
  { key: 'source_index', label: '序号', group: '声明', type: 'num', width: 80, align: 'right',
    meaning: '在部件 features 数组中的下标。' },

  { key: 'component', label: '归属部件', group: '归属', type: 'text', min: 200, show: true,
    link: r => (r.component_id ? { path: `/e/components/${r.component_id}` } : null),
    meaning: '声明这个特性的部件。' },
  { key: 'repo', label: '代码仓', group: '归属', type: 'text', min: 180, show: true,
    link: r => (r.repo_id ? { path: `/e/repos/${r.repo_id}` } : null),
    meaning: '归属部件所在的代码仓。' },
  { key: 'gn_arg_name', label: '关联参数', group: '归属', type: 'text', min: 200, show: true,
    link: r => (r.gn_arg_id ? { path: `/e/gn_args/${r.gn_arg_id}` } : null),
    meaning: 'component_links 按 features.value ↔ gn_args.name 匹配的结果。',
    reading: '为空表示没有找到同名的编译参数。' },
  { key: 'gn_arg_value', label: '参数值', group: '归属', type: 'text', width: 160, show: true,
    value: r => formatGnValue(r.gn_arg_value, r.gn_arg_type),
    meaning: '关联的编译参数在当前产品构建中生效的值。' },
]
