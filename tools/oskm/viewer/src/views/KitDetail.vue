<!-- Kit 详情。布局照部件详情页。

     一个 Kit 的"成员"有两条互不相同的来路，这一页的主要工作就是把它们摆开：
       模块自己在文件头写 @kit X   → declared_membership
       X 的入口文件 import 了模块  → entry_reference
     两边的差集不是数据缺陷，是真实结论，所以单独算、单独显示。

     label_only 的 Kit 没有入口文件，"入口"页恒为空。那种情况改问
     "它在哪里被提到过"——这是采集侧已识别的表达缺口的前端补法。 -->
<script setup>
import { ref, computed, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { loadArktsKitDetail } from '../model/lists.js'
import { humanBytes } from '../model/fields.js'
import MissingTable from '../components/MissingTable.vue'
import Icon from '../ui/Icon.vue'

const route = useRoute()
const router = useRouter()
const store = useViewerStore()

const id = computed(() => route.params.id)
const data = ref(null)
watch(() => [store.scanId, id.value, store.tables], () => {
  data.value = store.hasTable('arkts_kits')
    ? loadArktsKitDetail(store.scanId, id.value) : null
}, { immediate: true, deep: true })

const k = computed(() => data.value || {})
const backed = computed(() => k.value.origin === 'entry_backed')

/* 两条路径的并集与差集。差集本身就是结论，所以在这里算好，
   不要求使用者自己把两张表对着看。 */
const declaredIds = computed(() => new Set((k.value.declared || []).map(r => r.id)))
const importedIds = computed(() => new Set((k.value.imported || []).map(r => r.id)))
const union = computed(() => {
  const byId = new Map()
  for (const r of (k.value.declared || [])) byId.set(r.id, r)
  for (const r of (k.value.imported || [])) byId.set(r.id, r)
  return [...byId.values()].sort((a, b) => a.module_key.localeCompare(b.module_key))
})
const both = computed(() => union.value.filter(r => declaredIds.value.has(r.id) && importedIds.value.has(r.id)).length)
const onlyDeclared = computed(() => union.value.filter(r => declaredIds.value.has(r.id) && !importedIds.value.has(r.id)).length)
const onlyImported = computed(() => union.value.filter(r => !declaredIds.value.has(r.id) && importedIds.value.has(r.id)).length)
function memberRoute(r) {
  if (declaredIds.value.has(r.id) && importedIds.value.has(r.id)) return '两者'
  return declaredIds.value.has(r.id) ? '仅标签' : '仅引用'
}

const tab = computed({
  get: () => String(route.query.tab || 'basic'),
  set: v => router.replace({ path: route.path, query: { ...route.query, tab: v } }),
})
const TABS = computed(() => [
  { key: 'basic', label: '基本信息' },
  { key: 'entry', label: backed.value ? '入口文件' : '被提及的文件',
    n: (k.value.entries?.length || k.value.mentionedIn?.length) ?? 0 },
  { key: 'members', label: '成员模块', n: union.value.length },
  { key: 'evidence', label: '引用证据', n: k.value.references?.length ?? 0 },
])
watch(TABS, ts => {
  const cur = ts.find(t => t.key === tab.value)
  if (cur && cur.n === 0) tab.value = 'basic'
}, { flush: 'post' })

const KIND = { napi: 'NAPI', arkui: 'ArkUI', arkts_builtin: 'ArkTS 内置',
               arkts_language: '语言特性', type_only: '纯类型', unknown: '未知' }
const RESOLUTION = {
  resolved: '唯一命中', ambiguous: '多个模块同名，采集器不猜',
  not_found: '名字合法但 SDK 里没有', out_of_scope: '指向外部包或另一个 Kit，本就不解析',
  unsupported: '语法不支持或路径非法',
}
const unresolved = computed(() => (k.value.references || []).filter(r => r.resolution_status !== 'resolved'))
/* 引用条数 ≠ 模块数：同一个模块常在 if arkts static / dynamic 两个分支里各
   import 一次。AbilityKit 实测 188 条引用只指向 104 个模块——不写清楚，
   188 会被当成成员数。 */
const refModules = computed(() =>
  new Set((k.value.references || []).map(r => r.module_id).filter(Boolean)).size)

const goBack = () => router.push('/sdk/kits')
const open = (table, entityId) => { if (entityId) router.push({ path: `/e/${table}/${entityId}` }) }
</script>

<template>
<MissingTable v-if="store.dbLoaded && !store.hasTable('arkts_kits')"
              table="arkts_kits" collector="arkts" what="Kit" />
<div v-else-if="!data" class="cd-page"><p class="cd-empty">没有这条记录</p></div>
<div v-else class="cd-page">
  <nav class="cd-trail" aria-label="所属">
    <button class="cd-crumb-back" @click="goBack">← Kit</button>
    <span class="cd-sep" aria-hidden="true">›</span>
    <span class="cd-crumb-here mono">{{ k.name }}</span>
  </nav>

  <header class="cd-header">
    <Icon name="box" :size="22" class="hicon" />
    <div class="grow">
      <h1>{{ k.name }}</h1>
      <p class="cd-sub mono">{{ k.kit_key }}</p>
      <p class="tags">
        <span class="tag">{{ backed ? '有入口文件' : '仅标签分组' }}</span>
        <span class="tag">{{ union.length }} 个成员模块</span>
        <span v-if="unresolved.length" class="tag bad">{{ unresolved.length }} 条引用未解析</span>
      </p>
    </div>
    <span class="tag type">Kit</span>
  </header>

  <div class="tabs" role="tablist" aria-label="Kit 详情">
    <button v-for="t in TABS" :key="t.key" role="tab" :aria-selected="tab === t.key"
            class="chip" :class="{ on: tab === t.key }"
            :disabled="t.n === 0" @click="tab = t.key">
      {{ t.label }}<span v-if="t.n != null" class="n">{{ t.n }}</span>
    </button>
  </div>

  <!-- ════════ 基本信息 ════════ -->
  <section v-show="tab === 'basic'" class="pane">
    <div class="card">
      <h2>身份</h2>
      <dl class="kv">
        <dt>Kit 键<span class="hint">业务键。有入口时是 @kit.X，没入口时是 label:&lt;原标签&gt;</span></dt>
        <dd class="mono">{{ k.kit_key }}</dd>

        <dt>展示名<span class="hint">去掉前缀后的名字，内部空格与大小写按原样保留</span></dt>
        <dd>{{ k.name }}</dd>

        <dt>可 import 名<span class="hint">能写进 import 语句的名字</span></dt>
        <dd>
          <code v-if="k.import_name">{{ k.import_name }}</code>
          <span v-else class="dim">没有——这个分组<strong>没有被定义过</strong>，
            只是某个模块头上写了个对不上任何入口的标签。</span>
        </dd>

        <dt>来源<span class="hint">这个 Kit 是怎么被发现的</span></dt>
        <dd>
          {{ backed ? '入口文件（entry_backed）' : '仅标签（label_only）' }}
          <span class="hint">
            <template v-if="backed">SDK 里有一份 <code>@kit.X.d.ts</code> 入口文件，
              它 import 了这个 Kit 的全部成员。</template>
            <template v-else>SDK 里<strong>没有</strong>对应的入口文件。
              能给出的最好答案是"它在哪里被提到过"，见隔壁页。</template>
          </span>
        </dd>
      </dl>
    </div>

    <div class="card">
      <h2>成员构成</h2>
      <p class="dim">同一个 Kit 的成员有两条来路，这里是它们的交叉结果。</p>
      <dl class="kv">
        <dt>成员模块合计<span class="hint">两条路径的并集</span></dt>
        <dd>{{ union.length }} 个</dd>
        <dt>两边都有<span class="hint">模块写了 @kit 标签，入口也 import 了它。证据最充分</span></dt>
        <dd>{{ both }} 个</dd>
        <dt>仅有标签<span class="hint">模块声称属于这个 Kit，但入口没 import 它</span></dt>
        <dd>{{ onlyDeclared }} 个</dd>
        <dt>仅被引用<span class="hint">入口 import 了它，但模块文件头没写 @kit 标签</span></dt>
        <dd>{{ onlyImported }} 个</dd>
      </dl>
      <p class="hint">后两类<strong>不是数据缺陷</strong>：标签是模块的自我声明，
        import 是入口的实际组成，两者本来就可能不同步。把它们合并成一个数字会把
        "谁说的"抹掉。</p>
    </div>
  </section>

  <!-- ════════ 入口 / 被提及 ════════ -->
  <section v-show="tab === 'entry'" class="pane">
    <div v-if="k.entries?.length" class="card">
      <h2>入口文件 <span class="n">{{ k.entries.length }}</span></h2>
      <p class="dim">定义这个 Kit 的文件。它的 import 清单就是 Kit 的实际组成。</p>
      <table class="ev">
        <thead>
          <tr>
            <th>路径</th>
            <th>语言版本<span class="q" title=".static.d.ets 是 ArkTS 1.2，其余是 1.1">ⓘ</span></th>
            <th>大小</th>
            <th>文件头<span class="q" title="ok=读完且有确认的 @kit；no_tag=读完但没标签；failed=没读成。后两者含义完全不同">ⓘ</span></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="f in k.entries" :key="f.id">
            <td>
              <button class="link mono" @click="open('arkts_sources', f.id)">{{ f.source_path }}</button>
              <a v-if="f.source_url" class="extlink" :href="f.source_url" target="_blank"
                 rel="noopener" title="在代码托管平台打开"> ↗</a>
            </td>
            <td>{{ f.language_variant === 'static' ? '1.2 静态' : '1.1 动态' }}</td>
            <td class="dim">{{ f.byte_size != null ? humanBytes(f.byte_size) : '—' }}</td>
            <td class="dim">{{ f.header_status }}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <div v-else-if="k.mentionedIn?.length" class="card">
      <h2>被提及的文件 <span class="n">{{ k.mentionedIn.length }}</span></h2>
      <p class="dim">这个分组<strong>没有入口文件</strong>。下面是写了这个标签的模块声明文件——
        数据到得了，但它不是"定义"，只是"提及"。</p>
      <table class="ev">
        <thead><tr><th>文件</th><th>所属模块</th></tr></thead>
        <tbody>
          <tr v-for="f in k.mentionedIn" :key="f.id">
            <td><button class="link mono" @click="open('arkts_sources', f.id)">{{ f.source_path }}</button></td>
            <td>
              <button v-if="f.module_id" class="link mono" @click="open('arkts_modules', f.module_id)">
                {{ f.module_key }}</button>
              <span v-else class="dim">—</span>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>

  <!-- ════════ 成员模块 ════════ -->
  <section v-show="tab === 'members'" class="pane">
    <div class="card">
      <h2>成员模块 <span class="n">{{ union.length }}</span></h2>
      <p class="dim">"来路"一列说明这个成员关系是谁断言的。</p>
      <table class="ev">
        <thead>
          <tr>
            <th>模块</th>
            <th>来路<span class="q" title="两者=模块写了 @kit 标签且入口 import 了它；仅标签=只有模块自我声明；仅引用=只有入口 import，模块没写标签">ⓘ</span></th>
            <th>可 import 名</th>
            <th>实现方式<span class="q" title="由什么实现：NAPI 原生库 / ArkUI 引擎 / 语言内置 / 纯类型 / 未知">ⓘ</span></th>
            <th>语言版本<span class="q" title="dynamic=只有 1.1；static=只有 1.2；both=两份声明都有">ⓘ</span></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="r in union" :key="r.id">
            <td><button class="link mono" @click="open('arkts_modules', r.id)">{{ r.module_key }}</button></td>
            <td><span class="pill" :class="memberRoute(r) === '两者' ? 'ok' : 'partial'">{{ memberRoute(r) }}</span></td>
            <td class="mono dim">{{ r.module_name || '—' }}</td>
            <td class="dim">{{ KIND[r.implementation_kind] || r.implementation_kind }}</td>
            <td class="dim">{{ r.language_coverage }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>

  <!-- ════════ 引用证据 ════════ -->
  <section v-show="tab === 'evidence'" class="pane">
    <div v-if="unresolved.length" class="card note">
      <h2>{{ unresolved.length }} 条引用没有解析到模块</h2>
      <p class="dim">"没解析到"有四种完全不同的原因，不要都当成缺陷——
        指向外部包（<code>out_of_scope</code>）本来就不该解析。逐条见"解析"列。</p>
    </div>
    <div class="card">
      <h2>入口里的引用 <span class="n">{{ k.references?.length ?? 0 }}</span></h2>
      <p class="dim">入口文件里每一条 import / 带来源的 export，一行一条，带位置与条件。
        <strong>条数不等于模块数</strong>：{{ k.references?.length ?? 0 }} 条引用指向
        {{ refModules }} 个模块，同一个模块常在 <code>if arkts static</code> 和
        <code>dynamic</code> 两个分支里各写一次。</p>
      <table class="ev">
        <thead>
          <tr>
            <th>目标<span class="q" title="解析成功时显示模块键并可点进去；失败时显示原始 specifier">ⓘ</span></th>
            <th>语句<span class="q" title="import_from 是 import … from；export_from 是带来源的 re-export">ⓘ</span></th>
            <th>位置<span class="q" title="行:列，1 起算">ⓘ</span></th>
            <th>适用模式<span class="q" title="来自语句所在的 if arkts static / dynamic 条件块。与文件后缀无关">ⓘ</span></th>
            <th>解析<span class="q" title="这个 specifier 有没有对上一个模块，以及是怎么对上的">ⓘ</span></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="e in k.references" :key="e.id">
            <td>
              <button v-if="e.module_id" class="link mono" @click="open('arkts_modules', e.module_id)">
                {{ e.module_key }}</button>
              <span v-else class="mono">{{ e.target_text }}</span>
            </td>
            <td class="dim">{{ e.statement_kind }}</td>
            <td class="mono dim">{{ e.line }}:{{ e.column }}</td>
            <td class="dim">{{ e.condition_state }}</td>
            <td>
              <span :title="RESOLUTION[e.resolution_status] || ''">
                {{ e.resolution_status === 'resolved' ? '已解析' : (RESOLUTION[e.resolution_status] || e.resolution_status) }}</span>
              <span v-if="e.resolution_method" class="dim"> · {{ e.resolution_method }}</span>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
</div>
</template>

<style scoped>
@import '../styles/detail-view.css';
.hicon { color: var(--entity-component); flex-shrink: 0; margin-top: 4px }
.tag.type { flex-shrink: 0; border: 1px solid var(--border-default); background: none }
.note { background: var(--surface-sunken) }
.pill { padding: 1px 8px; border-radius: var(--radius-full); font-size: var(--text-xs);
  background: var(--surface-default); color: var(--text-secondary) }
.pill.ok { color: var(--text-primary) }
</style>
