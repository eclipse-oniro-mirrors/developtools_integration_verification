<script setup>
import { ref, computed, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { loadInnerApiDetail } from '../model/lists.js'
import Icon from '../ui/Icon.vue'

const route = useRoute()
const router = useRouter()
const store = useViewerStore()

const id = computed(() => route.params.id)
const data = ref(null)

watch(() => [store.scanId, id.value], () => {
  data.value = loadInnerApiDetail(store.scanId, id.value)
}, { immediate: true })

const ia = computed(() => data.value || {})
const title = computed(() => ia.value.external_name || ia.value.name)
const recordJson = computed(() => {
  try { return JSON.stringify(JSON.parse(ia.value.record), null, 2) } catch { return ia.value.record || '' }
})

function goToEntity(table, entityId) { if (entityId) router.push({ path: `/e/${table}/${entityId}` }) }
function goBack() { router.push('/parts/innerapis') }

/* GN label → BUILD.gn git 链接 */
function gnLabelUrl(label) {
  if (!label || !ia.value?.remote_url) return null
  const base = ia.value.remote_url.replace(/\.git$/, '')
  const ref = ia.value.head_commit || ia.value.revision || 'master'
  let p = label.replace(/^\/\//, '')
  const colon = p.indexOf(':')
  if (colon >= 0) p = p.slice(0, colon)
  p = p + '/BUILD.gn'
  if (ia.value.repo_path && p.startsWith(ia.value.repo_path + '/'))
    p = p.slice(ia.value.repo_path.length + 1)
  return `${base}/blob/${ref}/${p}`
}
</script>

<template>
<div ref="scroller" class="cd-page">
  <!-- 面包屑 -->
  <nav class="cd-trail">
    <button class="cd-crumb-back" @click="goBack">← InnerAPI</button>
    <span class="cd-sep" aria-hidden="true">›</span>
    <span class="cd-crumb-here mono">{{ title }}</span>
  </nav>

  <!-- 头部 -->
  <header class="cd-header">
    <div class="cd-head-left">
      <Icon name="node" :size="22" class="cd-icon" />
      <div class="cd-titles">
        <h1>{{ title }}</h1>
        <p class="cd-sub">
          <span class="mono">{{ ia.field || '—' }}</span>
          <span v-if="ia.component_name"> / {{ ia.component_name }}</span>
        </p>
      </div>
    </div>
    <span class="cd-type">InnerAPI</span>
  </header>

  <!-- 信息 -->
  <dl class="cd-dl">
    <div class="cd-row">
      <dt>引用名 <span class="cd-hint">external_deps 中使用的引用名</span></dt>
      <dd class="mono">{{ ia.external_name || '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>GN label <span class="cd-hint">点击跳转到 BUILD.gn</span></dt>
      <dd class="mono">
        <a v-if="gnLabelUrl(ia.name)" :href="gnLabelUrl(ia.name)" target="_blank" rel="noopener" class="cd-ext-link">{{ ia.name }} ↗</a>
        <span v-else>{{ ia.name || '—' }}</span>
      </dd>
    </div>
    <div class="cd-row">
      <dt>类型 <span class="cd-hint">声明来源</span></dt>
      <dd>{{ ia.field || '—' }}<span class="cd-hint-inline" v-if="ia.field">{{ ia.field === 'inner_kits' ? '（传统接口声明）' : '（统一接口声明）' }}</span></dd>
    </div>
    <div class="cd-row">
      <dt>序号 <span class="cd-hint">在 inner_kits/inner_api 数组中的下标</span></dt>
      <dd>{{ ia.source_index ?? '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>归属部件 <span class="cd-hint">这个接口属于哪个部件</span></dt>
      <dd><button v-if="ia.component_id" class="cd-link" @click="goToEntity('components', ia.component_id)">{{ ia.component_name }}</button><span v-else>—</span></dd>
    </div>
    <div class="cd-row">
      <dt>代码仓 <span class="cd-hint">归属部件所在的代码仓</span></dt>
      <dd><button v-if="ia.repo_id" class="cd-link" @click="goToEntity('repos', ia.repo_id)">{{ ia.repo_name }}</button><span v-else>—</span></dd>
    </div>
    <div class="cd-row">
      <dt>安装模块 <span class="cd-hint">component_links 匹配到的安装模块</span></dt>
      <dd><button v-if="ia.install_module_id" class="cd-link" @click="goToEntity('install_modules', ia.install_module_id)">{{ ia.install_label || '查看' }}</button><span v-else>—</span></dd>
    </div>
    <div class="cd-row">
      <dt>ELF 模块 <span class="cd-hint">安装模块对应的 .so 文件</span></dt>
      <dd><button v-if="ia.elf_module_id" class="cd-link" @click="goToEntity('elf_modules', ia.elf_module_id)">{{ (ia.elf_dest || '').split('/').pop() || '查看' }}</button><span v-else>—</span></dd>
    </div>
  </dl>

  <!-- 原始声明 -->
  <details v-if="recordJson" class="cd-record">
    <summary>原始声明 record <span class="cd-record-hint">逐字保留的 bundle.json inner_kit/inner_api 声明</span></summary>
    <pre>{{ recordJson }}</pre>
  </details>
</div>
</template>

<style scoped>
.cd-page { height: 100%; overflow: auto; padding: var(--space-5) var(--space-6) var(--space-7) }
.cd-trail { display: flex; align-items: center; gap: var(--space-1); flex-wrap: wrap; margin-bottom: var(--space-3); font-size: var(--text-sm) }
.cd-crumb-back { font: inherit; font-size: var(--text-sm); padding: 0; background: none; border: 0; cursor: pointer; color: var(--text-secondary) }
.cd-crumb-back:hover { text-decoration: underline; color: var(--entity-component) }
.cd-sep { color: var(--text-tertiary) }
.cd-crumb-here { color: var(--text-secondary); font-weight: 600 }
.cd-header { display: flex; align-items: flex-start; gap: var(--space-3); padding-bottom: var(--space-4); border-bottom: 1px solid var(--border-subtle); margin-bottom: var(--space-4) }
.cd-head-left { display: flex; gap: var(--space-3); flex: 1; min-width: 0 }
.cd-icon { color: var(--entity-component); flex-shrink: 0; margin-top: 2px }
.cd-titles { min-width: 0 }
.cd-header h1 { margin: 0; font-size: var(--text-xl); font-weight: 600; font-family: var(--font-mono); overflow-wrap: anywhere }
.cd-sub { margin: 2px 0 0; font-size: var(--text-sm); color: var(--text-secondary) }
.cd-type { flex-shrink: 0; font-size: var(--text-xs); color: var(--text-secondary); border: 1px solid var(--border-default); border-radius: var(--radius-full); padding: 2px var(--space-2); margin-top: 4px }
.cd-dl { display: grid; gap: var(--space-1) }
.cd-row { display: grid; grid-template-columns: 200px 1fr; gap: var(--space-4); padding: var(--space-2) 0; border-bottom: 1px solid var(--border-subtle) }
.cd-row dt { font-size: var(--text-sm); color: var(--text-secondary) }
.cd-hint { display: block; margin-top: 2px; font-size: var(--text-xs); color: var(--text-tertiary) }
.cd-hint-inline { margin-left: var(--space-2); font-size: var(--text-xs); color: var(--text-tertiary) }
.cd-row dd { margin: 0; font-size: var(--text-base); color: var(--text-primary) }
.cd-ext-link { color: var(--entity-component); text-decoration: none; font-family: var(--font-mono) }
.cd-ext-link:hover { text-decoration: underline }
.cd-link { font: inherit; font-family: var(--font-mono); font-size: var(--text-base); color: var(--entity-component); background: none; border: 0; padding: 0; cursor: pointer; text-align: left; overflow-wrap: anywhere }
.cd-link:hover { text-decoration: underline }
.mono { font-family: var(--font-mono) }
.cd-record { margin-top: var(--space-4) }
.cd-record summary { cursor: pointer; font-size: var(--text-sm); color: var(--text-secondary); font-weight: 600; padding: var(--space-2) 0 }
.cd-record-hint { margin-left: var(--space-2); font-size: var(--text-xs); font-weight: 400; color: var(--text-tertiary) }
.cd-record pre { margin: 0; padding: var(--space-3); background: var(--surface-sunken); border: 1px solid var(--border-subtle); border-radius: var(--radius-sm); font-family: var(--font-mono); font-size: var(--text-sm); color: var(--text-secondary); overflow: auto; max-height: 460px; white-space: pre-wrap; word-break: break-all }
</style>
