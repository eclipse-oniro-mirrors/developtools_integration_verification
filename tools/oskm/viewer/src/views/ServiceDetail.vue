<script setup>
import { ref, computed, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { loadServiceDetail } from '../model/lists.js'
import { unjson } from '../model/runtime.js'
import { useQueryState } from '../composables/useQueryState.js'
import Icon from '../ui/Icon.vue'

const route = useRoute()
const router = useRouter()
const store = useViewerStore()

const id = computed(() => route.params.id)
const data = ref(null)
const tab = useQueryState('tab', 'basic')

watch(() => [store.scanId, id.value], () => {
  data.value = loadServiceDetail(store.scanId, id.value)
}, { immediate: true })

const s = computed(() => data.value || {})
const argsList = computed(() => { const a = unjson(s.value.args); return Array.isArray(a) ? a : [] })

/* 解析 record：分离出已提升列 vs record 独有字段 */
const parsedRecord = computed(() => {
  if (!s.value.record) return null
  try { return JSON.parse(s.value.record) } catch { return null }
})
const recordJson = computed(() => parsedRecord.value ? JSON.stringify(parsedRecord.value, null, 2) : '')
/* 已提升的列名集合 */
const PROMOTED = new Set(['name', 'type', 'path', 'uid', 'gid', 'start_mode', 'ondemand', 'secon', 'sandbox', 'importance', 'caps', 'permission', 'apl', 'critical'])
const recordExtras = computed(() => {
  const r = parsedRecord.value
  if (!r || typeof r !== 'object' || Array.isArray(r)) return []
  return Object.entries(r).filter(([k]) => !PROMOTED.has(k)).filter(([, v]) => v != null && v !== '')
})

/* Tab 定义 */
const tabs = computed(() => [
  { key: 'basic',    label: '基本信息', n: null, disabled: false },
  { key: 'identity',  label: '运行身份', n: null, disabled: false },
  { key: 'security',  label: '权限与能力', n: recordExtras.value.length, disabled: !recordExtras.value.length },
  { key: 'contents',  label: '装载内容', n: (s.value.sas?.length || 0) + (s.value.hdis?.length || 0), disabled: !(s.value.sas?.length || s.value.hdis?.length) },
  { key: 'record',    label: '原始声明', n: null, disabled: !recordJson.value },
])
watch(() => tabs.value, (ts) => {
  const cur = ts.find(t => t.key === tab.value)
  if (cur?.disabled) { const first = ts.find(t => !t.disabled); if (first) tab.value = first.key }
}, { flush: 'post' })

function goToEntity(table, entityId) { if (entityId) router.push({ path: `/e/${table}/${entityId}` }) }
function goBack() { router.push('/runtime/services') }
const bool3 = v => v === '1' || v === 1 ? '是' : v === '0' || v === 0 ? '否' : '未声明'
const num3 = v => v != null && v !== '' ? v : '未声明'
function fmtVal(v) {
  if (Array.isArray(v)) return v.join(', ')
  if (typeof v === 'object') return JSON.stringify(v)
  return String(v)
}
</script>

<template>
<div ref="scroller" class="cd-page">
  <nav class="cd-trail">
    <button class="cd-crumb-back" @click="goBack">← 系统服务</button>
    <span class="cd-sep" aria-hidden="true">›</span>
    <span class="cd-crumb-here mono">{{ s.name || '—' }}</span>
  </nav>

  <header class="cd-header">
    <div class="cd-head-left">
      <Icon name="runtime" :size="22" class="cd-icon" />
      <div class="cd-titles">
        <h1>{{ s.name || '—' }}</h1>
        <p class="cd-sub"><span class="mono">{{ s.cfg || '—' }}</span></p>
      </div>
    </div>
    <span class="cd-type">{{ s.type || '—' }}</span>
  </header>

  <nav class="cd-tabs">
    <button v-for="t in tabs" :key="t.key" class="cd-tab"
            :class="{ on: tab === t.key, disabled: t.disabled }"
            :disabled="t.disabled" @click="tab = t.key">
      <span>{{ t.label }}</span>
      <span v-if="t.n != null" class="cd-tab-n">{{ t.n }}</span>
    </button>
  </nav>

  <div class="cd-content">
    <!-- 基本信息 -->
    <div v-if="tab === 'basic'" class="cd-tab-content">
      <dl class="cd-dl">
        <div class="cd-row"><dt>进程名 <span class="cd-hint">init 拉起的进程名</span></dt><dd class="mono">{{ s.name || '—' }}</dd></div>
        <div class="cd-row"><dt>类型 <span class="cd-hint">sa=SA宿主 / hdf=驱动宿主 / default=守护进程</span></dt><dd>{{ s.type || '—' }}</dd></div>
        <div class="cd-row"><dt>启动配置 <span class="cd-hint">init .cfg 文件路径</span></dt><dd class="mono">{{ s.cfg || '—' }}</dd></div>
        <div class="cd-row"><dt>可执行文件 <span class="cd-hint">path[0]，被 exec 的二进制</span></dt><dd class="mono">{{ s.executable || '—' }}</dd></div>
        <div class="cd-row"><dt>启动参数 <span class="cd-hint">path[1:]，HDF 宿主的 -n host 在这里</span></dt><dd class="mono">{{ argsList.length ? argsList.join(' ') : '—' }}</dd></div>
        <div class="cd-row"><dt>归属部件 <span class="cd-hint">这个进程属于哪个部件</span></dt><dd><button v-if="s.component_id" class="cd-link" @click="goToEntity('components', s.component_id)">{{ s.component_name }}</button><span v-else>—</span></dd></div>
        <div class="cd-row"><dt>代码仓 <span class="cd-hint">归属部件所在的代码仓</span></dt><dd><button v-if="s.repo_id" class="cd-link" @click="goToEntity('repos', s.repo_id)">{{ s.repo_name }}</button><span v-else>—</span></dd></div>
        <div class="cd-row"><dt>安装模块 <span class="cd-hint">装出可执行文件的 GN target</span></dt><dd><button v-if="s.install_module_id" class="cd-link" @click="goToEntity('install_modules', s.install_module_id)">{{ s.install_label }}</button><span v-else>—</span></dd></div>
        <div class="cd-row"><dt>子系统 <span class="cd-hint">部件所属子系统</span></dt><dd>{{ s.subsystem || '—' }}</dd></div>
      </dl>
    </div>

    <!-- 运行身份 -->
    <div v-else-if="tab === 'identity'" class="cd-tab-content">
      <dl class="cd-dl">
        <div class="cd-row"><dt>运行用户 <span class="cd-hint">进程以哪个用户身份运行</span></dt><dd class="mono">{{ s.uid || '—' }}</dd></div>
        <div class="cd-row"><dt>用户组 <span class="cd-hint">附加用户组</span></dt><dd class="mono">{{ (() => { const g = unjson(s.gid); return Array.isArray(g) ? g.join(', ') : (g || '—') })() }}</dd></div>
        <div class="cd-row"><dt>SELinux 上下文 <span class="cd-hint">u:r:domain:s0</span></dt><dd class="mono">{{ s.secon || '—' }}</dd></div>
        <div class="cd-row"><dt>沙箱 <span class="cd-hint">init 沙箱隔离开关</span></dt><dd>{{ bool3(s.sandbox) }}</dd></div>
        <div class="cd-row"><dt>重要级 <span class="cd-hint">nice 值，越小越优先</span></dt><dd>{{ num3(s.importance) }}</dd></div>
        <div class="cd-row"><dt>启动时机 <span class="cd-hint">boot 随 init / condition 等条件</span></dt><dd>{{ s.start_mode || '未声明' }}</dd></div>
        <div class="cd-row"><dt>按需启动 <span class="cd-hint">开机不拉起，有人访问时才拉起</span></dt><dd>{{ bool3(s.ondemand) }}</dd></div>
      </dl>
    </div>

    <!-- 权限与能力 -->
    <div v-else-if="tab === 'security'" class="cd-tab-content">
      <dl class="cd-dl">
        <div v-if="parsedRecord?.permission" class="cd-row">
          <dt>permission <span class="cd-hint">声明需要的权限列表</span></dt>
          <dd class="mono">{{ fmtVal(parsedRecord.permission) }}</dd>
        </div>
        <div v-if="parsedRecord?.caps" class="cd-row">
          <dt>caps <span class="cd-hint">Linux capability 集合</span></dt>
          <dd class="mono">{{ fmtVal(parsedRecord.caps) }}</dd>
        </div>
        <div v-if="parsedRecord?.apl" class="cd-row">
          <dt>apl <span class="cd-hint">Access Permission Level</span></dt>
          <dd>{{ parsedRecord.apl }}</dd>
        </div>
        <div v-if="parsedRecord?.critical" class="cd-row">
          <dt>critical <span class="cd-hint">是否为关键进程</span></dt>
          <dd>{{ bool3(parsedRecord.critical) }}</dd>
        </div>
      </dl>
      <dl v-if="recordExtras.length" class="cd-dl">
        <div v-for="([key, val]) in recordExtras" :key="key" class="cd-row">
          <dt>{{ key }} <span class="cd-hint">record 中的声明字段</span></dt>
          <dd class="mono">{{ fmtVal(val) }}</dd>
        </div>
      </dl>
    </div>

    <!-- 装载内容 -->
    <div v-else-if="tab === 'contents'" class="cd-tab-content">
      <div v-if="s.sas?.length" class="cd-subsection">
        <h3 class="cd-section-title">装载的 SA（{{ s.sas.length }} 个）</h3>
        <table class="cd-table">
          <thead><tr><th>SA 号</th><th>实现库</th></tr></thead>
          <tbody>
            <tr v-for="sa in s.sas" :key="sa.id" class="cd-clickable" @click="goToEntity('sas', sa.id)">
              <td class="mono">{{ sa.sa_id }}</td><td class="mono">{{ sa.libpath || '—' }}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div v-if="s.hdis?.length" class="cd-subsection">
        <h3 class="cd-section-title">装载的 HDI 设备（{{ s.hdis.length }} 个）</h3>
        <table class="cd-table">
          <thead><tr><th>设备服务名</th><th>驱动模块</th></tr></thead>
          <tbody>
            <tr v-for="h in s.hdis" :key="h.id" class="cd-clickable" @click="goToEntity('hdis', h.id)">
              <td class="mono">{{ h.service_name }}</td><td class="mono">{{ h.module_name || '—' }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <!-- 原始声明 -->
    <div v-else-if="tab === 'record'" class="cd-tab-content">
      <details class="cd-record" open>
        <summary>原始声明 record <span class="cd-record-hint">init .cfg 的完整声明</span></summary>
        <pre>{{ recordJson }}</pre>
      </details>
    </div>

  </div>
</div>
</template>

<style scoped>
.cd-page { height: 100%; overflow: auto; padding: var(--space-5) var(--space-6) var(--space-7) }
.cd-trail { display: flex; align-items: center; gap: var(--space-1); margin-bottom: var(--space-3); font-size: var(--text-sm) }
.cd-crumb-back { font: inherit; font-size: var(--text-sm); padding: 0; background: none; border: 0; cursor: pointer; color: var(--text-secondary) }
.cd-crumb-back:hover { text-decoration: underline; color: var(--entity-service) }
.cd-sep { color: var(--text-tertiary) }
.cd-crumb-here { color: var(--text-secondary); font-weight: 600 }
.cd-header { display: flex; align-items: flex-start; gap: var(--space-3); padding-bottom: var(--space-4); border-bottom: 1px solid var(--border-subtle); margin-bottom: var(--space-4) }
.cd-head-left { display: flex; gap: var(--space-3); flex: 1; min-width: 0 }
.cd-icon { color: var(--entity-service); flex-shrink: 0; margin-top: 2px }
.cd-titles { min-width: 0 }
.cd-header h1 { margin: 0; font-size: var(--text-xl); font-weight: 600; font-family: var(--font-mono); overflow-wrap: anywhere }
.cd-sub { margin: 2px 0 0; font-size: var(--text-sm); color: var(--text-secondary) }
.cd-type { flex-shrink: 0; font-size: var(--text-xs); color: var(--text-secondary); border: 1px solid var(--border-default); border-radius: var(--radius-full); padding: 2px var(--space-2); margin-top: 4px }
.cd-tabs { display: flex; gap: var(--space-1); border-bottom: 1px solid var(--border-subtle); margin-bottom: var(--space-4); overflow-x: auto }
.cd-tab { display: inline-flex; align-items: baseline; gap: var(--space-2); height: 36px; padding: 0 var(--space-3); font: inherit; font-size: var(--text-sm); color: var(--text-secondary); background: none; border: 0; border-bottom: 2px solid transparent; cursor: pointer; white-space: nowrap; transition: all var(--motion-fast) }
.cd-tab:hover:not(.disabled):not(.on) { color: var(--text-primary); border-bottom-color: var(--border-subtle) }
.cd-tab.on { color: var(--text-primary); font-weight: 600; border-bottom-color: var(--entity-service) }
.cd-tab.disabled { opacity: .35; cursor: not-allowed }
.cd-tab-n { font-family: var(--font-mono); font-size: var(--text-xs); color: var(--text-tertiary) }
.cd-tab.on .cd-tab-n { color: var(--entity-service) }
.cd-tab-content { width: 100% }
.cd-dl { display: grid; gap: var(--space-1) }
.cd-row { display: grid; grid-template-columns: 200px 1fr; gap: var(--space-4); padding: var(--space-2) 0; border-bottom: 1px solid var(--border-subtle) }
.cd-row dt { font-size: var(--text-sm); color: var(--text-secondary) }
.cd-hint { display: block; margin-top: 2px; font-size: var(--text-xs); color: var(--text-tertiary) }
.cd-row dd { margin: 0; font-size: var(--text-base); color: var(--text-primary) }
.cd-link { font: inherit; font-family: var(--font-mono); font-size: var(--text-base); color: var(--entity-service); background: none; border: 0; padding: 0; cursor: pointer; text-align: left; overflow-wrap: anywhere }
.cd-link:hover { text-decoration: underline }
.cd-subsection { margin-bottom: var(--space-4) }
.cd-section-title { margin: 0 0 var(--space-2); font-size: var(--text-base); font-weight: 600; color: var(--text-primary) }
.cd-table { width: 100%; border-collapse: collapse }
.cd-table th { text-align: left; padding: var(--space-2) var(--space-3); font-size: var(--text-sm); font-weight: 600; color: var(--text-secondary); background: var(--surface-raised); border-bottom: 1px solid var(--border-default); white-space: nowrap }
.cd-table td { padding: var(--space-2) var(--space-3); font-size: var(--text-sm); color: var(--text-primary); border-bottom: 1px solid var(--border-subtle) }
.cd-table tr:hover { background: var(--surface-overlay) }
.cd-clickable { cursor: pointer }
.cd-record { margin-top: var(--space-4) }
.cd-record summary { cursor: pointer; font-size: var(--text-sm); color: var(--text-secondary); font-weight: 600; padding: var(--space-2) 0 }
.cd-record-hint { margin-left: var(--space-2); font-size: var(--text-xs); font-weight: 400; color: var(--text-tertiary) }
.cd-record pre { margin: 0; padding: var(--space-3); background: var(--surface-sunken); border: 1px solid var(--border-subtle); border-radius: var(--radius-sm); font-family: var(--font-mono); font-size: var(--text-sm); color: var(--text-secondary); overflow: auto; max-height: 460px; white-space: pre-wrap; word-break: break-all }
.mono { font-family: var(--font-mono) }
</style>
