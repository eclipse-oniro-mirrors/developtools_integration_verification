<script setup>
/* 2.2 部件：382 个。原先是卡片网格，统一改表格——
   卡片上"被 N 个部件依赖"这类信息在表格里是一列，可排序、可导出。 */
import { computed, ref, watch } from 'vue'
import { useViewerStore } from '../../stores/viewer.js'
import { loadComponents } from '../../model/lists.js'
import { COLUMNS, GROUPS } from '../../model/columns/components.js'
import { useQueryState } from '../../composables/useQueryState.js'
import EntityTable from '../../components/EntityTable.vue'

const store = useViewerStore()
const all = ref([])
const sub = useQueryState('sub', '')

/* 子系统分面保留成 chips：56 个子系统里 thirdparty 占 110 个，
   分布极不均匀，放下拉里看不出这件事。 */
const subs = computed(() => {
  const by = new Map()
  for (const c of all.value) {
    const k = c.subsystem || '(未分类)'
    by.set(k, (by.get(k) || 0) + 1)
  }
  return [...by.entries()].sort((a, b) => b[1] - a[1] || a[0].localeCompare(b[0]))
})
const rows = computed(() =>
  all.value.filter(c => !sub.value || (c.subsystem || '(未分类)') === sub.value))

watch(() => store.scanId, id => { all.value = loadComponents(id) }, { immediate: true })
</script>

<template>
  <div v-if="!store.dbLoaded" class="empty">请先选择 .db 文件</div>
  <div v-else class="view">
    <header>
      <h1>部件 <span class="total">{{ all.length }} 个部件 · {{ subs.length }} 个子系统</span></h1>
    </header>
    <EntityTable :rows="rows" :columns="COLUMNS" :groups="GROUPS" :total="all.length"
                 name="部件" :tag="sub" default-sort-key="dependents" default-sort-desc
                 entity="components" :row-route="row => `/e/components/${row.id}`">
      <template #facets>
        <div class="facets">
          <button class="chip" :class="{ on: !sub }" @click="sub = ''">
            全部 <span class="n">{{ all.length }}</span></button>
          <button v-for="[name, n] in subs" :key="name" class="chip"
                  :class="{ on: sub === name }" @click="sub = name">
            {{ name }} <span class="n">{{ n }}</span>
          </button>
        </div>
      </template>
    </EntityTable>
  </div>
</template>

<style scoped>
@import '../../styles/list-view.css';
.facets { display: flex; gap: var(--space-1); flex-wrap: wrap; flex: 1;
          max-height: 76px; overflow: auto }
</style>
