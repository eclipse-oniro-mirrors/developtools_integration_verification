/* 导航结构（ux-design §2）：产品面四视角 + 两个次级入口。
   视角是心智模型，不是数据库表——表都在调测面。 */
import { metadata } from './metadata.js'
import { entityOf } from './entities.js'
import { useDatabase } from '../composables/useDatabase.js'

/* 两级：一级是概念分组，二级是具体视图。
   一级点击 → 直达该组第一个子项（一次点击到位，不是先展开再选）；
   子项由常驻子导航条展示，不做下拉——下拉的指针进出是刚修过 bug 的那类交互，
   加三个下拉就是三份同样的风险面。见 docs/nav-two-level-proposal.md §3 */
export const PRODUCT_NAV = [
  { route: '/', label: '首页', icon: 'home', needsDb: false },
  {
    key: 'parts', label: '部件信息', icon: 'build', needsDb: true,
    children: [
      { route: '/parts/repos',      label: '代码仓', table: 'repos' },
      { route: '/parts/components', label: '部件',   table: 'components' },
      { route: '/parts/innerapis',  label: 'InnerAPI', table: 'innerapis' },
      { route: '/parts/features',    label: '特性',  table: 'features' },
      { route: '/parts/syscaps',     label: 'SysCap', table: 'syscaps' },
      { route: '/parts/args',       label: '编译参数', table: 'gn_args' },
    ],
  },
  {
    key: 'files', label: '系统文件', icon: 'image', needsDb: true,
    children: [
      { route: '/files/targets', label: '安装产物', table: 'install_targets' },
      { route: '/files/elf',     label: 'ELF 模块', table: 'elf_modules' },
      { route: '/files/image',   label: '镜像视图' },
    ],
  },
  {
    key: 'runtime', label: '运行时进程', icon: 'runtime', needsDb: true,
    children: [
      { route: '/runtime/services', label: '系统服务', table: 'services' },
      { route: '/runtime/sa',       label: 'SA 服务',  table: 'sas' },
      { route: '/runtime/hdi',      label: 'HDI 服务', table: 'hdis' },
    ],
  },
]

/** 当前路径属于哪个一级组 */
export function groupOf(path) {
  /* 实体详情页 /e/<table>/<id> → 按 table 名匹配子菜单的 table 属性 */
  const entityMatch = path.match(/^\/e\/(\w+)\//)
  if (entityMatch) {
    const table = entityMatch[1]
    return PRODUCT_NAV.find(i => i.children?.some(c => c.table === table)) || null
  }
  return PRODUCT_NAV.find(i => i.children?.some(c => path.startsWith(c.route))
                               || (i.key && path.startsWith(`/${i.key}`))) || null
}
/** 一级入口点下去该去哪：该组第一个子项 */
export const entryOf = item => (item.children ? item.children[0].route : item.route)

/* 视图名，给"← 返回xxx"用 */
const VIEW_NAMES = [
  ['/parts/repos', '代码仓'], ['/parts/components', '部件'],
  ['/parts/innerapis', 'InnerAPI'], ['/parts/features', '特性'], ['/parts/syscaps', 'SysCap'],
  ['/parts/args', '编译参数'],
  ['/files/targets', '安装产物'], ['/files/elf', 'ELF 模块'],
  ['/files/image', '镜像视图'],
  ['/runtime/services', '系统服务'], ['/runtime/sa', 'SA 服务'], ['/runtime/hdi', 'HDI 服务'],
  ['/runtime/unit', '运行单元'],
  ['/lookup', '反查结果'], ['/findings', '质量与治理'],
  ['/e/components', '部件'], ['/e/repos', '代码仓'], ['/e/innerapis', 'InnerAPI'],
  ['/e/features', '特性'], ['/e/syscaps', 'SysCap'], ['/e/gn_args', '编译参数'],
  ['/e/install_targets', '安装产物'],
  ['/e/services', '系统服务'], ['/e/sas', 'SA 服务'], ['/e/hdis', 'HDI 设备'],
  ['/e/', '档案'], ['/', '首页'],
]
export function viewName(path) {
  return (VIEW_NAMES.find(([p]) => path === p || path.startsWith(p)) || [, ''])[1]
}

/* ---------------------------------------------------------------- 打开详情 */

/** 打开一个实体的详情。**一律浮抽屉**，叶子枢纽一视同仁。

    原先按外键入边数分流（叶子抽屉 / 枢纽整页）。实际用下来，分流带来的
    不确定性比它省下的麻烦更大：同一个列表里点不同的列会得到不同的形态，
    "什么时候浮什么时候跳"变成要背的东西；而换页丢掉筛选、排序、页码、
    滚动位置的代价，对枢纽和叶子是一样的。

    `/e/<table>/<id>` 整页保留，作为深链接目标与抽屉右上角「在新页面打开 ↗」
    的去处——需要整页时有出口，但不是默认。 */
export function openEntity(router, route, table, id) {
  /* 用 push 不用 replace —— 抽屉理应能被后退键关掉 */
  router.push({ path: route.path, query: { ...route.query, detail: `${table}/${id}` } })
}

/** 列表行点击。与 openEntity 现在是同一件事，保留名字是因为调用点语义不同。 */
export const openDetail = openEntity

/** 关抽屉 = 回到没有 detail 的那条 URL */
export function closeDetail(router, route) {
  const query = { ...route.query }
  delete query.detail
  router.replace({ path: route.path, query })
}

/* ---------------------------------------------------------------- 返回与面包屑 */

/* 真返回。来路确实是目标视图时走 history.back——筛选、展开、滚动位置
   全都还在；否则才 push 一个干净地址。
   直接 push 会往历史里再压一格，后退键越按越深（RuntimeUnit 原先就是这个 bug）。 */
export function goBackTo(router, prefix) {
  const back = window.history.state?.back
  if (typeof back === 'string' && back.split('?')[0] === prefix) router.back()
  else router.push(prefix)
}

/** 来路（没有则 null），给"← 返回xxx"按钮用 */
export function cameFrom() {
  const back = window.history.state?.back
  if (typeof back !== 'string') return null
  const path = back.split('?')[0]
  const name = viewName(path)
  return name ? { path: back, name } : null
}

/* 沿"归属"外键向上追溯，给档案页一条结构面包屑：
     多媒体 › camera_framework › /system/lib64/libcamera.z.so
   这条链从数据本身推导，深链接直接打开也成立——这正是来路丢失最痛的场景。
   出边有多条时按 entities.js 的 parent 声明消歧（sas 的第一条出边是
   install_module_id，并不是我们想展示的归属）。 */
export function trailOf(table, row, limit = 4) {
  const { rawQuery } = useDatabase()
  const meta = metadata()
  const trail = []
  let t = table, r = row

  while (trail.length < limit) {
    const outs = meta.outgoing[t] || []
    if (!outs.length) break
    const declared = entityOf(t).parent
    const fk = (declared && outs.find(o => o.column === declared)) || outs[0]
    const value = r[fk.column]
    if (value == null) break
    const parent = rawQuery(`SELECT * FROM ${fk.table} WHERE ${fk.to} = ?`, [value])[0]
    if (!parent) break
    trail.unshift({ table: fk.table, id: parent.id, text: entityOf(fk.table).title(parent) ?? parent.id })
    t = fk.table; r = parent
  }
  /* 仓和部件经常同名（accessibility 的仓就叫 accessibility），
     连着显示两遍是纯噪声，留里面那一级就够 */
  return trail.filter((c, i) => i === 0 || c.text !== trail[i - 1].text)
}
