<script setup>
import { ref, computed, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { loadFeatureDetail } from '../model/lists.js'
import { formatGnValue } from '../model/fields.js'
import Icon from '../ui/Icon.vue'

const route = useRoute()
const router = useRouter()
const store = useViewerStore()

const id = computed(() => route.params.id)
const data = ref(null)

watch(() => [store.scanId, id.value], () => {
  data.value = loadFeatureDetail(store.scanId, id.value)
}, { immediate: true })

const f = computed(() => data.value || {})

function goToEntity(table, entityId) { if (entityId) router.push({ path: `/e/${table}/${entityId}` }) }
function goBack() { router.push('/parts/features') }
</script>

<template>
<div ref="scroller" class="cd-page">
  <nav class="cd-trail">
    <button class="cd-crumb-back" @click="goBack">← 特性</button>
    <span class="cd-sep" aria-hidden="true">›</span>
    <span class="cd-crumb-here mono">{{ f.value }}</span>
  </nav>

  <header class="cd-header">
    <div class="cd-head-left">
      <Icon name="node" :size="22" class="cd-icon" />
      <div class="cd-titles">
        <h1>{{ f.value }}</h1>
        <p class="cd-sub" v-if="f.component_name"><span class="mono">{{ f.component_name }}</span></p>
      </div>
    </div>
    <span class="cd-type">特性</span>
  </header>

  <dl class="cd-dl">
    <div class="cd-row">
      <dt>特性名 <span class="cd-hint">bundle.json 中 component.features 数组的一项</span></dt>
      <dd class="mono">{{ f.value || '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>序号 <span class="cd-hint">在部件 features 数组中的下标</span></dt>
      <dd>{{ f.source_index ?? '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>归属部件 <span class="cd-hint">声明这个特性的部件</span></dt>
      <dd><button v-if="f.component_id" class="cd-link" @click="goToEntity('components', f.component_id)">{{ f.component_name }}</button><span v-else>—</span></dd>
    </div>
    <div class="cd-row">
      <dt>代码仓 <span class="cd-hint">归属部件所在的代码仓</span></dt>
      <dd><button v-if="f.repo_id" class="cd-link" @click="goToEntity('repos', f.repo_id)">{{ f.repo_name }}</button><span v-else>—</span></dd>
    </div>
    <div class="cd-row">
      <dt>关联编译参数 <span class="cd-hint">component_links 按特性名 ↔ gn_args.name 匹配</span></dt>
      <dd>
        <button v-if="f.gn_arg_id" class="cd-link" @click="goToEntity('gn_args', f.gn_arg_id)">{{ f.gn_arg_name || '查看' }}</button>
        <span v-else class="cd-muted">未关联</span>
      </dd>
    </div>
    <div class="cd-row">
      <dt>参数值 <span class="cd-hint">关联编译参数在当前产品构建中生效的值</span></dt>
      <dd class="mono">{{ formatGnValue(f.gn_arg_value, f.gn_arg_type) }}</dd>
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
.cd-link { font: inherit; font-family: var(--font-mono); font-size: var(--text-base); color: var(--entity-component); background: none; border: 0; padding: 0; cursor: pointer; text-align: left; overflow-wrap: anywhere }
.cd-link:hover { text-decoration: underline }
.cd-muted { color: var(--text-tertiary) }
.mono { font-family: var(--font-mono) }
</style>
