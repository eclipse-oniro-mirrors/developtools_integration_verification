<script setup>
/* 质量与治理：过程性的，随治理收敛。见 docs/ux-design.md §8

   一条问题码点开后是解释 + 实例清单，走侧边抽屉而不是展开在下方——
   列表在上、详情在下的版式，点到第三条就得把前两条的位置重新找一遍。 */
import { computed, ref, watch } from 'vue'
import { useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { useDatabase } from '../composables/useDatabase.js'
import { useQueryState } from '../composables/useQueryState.js'
import { useScrollMemory } from '../composables/useScrollMemory.js'
import { explain, CATEGORIES } from '../model/issues.js'
import SideDrawer from '../components/SideDrawer.vue'
import PathChip from '../components/PathChip.vue'
import Icon from '../ui/Icon.vue'

const store = useViewerStore()
const router = useRouter()
const { rawQuery } = useDatabase()
const scroller = ref(null)
useScrollMemory(scroller)

/* 展开的是哪一条问题码进 URL——"这条你看下"可以直接贴链接 */
const open = useQueryState('issue', '')

const rows = ref([])
const owners = ref(new Map())      // 部件名 -> { id, subsystem, repo }
const partsOf = ref(new Map())     // 'collector/code' -> [部件名]

const SEVERITY = { error: '错误', warning: '警告', info: '提示' }
const LIMIT = 200
const keyOf = r => `${r.collector}/${r.code}`

/* 一次性把"每条问题码涉及哪些部件"查出来。
   原先是在模板里按行查，渲染一次就是十几条 DISTINCT 查询。 */
function indexOwners(id) {
  const byName = new Map()
  for (const c of rawQuery(
    `SELECT c.id, c.name, c.subsystem, r.name AS repo FROM components c
       LEFT JOIN repos r ON r.id = c.repo_id WHERE c.scan_id = ?`, [id])) {
    byName.set(c.name, c)
  }
  const byCode = new Map()
  for (const r of rawQuery(
    `SELECT collector, code, component FROM issues
      WHERE scan_id = ? AND component != '' GROUP BY collector, code, component`, [id])) {
    const key = `${r.collector}/${r.code}`
    if (!byCode.has(key)) byCode.set(key, [])
    byCode.get(key).push(r.component)
  }
  return [byName, byCode]
}

const scanLevel = computed(() => rows.value.filter(r => !r.advisory))
const advisory = computed(() => rows.value.filter(r => r.advisory))
const groupOf = cat => (cat === 'scan' ? scanLevel.value : advisory.value)
const total = g => g.reduce((s, r) => s + r.n, 0)

/* 一眼看出该找谁：涉及几个部件、几个仓 */
function who(row) {
  const parts = partsOf.value.get(keyOf(row)) || []
  if (!parts.length) return ''
  const repos = new Set(parts.map(p => owners.value.get(p)?.repo).filter(Boolean))
  return repos.size ? `${parts.length} 部件 / ${repos.size} 仓` : `${parts.length} 部件`
}

/* 解释文本里用 **…** 标出"谁为准"这类关键判断。
   文本全部来自 model/issues.js 这张常量表，没有任何外部输入；
   仍然先转义再替换，不给将来留口子。 */
const esc = s => s.replace(/[&<>"]/g, c =>
  ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c]))
const bold = text => esc(text).replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')

/* ------------------------------------------------------------------ 抽屉 */
const current = computed(() =>
  (open.value ? rows.value.find(r => keyOf(r) === open.value) : null) || null)
const meta = computed(() => (current.value ? explain(current.value.code) : null))

const affected = computed(() =>
  (partsOf.value.get(open.value) || [])
    .map(p => owners.value.get(p)).filter(Boolean)
    .sort((a, b) => a.name.localeCompare(b.name)))

const items = computed(() => {
  if (!current.value || !store.scanId) return []
  return rawQuery(
    `SELECT path, pointer, component, details FROM issues
      WHERE scan_id = ? AND collector = ? AND code = ? ORDER BY path, pointer LIMIT ?`,
    [store.scanId, current.value.collector, current.value.code, LIMIT])
})

/* details 是 JSON：摊成 k=v 小块，比甩一坨原文好读。
   值可能是数组或对象（declarations 会列出全部声明位置）。 */
function facts(raw) {
  if (!raw) return []
  let obj
  try { obj = JSON.parse(raw) } catch { return [{ k: '', v: raw }] }
  if (!obj || typeof obj !== 'object') return [{ k: '', v: String(obj) }]
  return Object.entries(obj).map(([k, v]) => ({
    k, v: v == null ? '—' : typeof v === 'object' ? JSON.stringify(v) : String(v),
  }))
}

const select = row => { open.value = open.value === keyOf(row) ? '' : keyOf(row) }

/* 部件 chip 默认只露一屏的量：实例列表才是要动手的东西，
   30 个 chip 能把它整个挤出可视区 */
const CHIPS = 12
const allParts = ref(false)
watch(open, () => { allParts.value = false })
const shownParts = computed(() =>
  allParts.value ? affected.value : affected.value.slice(0, CHIPS))

/* immediate 的 watch 放文件末尾（§14.9） */
watch(() => store.scanId, id => {
  rows.value = id ? rawQuery(
    `SELECT collector, code, severity, advisory, COUNT(*) n
       FROM issues WHERE scan_id = ? GROUP BY collector, code, severity, advisory
      ORDER BY advisory,
               CASE severity WHEN 'error' THEN 0 WHEN 'warning' THEN 1 ELSE 2 END,
               n DESC`, [id]) : []
  const [byName, byCode] = id ? indexOwners(id) : [new Map(), new Map()]
  owners.value = byName
  partsOf.value = byCode
}, { immediate: true })
</script>

<template>
  <div ref="scroller" class="findings">
    <h1>质量与治理</h1>
    <p class="lede">
      这些是<strong>当前扫描暴露出的不一致</strong>，会随治理逐步收敛——因此它不在首页。
      点开任意一条，可以看到它是什么意思、要不要管、该找谁。
    </p>

    <p v-if="!store.dbLoaded" class="hint">请先加载数据库</p>
    <template v-else>
      <section v-for="cat in ['scan', 'advisory']" :key="cat">
        <h2>
          {{ CATEGORIES[cat].label }}
          <span class="n">{{ total(groupOf(cat)) }}</span>
          <span v-if="cat === 'advisory'" class="tag">advisory</span>
        </h2>
        <p class="sub">{{ CATEGORIES[cat].lede }}</p>
        <p class="body" v-html="bold(CATEGORIES[cat].body)" />

        <p v-if="!groupOf(cat).length" class="good">
          <Icon name="check" :size="15" />
          本次扫描{{ cat === 'scan' ? '没有读取层问题' : '未发现不一致' }}
        </p>
        <button v-for="r in groupOf(cat)" :key="keyOf(r)"
                class="row" :class="{ on: open === keyOf(r) }"
                :aria-expanded="open === keyOf(r)" @click="select(r)">
          <span class="sev" :class="r.severity" />
          <span class="names">
            <span class="what">{{ explain(r.code).title }}</span>
            <span class="code mono">{{ r.code }}</span>
          </span>
          <span v-if="who(r)" class="who">{{ who(r) }}</span>
          <span class="from">{{ r.collector }}</span>
          <span class="cnt">{{ r.n }}</span>
        </button>
      </section>
    </template>

    <SideDrawer :open="!!current" tag="问题说明" width="520px" @close="open = ''">
      <template v-if="current && meta">
        <header class="dhead">
          <span class="sev" :class="current.severity" />
          <div class="dnames">
            <h3>{{ meta.title }}</h3>
            <p class="code mono">{{ current.code }}</p>
          </div>
        </header>

        <ul class="badges">
          <li :class="current.severity">{{ SEVERITY[current.severity] || current.severity }}</li>
          <li>{{ current.advisory ? '数据一致性' : '扫描层' }}</li>
          <li class="mono">{{ current.collector }}</li>
          <li><b>{{ current.n }}</b> 处</li>
        </ul>

        <dl class="why">
          <dt>这是什么</dt><dd>{{ meta.what }}</dd>
          <dt>为什么要管</dt><dd v-html="bold(meta.why)" />
          <dt>怎么处理</dt><dd v-html="bold(meta.fix)" />
        </dl>
        <p v-if="!meta.exact" class="guess">
          这条码还没有逐条登记，以上是按码名归类给出的通用说明。
        </p>

        <template v-if="affected.length">
          <h4>涉及 {{ affected.length }} 个部件</h4>
          <ul class="parts">
            <li v-for="p in shownParts" :key="p.name">
              <button class="part" :title="`${p.subsystem || '—'} · 仓 ${p.repo || '—'}`"
                      @click="router.push(`/e/components/${p.id}`)">{{ p.name }}</button>
            </li>
            <li v-if="affected.length > CHIPS" class="more">
              <button class="part" @click="allParts = !allParts">
                {{ allParts ? '收起' : `还有 ${affected.length - CHIPS} 个` }}
              </button>
            </li>
          </ul>
        </template>

        <h4>
          实例
          <span class="dim">{{ current.n > LIMIT ? `前 ${LIMIT} 条，共 ${current.n}` : `${current.n} 条` }}</span>
        </h4>
        <ul class="items">
          <li v-for="(i, k) in items" :key="k">
            <PathChip :path="i.path" :max="56" />
            <span v-if="i.pointer" class="ptr mono">{{ i.pointer }}</span>
            <button v-if="i.component" class="comp" :disabled="!owners.get(i.component)"
                    @click="owners.get(i.component) &&
                            router.push(`/e/components/${owners.get(i.component).id}`)">
              {{ i.component }}
            </button>
            <span v-for="f in facts(i.details)" :key="f.k" class="fact mono">
              <template v-if="f.k">{{ f.k }}=</template>{{ f.v }}
            </span>
          </li>
        </ul>
      </template>
    </SideDrawer>
  </div>
</template>

<style scoped>
.findings { height: 100%; overflow: auto; padding: var(--space-5); max-width: 920px }
h1 { margin: 0 0 var(--space-2); font-size: var(--text-xl); font-weight: 600 }
.lede { margin: 0 0 var(--space-6); font-size: var(--text-base); color: var(--text-secondary) }
.lede strong { color: var(--text-primary) }
section { margin-bottom: var(--space-6) }
h2 { margin: 0; font-size: var(--text-lg); font-weight: 600 }
h2 .n { font-family: var(--font-mono); color: var(--text-secondary); margin-left: var(--space-2) }
.tag {
  font-size: var(--text-xs); color: var(--text-secondary); border: 1px solid var(--border-default);
  border-radius: var(--radius-full); padding: 1px var(--space-2); margin-left: var(--space-2);
  vertical-align: middle;
}
.sub { margin: var(--space-1) 0 0; font-size: var(--text-sm); color: var(--text-secondary) }
.body { margin: var(--space-1) 0 var(--space-3); font-size: var(--text-sm); color: var(--text-secondary);
        max-width: 68ch; line-height: var(--leading-base) }
.body :deep(strong) { color: var(--text-primary); font-weight: 600 }
.good { display: flex; align-items: center; gap: var(--space-2); color: var(--entity-sa);
        font-size: var(--text-base) }

.row {
  display: flex; align-items: center; gap: var(--space-3); width: 100%;
  padding: var(--space-2) var(--space-3); margin-bottom: 2px; text-align: left; font: inherit;
  background: var(--surface-raised); border: 1px solid var(--border-subtle);
  border-radius: var(--radius-sm); cursor: pointer;
}
.row:hover { background: var(--surface-overlay) }
.row.on { background: var(--surface-overlay); border-color: var(--border-strong) }
.sev { width: 3px; align-self: stretch; border-radius: 2px; background: var(--severity-advisory) }
.sev.error { background: var(--severity-error) }
.sev.warning { background: var(--severity-warning) }
.sev.info { background: var(--severity-info) }
.names { flex: 1; min-width: 0; display: flex; flex-direction: column }
.what { font-size: var(--text-base); color: var(--text-primary) }
/* 行内文字一律 secondary 起步，不用 tertiary：选中/悬停时行底色会变成
   overlay，tertiary 在浮层上只有 4.07:1（tokens.css 已注明"浮层上改用 secondary"）。 */
.code { font-family: var(--font-mono); font-size: var(--text-xs); color: var(--text-secondary) }
.from { font-size: var(--text-sm); color: var(--text-secondary) }
.who { font-size: var(--text-sm); color: var(--text-secondary) }
.cnt { font-family: var(--font-mono); font-size: var(--text-base); color: var(--text-secondary);
       min-width: 40px; text-align: right }

/* ------------------------------------------------------------- 抽屉内部 */
.dhead { display: flex; gap: var(--space-3); align-items: stretch; margin-bottom: var(--space-3) }
.dhead .sev { width: 3px; border-radius: 2px }
.dnames h3 { margin: 0; font-size: var(--text-lg); font-weight: 600; color: var(--text-primary) }
.dnames .code { display: block; margin: 2px 0 0; font-size: var(--text-sm) }

.badges { display: flex; flex-wrap: wrap; gap: var(--space-2); list-style: none;
          margin: 0 0 var(--space-4); padding: 0 }
.badges li {
  font-size: var(--text-xs); color: var(--text-secondary); padding: 2px var(--space-2);
  background: var(--surface-raised); border: 1px solid var(--border-subtle);
  border-radius: var(--radius-full);
}
.badges li.error { color: var(--severity-error);
                   border-color: color-mix(in srgb, var(--severity-error) 45%, transparent) }
.badges li.warning { color: var(--severity-warning);
                     border-color: color-mix(in srgb, var(--severity-warning) 45%, transparent) }
.badges b { font-family: var(--font-mono); color: var(--text-primary) }

.why { margin: 0 0 var(--space-4) }
.why dt {
  margin-top: var(--space-3); font-size: var(--text-xs); color: var(--text-tertiary);
  text-transform: uppercase; letter-spacing: .06em;
}
.why dd { margin: var(--space-1) 0 0; font-size: var(--text-base); color: var(--text-secondary);
          line-height: var(--leading-base) }
.why dd :deep(strong) { color: var(--text-primary); font-weight: 600 }
.guess { margin: 0 0 var(--space-4); font-size: var(--text-sm); color: var(--text-tertiary) }

h4 { margin: var(--space-5) 0 var(--space-2); font-size: var(--text-sm); font-weight: 600;
     color: var(--text-tertiary); text-transform: uppercase; letter-spacing: .06em }
h4 .dim { text-transform: none; letter-spacing: 0; font-weight: 400; margin-left: var(--space-2) }

.parts { list-style: none; margin: 0; padding: 0; display: flex; flex-wrap: wrap; gap: var(--space-1) }
.parts li {
  padding: 2px var(--space-2); background: var(--surface-raised);
  border: 1px solid var(--border-subtle); border-radius: var(--radius-full);
}
.parts li.more { border-style: dashed }
.part { font: inherit; font-size: var(--text-sm); color: var(--entity-component);
        background: none; border: 0; padding: 0; cursor: pointer }
.part:hover { text-decoration: underline }
.more .part { color: var(--text-secondary) }

.items { list-style: none; margin: 0; padding: 0 }
.items li {
  display: flex; flex-wrap: wrap; gap: var(--space-1) var(--space-2); align-items: baseline;
  padding: var(--space-2) var(--space-3); margin-bottom: 2px;
  border-left: 2px solid var(--border-subtle); font-size: var(--text-sm);
}
.items li:hover { background: var(--surface-raised) }
.ptr { color: var(--text-tertiary) }
.comp { font: inherit; font-size: var(--text-sm); color: var(--entity-component);
        background: none; border: 0; padding: 0; cursor: pointer }
.comp:hover:not(:disabled) { text-decoration: underline }
.comp:disabled { color: var(--text-secondary); cursor: default }
.fact {
  font-size: var(--text-xs); color: var(--text-secondary);
  background: var(--surface-sunken); border-radius: var(--radius-sm); padding: 0 var(--space-1);
  overflow-wrap: anywhere;
}
.mono { font-family: var(--font-mono) }
.dim { color: var(--text-tertiary) }
.hint { color: var(--text-secondary) }
</style>
