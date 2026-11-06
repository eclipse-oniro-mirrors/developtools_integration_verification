<script setup>
import { ref, computed, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { loadHdiDetail } from '../model/lists.js'
import Icon from '../ui/Icon.vue'

const route = useRoute()
const router = useRouter()
const store = useViewerStore()

const id = computed(() => route.params.id)
const data = ref(null)

watch(() => [store.scanId, id.value], () => {
  data.value = loadHdiDetail(store.scanId, id.value)
}, { immediate: true })

const h = computed(() => data.value || {})
const num3 = v => v != null && v !== '' ? v : '未声明'
const recordJson = computed(() => { try { return JSON.stringify(JSON.parse(h.value.record), null, 2) } catch { return h.value.record || '' } })

function goToEntity(table, entityId) { if (entityId) router.push({ path: `/e/${table}/${entityId}` }) }
function goBack() { router.push('/runtime/hdi') }
</script>

<template>
<div ref="scroller" class="cd-page">
  <nav class="cd-trail">
    <button class="cd-crumb-back" @click="goBack">← HDI 服务</button>
    <span class="cd-sep" aria-hidden="true">›</span>
    <span class="cd-crumb-here mono">{{ h.service_name || '—' }}</span>
  </nav>

  <header class="cd-header">
    <div class="cd-head-left">
      <Icon name="chip" :size="22" class="cd-icon" />
      <div class="cd-titles">
        <h1>{{ h.service_name || '—' }}</h1>
        <p class="cd-sub" v-if="h.module_name"><span class="mono">{{ h.module_name }}</span></p>
      </div>
    </div>
    <span class="cd-type">HDI</span>
  </header>

  <dl class="cd-dl">
    <div class="cd-row">
      <dt>设备服务名 <span class="cd-hint">HDI 设备对外暴露的服务名</span></dt>
      <dd class="mono">{{ h.service_name || '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>驱动模块 <span class="cd-hint">实现这个设备的驱动模块名</span></dt>
      <dd class="mono">{{ h.module_name || '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>驱动库路径 <span class="cd-hint">驱动 .so 在镜像里的安装路径</span></dt>
      <dd class="mono">{{ h.library || '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>HCB 节点 <span class="cd-hint">设备在 HCB 配置树里的节点路径</span></dt>
      <dd class="mono">{{ h.node || '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>宿主进程 <span class="cd-hint">驱动跑在哪个 hdf_devhost 进程里</span></dt>
      <dd><button v-if="h.service_id" class="cd-link" @click="goToEntity('services', h.service_id)">{{ h.host || '查看' }}</button><span v-else>—</span></dd>
    </div>
    <div class="cd-row">
      <dt>加载时机 <span class="cd-hint">preload 策略：开机加载 / 按需 / 不加载</span></dt>
      <dd>{{ num3(h.preload) }}</dd>
    </div>
    <div class="cd-row">
      <dt>优先级 <span class="cd-hint">同一宿主内的加载顺序，数值小的先加载</span></dt>
      <dd>{{ num3(h.priority) }}</dd>
    </div>
    <div class="cd-row">
      <dt>服务策略 <span class="cd-hint">设备以什么形式对外提供服务</span></dt>
      <dd>{{ num3(h.policy) }}</dd>
    </div>
    <div class="cd-row">
      <dt>权限位 <span class="cd-hint">设备节点的访问权限</span></dt>
      <dd>{{ num3(h.permission) }}</dd>
    </div>
    <div class="cd-row">
      <dt>归属部件 <span class="cd-hint">这个驱动属于哪个部件</span></dt>
      <dd><button v-if="h.component_id" class="cd-link" @click="goToEntity('components', h.component_id)">{{ h.component_name }}</button><span v-else>—</span></dd>
    </div>
    <div class="cd-row">
      <dt>代码仓 <span class="cd-hint">归属部件所在的代码仓</span></dt>
      <dd><button v-if="h.repo_id" class="cd-link" @click="goToEntity('repos', h.repo_id)">{{ h.repo_name }}</button><span v-else>—</span></dd>
    </div>
    <div class="cd-row">
      <dt>安装模块 <span class="cd-hint">装出驱动 .so 的 GN target</span></dt>
      <dd><button v-if="h.install_module_id" class="cd-link" @click="goToEntity('install_modules', h.install_module_id)">{{ h.install_label }}</button><span v-else>—</span></dd>
    </div>
    <div class="cd-row">
      <dt>子系统 <span class="cd-hint">部件所属子系统</span></dt>
      <dd>{{ h.subsystem || '—' }}</dd>
    </div>
  </dl>

  <details v-if="recordJson" class="cd-record">
    <summary>原始声明 record <span class="cd-record-hint">HCB 配置中的设备节点声明</span></summary>
    <pre>{{ recordJson }}</pre>
  </details>
</div>
</template>

<style scoped>
.cd-page { height: 100%; overflow: auto; padding: var(--space-5) var(--space-6) var(--space-7) }
.cd-trail { display: flex; align-items: center; gap: var(--space-1); margin-bottom: var(--space-3); font-size: var(--text-sm) }
.cd-crumb-back { font: inherit; font-size: var(--text-sm); padding: 0; background: none; border: 0; cursor: pointer; color: var(--text-secondary) }
.cd-crumb-back:hover { text-decoration: underline; color: var(--entity-hdi) }
.cd-sep { color: var(--text-tertiary) }
.cd-crumb-here { color: var(--text-secondary); font-weight: 600 }
.cd-header { display: flex; align-items: flex-start; gap: var(--space-3); padding-bottom: var(--space-4); border-bottom: 1px solid var(--border-subtle); margin-bottom: var(--space-4) }
.cd-head-left { display: flex; gap: var(--space-3); flex: 1; min-width: 0 }
.cd-icon { color: var(--entity-hdi); flex-shrink: 0; margin-top: 2px }
.cd-titles { min-width: 0 }
.cd-header h1 { margin: 0; font-size: var(--text-xl); font-weight: 600; font-family: var(--font-mono); overflow-wrap: anywhere }
.cd-sub { margin: 2px 0 0; font-size: var(--text-sm); color: var(--text-secondary) }
.cd-type { flex-shrink: 0; font-size: var(--text-xs); color: var(--text-secondary); border: 1px solid var(--border-default); border-radius: var(--radius-full); padding: 2px var(--space-2); margin-top: 4px }
.cd-dl { display: grid; gap: var(--space-1) }
.cd-row { display: grid; grid-template-columns: 200px 1fr; gap: var(--space-4); padding: var(--space-2) 0; border-bottom: 1px solid var(--border-subtle) }
.cd-row dt { font-size: var(--text-sm); color: var(--text-secondary) }
.cd-hint { display: block; margin-top: 2px; font-size: var(--text-xs); color: var(--text-tertiary) }
.cd-row dd { margin: 0; font-size: var(--text-base); color: var(--text-primary) }
.cd-link { font: inherit; font-family: var(--font-mono); font-size: var(--text-base); color: var(--entity-hdi); background: none; border: 0; padding: 0; cursor: pointer; text-align: left; overflow-wrap: anywhere }
.cd-link:hover { text-decoration: underline }
.cd-record { margin-top: var(--space-4) }
.cd-record summary { cursor: pointer; font-size: var(--text-sm); color: var(--text-secondary); font-weight: 600; padding: var(--space-2) 0 }
.cd-record-hint { margin-left: var(--space-2); font-size: var(--text-xs); font-weight: 400; color: var(--text-tertiary) }
.cd-record pre { margin: 0; padding: var(--space-3); background: var(--surface-sunken); border: 1px solid var(--border-subtle); border-radius: var(--radius-sm); font-family: var(--font-mono); font-size: var(--text-sm); color: var(--text-secondary); overflow: auto; max-height: 460px; white-space: pre-wrap; word-break: break-all }
.mono { font-family: var(--font-mono) }
</style>
