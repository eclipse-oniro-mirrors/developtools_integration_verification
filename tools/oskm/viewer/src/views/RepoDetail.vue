<script setup>
import { ref, computed, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { useQueryState } from '../composables/useQueryState.js'
import { loadRepoDetail } from '../model/lists.js'
import { humanBytes } from '../model/fields.js'
import Icon from '../ui/Icon.vue'

const route = useRoute()
const router = useRouter()
const store = useViewerStore()

const id = computed(() => route.params.id)
const data = ref(null)
const tab = useQueryState('tab', 'basic')

watch(() => [store.scanId, id.value], () => {
  data.value = loadRepoDetail(store.scanId, id.value)
}, { immediate: true })

const d = computed(() => data.value || {})
const repo = computed(() => d.value.repo)

const hasInnerapi = computed(() => !!d.value.innerapis?.length)
const hasFeature = computed(() => !!d.value.features?.length)
const hasSyscap = computed(() => !!d.value.syscaps?.length)
const hasArgs = computed(() => !!d.value.gnArgs?.length)
const hasArtifacts = computed(() => !!d.value.modules?.length)
const hasRuntime = computed(() => !!(d.value.services?.length || d.value.sas?.length || d.value.hdis?.length))
const tabs = computed(() => [
  { key: 'basic',     label: '基本信息', n: null,  disabled: false },
  { key: 'components',label: '部件',     n: d.value.components?.length ?? 0, disabled: !d.value.components?.length },
  { key: 'innerapi',  label: 'InnerAPI', n: d.value.innerapis?.length ?? 0, disabled: !hasInnerapi.value },
  { key: 'feature',   label: '特性',     n: d.value.features?.length ?? 0,  disabled: !hasFeature.value },
  { key: 'syscap',    label: 'SysCap',   n: d.value.syscaps?.length ?? 0,   disabled: !hasSyscap.value },
  { key: 'args',      label: '编译参数',  n: d.value.gnArgs?.length ?? 0,    disabled: !hasArgs.value },
  { key: 'artifacts', label: '安装产物',  n: d.value.modules?.length ?? 0,   disabled: !hasArtifacts.value },
  { key: 'runtime',   label: '运行时',    n: null,  disabled: !hasRuntime.value },
])
watch(() => tabs.value, (ts) => {
  const cur = ts.find(t => t.key === tab.value)
  if (cur?.disabled) { const first = ts.find(t => !t.disabled); if (first) tab.value = first.key }
}, { flush: 'post' })

/* 导航 */
function goToComponent(componentId) { if (componentId) router.push({ path: `/e/components/${componentId}` }) }
function goToEntity(table, entityId) { if (entityId) router.push({ path: `/e/${table}/${entityId}` }) }
function goToRepos() { router.push('/parts/repos') }

/* git 仓文件 URL */
function gitUrl(workspacePath) {
  if (!workspacePath || !repo.value?.remote_url) return null
  const base = repo.value.remote_url.replace(/\.git$/, '')
  const ref = repo.value.head_commit || repo.value.revision || 'master'
  let p = workspacePath
  if (repo.value.path && p.startsWith(repo.value.path + '/'))
    p = p.slice(repo.value.path.length + 1)
  return `${base}/blob/${ref}/${p}`
}
function gnLabelUrl(label) {
  if (!label) return null
  let p = label.replace(/^\/\//, '')
  const colon = p.indexOf(':')
  if (colon >= 0) p = p.slice(0, colon)
  return gitUrl(p + '/BUILD.gn')
}
const repoUrl = computed(() => repo.value?.remote_url ? repo.value.remote_url.replace(/\.git$/, '') : null)

/* 产物大小按分区分布 */
const PIE_COLORS = ['#409eff', '#67c23a', '#e6a23c', '#f56c6c', '#909399', '#9c27b0', '#00bcd4', '#ff9800']
function pieColor(i) { return PIE_COLORS[i % PIE_COLORS.length] }
const sizeByPartition = computed(() => {
  const map = new Map()
  let total = 0
  for (const t of (d.value.targets || [])) {
    const size = parseInt(t.size) || 0
    if (size <= 0) continue
    const p = t.partition || '未知'
    map.set(p, (map.get(p) || 0) + size)
    total += size
  }
  return { total, partitions: [...map.entries()].sort((a, b) => b[1] - a[1]) }
})
const pieGradient = computed(() => {
  const { partitions, total } = sizeByPartition.value
  if (!total || !partitions.length) return null
  let acc = 0
  const stops = partitions.map(([name, size], i) => {
    const start = (acc / total) * 100
    acc += size
    const end = (acc / total) * 100
    return `${pieColor(i)} ${start}% ${end}%`
  })
  return `conic-gradient(${stops.join(', ')})`
})

/* 安装产物按模块分组 */
const targetsByModule = computed(() => {
  const map = new Map()
  for (const t of (d.value.targets || [])) {
    if (!map.has(t.module_id)) map.set(t.module_id, [])
    map.get(t.module_id).push(t)
  }
  return map
})

const isOverride = v => v === 1 || v === '1' || v === true
function formatJson(s) { if (!s) return ''; try { return JSON.stringify(JSON.parse(s), null, 2) } catch { return String(s) } }
</script>

<template>
<div ref="scroller" class="cd-page">
  <!-- 面包屑 -->
  <nav class="cd-trail">
    <button class="cd-crumb-back" @click="goToRepos">← 代码仓</button>
    <span class="cd-sep" aria-hidden="true">›</span>
    <span class="cd-crumb-here mono">{{ repo?.name }}</span>
  </nav>

  <!-- 头部 -->
  <header class="cd-header">
    <div class="cd-head-left">
      <Icon name="box" :size="22" class="cd-icon" />
      <div class="cd-titles">
        <h1>{{ repo?.name }}</h1>
        <p class="cd-sub">
          <a v-if="repoUrl" :href="repoUrl" target="_blank" rel="noopener" class="cd-ext-link">{{ repo?.remote_url }} ↗</a>
          <span v-else class="mono">{{ repo?.remote_url || '—' }}</span>
        </p>
      </div>
    </div>
    <span class="cd-type">代码仓</span>
  </header>

  <!-- Tab 栏 -->
  <nav class="cd-tabs">
    <button v-for="t in tabs" :key="t.key" class="cd-tab"
            :class="{ on: tab === t.key, disabled: t.disabled }"
            :disabled="t.disabled" @click="tab = t.key">
      <span>{{ t.label }}</span>
      <span v-if="t.n != null" class="cd-tab-n">{{ t.n }}</span>
    </button>
  </nav>

  <div class="cd-content">

    <!-- ═══ 基本信息 ═══ -->
    <div v-if="tab === 'basic'" class="cd-tab-content">
      <dl class="cd-dl">
        <div class="cd-row">
          <dt>仓名 <span class="cd-hint">repo manifest 里声明的仓库名</span></dt>
          <dd class="mono">{{ repo?.name }}</dd>
        </div>
        <div class="cd-row">
          <dt>本地路径 <span class="cd-hint">仓检出到源码树里的相对路径</span></dt>
          <dd class="mono">{{ repo?.path || '—' }}</dd>
        </div>
        <div class="cd-row">
          <dt>远端 <span class="cd-hint">manifest 里 remote 的名字</span></dt>
          <dd class="mono">{{ repo?.remote || '—' }}</dd>
        </div>
        <div class="cd-row">
          <dt>远端地址 <span class="cd-hint">仓的克隆地址</span></dt>
          <dd class="mono">
            <a v-if="repoUrl" :href="repoUrl" target="_blank" rel="noopener" class="cd-ext-link">{{ repo?.remote_url }} ↗</a>
            <span v-else>{{ repo?.remote_url || '—' }}</span>
          </dd>
        </div>
        <div class="cd-row">
          <dt>分支 / 修订 <span class="cd-hint">manifest 指定检出的分支或 tag</span></dt>
          <dd class="mono">{{ repo?.revision || '—' }}</dd>
        </div>
        <div class="cd-row">
          <dt>HEAD <span class="cd-hint">扫描时该仓实际所在的提交</span></dt>
          <dd class="mono">{{ repo?.head_commit || '—' }}</dd>
        </div>
        <div class="cd-row">
          <dt>克隆深度 <span class="cd-hint">manifest 指定的浅克隆深度</span></dt>
          <dd>{{ repo?.clone_depth != null ? repo.clone_depth : '完整克隆' }}</dd>
        </div>
        <div class="cd-row">
          <dt>分组 <span class="cd-hint">manifest 的 groups 属性</span></dt>
          <dd class="mono">{{ repo?.groups || '—' }}</dd>
        </div>
      </dl>

      <div v-if="sizeByPartition.total" class="cd-size-chart">
        <h3 class="cd-chart-title">产物大小分布 <span class="cd-chart-total mono">{{ humanBytes(sizeByPartition.total) }}</span></h3>
        <div class="cd-chart-body">
          <div class="cd-pie" :style="{ background: pieGradient }"></div>
          <ul class="cd-legend">
            <li v-for="([name, size], i) in sizeByPartition.partitions" :key="name">
              <span class="cd-dot" :style="{ background: pieColor(i) }"></span>
              <span class="cd-part-name">{{ name }}</span>
              <span class="cd-part-size mono">{{ humanBytes(size) }}</span>
              <span class="cd-part-pct">{{ ((size / sizeByPartition.total) * 100).toFixed(1) }}%</span>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- ═══ 部件 ═══ -->
    <div v-else-if="tab === 'components'" class="cd-tab-content">
      <table class="cd-table">
        <thead>
          <tr>
            <th>部件名</th>
            <th>子系统</th>
            <th>被依赖</th>
            <th>依赖数</th>
            <th>InnerAPI</th>
            <th>SysCap</th>
            <th>feature</th>
            <th>安装模块</th>
            <th>服务</th>
            <th>SA</th>
            <th>HDI</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="c in d.components" :key="c.id" class="cd-clickable" @click="goToComponent(c.id)">
            <td class="mono cd-link">{{ c.name }}</td>
            <td>{{ c.subsystem || '—' }}</td>
            <td class="cd-center">{{ c.dependents }}</td>
            <td class="cd-center">{{ c.depends }}</td>
            <td class="cd-center">{{ c.apis }}</td>
            <td class="cd-center">{{ c.syscaps }}</td>
            <td class="cd-center">{{ c.features }}</td>
            <td class="cd-center">{{ c.modules }}</td>
            <td class="cd-center">{{ c.services }}</td>
            <td class="cd-center">{{ c.sas }}</td>
            <td class="cd-center">{{ c.hdis }}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- ═══ InnerAPI ═══ -->
    <div v-else-if="tab === 'innerapi'" class="cd-tab-content">
      <table class="cd-table">
        <thead>
          <tr>
            <th>引用名</th>
            <th>GN label <el-tooltip placement="top" content="点击跳转到 BUILD.gn"><span class="cd-q">ⓘ</span></el-tooltip></th>
            <th>类型</th>
            <th>归属部件</th>
            <th>安装模块</th>
            <th>ELF 模块</th>
          </tr>
        </thead>
        <tbody>
          <template v-for="ia in d.innerapis" :key="ia.id">
            <tr>
              <td class="mono">{{ ia.external_name || '—' }}</td>
              <td>
                <a v-if="gnLabelUrl(ia.name)" :href="gnLabelUrl(ia.name)" target="_blank" rel="noopener" class="cd-ext-link mono">{{ ia.name }} ↗</a>
                <span v-else class="mono">{{ ia.name }}</span>
              </td>
              <td>{{ ia.field }}</td>
              <td><button class="cd-link" @click="goToEntity('components', ia.component_id)">{{ ia.component_name }}</button></td>
              <td><button v-if="ia.install_module_id" class="cd-link" @click="goToEntity('install_modules', ia.install_module_id)">查看</button><span v-else>—</span></td>
              <td><button v-if="ia.elf_module_id" class="cd-link" @click="goToEntity('elf_modules', ia.elf_module_id)">{{ (ia.elf_dest || '').split('/').pop() || '查看' }}</button><span v-else>—</span></td>
            </tr>
            <tr class="cd-detail-row">
              <td colspan="6"><details><summary>原始声明</summary><pre>{{ formatJson(ia.record) }}</pre></details></td>
            </tr>
          </template>
        </tbody>
      </table>
    </div>

    <!-- ═══ 特性 ═══ -->
    <div v-else-if="tab === 'feature'" class="cd-tab-content">
      <table class="cd-table">
        <thead><tr><th>特性名</th><th>关联参数名</th><th>参数值</th><th>归属部件</th></tr></thead>
        <tbody>
          <tr v-for="f in d.features" :key="f.id">
            <td class="mono">{{ f.value }}</td>
            <td><button v-if="f.gn_arg_id" class="cd-link" @click="goToEntity('gn_args', f.gn_arg_id)">{{ f.gn_arg_name || '查看' }}</button><span v-else class="cd-muted">未关联</span></td>
            <td class="mono">{{ f.gn_arg_value ?? '—' }}</td>
            <td><button class="cd-link" @click="goToEntity('components', f.component_id)">{{ f.component_name }}</button></td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- ═══ SysCap ═══ -->
    <div v-else-if="tab === 'syscap'" class="cd-tab-content">
      <table class="cd-table">
        <thead><tr><th>能力名</th><th>归属部件</th></tr></thead>
        <tbody>
          <tr v-for="s in d.syscaps" :key="s.id">
            <td class="mono">{{ s.value }}</td>
            <td><button class="cd-link" @click="goToEntity('components', s.component_id)">{{ s.component_name }}</button></td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- ═══ 编译参数 ═══ -->
    <div v-else-if="tab === 'args'" class="cd-tab-content">
      <table class="cd-table">
        <thead>
          <tr>
            <th>参数名</th><th>当前值</th><th>默认值</th><th>类型</th><th>覆盖</th>
            <th>声明文件 <el-tooltip placement="top" content="点击跳转到 git 仓文件"><span class="cd-q">ⓘ</span></el-tooltip></th>
            <th>行号</th><th>归属部件</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="a in d.gnArgs" :key="a.id">
            <td class="mono">{{ a.name }}</td>
            <td class="mono">{{ a.current_value ?? '—' }}</td>
            <td class="mono cd-dim">{{ a.default_value ?? '—' }}</td>
            <td>{{ a.value_type }}</td>
            <td class="cd-center">{{ isOverride(a.has_override) ? '✓' : '—' }}</td>
            <td>
              <a v-if="gitUrl(a.decl_file)" :href="gitUrl(a.decl_file)" target="_blank" rel="noopener" class="cd-ext-link mono cd-truncate">{{ a.decl_file }} ↗</a>
              <span v-else class="mono cd-truncate" :title="a.decl_file">{{ a.decl_file }}</span>
            </td>
            <td class="cd-center">{{ a.decl_line }}</td>
            <td><button class="cd-link" @click="goToEntity('components', a.component_id)">{{ a.component_name }}</button></td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- ═══ 安装产物 ═══ -->
    <div v-else-if="tab === 'artifacts'" class="cd-tab-content">
      <table class="cd-table">
        <thead><tr><th>GN label</th><th>类型</th><th>文件数</th><th>归属部件</th></tr></thead>
        <tbody>
          <template v-for="m in d.modules" :key="m.id">
            <tr class="cd-clickable" @click="goToEntity('install_modules', m.id)">
              <td class="mono cd-link">{{ m.label }}</td>
              <td>{{ m.type }}</td>
              <td class="cd-center">{{ m.target_count }}</td>
              <td><button class="cd-link" @click.stop="goToEntity('components', m.component_id)">{{ m.component_name }}</button></td>
            </tr>
            <tr v-for="t in (targetsByModule.get(m.id) || [])" :key="t.id" class="cd-target-row">
              <td class="cd-target-dest" colspan="4">
                <span class="cd-target-arrow">└</span>
                <span class="mono" :title="t.dest">{{ t.dest }}</span>
                <span v-if="t.link_target_path" class="cd-symlink mono"> → {{ t.link_target_path }}</span>
                <span v-if="t.size" class="cd-size">{{ humanBytes(t.size) }}</span>
              </td>
            </tr>
          </template>
        </tbody>
      </table>
    </div>

    <!-- ═══ 运行时 ═══ -->
    <div v-else-if="tab === 'runtime'" class="cd-tab-content">
      <div v-if="d.services?.length" class="cd-subsection">
        <h4 class="cd-sub-title">系统服务（{{ d.services.length }} 个）</h4>
        <table class="cd-table"><thead><tr><th>服务名</th><th>cfg 文件</th><th>归属部件</th></tr></thead>
          <tbody><tr v-for="s in d.services" :key="s.id" class="cd-clickable" @click="goToEntity('services', s.id)">
            <td class="mono">{{ s.name || '—' }}</td><td class="mono">{{ s.cfg || '—' }}</td>
            <td><button class="cd-link" @click.stop="goToEntity('components', s.component_id)">{{ s.component_name }}</button></td>
          </tr></tbody></table>
      </div>
      <div v-if="d.sas?.length" class="cd-subsection">
        <h4 class="cd-sub-title">SA 服务（{{ d.sas.length }} 个）</h4>
        <table class="cd-table"><thead><tr><th>SA ID</th><th>库路径</th><th>宿主进程</th><th>归属部件</th></tr></thead>
          <tbody><tr v-for="s in d.sas" :key="s.id" class="cd-clickable" @click="goToEntity('sas', s.id)">
            <td class="mono">{{ s.sa_id || '—' }}</td>
            <td class="mono cd-truncate" :title="s.libpath">{{ s.libpath || '—' }}</td>
            <td>{{ s.host || '—' }}</td>
            <td><button class="cd-link" @click.stop="goToEntity('components', s.component_id)">{{ s.component_name }}</button></td>
          </tr></tbody></table>
      </div>
      <div v-if="d.hdis?.length" class="cd-subsection">
        <h4 class="cd-sub-title">HDI 设备（{{ d.hdis.length }} 个）</h4>
        <table class="cd-table"><thead><tr><th>设备名</th><th>库路径</th><th>节点</th><th>宿主进程</th><th>归属部件</th></tr></thead>
          <tbody><tr v-for="h in d.hdis" :key="h.id" class="cd-clickable" @click="goToEntity('hdis', h.id)">
            <td class="mono">{{ h.service_name || '—' }}</td>
            <td class="mono cd-truncate" :title="h.library">{{ h.library || '—' }}</td>
            <td class="mono">{{ h.node || '—' }}</td>
            <td>{{ h.host || '—' }}</td>
            <td><button class="cd-link" @click.stop="goToEntity('components', h.component_id)">{{ h.component_name }}</button></td>
          </tr></tbody></table>
      </div>
    </div>

  </div>
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
.cd-icon { color: var(--entity-repo); flex-shrink: 0; margin-top: 2px }
.cd-titles { min-width: 0 }
.cd-header h1 { margin: 0; font-size: var(--text-xl); font-weight: 600; font-family: var(--font-mono); overflow-wrap: anywhere }
.cd-sub { margin: 2px 0 0; font-size: var(--text-sm); color: var(--text-secondary) }
.cd-type { flex-shrink: 0; font-size: var(--text-xs); color: var(--text-secondary); border: 1px solid var(--border-default); border-radius: var(--radius-full); padding: 2px var(--space-2); margin-top: 4px }
.cd-tabs { display: flex; gap: var(--space-1); border-bottom: 1px solid var(--border-subtle); margin-bottom: var(--space-4); overflow-x: auto }
.cd-tab { display: inline-flex; align-items: baseline; gap: var(--space-2); height: 36px; padding: 0 var(--space-3); font: inherit; font-size: var(--text-sm); color: var(--text-secondary); background: none; border: 0; border-bottom: 2px solid transparent; cursor: pointer; white-space: nowrap; transition: all var(--motion-fast) }
.cd-tab:hover:not(.disabled):not(.on) { color: var(--text-primary); border-bottom-color: var(--border-subtle) }
.cd-tab.on { color: var(--text-primary); font-weight: 600; border-bottom-color: var(--entity-repo) }
.cd-tab.disabled { opacity: .35; cursor: not-allowed }
.cd-tab-n { font-family: var(--font-mono); font-size: var(--text-xs); color: var(--text-tertiary) }
.cd-tab.on .cd-tab-n { color: var(--entity-repo) }
.cd-tab-content { width: 100% }
.cd-dl { display: grid; gap: var(--space-1) }
.cd-row { display: grid; grid-template-columns: 200px 1fr; gap: var(--space-4); padding: var(--space-2) 0; border-bottom: 1px solid var(--border-subtle) }
.cd-row dt { font-size: var(--text-sm); color: var(--text-secondary) }
.cd-hint { display: block; margin-top: 2px; font-size: var(--text-xs); color: var(--text-tertiary) }
.cd-row dd { margin: 0; font-size: var(--text-base); color: var(--text-primary) }
.cd-ext-link { color: var(--entity-component); text-decoration: none; font-family: var(--font-mono) }
.cd-ext-link:hover { text-decoration: underline }
.cd-size-chart { margin-top: var(--space-4); padding: var(--space-4); background: var(--surface-raised); border: 1px solid var(--border-subtle); border-radius: var(--radius-md) }
.cd-chart-title { margin: 0 0 var(--space-3); font-size: var(--text-base); font-weight: 600; color: var(--text-primary) }
.cd-chart-total { margin-left: var(--space-2); font-size: var(--text-sm); color: var(--text-secondary) }
.cd-chart-body { display: flex; align-items: center; gap: var(--space-5); flex-wrap: wrap }
.cd-pie { width: 140px; height: 140px; border-radius: 50%; flex-shrink: 0; box-shadow: 0 0 0 1px var(--border-subtle) }
.cd-legend { list-style: none; margin: 0; padding: 0; display: grid; gap: var(--space-1) }
.cd-legend li { display: flex; align-items: center; gap: var(--space-2); font-size: var(--text-sm) }
.cd-dot { width: 10px; height: 10px; border-radius: 2px; flex-shrink: 0 }
.cd-part-name { color: var(--text-primary); min-width: 80px }
.cd-part-size { color: var(--text-secondary); margin-left: auto }
.cd-part-pct { color: var(--text-tertiary); font-size: var(--text-xs); font-variant-numeric: tabular-nums; min-width: 48px; text-align: right }
.cd-table { width: 100%; border-collapse: collapse; table-layout: auto }
.cd-table th { text-align: left; padding: var(--space-2) var(--space-3); font-size: var(--text-sm); font-weight: 600; color: var(--text-secondary); background: var(--surface-raised); border-bottom: 1px solid var(--border-default); white-space: nowrap }
.cd-table td { padding: var(--space-2) var(--space-3); font-size: var(--text-sm); color: var(--text-primary); border-bottom: 1px solid var(--border-subtle); vertical-align: top }
.cd-table tr:hover { background: var(--surface-overlay) }
.cd-q { margin-left: 2px; font-size: var(--text-xs); color: var(--text-tertiary); cursor: help; vertical-align: super }
.cd-link { font: inherit; font-family: var(--font-mono); font-size: var(--text-sm); color: var(--entity-component); background: none; border: 0; padding: 0; cursor: pointer; text-align: left; overflow-wrap: anywhere }
.cd-link:hover { text-decoration: underline }
.cd-muted { color: var(--text-tertiary); font-size: var(--text-sm) }
.cd-dim { color: var(--text-secondary) }
.cd-center { text-align: center }
.cd-truncate { max-width: 320px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; display: inline-block }
.mono { font-family: var(--font-mono) }
.cd-detail-row { background: var(--surface-sunken) }
.cd-detail-row:hover { background: var(--surface-sunken) }
.cd-detail-row details { padding: var(--space-1) var(--space-3) }
.cd-detail-row summary { cursor: pointer; font-size: var(--text-xs); color: var(--text-tertiary) }
.cd-detail-row pre { margin: 0; padding: var(--space-3); background: var(--surface-sunken); border: 1px solid var(--border-subtle); border-radius: var(--radius-sm); font-family: var(--font-mono); font-size: var(--text-sm); color: var(--text-secondary); overflow: auto; max-height: 300px; white-space: pre-wrap; word-break: break-all }
.cd-subsection { margin-bottom: var(--space-4) }
.cd-sub-title { margin: 0 0 var(--space-2); font-size: var(--text-sm); font-weight: 600; color: var(--text-primary) }
.cd-clickable { cursor: pointer }
.cd-target-row { background: var(--surface-sunken) }
.cd-target-row:hover { background: var(--surface-overlay) }
.cd-target-dest { display: flex; align-items: baseline; gap: var(--space-2); font-size: var(--text-xs) }
.cd-target-arrow { color: var(--text-tertiary); flex-shrink: 0 }
.cd-symlink { color: var(--text-secondary); font-size: var(--text-xs) }
.cd-size { margin-left: auto; color: var(--text-tertiary); font-size: var(--text-xs); font-variant-numeric: tabular-nums }
</style>
