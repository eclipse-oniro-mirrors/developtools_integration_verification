<script setup>
import { ref, watch, computed } from 'vue'
import { useViewerStore } from '../../stores/viewer.js'
import { loadGnArgs } from '../../model/lists.js'
import { COLUMNS, GROUPS } from '../../model/columns/gn_args.js'
import { useQueryState } from '../../composables/useQueryState.js'
import EntityTable from '../../components/EntityTable.vue'

const store = useViewerStore()
const all = ref([])
const type = useQueryState('type', '')
const overridden = useQueryState('ovr', '')

const types = computed(() => [...new Set(all.value.map(a => a.value_type))].sort())
const overriddenCount = computed(() => all.value.filter(a => a.has_override).length)
const rows = computed(() => all.value
  .filter(a => !type.value || a.value_type === type.value)
  .filter(a => !overridden.value || (overridden.value === '1' ? a.has_override : !a.has_override)))
const tag = computed(() => [type.value, overridden.value === '1' ? '已覆盖' : overridden.value === '0' ? '未覆盖' : ''].filter(Boolean).join('_'))

watch(() => store.scanId, id => { all.value = loadGnArgs(id) }, { immediate: true })
</script>

<template>
  <div v-if="!store.dbLoaded" class="empty">请先选择 .db 文件</div>
  <div v-else class="view">
    <header>
      <h1>编译参数 <span class="total">{{ all.length }} 个参数 · {{ overriddenCount }} 个被覆盖</span></h1>
    </header>
    <EntityTable :rows="rows" :columns="COLUMNS" :groups="GROUPS" :total="all.length"
                 name="参数" :tag="tag" default-sort-key="name" default-sort-desc=false
                 entity="gn_args" :row-route="row => `/e/gn_args/${row.id}`">
      <template #facets>
        <div class="facets">
          <button class="chip" :class="{ on: !type }" @click="type = ''">
            全部 <span class="n">{{ all.length }}</span></button>
          <button v-for="t in types" :key="t" class="chip"
                  :class="{ on: type === t }" @click="type = t">
            {{ t }} <span class="n">{{ all.filter(a => a.value_type === t).length }}</span>
          </button>
          <span class="sep" />
          <button class="chip" :class="{ on: overridden === '1' }" @click="overridden = overridden === '1' ? '' : '1'">
            已覆盖 <span class="n">{{ overriddenCount }}</span></button>
          <button class="chip" :class="{ on: overridden === '0' }" @click="overridden = overridden === '0' ? '' : '0'">
            未覆盖 <span class="n">{{ all.length - overriddenCount }}</span></button>
        </div>
      </template>
    </EntityTable>
  </div>
</template>

<style scoped>
@import '../../styles/list-view.css';
.facets { display: flex; gap: var(--space-1); flex-wrap: wrap; flex: 1; max-height: 76px; overflow: auto }
.sep { width: 1px; background: var(--border); margin: 0 4px; }
</style>
