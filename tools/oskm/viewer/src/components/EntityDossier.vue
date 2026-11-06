<script setup>
/* 实体档案的内容本体。整页（Entity.vue）与侧边抽屉（DetailDrawer.vue）共用。

   主要区块按读者动线排列：关联 → 属性 → 直接依赖 → 直接被依赖 → 依赖闭包。
   全部可折叠，开合状态按区块名记在 localStorage。

     身份       头部 + 面包屑 + 三镜头（全空时整块不显示，不留一排"—"）
     关联       由外键元数据生成，反向关联可展开成小表
     属性       两列表格。**包含未声明的字段**——"没声明"本身是事实，
                直接过滤掉等于让人以为这个字段不存在
     直接依赖   ELF 专属一跳出边表
     直接被依赖 ELF 专属一跳入边表，按部件聚合并分页
     依赖闭包   ELF 正反向间接可达集合，按跳数筛选
     其它声明   record 里没有成列的键，同样表格化
     原始声明   逐字保留的扫描输入

   列名走 model/columns/*.js 的人话目录并带 ⓘ 说明——
   列表里已经写过一遍，详情里不该退回 `dest_index` 这种字段名。 */
import { computed, ref, shallowRef, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { useDatabase } from '../composables/useDatabase.js'
import { metadata, relationsOf, relatedRows, columnsOf, hasTable, rowSQL } from '../model/metadata.js'
import { elfReachable } from '../model/elfGraph.js'
import { toCSV, download } from '../model/export.js'
import { entityOf, isKnown, INTERNAL } from '../model/entities.js'
import { openEntity, trailOf } from '../model/nav.js'
import { columnMeta, groupsOf } from '../model/columns/index.js'
import { useSections } from '../composables/useSections.js'
import Icon from '../ui/Icon.vue'
import FieldTable from './FieldTable.vue'
import FoldSection from './FoldSection.vue'

const props = defineProps({
  table: { type: String, required: true },
  id: { type: [String, Number], required: true },
  compact: { type: Boolean, default: false },   // 抽屉里：窄栏排版
})

const route = useRoute()
const router = useRouter()
const store = useViewerStore()
const { db, rawQuery } = useDatabase()
const { isOpen, toggle } = useSections({
  props: false, direct: false, dependents: false, rel: false, closure: false, record: false,
})

const row = shallowRef(null)
const relations = shallowRef([])
const trail = shallowRef([])
const expanded = ref(new Set())
const showEmpty = ref(false)
const elfDirectDependencies = shallowRef([])
const elfDependents = shallowRef([])
const dependentComponent = ref(null)
const dependentLimit = ref(50)
const elfClosures = shallowRef(null)
const closureLimits = ref({ forward: 50, reverse: 50 })
const closureHopFilters = ref({ forward: null, reverse: null })

const meta = computed(() => entityOf(props.table))
const known = computed(() => isKnown(props.table))
const missing = computed(() => store.dbLoaded && hasTable(props.table) && !row.value)
const go = (table, id) => openEntity(router, route, table, id)

const blank = v => v === null || v === undefined || v === ''
/* 库里 JSON 列声明为 TEXT，字符串值会带着引号出来（`"accessibility"`）。
   只剥最外层的字符串引号；对象与数组仍交给 JsonValue 渲染。 */
function display(v) {
  if (typeof v !== 'string') return blank(v) ? '' : String(v)
  if (v.length > 1 && v[0] === '"' && v.at(-1) === '"') {
    try { const p = JSON.parse(v); if (typeof p === 'string') return p } catch { /* 原样 */ }
  }
  return v
}

/* ------------------------------------------------------------------ 属性 */
const fkColumns = computed(() =>
  new Set((metadata().outgoing[props.table] || []).map(f => f.column)))

const allFields = computed(() => {
  if (!row.value) return []
  const derived = {
    elf_modules: ['dest'],
    elf_module_dependencies: ['callee_dest'],
  }[props.table] || []
  const derivedFields = derived.map(key => {
    const m = columnMeta(props.table, key)
    const v = m?.value ? m.value(row.value) : row.value[key]
    return {
      key, label: m?.label || key, meaning: m?.meaning, reading: m?.reading,
      type: m?.type, value: v, text: display(v), missing: blank(v),
    }
  })
  /* needed 在 ELF 档案里由“直接依赖”面板逐边展开；
     position 只是采集端的稳定排序键，对读者没有独立含义。 */
  const dossierSkips = new Set(props.table === 'elf_modules' ? ['needed', 'position'] : [])
  const physical = columnsOf(props.table)
    .filter(c => !INTERNAL.has(c.name) && !fkColumns.value.has(c.name)
                 && !dossierSkips.has(c.name))
    .map(c => {
      const m = columnMeta(props.table, c.name)
      const physical = row.value[c.name]
      const v = m?.value ? m.value(row.value) : physical
      return {
        key: c.name, label: m?.label || c.name, meaning: m?.meaning, reading: m?.reading,
        type: m?.type, value: v, text: display(v), missing: blank(v),
      }
    })
  return props.table === 'elf_modules'
    ? [...derivedFields, ...physical]
    : [...physical, ...derivedFields]
})
const emptyCount = computed(() => allFields.value.filter(f => f.missing).length)

/* 按列目录的分组排序并分段。列目录里本来就分好了（身份 / 依赖 / 产出 …），
   档案页原先按 PRAGMA 的物理列序平铺，等于把这份分组浪费掉——
   于是 1140 字符的 deps 和"部件名"平级并排。
   没有登记的列归到末尾的"其它"。 */
const fields = computed(() => {
  const order = groupsOf(props.table)
  const shown = showEmpty.value ? allFields.value : allFields.value.filter(f => !f.missing)
  if (!order.length) return shown
  const rank = g => { const i = order.indexOf(g); return i < 0 ? order.length : i }
  const sorted = shown
    .map(f => ({ ...f, group: columnMeta(props.table, f.key)?.group || '其它' }))
    .sort((a, b) => rank(a.group) - rank(b.group))
  let last = null
  return sorted.map(f => {
    const head = f.group !== last
    last = f.group
    return { ...f, groupHead: head }
  })
})

/* ------------------------------------------------- 原始声明里没有成列的键 */
const norm = s => String(s).replace(/-/g, '_').toLowerCase()
const recordExtras = computed(() => {
  if (!row.value?.record) return []
  let obj
  try { obj = JSON.parse(row.value.record) } catch { return [] }
  if (!obj || typeof obj !== 'object' || Array.isArray(obj)) return []
  const taken = new Set(columnsOf(props.table).map(c => norm(c.name)))
  return Object.entries(obj)
    .filter(([k, v]) => !taken.has(norm(k)) && !blank(v))
    .map(([k, v]) => {
      /* 原始声明里的键也查一次目录：components 的 features / syscap 现在没有列了
         （独立表才是展开值），它们落到这里，不该因此退回裸键名。 */
      const m = columnMeta(props.table, k)
      return {
        key: k, label: m?.label || k, meaning: m?.meaning, reading: m?.reading,
        value: v, text: typeof v === 'object' ? JSON.stringify(v) : String(v), missing: false,
      }
    })
})
const recordRaw = computed(() => {
  if (!row.value?.record) return null
  try { return JSON.stringify(JSON.parse(row.value.record), null, 2) } catch { return row.value.record }
})

/* deps.components 里的名字是真实部件——给成可点链接，这是最便宜的依赖导航 */
const componentIds = computed(() => {
  if (!store.dbLoaded) return {}
  return Object.fromEntries(rawQuery(
    'SELECT id, name FROM components WHERE scan_id = ?', [store.scanId]).map(r => [r.name, r.id]))
})
const componentLink = name => componentIds.value[name] ? `/e/components/${componentIds.value[name]}` : null

/* ------------------------------------------------------------- 三镜头 */
const lenses = computed(() => {
  const r = row.value; if (!r) return []
  const by = Object.fromEntries(relations.value.map(x => [x.table + x.dir, x]))
  const n = t => (by[t + 'from']?.count ?? 0)
  const comp = relations.value.find(x => x.dir === 'to' && x.table === 'components')?.rows?.[0]
  const parts = (...xs) => { const kept = xs.filter(Boolean); return kept.length ? kept.join(' · ') : null }
  const out = []
  out.push({ key: 'build', icon: 'build', label: '构建',
    text: comp ? `部件 ${comp.name}（${comp.subsystem || '—'}）`
        : props.table === 'components'
          ? parts(n('innerapis') && `InnerAPI ${n('innerapis')}`,
                  n('syscaps') && `syscap ${n('syscaps')}`,
                  n('features') && `feature ${n('features')}`) || '未声明 InnerAPI'
          : null,
    to: comp ? ['components', comp.id] : null })
  const mod = relations.value.find(x => x.dir === 'to' && x.table === 'install_modules')?.rows?.[0]
  out.push({ key: 'image', icon: 'image', label: '镜像',
    text: mod ? `由 ${mod.label || '(无 label)'} 装入`
        : props.table === 'install_modules' ? `${n('install_targets')} 个安装产物`
        : props.table === 'components' ? (n('install_modules') ? `${n('install_modules')} 个安装模块`
                                                               : '没有安装产物')
        : null,
    to: mod ? ['install_modules', mod.id] : null })
  const runtimeId = meta.value.runtimeId?.(r) ??
    relations.value.find(x => x.dir === 'to' && x.table === 'services')?.rows?.[0]?.id
  out.push({ key: 'runtime', icon: 'runtime', label: '运行',
    text: runtimeId ? '在运行视图中查看这个单元'
        : props.table === 'components'
          ? parts(n('services') && `服务 ${n('services')}`, n('sas') && `SA ${n('sas')}`,
                  n('hdis') && `设备 ${n('hdis')}`) || '运行时无直接体现'
        : null,
    unit: runtimeId || null })
  /* 只留**指向别的实体**的镜头。纯计数的那种（部件的"InnerAPI 8 · syscap 1"）
     和关联区说的是同一件事，留着就是同一批数字讲两遍——
     而关联区现在默认就露前几条，比一行计数信息量大。

     判据不需要给实体登记"主域"：有 to / unit 就是跨域指向，没有就是自述。 */
  return out.filter(l => l.text && (l.to || l.unit))
})

/* ------------------------------------------------- ELF 直接依赖 */
/* 通用关联区默认只露 6 条、展开最多 50 条；但 ELF 的 DT_NEEDED 最多有 128 条。
   这里一次取全量并放进有界滚动容器，避免“第 51 条以后没有出口”。 */
function loadElfDirectDependencies(id) {
  return rawQuery(`
    SELECT d.id, d.needed_ordinal, d.needed_name, d.callee_id,
           callee_t.dest AS callee_dest, callee.file_name AS callee_file_name,
           callee.partition AS callee_partition,
           callee_component.id AS callee_component_id,
           callee_component.name AS callee_component
      FROM elf_module_dependencies d
      LEFT JOIN elf_modules callee
             ON callee.scan_id = d.scan_id AND callee.id = d.callee_id
      LEFT JOIN install_targets callee_t
             ON callee_t.scan_id = callee.scan_id
            AND callee_t.id = callee.install_target_id
      LEFT JOIN components callee_component
             ON callee_component.scan_id = callee.scan_id
            AND callee_component.id = callee.component_id
     WHERE d.scan_id = ? AND d.caller_id = ?
     ORDER BY d.needed_ordinal`, [store.scanId, id])
}

/* ------------------------------------------------- ELF 被依赖 */
/* 反向边可能有两三千条。这里一次取全量用于计数/聚合/导出，
   但渲染仍分页；同时按部件聚合，先回答“影响落在谁身上”。 */
function loadElfDependents(id) {
  return rawQuery(`
    SELECT d.id, d.caller_id, d.needed_name,
           caller_t.dest AS caller_dest, caller.file_name AS caller_file_name,
           caller.partition AS caller_partition,
           caller_component.id AS caller_component_id,
           caller_component.name AS caller_component
      FROM elf_module_dependencies d
      JOIN elf_modules caller
             ON caller.scan_id = d.scan_id AND caller.id = d.caller_id
      JOIN install_targets caller_t
             ON caller_t.scan_id = caller.scan_id
            AND caller_t.id = caller.install_target_id
      LEFT JOIN components caller_component
             ON caller_component.scan_id = caller.scan_id
            AND caller_component.id = caller.component_id
     WHERE d.scan_id = ? AND d.callee_id = ?
     ORDER BY caller_component.name, caller_t.dest`, [store.scanId, id])
}

const elfDependentGroups = computed(() => {
  const groups = new Map()
  for (const dep of elfDependents.value) {
    const key = dep.caller_component_id ?? 'unowned'
    const group = groups.get(key) || {
      id: dep.caller_component_id,
      name: dep.caller_component || '归属未解析',
      count: 0,
    }
    group.count += 1
    groups.set(key, group)
  }
  return [...groups.values()].sort((a, b) => b.count - a.count
    || a.name.localeCompare(b.name, 'zh-Hans-CN'))
})
const topElfDependentGroups = computed(() => elfDependentGroups.value.slice(0, 8))
const filteredElfDependents = computed(() => dependentComponent.value == null
  ? elfDependents.value
  : elfDependents.value.filter(dep => dep.caller_component_id === dependentComponent.value))
const shownElfDependents = computed(() => filteredElfDependents.value.slice(0, dependentLimit.value))
function setDependentFilter(id) {
  dependentComponent.value = id == null || id === '' ? null : id
  dependentLimit.value = 50
}

const ELF_DEPENDENT_EXPORT_COLUMNS = [
  { label: '调用方 ID', key: 'caller_id' },
  { label: '调用方路径', key: 'caller_dest' },
  { label: 'DT_NEEDED', key: 'needed_name' },
  { label: '部件', key: 'caller_component' },
  { label: '分区', key: 'caller_partition' },
]
function exportElfDependents() {
  const name = `ELF被依赖_${props.id}_${elfDependents.value.length}行`
  download(toCSV(elfDependents.value, ELF_DEPENDENT_EXPORT_COLUMNS), `${name}.csv`, 'text/csv')
}

/* ------------------------------------------------------- ELF 依赖闭包 */
/* 列表仍只算一跳度数；这里在档案打开时做 BFS。两个方向共用一次加载的
   边表/节点缓存，默认只渲染 50 条，避免 libutils 这种 2900+ 反向闭包
   一次性铺满 DOM。 */
const CLOSURE_STEP = 100
const elfClosureSections = computed(() => elfClosures.value ? [
  { key: 'forward', title: '间接依赖', arrow: '→', closure: elfClosures.value.forward },
  { key: 'reverse', title: '间接被依赖', arrow: '←', closure: elfClosures.value.reverse },
] : [])
const closureViews = computed(() =>
  elfClosureSections.value.map(section => {
    const { closure, key } = section
    const direct = closure.nodes.filter(n => n.distance === 1).length
    const indirectNodes = closure.nodes.filter(n => n.distance > 1)
    const hop = closureHopFilters.value[key]
    const filteredNodes = hop == null
      ? indirectNodes
      : indirectNodes.filter(node => node.distance === hop)

    const layers = []
    for (const node of indirectNodes) {
      const last = layers.at(-1)
      if (last && last.distance === node.distance) last.nodes.push(node)
      else layers.push({ distance: node.distance, nodes: [node] })
    }
    for (const layer of layers) layer.count = layer.nodes.length

    /* 每个距离层至少露一条，再按轮转分配剩余额度。
       只取 filteredNodes.slice(0, 50) 时，2 跳一旦超过 50 条，
       3 跳及更远的层在列表里就永远不可见。 */
    const selectedByLayer = layers.map(() => [])
    let shown = 0
    let depth = 0
    let exhausted = false
    const limit = Math.min(closureLimits.value[key], filteredNodes.length)
    while (shown < limit && !exhausted) {
      exhausted = true
      for (let i = 0; i < layers.length && shown < limit; i++) {
        if (hop != null && layers[i].distance !== hop) continue
        if (depth >= layers[i].nodes.length) continue
        exhausted = false
        selectedByLayer[i].push(layers[i].nodes[depth])
        shown += 1
      }
      depth += 1
    }

    const rowsLayered = selectedByLayer
      .map((nodes, index) => ({
        distance: layers[index].distance,
        nodes: nodes.map(node => ({
          ...node,
          path: closure.pathOf(node.id).map(id => ({ id, record: closure.recordOf(id) })),
        })),
      }))
      .filter(layer => layer.nodes.length)
    return {
      ...section,
      direct,
      indirect: indirectNodes.length,
      filteredIndirect: filteredNodes.length,
      hop,
      layers,
      shown,
      rows: rowsLayered.flatMap(layer => layer.nodes),
      rowsLayered,
    }
  })
)
const elfClosureIndirectTotal = computed(() =>
  elfClosureSections.value.reduce((sum, s) =>
    sum + s.closure.nodes.filter(n => n.distance > 1).length, 0))
const closureTitle = node => node.dest || node.file_name || node.soname || `#${node.id}`
const API_TYPE_LABELS = {
  public_api: 'public API',
  inner_api: 'inner API',
  internal_api: 'internal API',
}
const apiTypeLabel = value => API_TYPE_LABELS[value] || value
function categoryText(value) {
  try {
    const parsed = JSON.parse(value || '[]')
    return Array.isArray(parsed) ? parsed.join(' · ') : ''
  } catch {
    return ''
  }
}
const closurePathLabel = record => record?.dest?.split('/').pop()
  || record?.file_name || record?.soname || '未命中'
function showMoreClosure(key) {
  closureLimits.value[key] += CLOSURE_STEP
}

function setClosureHop(key, distance) {
  closureHopFilters.value[key] = distance
  closureLimits.value[key] = 50
}

const CLOSURE_EXPORT_COLUMNS = [
  { label: '方向', key: 'direction' },
  { label: '距离', key: 'distance' },
  { label: '模块 ID', key: 'id' },
  { label: '安装路径', key: 'dest' },
  { label: '文件名', key: 'file_name' },
  { label: 'SONAME', key: 'soname' },
  { label: 'API 类型', key: 'api_type' },
  { label: 'Category', key: 'category' },
  { label: '最短路径', key: 'path' },
]

/** 导出完整闭包，不只导出当前渲染的前 50 条。 */
function exportClosure(view) {
  const closure = view.closure
  const rows = closure.nodes.map(node => ({
    direction: view.title,
    distance: node.distance,
    id: node.id,
    dest: node.dest || '',
    file_name: node.file_name || '',
    soname: node.soname || '',
    api_type: node.api_type || '',
    category: categoryText(node.category),
    path: closure.pathOf(node.id)
      .map(id => closureTitle(closure.recordOf(id) || { id }))
      .join(` ${view.arrow} `),
  }))
  const name = `ELF闭包_${view.key}_${props.id}_${rows.length}行`
  download(toCSV(rows, CLOSURE_EXPORT_COLUMNS), `${name}.csv`, 'text/csv')
}

/* ------------------------------------------------------------- 关联 */
/* 反向关联默认露出前几条，而不是只给一个折叠的计数。
   "这个部件产出了什么"正是打开部件档案的首要问题，把它压成
    `InnerAPI 8 条` 再要求点开，等于把答案藏起来。
   抽屉窄，露 3 条；整页露 6 条。 */
const PREVIEW = computed(() => (props.compact ? 3 : 6))
const previewOf = rel => relatedRows(rel.table, rel.via, row.value.id, store.scanId,
                                     PREVIEW.value)

function toggleRel(key) {
  const next = new Set(expanded.value)
  next.has(key) ? next.delete(key) : next.add(key)
  expanded.value = next
}
const rowsOf = rel => relatedRows(rel.table, rel.via, row.value.id, store.scanId)
const titleOf = (t, r) => entityOf(t).title(r) ?? r.id
const relLabel = r => entityOf(r.table).viaLabel?.[r.via] || entityOf(r.table).label
const subOf = (t, r) => entityOf(t).subtitle?.(r) ?? ''
const relCount = computed(() => relations.value.reduce((s, r) => s + (r.count ?? 1), 0))

/* immediate 的 watch 放文件末尾：它会在定义那一刻就跑，
   引用到下面才声明的 const 会直接 TDZ 报错、整页白屏（§14.9 的约定） */
watch(() => [props.table, props.id, store.scanId], () => {
  row.value = null; relations.value = []; trail.value = []
  expanded.value = new Set(); showEmpty.value = false
  elfDirectDependencies.value = []
  elfDependents.value = []
  dependentComponent.value = null; dependentLimit.value = 50
  elfClosures.value = null; closureLimits.value = { forward: 50, reverse: 50 }
  closureHopFilters.value = { forward: null, reverse: null }
  if (!store.dbLoaded || !hasTable(props.table)) return
  row.value = rawQuery(rowSQL(props.table), [props.id])[0] || null
  if (!row.value) return
  relations.value = relationsOf(props.table, row.value, store.scanId)
  trail.value = trailOf(props.table, row.value)
  if (props.table === 'elf_modules') {
    elfDirectDependencies.value = loadElfDirectDependencies(row.value.id)
    elfDependents.value = loadElfDependents(row.value.id)
    /* 出边和入边都有 ELF 专属面板；通用关联区不再用 50 条上限复述同一批边。 */
    relations.value = relations.value.filter(r =>
      !(r.table === 'elf_module_dependencies'
        && (r.via === 'caller_id' || r.via === 'callee_id')))
    const args = { db: db.value, rawQuery, scanId: store.scanId, startId: row.value.id }
    elfClosures.value = {
      forward: elfReachable({ ...args, direction: 'forward' }),
      reverse: elfReachable({ ...args, direction: 'reverse' }),
    }
  }
}, { immediate: true })
</script>

<template>
  <div v-if="!store.dbLoaded" class="empty">请先加载数据库</div>
  <div v-else-if="!hasTable(table)" class="empty">当前数据库没有 <code>{{ table }}</code> 这张表</div>
  <div v-else-if="missing" class="empty">未找到 <code>{{ table }} #{{ id }}</code></div>

  <div v-else-if="row" class="dossier" :class="{ compact }">
    <nav v-if="trail.length" class="trail a-trail" aria-label="所属">
      <template v-for="t in trail" :key="t.table + t.id">
        <button class="crumb" :title="t.text" @click="go(t.table, t.id)">{{ t.text }}</button>
        <span class="sep" aria-hidden="true">›</span>
      </template>
      <span class="crumb here" :title="meta.title(row)">{{ meta.title(row) }}</span>
    </nav>

    <header class="head a-head" :class="`a-${meta.accent}`">
      <Icon :name="meta.icon" :size="20" />
      <div class="names">
        <h1>{{ meta.title(row) }}</h1>
        <p v-if="meta.subtitle?.(row)" class="sub mono">{{ meta.subtitle(row) }}</p>
      </div>
      <span class="type">{{ meta.label }}<template v-if="!known"> · 未登记类型</template></span>
    </header>

    <ul v-if="lenses.length" class="lenses a-lens">
      <li v-for="l in lenses" :key="l.key">
        <Icon :name="l.icon" :size="14" /><span class="lb">{{ l.label }}</span>
        <span class="lt">{{ l.text }}</span>
        <button v-if="l.to" class="go" @click="go(l.to[0], l.to[1])">前往 →</button>
        <button v-else-if="l.unit" class="go"
                @click="router.push(`/runtime/unit/${l.unit}`)">前往 →</button>
      </li>
    </ul>

    <FoldSection v-if="relations.length" class="a-rel" title="关联" :count="relCount"
                 hint="由外键自动生成" :open="isOpen('rel')" @toggle="toggle('rel')">
      <table class="rel">
        <tbody>
          <template v-for="r in relations" :key="r.table + r.dir + r.via">
            <tr v-if="r.dir === 'to'">
              <th scope="row"><span class="arrow">→</span>{{ entityOf(r.table).label }}</th>
              <td>
                <button class="link" @click="go(r.table, r.rows[0].id)">
                  {{ titleOf(r.table, r.rows[0]) }}</button>
              </td>
            </tr>
            <tr v-else>
              <th scope="row">
                <span class="arrow">←</span>{{ relLabel(r) }}
                <span class="cnt">{{ r.count }}</span>
              </th>
              <td>
                <!-- 默认就露前几条，不要求先点开 -->
                <ul class="items">
                  <li v-for="x in (expanded.has(r.table + r.via) ? rowsOf(r) : previewOf(r))"
                      :key="x.id">
                    <button class="link" @click="go(r.table, x.id)">{{ titleOf(r.table, x) }}</button>
                    <span class="xs mono">{{ subOf(r.table, x) }}</span>
                  </li>
                </ul>
                <button v-if="r.count > PREVIEW" class="more" @click="toggleRel(r.table + r.via)">
                  {{ expanded.has(r.table + r.via)
                     ? '收起'
                     : `还有 ${r.count - PREVIEW} 条，展开看${r.count > 50 ? '（最多 50）' : ''}` }}
                </button>
              </td>
            </tr>
          </template>
        </tbody>
      </table>
    </FoldSection>

    <FoldSection class="a-props" title="属性" :count="fields.length" :open="isOpen('props')"
                 @toggle="toggle('props')">
      <FieldTable :fields="fields" :compact="compact" :links="componentLink"
                  @go="to => router.push(to)" />
      <button v-if="emptyCount" class="more" @click="showEmpty = !showEmpty">
        {{ showEmpty ? '收起未声明的字段' : `还有 ${emptyCount} 个字段未声明，展开看` }}
      </button>
    </FoldSection>

    <FoldSection v-if="table === 'elf_modules'"
                 class="a-direct" title="直接依赖" :count="elfDirectDependencies.length"
                 hint="一跳边表，全部列出" :open="isOpen('direct')"
                 @toggle="toggle('direct')">
      <p v-if="!elfDirectDependencies.length" class="closure-empty">没有直接依赖</p>
      <div v-else class="direct-scroll">
        <table class="direct">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">DT_NEEDED</th>
              <th scope="col">命中模块</th>
              <th scope="col">部件</th>
              <th scope="col">分区</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="dep in elfDirectDependencies" :key="dep.id">
              <td class="mono">{{ dep.needed_ordinal + 1 }}</td>
              <td class="mono">{{ dep.needed_name }}</td>
              <td>
                <button v-if="dep.callee_id" class="link" :title="dep.callee_dest"
                        @click="go('elf_modules', dep.callee_id)">
                  {{ dep.callee_dest || dep.callee_file_name || `#${dep.callee_id}` }}
                </button>
                <span v-else class="warn">未命中</span>
              </td>
              <td>
                <button v-if="dep.callee_component_id" class="link"
                        @click="go('components', dep.callee_component_id)">
                  {{ dep.callee_component }}
                </button>
                <span v-else class="dim">—</span>
              </td>
              <td>{{ dep.callee_partition || '—' }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </FoldSection>

    <FoldSection v-if="table === 'elf_modules'" class="a-dependents"
                 title="直接被依赖" :count="elfDependents.length"
                 hint="按部件聚合，分页查看" :open="isOpen('dependents')"
                 @toggle="toggle('dependents')">
      <div class="dep-tools">
        <button class="layer" :class="{ on: dependentComponent == null }"
                :aria-pressed="dependentComponent == null"
                @click="setDependentFilter(null)">
          全部 {{ elfDependents.length.toLocaleString('en-US') }}
        </button>
        <button v-for="group in topElfDependentGroups" :key="group.id ?? group.name"
                class="layer" :class="{ on: dependentComponent === group.id }"
                :aria-pressed="dependentComponent === group.id"
                @click="setDependentFilter(group.id)">
          {{ group.name }} {{ group.count.toLocaleString('en-US') }}
        </button>
        <el-select :model-value="dependentComponent" clearable filterable
                   placeholder="按部件" size="small" class="dep-select"
                   @update:model-value="v => setDependentFilter(v)">
          <el-option v-for="group in elfDependentGroups" :key="group.id ?? group.name"
                     :label="`${group.name}（${group.count}）`" :value="group.id" />
        </el-select>
        <button class="closure-export" @click="exportElfDependents">
          导出完整 {{ elfDependents.length }} 条
        </button>
      </div>
      <p v-if="!elfDependents.length" class="closure-empty">没有直接依赖方</p>
      <div v-else class="direct-scroll">
        <table class="direct dependent">
          <thead>
            <tr>
              <th scope="col">调用方</th>
              <th scope="col">DT_NEEDED</th>
              <th scope="col">部件</th>
              <th scope="col">分区</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="dep in shownElfDependents" :key="dep.id">
              <td>
                <button class="link" :title="dep.caller_dest"
                        @click="go('elf_modules', dep.caller_id)">
                  {{ dep.caller_dest || dep.caller_file_name || `#${dep.caller_id}` }}
                </button>
              </td>
              <td class="mono">{{ dep.needed_name }}</td>
              <td>
                <button v-if="dep.caller_component_id" class="link"
                        @click="go('components', dep.caller_component_id)">
                  {{ dep.caller_component }}
                </button>
                <span v-else class="dim">归属未解析</span>
              </td>
              <td>{{ dep.caller_partition || '—' }}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <button v-if="filteredElfDependents.length > dependentLimit" class="more"
              @click="dependentLimit += 100">
        显示 {{ dependentLimit }} / {{ filteredElfDependents.length }} 条，再显示 100 条
      </button>
    </FoldSection>

    <FoldSection v-if="elfClosures" class="a-closure" title="依赖闭包"
                 :count="elfClosureIndirectTotal" hint="按需 BFS，不落库"
                 :open="isOpen('closure')" @toggle="toggle('closure')">
      <div v-for="view in closureViews" :key="view.key" class="closure">
        <div class="closure-head">
          <h3>{{ view.title }}</h3>
          <span class="closure-summary">
            间接 {{ view.indirect }} · 直接 {{ view.direct }} · 闭包 {{ view.closure.count }}
          </span>
          <button class="closure-export" @click="exportClosure(view)">
            导出完整 {{ view.closure.count }} 条
          </button>
        </div>
        <div v-if="view.layers.length" class="closure-layers" aria-label="间接依赖按跳数筛选">
          <button class="layer" :class="{ on: view.hop == null }"
                  :aria-pressed="view.hop == null"
                  @click="setClosureHop(view.key, null)">
            全部 {{ view.indirect.toLocaleString('en-US') }}
          </button>
          <button v-for="layer in view.layers" :key="`${view.key}-${layer.distance}`"
                  class="layer" :class="{ on: view.hop === layer.distance }"
                  :aria-pressed="view.hop === layer.distance"
                  @click="setClosureHop(view.key, layer.distance)">
            {{ layer.distance }}跳 {{ layer.count.toLocaleString('en-US') }}
          </button>
        </div>
        <p v-if="!view.rows.length" class="closure-empty">没有间接{{ view.key === 'forward' ? '依赖' : '被依赖' }}</p>
        <template v-else>
          <div v-for="layer in view.rowsLayered" :key="`${view.key}-${layer.distance}`"
               class="closure-layer">
            <h4>{{ layer.distance }} 跳 <span>{{ layer.nodes.length }} 个</span></h4>
            <ul class="closure-list">
              <li v-for="node in layer.nodes" :key="`${view.key}-${node.id}`" class="closure-node">
                <div class="node-head">
                  <button class="link" :title="closureTitle(node)"
                          @click="go('elf_modules', node.id)">{{ closureTitle(node) }}</button>
                  <span v-if="node.api_type" class="badge"
                        :title="`API 类型：${apiTypeLabel(node.api_type)}`">
                    {{ apiTypeLabel(node.api_type) }}
                  </span>
                  <span class="distance indirect">{{ node.distance }} 跳</span>
                </div>
                <p v-if="categoryText(node.category)" class="node-category mono">
                  {{ categoryText(node.category) }}
                </p>
                <div class="path" aria-label="最短路径">
                  <template v-for="(step, i) in node.path" :key="`${view.key}-${node.id}-${step.id}`">
                    <button class="path-node" :title="step.record?.dest || `#${step.id}`"
                            @click="go('elf_modules', step.id)">
                      {{ closurePathLabel(step.record) }}
                    </button>
                    <span v-if="i < node.path.length - 1" class="path-arrow"
                          aria-hidden="true">{{ view.arrow }}</span>
                  </template>
                </div>
              </li>
            </ul>
          </div>
        </template>
        <button v-if="view.filteredIndirect > closureLimits[view.key]" class="more"
                @click="showMoreClosure(view.key)">
          显示 {{ view.shown }} / {{ view.filteredIndirect }} 条，再显示 {{ CLOSURE_STEP }} 条
        </button>
      </div>
    </FoldSection>

    <FoldSection v-if="recordExtras.length" class="a-extras" title="其它声明" :count="recordExtras.length"
                 hint="原始声明里未成列的字段" :open="isOpen('extras')" @toggle="toggle('extras')">
      <FieldTable :fields="recordExtras" :compact="compact" />
    </FoldSection>

    <FoldSection v-if="recordRaw" class="a-record" title="原始声明 record" hint="逐字保留的扫描输入"
                 :open="isOpen('record')" @toggle="toggle('record')">
      <pre>{{ recordRaw }}</pre>
    </FoldSection>

</div>
</template>

<style scoped>
.empty { padding: var(--space-7); text-align: center; color: var(--text-secondary) }
.empty code { font-family: var(--font-mono); color: var(--entity-component) }

/* 整页：主要区块按阅读顺序通栏展示。抽屉（compact）同样是纵向单栏。

   ELF 详情的阅读动线是：关联 → 属性 → 直接依赖 → 直接被依赖 → 依赖闭包。
   这些区块不能左右并排，否则“属性在右边”会破坏顺序感；宽度利用率交给
   FieldTable / 关联表 / 依赖表自己处理。 */
@media (min-width: 1180px) {
  .dossier:not(.compact) {
    display: grid; row-gap: var(--space-4);
    grid-template-columns: minmax(0, 1fr);
    grid-template-areas:
      'trail'
      'head'
      'lens'
      'rel'
      'props'
      'direct'
      'dependents'
      'closure'
      'extras'
      'record';
    align-content: start;
  }
  .dossier:not(.compact) > .a-trail  { grid-area: trail }
  .dossier:not(.compact) > .a-head   { grid-area: head }
  .dossier:not(.compact) > .a-lens   { grid-area: lens }
  .dossier:not(.compact) > .a-props  { grid-area: props }
  .dossier:not(.compact) > .a-extras { grid-area: extras }
  .dossier:not(.compact) > .a-rel    { grid-area: rel }
  .dossier:not(.compact) > .a-direct { grid-area: direct }
  .dossier:not(.compact) > .a-dependents { grid-area: dependents }
  .dossier:not(.compact) > .a-closure { grid-area: closure }
  .dossier:not(.compact) > .a-record { grid-area: record }
}

.trail {
  display: flex; align-items: center; gap: var(--space-1); flex-wrap: wrap;
  margin-bottom: var(--space-3); font-size: var(--text-sm);
}
.crumb {
  font: inherit; font-size: var(--text-sm); padding: 0;
  background: none; border: 0; cursor: pointer; color: var(--entity-component);
  /* GN label 动辄 80 字符，不截的话一条面包屑能占三行 */
  max-width: 34ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
}
.compact .crumb { max-width: 22ch }
.crumb:hover { text-decoration: underline }
.crumb.here { color: var(--text-secondary); cursor: default; font-family: var(--font-mono) }
.sep { color: var(--text-secondary) }

.head {
  display: flex; align-items: center; gap: var(--space-3);
  padding-bottom: var(--space-3); border-bottom: 1px solid var(--border-subtle);
}
.head .icon { color: var(--border-strong); flex-shrink: 0 }
.a-component .icon { color: var(--entity-component) }
.a-service   .icon { color: var(--entity-service) }
.a-sa        .icon { color: var(--entity-sa) }
.a-hdi       .icon { color: var(--entity-hdi) }
.a-module    .icon { color: var(--entity-module) }
.names { min-width: 0 }
h1 { margin: 0; font-size: var(--text-xl); font-weight: 600; font-family: var(--font-mono);
     overflow-wrap: anywhere }
.compact h1 { font-size: var(--text-lg) }
.sub { margin: 2px 0 0; font-size: var(--text-sm); color: var(--text-secondary);
       overflow-wrap: anywhere }
.type {
  margin-left: auto; flex-shrink: 0; font-size: var(--text-xs); color: var(--text-secondary);
  border: 1px solid var(--border-default); border-radius: var(--radius-full); padding: 2px var(--space-2);
}

.lenses { list-style: none; margin: var(--space-3) 0 var(--space-4); padding: 0;
          border: 1px solid var(--border-subtle); border-radius: var(--radius-md); overflow: hidden }
.lenses li {
  display: flex; align-items: center; gap: var(--space-2);
  padding: var(--space-2) var(--space-3); font-size: var(--text-base);
  background: var(--surface-raised);
}
.lenses li + li { border-top: 1px solid var(--border-subtle) }
.lb { width: 36px; color: var(--text-secondary); font-size: var(--text-sm); flex-shrink: 0 }
.lt { color: var(--text-primary); min-width: 0; overflow-wrap: anywhere }
.go { margin-left: auto; flex-shrink: 0; font: inherit; font-size: var(--text-sm);
      color: var(--entity-component); background: none; border: 0; cursor: pointer }
.go:hover { text-decoration: underline }

.more { display: block; margin-top: var(--space-2); font: inherit; font-size: var(--text-sm);
        color: var(--entity-component); background: none; border: 0; padding: 0; cursor: pointer }
.more:hover { text-decoration: underline }

.rel { width: 100%; border-collapse: collapse; table-layout: fixed }
.rel th { width: 148px; text-align: left; font-weight: 400; vertical-align: top;
          padding: var(--space-1) var(--space-3) var(--space-1) 0;
          color: var(--text-secondary); font-size: var(--text-sm) }
.compact .rel th { width: 116px }
.rel td { padding: var(--space-1) 0; vertical-align: top; overflow-wrap: anywhere }
.rel tr + tr th, .rel tr + tr td { border-top: 1px solid var(--border-subtle) }
.cnt { margin-left: var(--space-2); font-family: var(--font-mono);
       color: var(--entity-component) }
.arrow { margin-right: var(--space-2); font-family: var(--font-mono) }
.fold { font: inherit; font-size: var(--text-sm); color: var(--text-secondary);
        background: none; border: 0; padding: 0; cursor: pointer;
        display: inline-flex; align-items: center; gap: 4px }
.fold:hover { color: var(--text-primary) }
.link { font: inherit; font-size: var(--text-sm); font-family: var(--font-mono);
        color: var(--entity-component); background: none; border: 0; cursor: pointer;
        padding: 0; text-align: left; overflow-wrap: anywhere }
.link:hover { text-decoration: underline }
.direct-scroll { max-height: 420px; overflow: auto; border: 1px solid var(--border-subtle);
                  border-radius: var(--radius-sm) }
.direct { width: 100%; border-collapse: collapse; table-layout: fixed; font-size: var(--text-sm) }
.direct th {
  position: sticky; top: 0; z-index: 1; padding: var(--space-2);
  background: var(--surface-raised); text-align: left; color: var(--text-secondary);
  font-size: var(--text-xs); font-weight: 600; border-bottom: 1px solid var(--border-default);
}
.direct td { padding: var(--space-2); vertical-align: top; overflow-wrap: anywhere;
             border-top: 1px solid var(--border-subtle) }
.direct td:first-child { width: 44px }
.direct td:nth-child(2) { width: 24% }
.direct td:nth-child(4) { width: 20% }
.direct td:nth-child(5) { width: 82px }
.direct.dependent td:first-child { width: auto }
.direct.dependent td:nth-child(4) { width: 82px }
.warn { color: var(--severity-warning) }

.dep-tools { display: flex; align-items: center; gap: var(--space-2);
             flex-wrap: wrap; margin-bottom: var(--space-2) }
.dep-select { width: 190px }
.direct td:nth-child(2) { width: 24% }

.closure + .closure { margin-top: var(--space-4) }
.closure-head { display: flex; align-items: baseline; gap: var(--space-3); flex-wrap: wrap }
.closure-head h3 { margin: 0; font-size: var(--text-sm); color: var(--text-primary) }
.closure-summary { font-size: var(--text-sm); color: var(--text-secondary);
                    font-variant-numeric: tabular-nums }
.closure-export { font: inherit; font-size: var(--text-xs); padding: 2px var(--space-2);
                  color: var(--entity-component); background: none; cursor: pointer;
                  border: 1px solid var(--border-default); border-radius: var(--radius-full) }
.closure-export:hover { border-color: var(--entity-component) }
.closure-layers { display: flex; flex-wrap: wrap; gap: var(--space-2); margin-top: var(--space-2) }
.closure-layers .layer { font: inherit; font-family: var(--font-mono);
                         font-size: var(--text-xs); color: var(--text-secondary);
                         padding: 1px var(--space-2); background: none; cursor: pointer;
                         border: 1px solid var(--border-subtle); border-radius: var(--radius-full) }
.closure-layers .layer:hover { color: var(--text-primary); border-color: var(--border-default) }
.closure-layers .layer.on { color: var(--entity-module); border-color: var(--entity-module) }
.closure-layer + .closure-layer { margin-top: var(--space-3) }
.closure-layer h4 { margin: 0 0 var(--space-2); font-size: var(--text-xs);
                    color: var(--text-secondary); letter-spacing: .05em }
.closure-layer h4 span { margin-left: var(--space-2); font-family: var(--font-mono) }
.closure-empty { margin: var(--space-2) 0 0; font-size: var(--text-sm); color: var(--text-secondary) }
.closure-list { list-style: none; margin: var(--space-2) 0 0; padding: 0;
                display: grid; gap: var(--space-2) }
.closure-node { padding: var(--space-2); border: 1px solid var(--border-subtle);
                border-radius: var(--radius-sm); background: var(--surface-raised) }
.node-head { display: flex; align-items: baseline; gap: var(--space-3); min-width: 0 }
.distance { margin-left: auto; flex-shrink: 0; font-family: var(--font-mono);
            font-size: var(--text-xs); color: var(--text-secondary) }
.distance.indirect { color: var(--entity-module) }
.badge { flex-shrink: 0; font-size: var(--text-xs); padding: 1px var(--space-2);
         border-radius: var(--radius-full); border: 1px solid var(--entity-module);
         color: var(--text-secondary) }
.node-category { margin: var(--space-1) 0 0; color: var(--text-secondary);
                 overflow-wrap: anywhere }
.path { display: flex; align-items: center; gap: 4px; flex-wrap: wrap;
        margin-top: var(--space-1); font-size: var(--text-xs) }
.path-node { font: inherit; font-family: var(--font-mono); color: var(--entity-component);
             background: none; border: 0; padding: 0; cursor: pointer;
             max-width: 26ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap }
.path-node:hover { text-decoration: underline }
.path-arrow { color: var(--text-secondary); font-family: var(--font-mono) }

.items { list-style: none; margin: var(--space-1) 0 0; padding: 0 }
.items li { display: flex; gap: var(--space-2); align-items: baseline; flex-wrap: wrap;
            padding: 2px var(--space-2); border-left: 2px solid var(--border-subtle) }
.xs { font-size: var(--text-sm); color: var(--text-secondary) }
.mono { font-family: var(--font-mono); font-size: var(--text-sm) }
.dim { color: var(--text-secondary) }

pre { margin: 0; padding: var(--space-3); background: var(--surface-sunken);
      border: 1px solid var(--border-subtle); border-radius: var(--radius-sm);
      font-family: var(--font-mono); font-size: var(--text-sm); color: var(--text-secondary);
      overflow: auto; max-height: 460px; white-space: pre-wrap; word-break: break-all }
</style>
