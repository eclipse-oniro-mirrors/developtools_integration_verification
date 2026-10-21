<script setup>
import { ref, computed, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { loadGnArgDetail } from '../model/lists.js'
import { formatGnValue } from '../model/fields.js'
import Icon from '../ui/Icon.vue'

const route = useRoute()
const router = useRouter()
const store = useViewerStore()

const id = computed(() => route.params.id)
const data = ref(null)

watch(() => [store.scanId, id.value], () => {
  data.value = loadGnArgDetail(store.scanId, id.value)
}, { immediate: true })

const a = computed(() => data.value || {})
const isOverride = v => v === 1 || v === '1' || v === true

function goToEntity(table, entityId) { if (entityId) router.push({ path: `/e/${table}/${entityId}` }) }
function goBack() { router.push('/parts/args') }

function gitUrl(filePath) {
  if (!filePath || !a.value?.remote_url) return null
  const base = a.value.remote_url.replace(/\.git$/, '')
  const ref = a.value.head_commit || a.value.revision || 'master'
  let p = filePath
  if (a.value.repo_path && p.startsWith(a.value.repo_path + '/'))
    p = p.slice(a.value.repo_path.length + 1)
  return `${base}/blob/${ref}/${p}`
}
</script>

<template>
<div ref="scroller" class="cd-page">
  <nav class="cd-trail">
    <button class="cd-crumb-back" @click="goBack">← 编译参数</button>
    <span class="cd-sep" aria-hidden="true">›</span>
    <span class="cd-crumb-here mono">{{ a.name }}</span>
  </nav>

  <header class="cd-header">
    <div class="cd-head-left">
      <Icon name="chip" :size="22" class="cd-icon" />
      <div class="cd-titles">
        <h1>{{ a.name }}</h1>
        <p class="cd-sub" v-if="a.component_name"><span class="mono">{{ a.component_name }}</span></p>
      </div>
    </div>
    <span class="cd-type">编译参数</span>
  </header>

  <dl class="cd-dl">
    <div class="cd-row">
      <dt>参数名 <span class="cd-hint">GN declare_args() 中声明的构建参数名，全局唯一</span></dt>
      <dd class="mono">{{ a.name || '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>当前值 <span class="cd-hint">该参数在当前产品构建中生效的值</span></dt>
      <dd class="mono">{{ formatGnValue(a.current_value, a.value_type) }}</dd>
    </div>
    <div class="cd-row">
      <dt>默认值 <span class="cd-hint">declare_args() 中声明的默认值</span></dt>
      <dd class="mono cd-dim">{{ formatGnValue(a.default_value, a.value_type) }}</dd>
    </div>
    <div class="cd-row">
      <dt>类型 <span class="cd-hint">值的类型：bool / str / int / list</span></dt>
      <dd>{{ a.value_type || '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>覆盖 <span class="cd-hint">✓ 表示 args.gn 中显式设置了该参数的值</span></dt>
      <dd>{{ isOverride(a.has_override) ? '✓ 已覆盖' : '未覆盖' }}</dd>
    </div>
    <div class="cd-row">
      <dt>声明文件 <span class="cd-hint">声明该参数的 .gni 或 BUILD.gn 文件，点击跳转</span></dt>
      <dd class="mono">
        <a v-if="gitUrl(a.decl_file)" :href="gitUrl(a.decl_file)" target="_blank" rel="noopener" class="cd-ext-link">{{ a.decl_file }} ↗</a>
        <span v-else>{{ a.decl_file || '—' }}</span>
      </dd>
    </div>
    <div class="cd-row">
      <dt>行号 <span class="cd-hint">在声明文件中的行号</span></dt>
      <dd>{{ a.decl_line ?? '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>注释 <span class="cd-hint">声明前方的注释文本</span></dt>
      <dd>{{ a.comment || '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>归属部件 <span class="cd-hint">该参数声明在哪个部件的源码目录内</span></dt>
      <dd><button v-if="a.component_id" class="cd-link" @click="goToEntity('components', a.component_id)">{{ a.component_name }}</button><span v-else>—</span></dd>
    </div>
    <div class="cd-row">
      <dt>代码仓 <span class="cd-hint">归属部件所在的代码仓</span></dt>
      <dd><button v-if="a.repo_id" class="cd-link" @click="goToEntity('repos', a.repo_id)">{{ a.repo_name }}</button><span v-else>—</span></dd>
    </div>
  </dl>
</div>
</template>

<style scoped>
.cd-page { height: 100%; overflow: auto; padding: var(--space-5) var(--space-6) var(--space-7) }
.cd-trail { display: flex; align-items: center; gap: var(--space-1); margin-bottom: var(--space-3); font-size: var(--text-sm) }
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
.cd-row dd { margin: 0; font-size: var(--text-base); color: var(--text-primary) }
.cd-ext-link { color: var(--entity-component); text-decoration: none; font-family: var(--font-mono) }
.cd-ext-link:hover { text-decoration: underline }
.cd-link { font: inherit; font-family: var(--font-mono); font-size: var(--text-base); color: var(--entity-component); background: none; border: 0; padding: 0; cursor: pointer; text-align: left; overflow-wrap: anywhere }
.cd-link:hover { text-decoration: underline }
.cd-dim { color: var(--text-secondary) }
.mono { font-family: var(--font-mono) }
</style>
