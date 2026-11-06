<!-- 声明文件详情：整页，不走抽屉。

     一份声明文件承载的东西比抽屉能摊开的多——文件事实、它声明的实体、
     同模块的另一语言版本、以及文件内逐条的关系证据（带行列与原文）。
     分子 tab 而不是一路向下堆，是因为"证据"那一段在 Kit 入口上可达数十条。 -->
<script setup>
import { ref, computed, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { loadArktsSourceDetail, capText, conditionText } from '../model/lists.js'
import { fileSource } from '../model/gitlink.js'
import { humanBytes } from '../model/fields.js'
import MissingTable from '../components/MissingTable.vue'
import Icon from '../ui/Icon.vue'

const route = useRoute()
const router = useRouter()
const store = useViewerStore()

const id = computed(() => route.params.id)
const data = ref(null)
watch(() => [store.scanId, id.value, store.tables], () => {
  data.value = store.hasTable('arkts_sources')
    ? loadArktsSourceDetail(store.scanId, id.value) : null
}, { immediate: true, deep: true })

const s = computed(() => data.value || {})
const name = computed(() => (s.value.source_path || '').split('/').pop() || '—')
const src = computed(() => fileSource(store.scanId, s.value.source_path))

/* tab 走 URL，刷新和贴链接都还在原处（url-spec §2：能回到的状态进 URL） */
const tab = computed({
  get: () => String(route.query.tab || 'facts'),
  set: v => router.replace({ path: route.path, query: { ...route.query, tab: v } }),
})

const membership = computed(() =>
  (s.value.evidence || []).filter(e => e.relation_type === 'declared_membership'))
const references = computed(() =>
  (s.value.evidence || []).filter(e => e.relation_type === 'entry_reference'))

const TABS = computed(() => [
  { key: 'facts', label: '文件事实' },
  { key: 'declares', label: '声明的实体' },
  { key: 'evidence', label: '关系证据', n: (s.value.evidence || []).length },
])

/* 读取/文件头状态的人话。空值与失败是两回事，各自说清楚。 */
const READ = {
  ok: '读取成功', encoding_failed: '不是合法 UTF-8，内容未解析',
  unreadable: '无法读取', limit_exceeded: '超出单文件大小预算', path_invalid: '路径不合法',
}
const HEADER = {
  ok: '读完且有确认的 @kit 归属', no_tag: '读完，没有归属标签',
  partial: '只有孤立标签或头部结构有问题', failed: 'IO/解码失败，头部未处理',
}
/* 四个提取能力各自跑成什么样。模块声明不请求后两项，所以是"未请求"——
   那是"没分析正文"，不是"分析过且没有引用"。 */
const CAPS = [
  ['file.header', '文件头', '版权注释 + JSDoc 区域，@kit 归属标签从这里来'],
  ['kit.references', '顶层引用', 'Kit 入口的 import / 带来源的 export'],
  ['condition.top_level', '顶层条件', '语句之间的 /*** if arkts … */ 标记'],
  ['source.utf8_spans', '字节位置', 'UTF-16 → UTF-8 的位置换算，所有跨度都靠它'],
]
const CAP_STATE = {
  complete: '完整执行', partial: '只接受了部分可靠事实', failed: '失败',
  unsupported: '该前端不具备此能力', not_requested: '未请求（本角色不分析这一项）',
}
const coverage = computed(() => {
  const v = s.value.coverage || {}
  return CAPS.filter(([k]) => k in v).map(([k, label, hint]) =>
    ({ key: k, label, hint, state: CAP_STATE[v[k]] || v[k] }))
})
const conditions = computed(() => conditionText(s.value.condition_evidence ?? []))
const goBack = () => router.push('/sdk/declarations')
const open = (table, entityId) => { if (entityId) router.push({ path: `/e/${table}/${entityId}` }) }
</script>

<template>
<MissingTable v-if="store.dbLoaded && !store.hasTable('arkts_sources')"
              table="arkts_sources" collector="arkts" what="声明文件" />
<div v-else-if="!data" class="cd-page"><p class="cd-empty">没有这条记录</p></div>
<div v-else class="cd-page">
  <nav class="cd-trail">
    <button class="cd-crumb-back" @click="goBack">← 声明文件</button>
    <span class="cd-sep" aria-hidden="true">›</span>
    <span class="cd-crumb-here mono">{{ name }}</span>
  </nav>

  <header class="cd-header">
    <div class="grow">
      <h1>{{ name }}</h1>
      <p class="cd-sub mono">{{ s.source_path }}</p>
      <p class="tags">
        <span class="tag">{{ s.role === 'kit_entry' ? 'Kit 入口' : '模块声明' }}</span>
        <span class="tag">{{ s.declaration_format }}</span>
        <span class="tag">{{ s.language_variant === 'static' ? 'ArkTS 1.2（静态）' : 'ArkTS 1.1（动态）' }}</span>
        <span v-if="s.siblings?.length" class="tag">该模块另有 {{ s.siblings.length }} 份其它语言版本声明</span>
        <span v-if="s.read_status !== 'ok'" class="tag bad">{{ READ[s.read_status] || s.read_status }}</span>
      </p>
    </div>
    <a v-if="src" class="srclink" :href="src.url" target="_blank" rel="noopener"
       :title="`${src.repo} @ ${src.ref.slice(0, 12)}`">
      <Icon name="tools" :size="14" /> 查看源码 ↗
    </a>
  </header>

  <div class="tabs" role="tablist" aria-label="声明文件详情">
    <button v-for="t in TABS" :key="t.key" role="tab" :aria-selected="tab === t.key"
            class="chip" :class="{ on: tab === t.key }" @click="tab = t.key">
      {{ t.label }}<span v-if="t.n != null" class="n">{{ t.n }}</span>
    </button>
  </div>

  <!-- 文件事实 -->
  <section v-show="tab === 'facts'" class="pane">
    <dl class="kv">
      <dt>读取状态</dt><dd>{{ READ[s.read_status] || s.read_status }}</dd>
      <dt>文件头</dt><dd>{{ HEADER[s.header_status] || s.header_status || '—' }}</dd>
      <dt>大小</dt><dd>{{ s.byte_size != null ? humanBytes(s.byte_size) : '—' }}</dd>
      <dt>适用模式</dt>
      <dd>
        {{ s.file_condition === 'unspecified' ? 'unspecified' : s.file_condition || '—' }}
        <span class="dim">{{ s.file_condition === 'unspecified'
          ? '（文件内容没有显式声明；不等于两种模式都支持）'
          : '（文件内容声明的，与后缀无关）' }}</span>
      </dd>
      <dt>判定依据</dt>
      <dd>
        <template v-if="conditions">{{ conditions }}
          <span class="dim">（静态后缀的依据是文件名，所以没有字节位置；use static 带指令本身的位置）</span>
        </template>
        <template v-else><span class="dim">没有找到任何条件标记</span></template>
      </dd>
      <dt>文件头范围</dt>
      <dd>
        <template v-if="s.header_span">{{ s.header_span }} 字节
          <span class="dim">（原文不入库——整段是许可证样板；承载归属的 @kit 标签已存为关系原文）</span>
        </template>
        <template v-else>—</template>
      </dd>
      <dt>源码位置</dt>
      <dd>
        <template v-if="src">{{ src.repo }} · 提交 {{ src.ref.slice(0, 12) }}
          <span class="dim">（链接按扫描当时的提交号拼成，内容未与该提交逐字节比对）</span>
        </template>
        <template v-else>—</template>
      </dd>
    </dl>

    <div class="card">
      <h2>提取能力</h2>
      <p class="dim">解析核心有四个能力，每个在这份文件上单独记状态。</p>
      <table class="ev">
        <thead><tr><th>能力</th><th>状态</th><th>它负责什么</th></tr></thead>
        <tbody>
          <tr v-for="c in coverage" :key="c.key">
            <td>{{ c.label }}</td><td>{{ c.state }}</td><td class="dim">{{ c.hint }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>

  <!-- 声明的实体 -->
  <section v-show="tab === 'declares'" class="pane">
    <div v-if="s.module_id" class="card">
      <h2>模块</h2>
      <p>
        <button class="link mono" @click="open('arkts_modules', s.module_id)">{{ s.module_key }}</button>
        <span v-if="s.module_name" class="dim"> · 可 import 名 <code>{{ s.module_name }}</code></span>
        <span v-else class="dim"> · 无 import 名，只能按相对路径引用</span>
      </p>
      <p class="dim">实现方式 {{ s.implementation_kind }} · 语言覆盖 {{ s.language_coverage }}</p>
    </div>
    <div v-else-if="s.kit_id" class="card">
      <h2>Kit</h2>
      <p>
        <button class="link mono" @click="open('arkts_kits', s.kit_id)">{{ s.kit_key }}</button>
        <span class="dim"> · {{ s.kit_origin === 'entry_backed' ? '有入口文件' : '仅标签分组' }}</span>
      </p>
    </div>
    <div v-else class="card">
      <h2>无归属</h2>
      <p class="dim">这份文件没有声明任何实体。Kit 入口文件名不是合法的
        <code>@kit.&lt;Name&gt;</code> 时会是这种状态，行与读取状态仍然保留。</p>
    </div>

    <div v-if="s.siblings?.length" class="card">
      <h2>同模块的其它语言版本</h2>
      <ul class="rows">
        <li v-for="x in s.siblings" :key="x.id">
          <button class="link mono" @click="open('arkts_sources', x.id)">{{ x.source_path }}</button>
          <span class="dim">{{ x.language_variant === 'static' ? '静态 1.2' : '动态 1.1' }}</span>
        </li>
      </ul>
      <p class="dim">同一个模块的两份声明。它们不是两个模块——这正是实体按模块而非文件建模的原因。</p>
    </div>
  </section>

  <!-- 关系证据 -->
  <section v-show="tab === 'evidence'" class="pane">
    <div v-if="!s.evidence?.length" class="card"><p class="dim">这份文件没有产生关系证据。</p></div>

    <div v-if="membership.length" class="card">
      <h2>归属声明 <span class="n">{{ membership.length }}</span></h2>
      <p class="dim">文件头的 <code>@kit</code> 标签。不能据此断言该模块的全部 API 由这个 Kit 导出。</p>
      <table class="ev">
        <thead><tr><th>Kit</th><th>位置</th><th>证据</th><th>状态</th></tr></thead>
        <tbody>
          <tr v-for="e in membership" :key="e.id">
            <td><button class="link mono" @click="open('arkts_kits', e.kit_id)">{{ e.kit_key }}</button></td>
            <td class="mono dim">{{ e.line }}:{{ e.column }}</td>
            <td class="mono wrap">{{ e.record }}</td>
            <td>{{ e.evidence_state === 'confirmed' ? '已确认' : '候选（无同块 @file）' }}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <div v-if="references.length" class="card">
      <h2>入口引用 <span class="n">{{ references.length }}</span></h2>
      <p class="dim">Kit 入口里的 import / 带来源的 export。被引用不等于该模块全部 API 都被导出。</p>
      <table class="ev">
        <thead><tr><th>目标</th><th>语句</th><th>位置</th><th>条件</th><th>解析</th></tr></thead>
        <tbody>
          <tr v-for="e in references" :key="e.id">
            <td>
              <button v-if="e.module_id" class="link mono" @click="open('arkts_modules', e.module_id)">
                {{ e.target_module }}</button>
              <span v-else class="mono">{{ e.target_text }}</span>
            </td>
            <td class="dim">{{ e.statement_kind }}</td>
            <td class="mono dim">{{ e.line }}:{{ e.column }}</td>
            <td class="dim">{{ e.condition_state }}</td>
            <td>{{ e.resolution_status }}<span v-if="e.resolution_method" class="dim">
              · {{ e.resolution_method }}</span></td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
</div>
</template>

<style scoped>
/* 外壳与模块/Kit 详情页共用一份，见 detail-view.css。
   三个页面长得一样不是巧合，是同一张样式表。 */
@import '../styles/detail-view.css';
</style>
