<script setup>
import { ref, computed, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { loadTargetDetail } from '../model/lists.js'
import { humanBytes } from '../model/fields.js'
import Icon from '../ui/Icon.vue'

const route = useRoute()
const router = useRouter()
const store = useViewerStore()

const id = computed(() => route.params.id)
const data = ref(null)

watch(() => [store.scanId, id.value], () => {
  data.value = loadTargetDetail(store.scanId, id.value)
}, { immediate: true })

const t = computed(() => data.value || {})
const title = computed(() => t.value.file_name || t.value.dest || '—')
const entryType = computed(() => {
  if (t.value.link_target_path) return '软链接'
  if (t.value.directory) return '整目录'
  return '文件'
})

function goToEntity(table, entityId) { if (entityId) router.push({ path: `/e/${table}/${entityId}` }) }
function goBack() { router.push('/files/targets') }
</script>

<template>
<div ref="scroller" class="cd-page">
  <nav class="cd-trail">
    <button class="cd-crumb-back" @click="goBack">← 安装产物</button>
    <span class="cd-sep" aria-hidden="true">›</span>
    <span class="cd-crumb-here mono">{{ title }}</span>
  </nav>

  <header class="cd-header">
    <div class="cd-head-left">
      <Icon name="image" :size="22" class="cd-icon" />
      <div class="cd-titles">
        <h1>{{ title }}</h1>
        <p class="cd-sub">
          <span class="mono">{{ t.partition || '—' }}</span>
          <span v-if="t.component_name"> / {{ t.component_name }}</span>
        </p>
      </div>
    </div>
    <span class="cd-type">{{ entryType }}</span>
  </header>

  <dl class="cd-dl">
    <div class="cd-row">
      <dt>安装路径 <span class="cd-hint">文件最终落在镜像里的位置，相对分区根目录</span></dt>
      <dd class="mono">{{ t.dest || '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>文件名 <span class="cd-hint">安装路径的最后一段</span></dt>
      <dd class="mono">{{ t.file_name || '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>分区 <span class="cd-hint">文件落在哪个镜像分区</span></dt>
      <dd>{{ t.partition || '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>类型 <span class="cd-hint">软链接 / 整目录 / 文件</span></dt>
      <dd>{{ entryType }}</dd>
    </div>
    <div class="cd-row">
      <dt>大小 <span class="cd-hint">镜像里自己占的字节数，不跟随软链接</span></dt>
      <dd class="mono">{{ t.size != null ? humanBytes(t.size) : '—' }}</dd>
    </div>
    <div v-if="t.link_target_path" class="cd-row">
      <dt>软链接指向 <span class="cd-hint">链接目标的全路径</span></dt>
      <dd class="mono">{{ t.link_target_path }}</dd>
    </div>
    <div class="cd-row">
      <dt>安装模块 <span class="cd-hint">装出这个文件的 GN target</span></dt>
      <dd><button v-if="t.module_id" class="cd-link" @click="goToEntity('install_modules', t.module_id)">{{ t.label }}</button><span v-else>—</span></dd>
    </div>
    <div class="cd-row">
      <dt>模块类型 <span class="cd-hint">构建系统给这个目标的类型</span></dt>
      <dd>{{ t.module_type || '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>构建产物 <span class="cd-hint">安装前在 out 目录下的位置</span></dt>
      <dd class="mono">{{ t.source || '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>归属部件 <span class="cd-hint">这个文件属于哪个部件</span></dt>
      <dd><button v-if="t.component_id" class="cd-link" @click="goToEntity('components', t.component_id)">{{ t.component_name }}</button><span v-else>—</span></dd>
    </div>
    <div class="cd-row">
      <dt>代码仓 <span class="cd-hint">归属部件所在的代码仓</span></dt>
      <dd><button v-if="t.repo_id" class="cd-link" @click="goToEntity('repos', t.repo_id)">{{ t.repo_name }}</button><span v-else>—</span></dd>
    </div>
    <div class="cd-row">
      <dt>子系统 <span class="cd-hint">部件所属子系统</span></dt>
      <dd>{{ t.subsystem || '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>清单序号 <span class="cd-hint">在 system_module_info.json 里的位置</span></dt>
      <dd>{{ t.ordinal ?? '—' }}</dd>
    </div>
  </dl>
</div>
</template>

<style scoped>
.cd-page { height: 100%; overflow: auto; padding: var(--space-5) var(--space-6) var(--space-7) }
.cd-trail { display: flex; align-items: center; gap: var(--space-1); margin-bottom: var(--space-3); font-size: var(--text-sm) }
.cd-crumb-back { font: inherit; font-size: var(--text-sm); padding: 0; background: none; border: 0; cursor: pointer; color: var(--text-secondary) }
.cd-crumb-back:hover { text-decoration: underline; color: var(--entity-module) }
.cd-sep { color: var(--text-tertiary) }
.cd-crumb-here { color: var(--text-secondary); font-weight: 600 }
.cd-header { display: flex; align-items: flex-start; gap: var(--space-3); padding-bottom: var(--space-4); border-bottom: 1px solid var(--border-subtle); margin-bottom: var(--space-4) }
.cd-head-left { display: flex; gap: var(--space-3); flex: 1; min-width: 0 }
.cd-icon { color: var(--entity-module); flex-shrink: 0; margin-top: 2px }
.cd-titles { min-width: 0 }
.cd-header h1 { margin: 0; font-size: var(--text-xl); font-weight: 600; font-family: var(--font-mono); overflow-wrap: anywhere }
.cd-sub { margin: 2px 0 0; font-size: var(--text-sm); color: var(--text-secondary) }
.cd-type { flex-shrink: 0; font-size: var(--text-xs); color: var(--text-secondary); border: 1px solid var(--border-default); border-radius: var(--radius-full); padding: 2px var(--space-2); margin-top: 4px }
.cd-dl { display: grid; gap: var(--space-1) }
.cd-row { display: grid; grid-template-columns: 200px 1fr; gap: var(--space-4); padding: var(--space-2) 0; border-bottom: 1px solid var(--border-subtle) }
.cd-row dt { font-size: var(--text-sm); color: var(--text-secondary) }
.cd-hint { display: block; margin-top: 2px; font-size: var(--text-xs); color: var(--text-tertiary) }
.cd-row dd { margin: 0; font-size: var(--text-base); color: var(--text-primary) }
.cd-link { font: inherit; font-family: var(--font-mono); font-size: var(--text-base); color: var(--entity-module); background: none; border: 0; padding: 0; cursor: pointer; text-align: left; overflow-wrap: anywhere }
.cd-link:hover { text-decoration: underline }
.mono { font-family: var(--font-mono) }
</style>
