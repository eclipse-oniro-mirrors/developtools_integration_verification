<script setup>
/* 1.1 系统服务：164 个运行单元。
   表格本体在 EntityTable.vue，这里只管取数与分面筛选；详情走侧边抽屉。 */
import { computed, ref, watch } from 'vue'
import { useViewerStore } from '../stores/viewer.js'
import { loadRuntimeUnits, KINDS } from '../model/runtime.js'
import { COLUMNS, GROUPS } from '../model/columns/services.js'
import { useQueryState } from '../composables/useQueryState.js'
import EntityTable from '../components/EntityTable.vue'

const store = useViewerStore()

const units = ref([])
const kind = useQueryState('kind', 'all')
const part = useQueryState('part', '')
const sub = useQueryState('sub', '')
const onlyMixed = useQueryState('mixed', '')

const counts = computed(() => {
  const by = { all: units.value.length }
  for (const k of Object.keys(KINDS)) by[k] = units.value.filter(u => u.kind === k).length
  return by
})
const parts = computed(() => [...new Set(units.value.flatMap(u => u.components))].sort())
const subs = computed(() =>
  [...new Set(units.value.map(u => u.subsystem).filter(Boolean))].sort())
const mixedTotal = computed(() => units.value.filter(u => u.mixed).length)

const rows = computed(() => units.value
  .filter(u => kind.value === 'all' || u.kind === kind.value)
  .filter(u => !part.value || u.components.includes(part.value))
  .filter(u => !sub.value || u.subsystem === sub.value)
  .filter(u => !onlyMixed.value || u.mixed))

const tag = computed(() => [kind.value !== 'all' && KINDS[kind.value]?.label,
  part.value, sub.value, onlyMixed.value && '混装'].filter(Boolean).join('_'))
const dirty = computed(() => kind.value !== 'all' || part.value || sub.value || onlyMixed.value)
function reset() { kind.value = 'all'; part.value = ''; sub.value = ''; onlyMixed.value = '' }

watch(() => store.scanId, id => { units.value = loadRuntimeUnits(id) }, { immediate: true })
</script>

<template>
  <div v-if="!store.dbLoaded" class="empty">请先选择 .db 文件</div>
  <div v-else class="view">
    <header>
      <h1>系统服务 <span class="total">{{ units.length }} 个运行单元</span></h1>
      <!-- 按钮与后文之间不留换行：模板里的换行会渲染成一个空格 -->
      <p v-if="mixedTotal" class="hint">其中<button
          class="warnlink" :class="{ on: onlyMixed }"
          @click="onlyMixed = onlyMixed ? '' : '1'">{{ mixedTotal }} 个</button>装载了多个部件的内容——改动影响面与崩溃定位都卡在这里。</p>
    </header>

    <EntityTable :rows="rows" :columns="COLUMNS" :groups="GROUPS" :total="units.length"
                 name="系统服务" :tag="tag" default-sort-key="contentCount" default-sort-desc
                 entity="services" :row-route="row => `/e/services/${row.id}`">
      <template #facets>
        <div class="kinds" role="tablist" aria-label="按类型筛选">
          <button v-for="(meta, k) in { all: { label: '全部' }, ...KINDS }" :key="k"
                  role="tab" :aria-selected="kind === k"
                  class="chip" :class="{ on: kind === k }" @click="kind = k">
            {{ meta.label }} <span class="n">{{ counts[k] ?? 0 }}</span>
          </button>
        </div>
      </template>

      <template #filters>
        <el-select v-model="part" placeholder="按部件" clearable filterable
                   size="small" style="width: 140px">
          <el-option v-for="p in parts" :key="p" :label="p" :value="p" />
        </el-select>
        <el-select v-model="sub" placeholder="按子系统" clearable filterable
                   size="small" style="width: 130px">
          <el-option v-for="x in subs" :key="x" :label="x" :value="x" />
        </el-select>
      </template>

      <template #actions>
        <el-button v-if="dirty" size="small" text @click="reset">清空筛选</el-button>
      </template>

    </EntityTable>
  </div>
</template>

<style scoped>
@import '../styles/list-view.css';
.hint { margin: var(--space-2) 0 0; font-size: var(--text-base); color: var(--text-secondary) }
.warnlink { font: inherit; font-size: inherit; color: var(--severity-warning); font-weight: 600;
            background: none; border: 0; padding: 0; cursor: pointer }
.warnlink.on { text-decoration: underline }
</style>
