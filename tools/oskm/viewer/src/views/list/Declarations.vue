<script setup>
import { ref, computed, watch } from 'vue'
import { useViewerStore } from '../../stores/viewer.js'
import { loadArktsSources } from '../../model/lists.js'
import { COLUMNS, GROUPS } from '../../model/columns/arkts_sources.js'
import { useQueryState } from '../../composables/useQueryState.js'
import EntityTable from '../../components/EntityTable.vue'
import MissingTable from '../../components/MissingTable.vue'

const store = useViewerStore()
const all = ref([])
/* 取数前先确认表在：缺表时 rawQuery 返回 []，渲染出来的空表格会被读成
   "这个产品没有声明文件"，而事实是这个快照没采过。 */
/* 声明文件有定制详情页（内容多，分子 tab），所以用 row-route 整页跳转，
   不走抽屉——抽屉摊不开逐条证据。模块与 Kit 仍走抽屉。 */
watch(() => [store.scanId, store.tables], () => {
  all.value = store.hasTable('arkts_sources') ? loadArktsSources(store.scanId) : []
}, { immediate: true, deep: true })

/* 按"这是什么文件"分面。1,567 份里只有 50 份是 Kit 入口，按路径排序它们全落在
   最后一页，于是首页看起来"所属 Kit"整列都是空的——像坏了，其实是对的。
   给一个一键筛选，把这层结构摆到明面上。 */
const ROLES = { module: '模块声明', kit_entry: 'Kit 入口' }
const role = useQueryState('role', 'all')
const counts = computed(() => {
  const n = { all: all.value.length, module: 0, kit_entry: 0 }
  for (const r of all.value) n[r.role] = (n[r.role] || 0) + 1
  return n
})
const rows = computed(() =>
  (role.value === 'all' ? all.value : all.value.filter(r => r.role === role.value)))
</script>

<template>
  <div v-if="!store.dbLoaded" class="empty">请先选择 .db 文件</div>
  <MissingTable v-else-if="!store.hasTable('arkts_sources')"
                table="arkts_sources" collector="arkts" what="声明文件" />
  <div v-else class="view">
    <header><h1>声明文件 <span class="total">{{ rows.length }} 份</span></h1></header>
    <EntityTable :rows="rows" :columns="COLUMNS" :groups="GROUPS" :total="rows.length"
                 name="声明文件" default-sort-key="source_path" entity="arkts_sources"
                 :row-route="row => `/e/arkts_sources/${row.id}`">
      <template #facets>
        <div class="kinds" role="tablist" aria-label="按文件类型筛选">
          <button v-for="(label, k) in { all: '全部', ...ROLES }" :key="k"
                  role="tab" :aria-selected="role === k"
                  class="chip" :class="{ on: role === k }" @click="role = k">
            {{ label }} <span class="n">{{ counts[k] ?? 0 }}</span>
          </button>
        </div>
      </template>
    </EntityTable>
  </div>
</template>

<style scoped>
@import '../../styles/list-view.css';
.kinds { display: flex; gap: var(--space-2) }
.chip {
  display: inline-flex; align-items: baseline; gap: 6px; padding: 4px 12px;
  border: 1px solid var(--border-subtle); border-radius: var(--radius-full);
  background: none; color: var(--text-secondary); font: inherit; font-size: var(--text-sm);
  cursor: pointer;
}
.chip.on { background: var(--surface-raised); color: var(--text-primary); border-color: var(--border-default) }
.chip .n { color: var(--text-tertiary); font-size: var(--text-xs) }
</style>
