<script setup>
/* 实体档案的内容本体。整页（Entity.vue）与侧边抽屉（DetailDrawer.vue）共用。

   四个区块，都可折叠，开合状态按区块名记在 localStorage：

     身份     头部 + 面包屑 + 三镜头（全空时整块不显示，不留一排"—"）
     属性     两列表格。**包含未声明的字段**——"没声明"本身是事实，
              直接过滤掉等于让人以为这个字段不存在
     其它声明 record 里没有成列的键，同样表格化。services 的 record 有 29 个键、
              只有 8 个成列，剩下 21 个（permission / caps / apl / critical …）
              过去只在运行单元整页露过面
     关联     由外键元数据生成，反向关联可展开成小表

   列名走 model/columns/*.js 的人话目录并带 ⓘ 说明——
   列表里已经写过一遍，详情里不该退回 `dest_index` 这种字段名。 */
import { computed, ref, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { useDatabase } from '../composables/useDatabase.js'
import { metadata, relationsOf, relatedRows, columnsOf, hasTable, rowSQL } from '../model/metadata.js'
import { elfReachable } from '../model/elfGraph.js'
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
const { isOpen, toggle } = useSections({ record: false })

const row = ref(null)
const relations = ref([])
const trail = ref([])
const expanded = ref(new Set())
const showEmpty = ref(false)
const elfClosures = ref(null)
const closureLimits = ref({ forward: 50, reverse: 50 })

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
  const physical = columnsOf(props.table)
    .filter(c => !INTERNAL.has(c.name) && !fkColumns.value.has(c.name))
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

/* ------------------------------------------------------- ELF 依赖闭包 */
/* 列表仍只算一跳度数；这里在档案打开时做 BFS。两个方向共用一次加载的
   边表/节点缓存，默认只渲染 50 条，避免 libutils 这种 2900+ 反向闭包
   一次性铺满 DOM。 */
const CLOSURE_STEP = 100
const elfClosureSections = computed(() => elfClosures.value ? [
  { key: 'forward', title: '间接依赖', arrow: '→', closure: elfClosures.value.forward },
  { key: 'reverse', title: '间接被依赖', arrow: '←', closure: elfClosures.value.reverse },
] : [])
const closureViews = computed(() => elfClosureSections.value.map(section => {
  const { closure, key } = section
  const direct = closure.nodes.filter(n => n.distance === 1).length
  const indirect = closure.count - direct
  return {
    ...section,
    direct,
    indirect,
    rows: closure.nodes
      .slice(0, closureLimits.value[key])
      .map(node => ({
        ...node,
        path: closure.pathOf(node.id).map(id => ({ id, record: closure.recordOf(id) })),
      })),
  }
}))
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
  elfClosures.value = null; closureLimits.value = { forward: 50, reverse: 50 }
  if (!store.dbLoaded || !hasTable(props.table)) return
  row.value = rawQuery(rowSQL(props.table), [props.id])[0] || null
  if (!row.value) return
  relations.value = relationsOf(props.table, row.value, store.scanId)
  trail.value = trailOf(props.table, row.value)
  if (props.table === 'elf_modules') {
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
  <div v-else-if="!hasTable(table)" class="empty">本次扫描没有 <code>{{ table }}</code> 这张表</div>
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

    <FoldSection class="a-props" title="属性" :count="fields.length" :open="isOpen('props')"
                 @toggle="toggle('props')">
      <FieldTable :fields="fields" :compact="compact" :links="componentLink"
                  @go="to => router.push(to)" />
      <button v-if="emptyCount" class="more" @click="showEmpty = !showEmpty">
        {{ showEmpty ? '收起未声明的字段' : `还有 ${emptyCount} 个字段未声明，展开看` }}
      </button>
    </FoldSection>

    <FoldSection v-if="recordExtras.length" class="a-extras" title="其它声明" :count="recordExtras.length"
                 hint="原始声明里未成列的字段" :open="isOpen('extras')" @toggle="toggle('extras')">
      <FieldTable :fields="recordExtras" :compact="compact" />
    </FoldSection>

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

    <FoldSection v-if="elfClosures" class="a-closure" title="依赖闭包"
                 :count="elfClosureIndirectTotal" hint="按需 BFS，不落库"
                 :open="isOpen('closure')" @toggle="toggle('closure')">
      <div v-for="view in closureViews" :key="view.key" class="closure">
        <div class="closure-head">
          <h3>{{ view.title }}</h3>
          <span class="closure-summary">
            间接 {{ view.indirect }} · 直接 {{ view.direct }} · 闭包 {{ view.closure.count }}
          </span>
        </div>
        <ul class="closure-list">
          <li v-for="node in view.rows" :key="`${view.key}-${node.id}`" class="closure-node">
            <div class="node-head">
              <button class="link" :title="closureTitle(node)"
                      @click="go('elf_modules', node.id)">{{ closureTitle(node) }}</button>
              <span v-if="node.api_type" class="badge"
                    :title="`API 类型：${apiTypeLabel(node.api_type)}`">
                {{ apiTypeLabel(node.api_type) }}
              </span>
              <span class="distance" :class="{ indirect: node.distance > 1 }">
                {{ node.distance }} 跳
              </span>
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
        <button v-if="view.closure.count > closureLimits[view.key]" class="more"
                @click="showMoreClosure(view.key)">
          显示 {{ closureLimits[view.key] }} / {{ view.closure.count }} 条，再显示 {{ CLOSURE_STEP }} 条
        </button>
      </div>
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

/* 整页：头部通栏 + 下面两栏。抽屉（compact）不受影响，仍是纵向单栏。

   抽屉与整页服务的动作不同——抽屉是"扫一眼就走"、旁边还有列表要继续点；
   整页是"读完、对照、复制"、没有别的东西要让位。所以不该共用一套纵向单栏，
   那等于让整页迁就抽屉（实测 1760px 视口下整页只用了 940px，浪费 47%）。
   见 docs/dossier-layout.md §2。

   用 grid-template-areas 而不是两个 div：区块缺席（比如没有"其它声明"）
   不会留下空洞，也不必为整页另写一套模板——另写必然两边长歪。 */
@media (min-width: 1180px) {
  .dossier:not(.compact) {
    display: grid; column-gap: var(--space-6);
    grid-template-columns: minmax(0, 1.3fr) minmax(0, 1fr);
    grid-template-areas:
      'trail  trail'
      'head   head'
      'lens   lens'
      'props  rel'
      'extras rel'
      'closure closure'
      'record record';
    align-content: start;
  }
  .dossier:not(.compact) > .a-trail  { grid-area: trail }
  .dossier:not(.compact) > .a-head   { grid-area: head }
  .dossier:not(.compact) > .a-lens   { grid-area: lens }
  .dossier:not(.compact) > .a-props  { grid-area: props }
  .dossier:not(.compact) > .a-extras { grid-area: extras }
  .dossier:not(.compact) > .a-rel    { grid-area: rel; align-self: start }
  .dossier:not(.compact) > .a-closure { grid-area: closure }
  .dossier:not(.compact) > .a-record { grid-area: record }
  /* 两栏下第一个区块不要再叠一层上边距 */
  .dossier:not(.compact) > .a-rel.fs { margin-top: 0 }
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
.closure + .closure { margin-top: var(--space-4) }
.closure-head { display: flex; align-items: baseline; gap: var(--space-3); flex-wrap: wrap }
.closure-head h3 { margin: 0; font-size: var(--text-sm); color: var(--text-primary) }
.closure-summary { font-size: var(--text-sm); color: var(--text-secondary);
                    font-variant-numeric: tabular-nums }
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
