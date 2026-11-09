<script setup>
import { ref, watch } from 'vue'
import { useViewerStore } from '../../stores/viewer.js'
import { loadArktsKits } from '../../model/lists.js'
import { COLUMNS, GROUPS } from '../../model/columns/arkts_kits.js'
import EntityTable from '../../components/EntityTable.vue'
import MissingTable from '../../components/MissingTable.vue'

const store = useViewerStore()
const all = ref([])
/* 取数前先确认表在：缺表时 rawQuery 返回 []，渲染出来的空表格会被读成
   "这个产品没有Kit"，而事实是这个快照没采过。 */
watch(() => [store.scanId, store.tables], () => {
  all.value = store.hasTable('arkts_kits') ? loadArktsKits(store.scanId) : []
}, { immediate: true, deep: true })
</script>

<template>
  <div v-if="!store.dbLoaded" class="empty">请先选择 .db 文件</div>
  <MissingTable v-else-if="!store.hasTable('arkts_kits')"
                table="arkts_kits" collector="arkts" what="Kit" />
  <div v-else class="view">
    <header><h1>Kit <span class="total">{{ all.length }} 个</span></h1></header>
    <!-- 整页跳转而不是抽屉：Kit 详情要并排摆两条成员来路和逐条引用证据 -->
    <EntityTable :rows="all" :columns="COLUMNS" :groups="GROUPS" :total="all.length"
                 name="Kit" default-sort-key="kit_key" entity="arkts_kits"
                 :row-route="row => `/e/arkts_kits/${row.id}`" />
  </div>
</template>

<style scoped>
@import '../../styles/list-view.css';
</style>
