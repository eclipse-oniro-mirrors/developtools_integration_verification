<script setup>
import { ref, computed, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { loadSaDetail } from '../model/lists.js'
import Icon from '../ui/Icon.vue'

const route = useRoute()
const router = useRouter()
const store = useViewerStore()

const id = computed(() => route.params.id)
const data = ref(null)

watch(() => [store.scanId, id.value], () => {
  data.value = loadSaDetail(store.scanId, id.value)
}, { immediate: true })

const a = computed(() => data.value || {})
const bool3 = v => v === '1' ? '是' : v === '0' ? '否' : '未声明'
const num3 = v => v != null && v !== '' ? v : '未声明'
const recordJson = computed(() => { try { return JSON.stringify(JSON.parse(a.value.record), null, 2) } catch { return a.value.record || '' } })

function goToEntity(table, entityId) { if (entityId) router.push({ path: `/e/${table}/${entityId}` }) }
function goBack() { router.push('/runtime/sa') }
</script>

<template>
<div ref="scroller" class="cd-page">
  <nav class="cd-trail">
    <button class="cd-crumb-back" @click="goBack">← SA 服务</button>
    <span class="cd-sep" aria-hidden="true">›</span>
    <span class="cd-crumb-here mono">SA {{ a.sa_id ?? '—' }}</span>
  </nav>

  <header class="cd-header">
    <div class="cd-head-left">
      <Icon name="runtime" :size="22" class="cd-icon" />
      <div class="cd-titles">
        <h1>SA {{ a.sa_id ?? '—' }}</h1>
        <p class="cd-sub" v-if="a.host"><span class="mono">{{ a.host }}</span></p>
      </div>
    </div>
    <span class="cd-type">SA</span>
  </header>

  <dl class="cd-dl">
    <div class="cd-row">
      <dt>SA 号 <span class="cd-hint">SystemAbility 全局唯一编号</span></dt>
      <dd class="mono">{{ a.sa_id ?? '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>实现库 <span class="cd-hint">由宿主进程 dlopen 加载的动态库</span></dt>
      <dd class="mono">{{ a.libpath || '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>SA 配置 <span class="cd-hint">声明这个 SA 的 .json profile 文件</span></dt>
      <dd class="mono">{{ a.profile || '—' }}</dd>
    </div>
    <div class="cd-row">
      <dt>宿主进程 <span class="cd-hint">这个 SA 跑在哪个进程里</span></dt>
      <dd><button v-if="a.service_id" class="cd-link" @click="goToEntity('services', a.service_id)">{{ a.host || '查看' }}</button><span v-else>—</span></dd>
    </div>
    <div class="cd-row">
      <dt>随进程启动 <span class="cd-hint">宿主起来就加载，还是等第一次调用时才加载</span></dt>
      <dd>{{ bool3(a.run_on_create) }}</dd>
    </div>
    <div class="cd-row">
      <dt>分布式 <span class="cd-hint">是否对外提供跨设备调用能力</span></dt>
      <dd>{{ bool3(a.distributed) }}</dd>
    </div>
    <div class="cd-row">
      <dt>自动重启 <span class="cd-hint">崩溃后是否由框架自动拉起</span></dt>
      <dd>{{ bool3(a.auto_restart) }}</dd>
    </div>
    <div class="cd-row">
      <dt>dump 级别 <span class="cd-hint">hidumper 抓取信息的详细程度</span></dt>
      <dd>{{ num3(a.dump_level) }}</dd>
    </div>
    <div class="cd-row">
      <dt>归属部件 <span class="cd-hint">这个 SA 属于哪个部件</span></dt>
      <dd><button v-if="a.component_id" class="cd-link" @click="goToEntity('components', a.component_id)">{{ a.component_name }}</button><span v-else>—</span></dd>
    </div>
    <div class="cd-row">
      <dt>代码仓 <span class="cd-hint">归属部件所在的代码仓</span></dt>
      <dd><button v-if="a.repo_id" class="cd-link" @click="goToEntity('repos', a.repo_id)">{{ a.repo_name }}</button><span v-else>—</span></dd>
    </div>
    <div class="cd-row">
      <dt>安装模块 <span class="cd-hint">装出 libpath 的 GN target</span></dt>
      <dd><button v-if="a.install_module_id" class="cd-link" @click="goToEntity('install_modules', a.install_module_id)">{{ a.install_label }}</button><span v-else>—</span></dd>
    </div>
    <div class="cd-row">
      <dt>子系统 <span class="cd-hint">部件所属子系统</span></dt>
      <dd>{{ a.subsystem || '—' }}</dd>
    </div>
  </dl>

  <details v-if="recordJson" class="cd-record">
    <summary>原始声明 record <span class="cd-record-hint">SA profile 中的 systemability 元素</span></summary>
    <pre>{{ recordJson }}</pre>
  </details>
</div>
</template>

<style scoped>
.cd-page { height: 100%; overflow: auto; padding: var(--space-5) var(--space-6) var(--space-7) }
.cd-trail { display: flex; align-items: center; gap: var(--space-1); margin-bottom: var(--space-3); font-size: var(--text-sm) }
.cd-crumb-back { font: inherit; font-size: var(--text-sm); padding: 0; background: none; border: 0; cursor: pointer; color: var(--text-secondary) }
.cd-crumb-back:hover { text-decoration: underline; color: var(--entity-sa) }
.cd-sep { color: var(--text-tertiary) }
.cd-crumb-here { color: var(--text-secondary); font-weight: 600 }
.cd-header { display: flex; align-items: flex-start; gap: var(--space-3); padding-bottom: var(--space-4); border-bottom: 1px solid var(--border-subtle); margin-bottom: var(--space-4) }
.cd-head-left { display: flex; gap: var(--space-3); flex: 1; min-width: 0 }
.cd-icon { color: var(--entity-sa); flex-shrink: 0; margin-top: 2px }
.cd-titles { min-width: 0 }
.cd-header h1 { margin: 0; font-size: var(--text-xl); font-weight: 600; font-family: var(--font-mono); overflow-wrap: anywhere }
.cd-sub { margin: 2px 0 0; font-size: var(--text-sm); color: var(--text-secondary) }
.cd-type { flex-shrink: 0; font-size: var(--text-xs); color: var(--text-secondary); border: 1px solid var(--border-default); border-radius: var(--radius-full); padding: 2px var(--space-2); margin-top: 4px }
.cd-dl { display: grid; gap: var(--space-1) }
.cd-row { display: grid; grid-template-columns: 200px 1fr; gap: var(--space-4); padding: var(--space-2) 0; border-bottom: 1px solid var(--border-subtle) }
.cd-row dt { font-size: var(--text-sm); color: var(--text-secondary) }
.cd-hint { display: block; margin-top: 2px; font-size: var(--text-xs); color: var(--text-tertiary) }
.cd-row dd { margin: 0; font-size: var(--text-base); color: var(--text-primary) }
.cd-link { font: inherit; font-family: var(--font-mono); font-size: var(--text-base); color: var(--entity-sa); background: none; border: 0; padding: 0; cursor: pointer; text-align: left; overflow-wrap: anywhere }
.cd-link:hover { text-decoration: underline }
.cd-record { margin-top: var(--space-4) }
.cd-record summary { cursor: pointer; font-size: var(--text-sm); color: var(--text-secondary); font-weight: 600; padding: var(--space-2) 0 }
.cd-record-hint { margin-left: var(--space-2); font-size: var(--text-xs); font-weight: 400; color: var(--text-tertiary) }
.cd-record pre { margin: 0; padding: var(--space-3); background: var(--surface-sunken); border: 1px solid var(--border-subtle); border-radius: var(--radius-sm); font-family: var(--font-mono); font-size: var(--text-sm); color: var(--text-secondary); overflow: auto; max-height: 460px; white-space: pre-wrap; word-break: break-all }
.mono { font-family: var(--font-mono) }
</style>
