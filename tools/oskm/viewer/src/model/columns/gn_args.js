/* 编译参数（gn_args，~2958 行）。 */
import { formatGnValue } from '../fields.js'

export const GROUPS = ['参数', '声明']

export const COLUMNS = [
  { key: 'name', label: '参数名', group: '参数', type: 'text', min: 260,
    fixed: true, show: true, primary: true,
    meaning: 'GN declare_args() 中声明的构建参数名。',
    reading: '由 gn args --list --json 输出，全局唯一。' },
  { key: 'current_value', label: '当前值', group: '参数', type: 'text', width: 160, show: true,
    value: r => formatGnValue(r.current_value, r.value_type),
    meaning: '该参数在当前产品构建中生效的值。',
    reading: '如果有产品覆盖（args.gn 中显式设置），取覆盖值；否则取 .gni 中 declare_args() 的默认值。' },
  { key: 'value_type', label: '类型', group: '参数', type: 'text', width: 80, show: true,
    meaning: '值的类型：bool / str / int / list。',
    reading: '从 GN 字面量解析得出。' },
  { key: 'has_override', label: '覆盖', group: '参数', type: 'bool', width: 70,
    align: 'center', show: true,
    meaning: '该参数是否被产品配置覆盖。',
    reading: '为 ✓ 表示 args.gn 中显式设置了该参数的值。' },

  { key: 'default_value', label: '默认值', group: '声明', type: 'text', width: 160, show: true,
    value: r => formatGnValue(r.default_value, r.value_type),
    meaning: 'declare_args() 中声明的默认值。',
    reading: '未被产品覆盖时，此值即为生效值。' },
  { key: 'component', label: '归属部件', group: '声明', type: 'text', min: 180, show: true,
    link: r => (r.component_id ? { path: `/e/components/${r.component_id}` } : null),
    meaning: '该参数声明在哪个部件的源码目录内。',
    reading: '按 decl_file 路径与 components.manifest 目录做最长前缀匹配。未匹配的为空。' },
  { key: 'repo', label: '代码仓', group: '声明', type: 'text', min: 160, show: true,
    link: r => (r.repo_id ? { path: `/e/repos/${r.repo_id}` } : null),
    meaning: '归属部件所在的代码仓。' },
  { key: 'decl_file', label: '声明文件', group: '声明', type: 'path', min: 280,
    meaning: '声明该参数的 .gni 或 BUILD.gn 文件。',
    reading: '去掉 // 前缀的 workspace 相对路径。' },
  { key: 'decl_line', label: '行号', group: '声明', type: 'num', width: 80,
    align: 'right',
    meaning: '在声明文件中的行号。' },
  { key: 'comment', label: '注释', group: '声明', type: 'text', min: 200,
    meaning: '声明前方的注释文本。' },
]
