/* 列目录的通用工具。各视图的列目录在 model/columns/*.js。

   每条列解释分两类陈述，刻意分开标注，不把推断当规范：

     meaning —— init / 构建体系的通用约定（"是什么"）
     reading —— 在 oskm 里这一列怎么来的、怎么读（"扫描器做了什么"）
     分布    —— 不写在目录里，由 distribution() 从当前数据实时算。
                写死的分布会过时，算出来的不会。

   列的字段：
     key / label          数据键 / 人话列名
     value(row)           可选：算出来的列（如经外键关联取到的宿主进程名）
     type                 'text' | 'num' | 'num3' | 'bytes' | 'bool' | 'bool3' | 'list' | 'path' | 'badge'
                          bytes = 字节数：屏幕上换算成 KB/MB，排序与导出仍用原始数值
                          bool3/num3 = 三态：有值 / 显式 0 / 未声明。
                          0 与未声明是两个不同的事实，不能都渲染成空白。
     width / min          定宽 / 弹性。**至少要有两列默认可见且用 min**：
                          一列都没有则窗口宽时右边留一条空白，只有一列则它把剩余
                          宽度全吃掉（实测 SA 视图的"实现库"宽到离谱）
     show                 默认是否显示
     fixed                固定在左侧（只给主列用）
     primary              主列，加粗
     link(row)            返回 {path} 直接跳，或 {entity, id} 走叶子/枢纽规则
     full                 超过多少字符算"超量内容"，给展开全文的出口（默认 90）
*/

const blank = v => v === null || v === undefined || v === ''

/* 字节数：屏幕上换算成人看的单位，排序与导出仍用原始数值——
   导出是给脚本吃的，"1.2 MB" 没法二次计算。 */
const KB = 1024
export function humanBytes(n) {
  if (blank(n)) return ''
  const v = Number(n)
  if (!Number.isFinite(v)) return String(n)
  if (v < KB) return `${v} B`
  if (v < KB ** 2) return `${(v / KB).toFixed(1)} KB`
  if (v < KB ** 3) return `${(v / KB ** 2).toFixed(1)} MB`
  return `${(v / KB ** 3).toFixed(2)} GB`
}
/** 按类型格式化 GN 参数值。当前值/默认值/特性关联参数值共用。 */
export function formatGnValue(val, type) {
  if (val == null || val === '') return '—'
  const s = String(val)
  switch (type) {
    case 'bool':
      return s === 'true' ? 'true' : s === 'false' ? 'false' : s
    case 'str':
      if (s.length >= 2 && s[0] === '"' && s.at(-1) === '"')
        try { return JSON.parse(s) } catch { /* not JSON */ }
      return s
    case 'list':
      try {
        const arr = JSON.parse(s)
        if (Array.isArray(arr)) {
          if (!arr.length) return '空列表'
          return arr.map(x => typeof x === 'string' ? x : String(x)).join(', ')
        }
      } catch { /* not JSON */ }
      return s
    default:
      return s
  }
}

const read = (row, col) => (col?.value ? col.value(row) : row[col?.key])

/* 字段在**当前这批数据**里的分布。实时算，不写死——
   写死的数字会随产品变化而说谎，这个项目已经为此改过两次文档。 */
export function distribution(rows, key, col) {
  const has = v => !blank(v)
  const norm = v => (Array.isArray(v) ? `${v.length} 项` : String(v))
  const present = rows.map(r => read(r, col || { key })).filter(has)
  const counts = new Map()
  for (const v of present) counts.set(norm(v), (counts.get(norm(v)) || 0) + 1)
  return {
    total: rows.length,
    present: present.length,
    distinct: counts.size,
    top: [...counts.entries()].sort((a, b) => b[1] - a[1]).slice(0, 4),
  }
}

/* 排序比较器。只负责"有值的怎么比"；方向与"未声明排末尾"由 sortRows 处理。

   注意不能交给 el-table 的 sort-method：它对降序会把比较结果整个取反，
   于是一百多行未声明的会翻到最前面挡住所有有值的行。所以列用
   sortable="custom"，el-table 只发事件，排序自己做——顺带也保证
   导出的内容与屏幕上看到的完全一致。 */
export function comparator(col) {
  const get = row => {
    const v = read(row, col)
    if (blank(v)) return null
    if (col.type === 'list') return Array.isArray(v) ? v.length : 1
    if (col.type === 'num' || col.type === 'num3' || col.type === 'bytes') return Number(v)
    if (col.type === 'bool' || col.type === 'bool3') return v ? 1 : 0
    return String(v)
  }
  return { get, cmp: (x, y) =>
    (typeof x === 'number' && typeof y === 'number') ? x - y : String(x).localeCompare(String(y)) }
}

/** 按某列排序。未声明的恒定排末尾，升序降序都一样——
 *  否则降序时先看到的是一片空白。 */
export function sortRows(rows, col, desc) {
  if (!col) return rows
  const { get, cmp } = comparator(col)
  const dir = desc ? -1 : 1
  /* 先把键取出来再排（decorate–sort–undecorate）。get() 会跑列目录里的 value() 派生，
     比较器里调它就是 O(n log n) 次派生：3520 行按派生列排序实测 16.6 ms，
     取值一次只要 1.4 ms。Array#sort 稳定，等值行的相对顺序与改前一致。 */
  const keyed = rows.map(row => ({ row, k: get(row) }))
  keyed.sort((a, b) => {
    if (a.k === null && b.k === null) return 0
    if (a.k === null) return 1
    if (b.k === null) return -1
    return cmp(a.k, b.k) * dir
  })
  return keyed.map(x => x.row)
}
