<script setup>
import { ref, computed, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { useQueryState } from '../composables/useQueryState.js'
import { loadComponentDetail } from '../model/lists.js'
import { humanBytes } from '../model/fields.js'
import Icon from '../ui/Icon.vue'

const route = useRoute()
const router = useRouter()
const store = useViewerStore()

const id = computed(() => route.params.id)
const data = ref(null)
const tab = useQueryState('tab', 'basic')

watch(() => [store.scanId, id.value], () => {
  data.value = loadComponentDetail(store.scanId, id.value)
}, { immediate: true })

const d = computed(() => data.value || {})
const comp = computed(() => d.value.comp)
const record = computed(() => d.value.record || {})

/* Tab 定义：8 个 Tab，顺序与一级菜单一致。空 Tab 灰掉。 */
const hasDeps = computed(() => !!(d.value.forwardDeps?.length || d.value.dependents?.length || d.value.thirdParty?.length))
const hasArtifacts = computed(() => !!d.value.modules?.length)
const hasRuntime = computed(() => !!(d.value.services?.length || d.value.sas?.length || d.value.hdis?.length))
const tabs = computed(() => [
  { key: 'basic',    label: '基本信息', n: null,  disabled: false },
  { key: 'innerapi', label: 'InnerAPI', n: d.value.innerapis?.length ?? 0, disabled: !d.value.innerapis?.length },
  { key: 'feature',  label: '特性',     n: d.value.features?.length ?? 0,  disabled: !d.value.features?.length },
  { key: 'syscap',   label: 'SysCap',   n: d.value.syscaps?.length ?? 0,   disabled: !d.value.syscaps?.length },
  { key: 'args',     label: '编译参数',  n: d.value.gnArgs?.length ?? 0,    disabled: !d.value.gnArgs?.length },
  { key: 'deps',     label: '依赖关系',  n: null,  disabled: !hasDeps.value },
  { key: 'artifacts',label: '安装产物',  n: d.value.modules?.length ?? 0,   disabled: !hasArtifacts.value },
  { key: 'runtime',  label: '运行时',    n: null,  disabled: !hasRuntime.value },
])
watch(() => tabs.value, (ts) => {
  const cur = ts.find(t => t.key === tab.value)
  if (cur?.disabled) { const first = ts.find(t => !t.disabled); if (first) tab.value = first.key }
}, { flush: 'post' })

/* 导航 */
function goToComponent(componentId) { if (componentId) router.push({ path: `/e/components/${componentId}` }) }
function goToEntity(table, entityId) { if (entityId) router.push({ path: `/e/${table}/${entityId}` }) }
function goToComponents() { router.push('/parts/components') }

/* git 仓文件 URL：把 workspace 相对路径拼成代码托管平台链接 */
function gitUrl(workspacePath) {
  if (!workspacePath || !comp.value?.remote_url) return null
  const base = comp.value.remote_url.replace(/\.git$/, '')
  const ref = comp.value.head_commit || comp.value.revision || 'master'
  let p = workspacePath
  if (comp.value.repo_path && p.startsWith(comp.value.repo_path + '/'))
    p = p.slice(comp.value.repo_path.length + 1)
  return `${base}/blob/${ref}/${p}`
}
/* GN label → BUILD.gn 文件 URL */
function gnLabelUrl(label) {
  if (!label) return null
  let p = label.replace(/^\/\//, '')
  const colon = p.indexOf(':')
  if (colon >= 0) p = p.slice(0, colon)
  return gitUrl(p + '/BUILD.gn')
}
const manifestUrl = computed(() => comp.value?.manifest ? gitUrl(comp.value.manifest) : null)

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
const recordJson = computed(() => { try { return JSON.stringify(record.value, null, 2) } catch { return '' } })

/* 产物大小按分区分布：从已有的 targets 数据计算，无需额外 SQL */
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
</script>

<template>
<div ref="scroller" class="cd-page">
  <!-- 面包屑：两层，← 部件 › 部件名 -->
  <nav class="cd-trail" aria-label="所属">
    <button class="cd-crumb-back" @click="goToComponents">← 部件</button>
    <span class="cd-sep" aria-hidden="true">›</span>
    <span class="cd-crumb-here mono">{{ comp?.name }}</span>
  </nav>

  <!-- 头部 -->
  <header class="cd-header">
    <div class="cd-head-left">
      <Icon name="build" :size="22" class="cd-icon" />
      <div class="cd-titles">
        <h1>{{ comp?.name }}</h1>
        <p class="cd-sub">
          <span v-if="comp?.subsystem" class="mono">{{ comp.subsystem }}</span>
          <span v-if="comp?.repo"> / {{ comp.repo }}</span>
        </p>
      </div>
    </div>
    <span class="cd-type">部件</span>
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

    <!-- ═══════════════ 基本信息 ═══════════════ -->
    <div v-if="tab === 'basic'" class="cd-tab-content">
      <dl class="cd-dl">
        <div class="cd-row">
          <dt>子系统 <span class="cd-hint">部件所属的子系统</span></dt>
          <dd class="mono">{{ comp?.subsystem || '—' }}</dd>
        </div>
        <div class="cd-row">
          <dt>代码仓 <span class="cd-hint">部件代码所在的 git 仓</span></dt>
          <dd><button v-if="comp?.repo_id" class="cd-link" @click="goToEntity('repos', comp.repo_id)">{{ comp?.repo }}</button><span v-else>—</span></dd>
        </div>
        <div class="cd-row">
          <dt>部件清单 <span class="cd-hint">声明这个部件的 bundle.json</span></dt>
          <dd class="mono">
            <a v-if="manifestUrl" :href="manifestUrl" target="_blank" rel="noopener" class="cd-ext-link">{{ comp?.manifest }} ↗</a>
            <span v-else>{{ comp?.manifest || '—' }}</span>
          </dd>
        </div>
        <div class="cd-row">
          <dt>描述 <span class="cd-hint">bundle.json 里 component.description</span></dt>
          <dd>{{ record.description || '—' }}</dd>
        </div>
      </dl>

      <!-- 产物大小分布饼图 -->
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
      <details class="cd-record">
        <summary>原始声明 record <span class="cd-record-hint">逐字保留的 bundle.json component 对象</span></summary>
        <pre>{{ recordJson }}</pre>
      </details>
    </div>

    <!-- ═══════════════ InnerAPI ═══════════════ -->
    <div v-else-if="tab === 'innerapi'" class="cd-tab-content">
      <p class="cd-tab-desc">部件给别的部件用的接口。其他部件通过 external_deps 引用这些 GN label。</p>
      <table class="cd-table">
        <thead>
          <tr>
            <th>引用名 <el-tooltip placement="top" content="external_deps 中使用的引用名（component:target 格式）"><span class="cd-q">ⓘ</span></el-tooltip></th>
            <th>GN label <el-tooltip placement="top" content="inner_kits / inner_api 中声明的 GN target label，点击跳转到 BUILD.gn"><span class="cd-q">ⓘ</span></el-tooltip></th>
            <th>类型 <el-tooltip placement="top" content="声明来源：inner_kits 是传统接口声明，inner_api 是新的统一接口声明方式"><span class="cd-q">ⓘ</span></el-tooltip></th>
            <th>安装模块 <el-tooltip placement="top" content="component_links 按 label 名匹配到的安装模块"><span class="cd-q">ⓘ</span></el-tooltip></th>
            <th>ELF 模块 <el-tooltip placement="top" content="安装模块对应的 ELF 文件（.so）"><span class="cd-q">ⓘ</span></el-tooltip></th>
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
              <td><button v-if="ia.install_module_id" class="cd-link" @click="goToEntity('install_modules', ia.install_module_id)">查看</button><span v-else>—</span></td>
              <td><button v-if="ia.elf_module_id" class="cd-link" @click="goToEntity('elf_modules', ia.elf_module_id)">{{ (ia.elf_dest || '').split('/').pop() || '查看' }}</button><span v-else>—</span></td>
            </tr>
            <tr class="cd-detail-row">
              <td colspan="5">
                <details>
                  <summary>原始声明</summary>
                  <pre>{{ formatJson(ia.record) }}</pre>
                </details>
              </td>
            </tr>
          </template>
        </tbody>
      </table>
    </div>

    <!-- ═══════════════ 特性 ═══════════════ -->
    <div v-else-if="tab === 'feature'" class="cd-tab-content">
      <p class="cd-tab-desc">可配置开关名，通常与编译参数同名，对应一个 GN declare_args() 参数。</p>
      <table class="cd-table">
        <thead>
          <tr>
            <th>特性名 <el-tooltip placement="top" content="bundle.json 中 component.features 数组的一项"><span class="cd-q">ⓘ</span></el-tooltip></th>
            <th>关联参数名 <el-tooltip placement="top" content="component_links 按 features.value ↔ gn_args.name 匹配的结果"><span class="cd-q">ⓘ</span></el-tooltip></th>
            <th>参数值 <el-tooltip placement="top" content="关联的编译参数在当前产品构建中生效的值"><span class="cd-q">ⓘ</span></el-tooltip></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="f in d.features" :key="f.id">
            <td class="mono">{{ f.value }}</td>
            <td>
              <button v-if="f.gn_arg_id" class="cd-link" @click="goToEntity('gn_args', f.gn_arg_id)">{{ f.gn_arg_name || '查看' }}</button>
              <span v-else class="cd-muted">未关联</span>
            </td>
            <td class="mono">{{ f.gn_arg_value ?? '—' }}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- ═══════════════ SysCap ═══════════════ -->
    <div v-else-if="tab === 'syscap'" class="cd-tab-content">
      <p class="cd-tab-desc">声明提供的系统能力。设备根据 SysCap 列表判断产品是否支持某项能力。</p>
      <table class="cd-table">
        <thead><tr><th>能力名 <el-tooltip placement="top" content="格式为 SystemCapability.X.Y.Z，声明这个部件提供了什么系统能力"><span class="cd-q">ⓘ</span></el-tooltip></th></tr></thead>
        <tbody><tr v-for="s in d.syscaps" :key="s.id"><td class="mono">{{ s.value }}</td></tr></tbody>
      </table>
    </div>

    <!-- ═══════════════ 编译参数 ═══════════════ -->
    <div v-else-if="tab === 'args'" class="cd-tab-content">
      <p class="cd-tab-desc">GN declare_args() 声明在这个部件源码目录里的构建参数。</p>
      <table class="cd-table">
        <thead>
          <tr>
            <th>参数名 <el-tooltip placement="top" content="GN declare_args() 中声明的构建参数名，全局唯一"><span class="cd-q">ⓘ</span></el-tooltip></th>
            <th>当前值 <el-tooltip placement="top" content="该参数在当前产品构建中生效的值"><span class="cd-q">ⓘ</span></el-tooltip></th>
            <th>默认值 <el-tooltip placement="top" content="declare_args() 中声明的默认值"><span class="cd-q">ⓘ</span></el-tooltip></th>
            <th>类型 <el-tooltip placement="top" content="值的类型：bool / str / int / list"><span class="cd-q">ⓘ</span></el-tooltip></th>
            <th>覆盖 <el-tooltip placement="top" content="✓ 表示 args.gn 中显式设置了该参数的值"><span class="cd-q">ⓘ</span></el-tooltip></th>
            <th>声明文件 <el-tooltip placement="top" content="声明该参数的 .gni 或 BUILD.gn 文件，点击跳转"><span class="cd-q">ⓘ</span></el-tooltip></th>
            <th>行号</th>
            <th>注释</th>
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
            <td class="cd-truncate" :title="a.comment">{{ a.comment || '—' }}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- ═══════════════ 依赖关系 ═══════════════ -->
    <div v-else-if="tab === 'deps'" class="cd-tab-content">
      <div v-if="d.forwardDeps?.length" class="cd-subsection">
        <h4 class="cd-sub-title">依赖了谁（{{ d.forwardDeps.length }} 个）<span class="cd-sub-hint">这个部件运行/构建需要哪些部件</span></h4>
        <ul class="cd-chips"><li v-for="dep in d.forwardDeps" :key="dep.name">
          <button v-if="dep.resolved" class="cd-link" @click="goToComponent(dep.id)">{{ dep.name }}</button>
          <span v-else class="cd-unresolved" :title="dep.name + ' 不在本产品构建索引中'">{{ dep.name }}</span>
        </li></ul>
      </div>
      <div v-if="d.dependents?.length" class="cd-subsection">
        <h4 class="cd-sub-title">被谁依赖（{{ d.dependents.length }} 个）<span class="cd-sub-hint">改动这个部件会影响哪些部件</span></h4>
        <ul class="cd-chips"><li v-for="dep in d.dependents" :key="dep.id">
          <button class="cd-link" @click="goToComponent(dep.id)">{{ dep.name }}</button>
        </li></ul>
      </div>
      <div v-if="d.thirdParty?.length" class="cd-subsection">
        <h4 class="cd-sub-title">三方库依赖（{{ d.thirdParty.length }} 个）</h4>
        <ul class="cd-chips"><li v-for="lib in d.thirdParty" :key="lib" class="cd-chip-static">{{ lib }}</li></ul>
      </div>
    </div>

    <!-- ═══════════════ 安装产物 ═══════════════ -->
    <div v-else-if="tab === 'artifacts'" class="cd-tab-content">
      <p class="cd-tab-desc">装进镜像的构建目标，每个模块装出一个或多个文件。</p>
      <table class="cd-table">
        <thead>
          <tr>
            <th>GN label <el-tooltip placement="top" content="去 toolchain 后缀的 GN label"><span class="cd-q">ⓘ</span></el-tooltip></th>
            <th>类型 <el-tooltip placement="top" content="安装模块类型"><span class="cd-q">ⓘ</span></el-tooltip></th>
            <th>文件数</th>
          </tr>
        </thead>
        <tbody>
          <template v-for="m in d.modules" :key="m.id">
            <tr class="cd-module-row" @click="goToEntity('install_modules', m.id)">
              <td class="mono cd-link">{{ m.label }}</td>
              <td>{{ m.type }}</td>
              <td class="cd-center">{{ m.target_count }}</td>
            </tr>
            <tr v-for="t in (targetsByModule.get(m.id) || [])" :key="t.id" class="cd-target-row">
              <td class="cd-target-dest" colspan="3">
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

    <!-- ═══════════════ 运行时 ═══════════════ -->
    <div v-else-if="tab === 'runtime'" class="cd-tab-content">
      <div v-if="d.services?.length" class="cd-subsection">
        <h4 class="cd-sub-title">系统服务（{{ d.services.length }} 个）<span class="cd-sub-hint">init 配置声明的服务</span></h4>
        <table class="cd-table"><thead><tr><th>服务名</th><th>cfg 文件</th></tr></thead>
          <tbody><tr v-for="s in d.services" :key="s.id" class="cd-clickable" @click="goToEntity('services', s.id)">
            <td class="mono">{{ s.name || '—' }}</td><td class="mono">{{ s.cfg || '—' }}</td>
          </tr></tbody></table>
      </div>
      <div v-if="d.sas?.length" class="cd-subsection">
        <h4 class="cd-sub-title">SA 服务（{{ d.sas.length }} 个）<span class="cd-sub-hint">SystemAbility</span></h4>
        <table class="cd-table"><thead><tr><th>SA ID</th><th>库路径</th><th>宿主进程</th></tr></thead>
          <tbody><tr v-for="s in d.sas" :key="s.id" class="cd-clickable" @click="goToEntity('sas', s.id)">
            <td class="mono">{{ s.sa_id || '—' }}</td>
            <td class="mono cd-truncate" :title="s.libpath">{{ s.libpath || '—' }}</td>
            <td>{{ s.host || '—' }}</td>
          </tr></tbody></table>
      </div>
      <div v-if="d.hdis?.length" class="cd-subsection">
        <h4 class="cd-sub-title">HDI 设备（{{ d.hdis.length }} 个）<span class="cd-sub-hint">HDF 设备驱动</span></h4>
        <table class="cd-table"><thead><tr><th>设备名</th><th>库路径</th><th>节点</th><th>宿主进程</th></tr></thead>
          <tbody><tr v-for="h in d.hdis" :key="h.id" class="cd-clickable" @click="goToEntity('hdis', h.id)">
            <td class="mono">{{ h.service_name || '—' }}</td>
            <td class="mono cd-truncate" :title="h.library">{{ h.library || '—' }}</td>
            <td class="mono">{{ h.node || '—' }}</td>
            <td>{{ h.host || '—' }}</td>
          </tr></tbody></table>
      </div>
    </div>

  </div>
</div>
</template>

<style scoped>
.cd-page { height: 100%; overflow: auto; padding: var(--space-5) var(--space-6) var(--space-7) }

.cd-trail { display: flex; align-items: center; gap: var(--space-1); flex-wrap: wrap;
            margin-bottom: var(--space-3); font-size: var(--text-sm) }
.cd-crumb-back { font: inherit; font-size: var(--text-sm); padding: 0;
                  background: none; border: 0; cursor: pointer; color: var(--text-secondary) }
.cd-crumb-back:hover { text-decoration: underline; color: var(--entity-component) }
.cd-sep { color: var(--text-tertiary) }
.cd-crumb-here { color: var(--text-secondary); font-weight: 600 }

.cd-header { display: flex; align-items: flex-start; gap: var(--space-3);
             padding-bottom: var(--space-4); border-bottom: 1px solid var(--border-subtle); margin-bottom: var(--space-4) }
.cd-head-left { display: flex; gap: var(--space-3); flex: 1; min-width: 0 }
.cd-icon { color: var(--entity-component); flex-shrink: 0; margin-top: 2px }
.cd-titles { min-width: 0 }
.cd-header h1 { margin: 0; font-size: var(--text-xl); font-weight: 600; font-family: var(--font-mono); overflow-wrap: anywhere }
.cd-sub { margin: 2px 0 0; font-size: var(--text-sm); color: var(--text-secondary) }
.cd-type { flex-shrink: 0; font-size: var(--text-xs); color: var(--text-secondary);
           border: 1px solid var(--border-default); border-radius: var(--radius-full); padding: 2px var(--space-2); margin-top: 4px }

.cd-tabs { display: flex; gap: var(--space-1); border-bottom: 1px solid var(--border-subtle);
           margin-bottom: var(--space-4); overflow-x: auto }
.cd-tab { display: inline-flex; align-items: baseline; gap: var(--space-2);
          height: 36px; padding: 0 var(--space-3); font: inherit; font-size: var(--text-sm);
          color: var(--text-secondary); background: none; border: 0; border-bottom: 2px solid transparent;
          cursor: pointer; white-space: nowrap; transition: all var(--motion-fast) }
.cd-tab:hover:not(.disabled):not(.on) { color: var(--text-primary); border-bottom-color: var(--border-subtle) }
.cd-tab.on { color: var(--text-primary); font-weight: 600; border-bottom-color: var(--entity-component) }
.cd-tab.disabled { opacity: .35; cursor: not-allowed }
.cd-tab-n { font-family: var(--font-mono); font-size: var(--text-xs); color: var(--text-tertiary) }
.cd-tab.on .cd-tab-n { color: var(--entity-component) }
.cd-tab-desc { margin: 0 0 var(--space-3); font-size: var(--text-sm); color: var(--text-secondary) }
.cd-tab-content { width: 100% }

.cd-dl { display: grid; gap: var(--space-1) }
.cd-row { display: grid; grid-template-columns: 200px 1fr; gap: var(--space-4);
          padding: var(--space-2) 0; border-bottom: 1px solid var(--border-subtle) }
.cd-row dt { font-size: var(--text-sm); color: var(--text-secondary) }
.cd-hint { display: block; margin-top: 2px; font-size: var(--text-xs); color: var(--text-tertiary) }
.cd-row dd { margin: 0; font-size: var(--text-base); color: var(--text-primary) }
.cd-ext-link { color: var(--entity-component); text-decoration: none; font-family: var(--font-mono) }
.cd-ext-link:hover { text-decoration: underline }

.cd-record { margin-top: var(--space-4) }

/* ── 产物大小饼图 ── */
.cd-size-chart { margin-top: var(--space-4); padding: var(--space-4);
                 background: var(--surface-raised); border: 1px solid var(--border-subtle);
                 border-radius: var(--radius-md) }
.cd-chart-title { margin: 0 0 var(--space-3); font-size: var(--text-base); font-weight: 600; color: var(--text-primary) }
.cd-chart-total { margin-left: var(--space-2); font-size: var(--text-sm); color: var(--text-secondary) }
.cd-chart-body { display: flex; align-items: center; gap: var(--space-5); flex-wrap: wrap }
.cd-pie { width: 140px; height: 140px; border-radius: 50%; flex-shrink: 0;
          box-shadow: 0 0 0 1px var(--border-subtle) }
.cd-legend { list-style: none; margin: 0; padding: 0; display: grid; gap: var(--space-1) }
.cd-legend li { display: flex; align-items: center; gap: var(--space-2); font-size: var(--text-sm) }
.cd-dot { width: 10px; height: 10px; border-radius: 2px; flex-shrink: 0 }
.cd-part-name { color: var(--text-primary); min-width: 80px }
.cd-part-size { color: var(--text-secondary); margin-left: auto }
.cd-part-pct { color: var(--text-tertiary); font-size: var(--text-xs); font-variant-numeric: tabular-nums; min-width: 48px; text-align: right }
@media (max-width: 520px) { .cd-chart-body { flex-direction: column; align-items: flex-start } }
.cd-record summary { cursor: pointer; font-size: var(--text-sm); color: var(--text-secondary); font-weight: 600; padding: var(--space-2) 0 }
.cd-record-hint { margin-left: var(--space-2); font-size: var(--text-xs); font-weight: 400; color: var(--text-tertiary) }
.cd-record pre, .cd-detail-row pre { margin: 0; padding: var(--space-3); background: var(--surface-sunken);
                  border: 1px solid var(--border-subtle); border-radius: var(--radius-sm);
                  font-family: var(--font-mono); font-size: var(--text-sm); color: var(--text-secondary);
                  overflow: auto; max-height: 300px; white-space: pre-wrap; word-break: break-all }

.cd-table { width: 100%; border-collapse: collapse; table-layout: auto }
.cd-table th { text-align: left; padding: var(--space-2) var(--space-3);
               font-size: var(--text-sm); font-weight: 600; color: var(--text-secondary);
               background: var(--surface-raised); border-bottom: 1px solid var(--border-default); white-space: nowrap }
.cd-table td { padding: var(--space-2) var(--space-3); font-size: var(--text-sm);
               color: var(--text-primary); border-bottom: 1px solid var(--border-subtle); vertical-align: top }
.cd-table tr:hover { background: var(--surface-overlay) }
.cd-q { margin-left: 2px; font-size: var(--text-xs); color: var(--text-tertiary); cursor: help; vertical-align: super }

.cd-link { font: inherit; font-family: var(--font-mono); font-size: var(--text-sm);
           color: var(--entity-component); background: none; border: 0; padding: 0;
           cursor: pointer; text-align: left; overflow-wrap: anywhere }
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

.cd-subsection { margin-bottom: var(--space-4) }
.cd-sub-title { margin: 0 0 var(--space-2); font-size: var(--text-sm); font-weight: 600; color: var(--text-primary) }
.cd-sub-hint { margin-left: var(--space-2); font-size: var(--text-xs); font-weight: 400; color: var(--text-tertiary) }
.cd-chips { list-style: none; margin: 0; padding: 0; display: flex; flex-wrap: wrap; gap: var(--space-1) }
.cd-chips li { padding: 2px var(--space-2); border: 1px solid var(--border-subtle); border-radius: var(--radius-sm); background: var(--surface-raised) }
.cd-chip-static { font-family: var(--font-mono); font-size: var(--text-sm); color: var(--text-secondary) }
.cd-unresolved { color: var(--severity-warning); font-family: var(--font-mono); font-size: var(--text-sm); cursor: help }

.cd-module-row { cursor: pointer }
.cd-target-row { background: var(--surface-sunken) }
.cd-target-row:hover { background: var(--surface-overlay) }
.cd-target-dest { display: flex; align-items: baseline; gap: var(--space-2); font-size: var(--text-xs) }
.cd-target-arrow { color: var(--text-tertiary); flex-shrink: 0 }
.cd-symlink { color: var(--text-secondary); font-size: var(--text-xs) }
.cd-size { margin-left: auto; color: var(--text-tertiary); font-size: var(--text-xs); font-variant-numeric: tabular-nums }
.cd-clickable { cursor: pointer }
</style>
