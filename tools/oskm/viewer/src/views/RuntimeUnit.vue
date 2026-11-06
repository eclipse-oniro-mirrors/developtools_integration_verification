<script setup>
import { computed, ref, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { loadRuntimeUnits, KINDS } from '../model/runtime.js'
import { goBackTo, openEntity } from '../model/nav.js'
import { useScrollMemory } from '../composables/useScrollMemory.js'
import PathChip from '../components/PathChip.vue'
import JsonValue from '../components/JsonValue.vue'
import Icon from '../ui/Icon.vue'

const route = useRoute()
const router = useRouter()
const store = useViewerStore()
const units = ref([])
const scroller = ref(null)
useScrollMemory(scroller)

/* 原先这里是 router.push('/runtime')：那是往历史里再压一格，不是返回——
   既丢了列表的筛选，后退键还越按越深。见 docs/navigation-options.md §1.3 */
const backToRuntime = () => goBackTo(router, '/runtime/services')

watch(() => [store.scanId, route.params.id],
      () => { units.value = loadRuntimeUnits(store.scanId) }, { immediate: true })

const unit = computed(() => units.value.find(u => String(u.id) === String(route.params.id)))
const kind = computed(() => unit.value && KINDS[unit.value.kind])
const noun = computed(() => (unit.value?.kind === 'hdf' ? '装载的设备' : '装载的 SA'))

/* record 里没有成列的键在这里展开。EntityDossier 的"其它声明"也做同一件事，
   两处并存是有意的：那边按字段逐条列，这边与"装载内容"放在一起看，
   排查"这个进程申请了什么权限、装了谁的 SA"时不用来回切。 */
const COLUMN_KEYS = new Set(['name', 'uid', 'gid', 'secon', 'ondemand',
                             'sandbox', 'importance', 'start-mode', 'path'])
const extras = computed(() => {
  let obj
  try { obj = JSON.parse(unit.value?.record || '{}') } catch { return [] }
  return Object.entries(obj || {})
    .filter(([k, v]) => !COLUMN_KEYS.has(k) && v !== null && v !== '')
    .map(([k, v]) => ({ k, v, text: typeof v === 'object' ? JSON.stringify(v) : String(v) }))
})

/* 默认按部件分组——这正是"混装"要传达的信息 */
const groups = computed(() => {
  if (!unit.value) return []
  const by = new Map()
  for (const item of unit.value.contents) {
    const key = item.component || '(归属未知)'
    if (!by.has(key)) by.set(key, [])
    by.get(key).push(item)
  }
  return [...by.entries()]
    .map(([component, items]) => ({ component, items }))
    .sort((a, b) => b.items.length - a.items.length || a.component.localeCompare(b.component))
})
</script>

<template>
  <div v-if="!unit" class="empty">
    未找到该运行单元 · <a href="#" @click.prevent="backToRuntime">返回运行视图</a>
  </div>
  <article v-else ref="scroller" class="unit">
    <nav class="crumb">
      <a href="#" @click.prevent="backToRuntime">← 运行视图</a>
    </nav>

    <header class="head" :class="`k-${unit.kind}`">
      <span class="glyph" aria-hidden="true">{{ kind.glyph }}</span>
      <h1>{{ unit.host || unit.name }}</h1>
      <span class="kind">{{ kind.label }}</span>
    </header>

    <dl class="facts">
      <dt>启动</dt>
      <dd>
        <PathChip :path="unit.cfg" :max="200" />
        <div v-if="unit.executable" class="cmd">
          {{ [unit.executable, ...(unit.args || [])].join(' ') }}
        </div>
      </dd>
      <dt>归属</dt>
      <dd>
        <template v-if="unit.component">
          部件 <strong>{{ unit.component }}</strong>
          <span v-if="unit.subsystem" class="dim">（{{ unit.subsystem }}）</span>
          <button v-if="unit.componentId" class="go"
                  @click="router.push(`/e/components/${unit.componentId}`)">档案 →</button>
        </template>
        <span v-else class="warn">⚠ 归属未知</span>
      </dd>
      <dt>安装</dt>
      <dd>
        <span v-if="unit.installLabel" class="mono">{{ unit.installLabel }}</span>
        <span v-else class="dim">—</span>
      </dd>
    </dl>

    <p v-if="unit.mixed" class="mixed">
      <Icon name="warn" :size="15" />
      这个运行单元装载了 <strong>{{ unit.components.length }}</strong> 个部件的内容——
      改动影响面、崩溃定位、内存归因都要按部件区分。
    </p>

    <section v-if="extras.length" class="extras">
      <h2>其它声明 <span class="dim">来自 record，列表里不展开</span></h2>
      <dl>
        <template v-for="e in extras" :key="e.k">
          <dt class="mono">{{ e.k }}</dt>
          <dd>
            <JsonValue v-if="typeof e.v === 'object'" :value="JSON.stringify(e.v)" />
            <span v-else class="mono">{{ e.text }}</span>
          </dd>
        </template>
      </dl>
    </section>

    <section v-if="unit.contents.length" class="contents">
      <h2>{{ noun }}（{{ unit.contents.length }}）<span class="dim">按部件分组</span></h2>
      <div v-for="g in groups" :key="g.component" class="group">
        <h3>{{ g.component }} <span class="n">{{ g.items.length }}</span></h3>
        <ul>
          <li v-for="i in g.items" :key="`${i.table}-${i.id}`">
            <button class="title mono" @click="openEntity(router, route, i.table, i.id)">
              {{ i.title }}</button>
            <span class="sub mono">{{ i.subtitle }}</span>
          </li>
        </ul>
      </div>
    </section>

  </article>
</template>

<style scoped>
.unit { height: 100%; overflow: auto; padding: var(--space-5); max-width: 960px }
.crumb { margin-bottom: var(--space-3); font-size: var(--text-sm) }

.head {
  display: flex; align-items: center; gap: var(--space-3);
  padding-bottom: var(--space-3); border-bottom: 1px solid var(--border-subtle);
}
.head h1 { margin: 0; font-size: var(--text-xl); font-family: var(--font-mono); font-weight: 600 }
.glyph { font-size: var(--text-xl) }
.k-sa .glyph { color: var(--entity-sa) }
.k-hdf .glyph { color: var(--entity-hdi) }
.k-daemon .glyph { color: var(--entity-service) }
.kind {
  margin-left: auto; font-size: var(--text-xs); color: var(--text-secondary);
  border: 1px solid var(--border-default); border-radius: var(--radius-full);
  padding: 2px var(--space-2);
}

.facts {
  display: grid; grid-template-columns: 72px 1fr; gap: var(--space-2) var(--space-4);
  margin: var(--space-4) 0; font-size: var(--text-base);
}
.facts dt { color: var(--text-secondary) }
.facts dd { margin: 0 }
.cmd { font-family: var(--font-mono); font-size: var(--text-sm); color: var(--text-tertiary); margin-top: 2px }
.mono { font-family: var(--font-mono); font-size: var(--text-sm) }
.go { font: inherit; font-size: var(--text-sm); color: var(--entity-component);
      background: none; border: 0; cursor: pointer; margin-left: var(--space-2) }
.go:hover { text-decoration: underline }
.dim { color: var(--text-tertiary) }
.warn { color: var(--severity-warning) }

.contents h2 {
  font-size: var(--text-lg); font-weight: 600; margin: var(--space-5) 0 var(--space-3);
  border-top: 1px solid var(--border-subtle); padding-top: var(--space-4);
}
.contents h2 .dim { font-size: var(--text-sm); font-weight: 400; margin-left: var(--space-2) }
.group { margin-bottom: var(--space-4) }
.group h3 {
  margin: 0 0 var(--space-2); font-size: var(--text-base); font-weight: 600;
  font-family: var(--font-mono); color: var(--entity-component);
}
.group h3 .n { color: var(--text-tertiary); font-weight: 400; margin-left: var(--space-1) }
.group ul { margin: 0; padding: 0; list-style: none }
.group li {
  display: flex; gap: var(--space-3); align-items: baseline;
  padding: var(--space-1) var(--space-3);
  border-left: 2px solid var(--border-subtle);
}
.group li .title { color: var(--entity-component); min-width: 72px; font: inherit;
                   font-family: var(--font-mono); font-size: var(--text-sm);
                   background: none; border: 0; padding: 0; cursor: pointer; text-align: left }
.group li .title:hover { text-decoration: underline }
.group li .sub { color: var(--text-secondary) }

.mixed { color: var(--text-primary);
  display: flex; align-items: center; gap: var(--space-2); flex-wrap: wrap;
  margin-top: var(--space-5); padding: var(--space-3) var(--space-4);
  background: color-mix(in srgb, var(--severity-warning) 12%, transparent);
  border-left: 2px solid var(--severity-warning);
  border-radius: var(--radius-sm); font-size: var(--text-base);
}
.extras h2 {
  font-size: var(--text-lg); font-weight: 600; margin: var(--space-5) 0 var(--space-3);
  border-top: 1px solid var(--border-subtle); padding-top: var(--space-4);
}
.extras h2 .dim { font-size: var(--text-sm); font-weight: 400; margin-left: var(--space-2) }
.extras dl { display: grid; grid-template-columns: 170px 1fr; gap: var(--space-1) var(--space-4);
             margin: 0 }
.extras dt { color: var(--text-secondary); font-size: var(--text-sm) }
.extras dd { margin: 0; overflow-wrap: anywhere }
.empty { padding: var(--space-7); text-align: center; color: var(--text-secondary) }
</style>
