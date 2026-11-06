<!-- SDK 模块详情。布局照部件详情页：面包屑 → 头部 → tab → 字段表，
     每个字段名底下压一行小字说明它到底是什么。

     这一页要回答三个问题，正好对应三个 tab：
       这是什么模块（身份与声明位置）
       谁实现了它（NAPI/ArkUI → .so → 部件，SDK 面与产品面在这里接上）
       谁在用它（两类 Kit 关系，必须分开摆——它们会不一致）-->
<script setup>
import { ref, computed, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { loadArktsModuleDetail } from '../model/lists.js'
import { humanBytes } from '../model/fields.js'
import MissingTable from '../components/MissingTable.vue'
import Icon from '../ui/Icon.vue'

const route = useRoute()
const router = useRouter()
const store = useViewerStore()

const id = computed(() => route.params.id)
const data = ref(null)
watch(() => [store.scanId, id.value, store.tables], () => {
  data.value = store.hasTable('arkts_modules')
    ? loadArktsModuleDetail(store.scanId, id.value) : null
}, { immediate: true, deep: true })

const m = computed(() => data.value || {})
const short = computed(() => m.value.module_name || (m.value.module_key || '').split('/').pop() || '—')

/* tab 进 URL：刷新、贴链接、后退都回到同一处（url-spec §2） */
const tab = computed({
  get: () => String(route.query.tab || 'basic'),
  set: v => router.replace({ path: route.path, query: { ...route.query, tab: v } }),
})
const TABS = computed(() => [
  { key: 'basic', label: '基本信息' },
  { key: 'impl', label: '实现', n: m.value.impl_so_path ? 1 : 0 },
  { key: 'files', label: '声明文件', n: m.value.sources?.length ?? 0 },
  { key: 'kits', label: 'Kit 关系',
    n: (m.value.declares?.length ?? 0) + (m.value.referencedBy?.length ?? 0) },
])
/* 落在空 tab 上就换到第一个非空的，不让人盯着一个空白面板 */
watch(TABS, ts => {
  const cur = ts.find(t => t.key === tab.value)
  if (cur && cur.n === 0) tab.value = 'basic'
}, { flush: 'post' })

/* ── 取值的人话。每个枚举都写清楚"空/未知"意味着什么，
      因为这个域里空值有好几种完全不同的来源。 ── */
const SCOPE = {
  api_named: 'api/ 顶层具名声明',
  api_auxiliary: 'api/ 子目录里的辅助声明',
  internal_component: '@internal 下的 ArkUI 组件声明',
  internal_ets: '@internal 下的 ets 声明',
  arkts_named: 'arkts/ 下的具名声明',
  arkts_builtin: 'arkts/ 下的语言内置声明',
}
const KIND = {
  napi: { label: 'NAPI 原生模块',
    why: '映射表指明了实现它的动态库，运行时由 NAPI 注册进 JS 环境。' },
  arkui: { label: 'ArkUI 引擎',
    why: '由 ArkUI 引擎统一实现，不是一个模块一个 .so。' },
  arkts_builtin: { label: 'ArkTS 内置',
    why: '语言运行时自带，没有独立的实现库。' },
  arkts_language: { label: 'ArkTS 语言特性',
    why: '语言本身的特性声明，不对应任何库。' },
  type_only: { label: '纯类型声明',
    why: '只声明类型，编译期用完即弃，本来就不需要运行时实现。' },
  unknown: { label: '未知',
    why: '有模块名，但没有任何实现证据。这是"查不到"，不是"没有"——采集器不猜。' },
}
const COVERAGE = {
  dynamic: { label: '仅 ArkTS 1.1（动态）', why: '只有 .d.ts / .d.ets 一份声明。' },
  static: { label: '仅 ArkTS 1.2（静态）', why: '只有 .static.d.ets 一份声明。' },
  both: { label: '1.1 + 1.2 双声明',
    why: '同一个模块有两份声明文件。它们是一个模块，不是两个——实体按模块而非文件建模正是为此。' },
}
const MATCH = {
  module_name: { label: '模块名精确匹配', why: '运行时注册名与可 import 名一致，最强的证据。' },
  declaration_path: { label: '声明路径精确匹配', why: '映射表直接给出了声明文件路径。' },
  name_suffix: { label: '名字后缀唯一匹配',
    why: '兜底规则——运行时名只与某个模块名的后缀唯一对上，证据比前两种弱，看到要留心。' },
  arkui_engine: { label: 'ArkUI 引擎约定', why: '不走映射表，ArkUI 声明一律归到引擎库。' },
}
const kind = computed(() => KIND[m.value.implementation_kind] || { label: m.value.implementation_kind, why: '' })
const coverage = computed(() => COVERAGE[m.value.language_coverage] || { label: m.value.language_coverage, why: '' })
const match = computed(() => MATCH[m.value.impl_match] || { label: m.value.impl_match, why: '' })

/* 两类关系的差集就是结论本身：声称属于某 Kit 却没被它 import，
   或者被 import 了却没在文件头声明。两边都正常，但值得看见。 */
const declaredKits = computed(() => new Set((m.value.declares || []).map(r => r.kit_id)))
const importedKits = computed(() => new Set((m.value.referencedBy || []).map(r => r.kit_id)))
const onlyDeclared = computed(() => (m.value.declares || [])
  .filter(r => !importedKits.value.has(r.kit_id)).length)
const onlyImported = computed(() => [...new Set((m.value.referencedBy || [])
  .filter(r => !declaredKits.value.has(r.kit_id)).map(r => r.kit_id))].length)

const goBack = () => router.push('/sdk/modules')
const open = (table, entityId) => { if (entityId) router.push({ path: `/e/${table}/${entityId}` }) }
</script>

<template>
<MissingTable v-if="store.dbLoaded && !store.hasTable('arkts_modules')"
              table="arkts_modules" collector="arkts" what="SDK 模块" />
<div v-else-if="!data" class="cd-page"><p class="cd-empty">没有这条记录</p></div>
<div v-else class="cd-page">
  <nav class="cd-trail" aria-label="所属">
    <button class="cd-crumb-back" @click="goBack">← SDK 模块</button>
    <span class="cd-sep" aria-hidden="true">›</span>
    <span class="cd-crumb-here mono">{{ short }}</span>
  </nav>

  <header class="cd-header">
    <Icon name="node" :size="22" class="hicon" />
    <div class="grow">
      <h1>{{ short }}</h1>
      <p class="cd-sub mono">{{ m.module_key }}</p>
      <p class="tags">
        <span class="tag">{{ kind.label }}</span>
        <span class="tag">{{ coverage.label }}</span>
        <span class="tag">{{ SCOPE[m.declaration_scope] || m.declaration_scope }}</span>
        <span v-if="!m.module_name" class="tag">无 import 名</span>
      </p>
    </div>
    <span class="tag type">SDK 模块</span>
  </header>

  <div class="tabs" role="tablist" aria-label="模块详情">
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
        <dt>模块键<span class="hint">SDK 相对路径，去掉语言后缀。这是模块的身份</span></dt>
        <dd class="mono">{{ m.module_key }}</dd>

        <dt>可 import 名<span class="hint">能直接写进 import 语句的裸标识符</span></dt>
        <dd>
          <code v-if="m.module_name">{{ m.module_name }}</code>
          <span v-else class="dim">没有。它是 @internal 组件、api/ 子目录的辅助声明或
            arkts/ 内置之一，只能按相对路径引用——<strong>空不是采集遗漏</strong>。</span>
        </dd>

        <dt>声明位置<span class="hint">声明放在 SDK 的哪个目录区域。纯路径事实，永远能判定</span></dt>
        <dd>
          {{ SCOPE[m.declaration_scope] || m.declaration_scope }}
          <span class="hint">它<strong>不告诉你怎么实现</strong>——同一个目录里 NAPI 和
            ArkUI 是混着的，所以"实现方式"是另一列。</span>
        </dd>

        <dt>语言版本<span class="hint">这个模块被哪些 ArkTS 语言版本声明</span></dt>
        <dd>{{ coverage.label }}<span class="hint">{{ coverage.why }}</span></dd>
      </dl>
    </div>

    <div class="card">
      <h2>一眼概览</h2>
      <dl class="kv">
        <dt>声明文件<span class="hint">磁盘上有几份 .d.ts / .d.ets 声明了它</span></dt>
        <dd>{{ m.sources?.length ?? 0 }} 份</dd>
        <dt>自己声明的 Kit 归属<span class="hint">它的文件头里写了几个 @kit 标签</span></dt>
        <dd>{{ declaredKits.size }} 个</dd>
        <dt>被 Kit 入口引用<span class="hint">有几个 Kit 的入口文件 import 了它</span></dt>
        <dd>{{ importedKits.size }} 个</dd>
        <dt>实现<span class="hint">由什么实现，详见"实现"页</span></dt>
        <dd>{{ kind.label }}<span class="hint">{{ kind.why }}</span></dd>
      </dl>
    </div>
  </section>

  <!-- ════════ 实现 ════════ -->
  <section v-show="tab === 'impl'" class="pane">
    <div class="card">
      <h2>实现方式</h2>
      <dl class="kv">
        <dt>判定结果<span class="hint">这个模块由什么实现。按证据判定，可能未知</span></dt>
        <dd>{{ kind.label }}<span class="hint">{{ kind.why }}</span></dd>
        <dt>匹配方式<span class="hint">运行时注册名是怎么对上这个 SDK 模块的，强度从高到低</span></dt>
        <dd v-if="m.impl_match">{{ match.label }}<span class="hint">{{ match.why }}</span></dd>
        <dd v-else class="dim">—</dd>
        <dt>运行时名<span class="hint">NAPI 注册这个模块时用的名字</span></dt>
        <dd v-if="m.impl_napi_name">
          <code>{{ m.impl_napi_name }}</code>
          <span class="hint">多数等于模块名去掉 @ohos.，但有 19 例不是（如 @ohos.util.stream
            注册成 stream），所以单独存一列而不是现推。</span>
        </dd>
        <dd v-else class="dim">—<span class="hint">ArkUI 实现的模块没有 NAPI 注册名。</span></dd>
      </dl>
    </div>

    <div v-if="m.impl_so_path" class="card">
      <h2>实现库</h2>
      <dl class="kv">
        <dt>声明路径<span class="hint">参考数据里写的镜像路径，逐字保留不改写</span></dt>
        <dd class="mono">{{ m.impl_so_path }}</dd>
        <dt>镜像实际位置<span class="hint">这个 .so 在本产品镜像里真正装到哪</span></dt>
        <dd>
          <button v-if="m.elf_id" class="link mono" @click="open('elf_modules', m.elf_id)">
            {{ m.installed_at }}</button>
          <span v-else class="dim">路径不在本镜像里</span>
          <span v-if="m.installed_at && m.installed_at !== m.impl_so_path" class="hint">
            与声明路径不同是正常的：映射表按 64 位镜像写（system/lib64/…），
            32 位产品装在 system/lib/ 下。本产品 932 条全部要靠这个别名才对得上，
            <strong>两行并排正是为了让这个差异看得见</strong>。</span>
        </dd>
        <dt>大小 / 分区<span class="hint">实现库的实际体积和所在分区</span></dt>
        <dd>
          <span v-if="m.so_size">{{ humanBytes(m.so_size) }}</span><span v-else class="dim">—</span>
          <span v-if="m.partition" class="dim"> · {{ m.partition }}</span>
        </dd>
        <dt>实现部件<span class="hint">这个 .so 由哪个部件构建出来</span></dt>
        <dd>
          <button v-if="m.component_id" class="link" @click="open('components', m.component_id)">
            {{ m.component }}</button>
          <span v-else class="dim">—</span>
          <span v-if="m.subsystem" class="dim"> · {{ m.subsystem }}</span>
          <span class="hint">SDK 接口与产品部件就在这里接上——这是整条链路的落点。</span>
        </dd>
      </dl>
    </div>

    <div v-else class="card">
      <h2>没有实现库</h2>
      <p class="dim">{{ kind.why }}</p>
      <p class="hint">空着有好几种含义，不要都读成"查询失败"：
        <code>type_only</code> 本来就不需要实现；<code>arkts_builtin</code> 由语言运行时提供；
        <code>unknown</code> 才是真的不知道由谁实现。</p>
    </div>
  </section>

  <!-- ════════ 声明文件 ════════ -->
  <section v-show="tab === 'files'" class="pane">
    <div class="card">
      <h2>声明文件 <span class="n">{{ m.sources?.length ?? 0 }}</span></h2>
      <p class="dim">磁盘上声明这个模块的文件。两份就是动/静双声明——
        它们是<strong>同一个模块</strong>的两个语言版本。</p>
      <table class="ev">
        <thead>
          <tr>
            <th>路径</th>
            <th>语言版本<span class="q" title="由文件名后缀决定：.static.d.ets 是 ArkTS 1.2，其余是 1.1。单份文件永远只属于一个版本">ⓘ</span></th>
            <th>后缀<span class="q" title="文件名末尾那一段，纯语法事实">ⓘ</span></th>
            <th>适用模式<span class="q" title="文件内容声明它适用于哪种模式，与后缀无关。一份 .d.ts 写上 'use static' 就会与后缀分叉">ⓘ</span></th>
            <th>大小</th>
            <th>读取<span class="q" title="文件本身读到了吗。no_tag 与 failed 是两件事：前者读完了确实没写 @kit，后者是没读成">ⓘ</span></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="f in m.sources" :key="f.id">
            <td>
              <button class="link mono" @click="open('arkts_sources', f.id)">{{ f.source_path }}</button>
              <a v-if="f.source_url" class="extlink" :href="f.source_url" target="_blank"
                 rel="noopener" title="在代码托管平台打开"> ↗</a>
            </td>
            <td>{{ f.language_variant === 'static' ? '1.2 静态' : '1.1 动态' }}</td>
            <td class="mono dim">{{ f.declaration_format }}</td>
            <td class="dim">{{ f.file_condition }}</td>
            <td class="dim">{{ f.byte_size != null ? humanBytes(f.byte_size) : '—' }}</td>
            <td :class="{ dim: f.read_status === 'ok' }">
              {{ f.read_status === 'ok' ? '正常' : f.read_status }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>

  <!-- ════════ Kit 关系 ════════ -->
  <section v-show="tab === 'kits'" class="pane">
    <div class="card note">
      <h2>两类关系，不要混着读</h2>
      <p class="dim"><strong>自己声明的归属</strong>是这个模块在自己文件头上写的
        <code>@kit</code> 标签；<strong>被入口引用</strong>是某个 Kit 的入口文件把它
        import 了进去。两者会不一致，而且不一致是正常的——
        一个模块可以声称属于 ArkUI 却不出现在 <code>@kit.ArkUI.d.ts</code> 里。</p>
      <p v-if="onlyDeclared || onlyImported" class="dim">
        本模块就有差异：<span v-if="onlyDeclared">{{ onlyDeclared }} 个 Kit 只在文件头声明过、
        入口没 import</span><span v-if="onlyDeclared && onlyImported">；</span><span
        v-if="onlyImported">{{ onlyImported }} 个 Kit 的入口 import 了它、但文件头没声明</span>。</p>
    </div>

    <div v-if="m.declares?.length" class="card">
      <h2>自己声明的归属 <span class="n">{{ m.declares.length }}</span></h2>
      <p class="dim">证据在<strong>这个模块自己的</strong>声明文件头里。</p>
      <table class="ev">
        <thead>
          <tr>
            <th>Kit</th>
            <th>位置<span class="q" title="行:列。证据所在文件里的位置，1 起算">ⓘ</span></th>
            <th>原文<span class="q" title="该字节跨度的逐字原文，用来不回源码就能核对判断">ⓘ</span></th>
            <th>适用模式<span class="q" title="这条证据在哪种 ArkTS 模式下生效">ⓘ</span></th>
            <th>证据状态<span class="q" title="这段字样读准了吗。候选=只有孤立标签，没有同块的 @file">ⓘ</span></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="e in m.declares" :key="e.id">
            <td>
              <button class="link mono" @click="open('arkts_kits', e.kit_id)">{{ e.kit_key }}</button>
              <span v-if="e.origin === 'label_only'" class="dim"> · 无入口</span>
            </td>
            <td class="mono dim">{{ e.line }}:{{ e.column }}</td>
            <td class="mono wrap">{{ e.record }}</td>
            <td class="dim">{{ e.condition_state }}</td>
            <td>{{ e.evidence_state === 'confirmed' ? '已确认' : '候选' }}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <div v-if="m.referencedBy?.length" class="card">
      <h2>被 Kit 入口引用 <span class="n">{{ m.referencedBy.length }}</span></h2>
      <p class="dim">证据在<strong>入口文件</strong>里，不在这个模块的文件里。
        被引用不等于这个模块的全部 API 都被该 Kit 导出。</p>
      <table class="ev">
        <thead>
          <tr>
            <th>Kit</th>
            <th>入口文件</th>
            <th>语句<span class="q" title="import_from 是 import … from，export_from 是带来源的 re-export">ⓘ</span></th>
            <th>位置</th>
            <th>适用模式<span class="q" title="来自语句所在的 if arkts static / dynamic 条件块；与文件后缀无关">ⓘ</span></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="e in m.referencedBy" :key="e.id">
            <td><button class="link mono" @click="open('arkts_kits', e.kit_id)">{{ e.kit_key }}</button></td>
            <td>
              <button v-if="e.source_id" class="link mono" @click="open('arkts_sources', e.source_id)">
                {{ (e.source_path || '').split('/').pop() }}</button>
              <span v-else class="dim">—</span>
            </td>
            <td class="dim">{{ e.statement_kind }}</td>
            <td class="mono dim">{{ e.line }}:{{ e.column }}</td>
            <td class="dim">{{ e.condition_state }}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <div v-if="!m.declares?.length && !m.referencedBy?.length" class="card">
      <p class="dim">这个模块既没有 <code>@kit</code> 标签，也没有被任何 Kit 入口引用。
        1,319 个模块里大多数都是这样——<strong>不属于任何 Kit 是常态，不是缺陷</strong>。</p>
    </div>
  </section>
</div>
</template>

<style scoped>
@import '../styles/detail-view.css';
.hicon { color: var(--entity-component); flex-shrink: 0; margin-top: 4px }
.tag.type { flex-shrink: 0; border: 1px solid var(--border-default); background: none }
.note { background: var(--surface-sunken) }
</style>
