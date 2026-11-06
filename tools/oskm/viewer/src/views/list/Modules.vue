<script setup>
import { ref, watch } from 'vue'
import { useViewerStore } from '../../stores/viewer.js'
import { loadArktsModules } from '../../model/lists.js'
import { COLUMNS, GROUPS } from '../../model/columns/arkts_modules.js'
import EntityTable from '../../components/EntityTable.vue'
import MissingTable from '../../components/MissingTable.vue'

const store = useViewerStore()
const all = ref([])
/* 取数前先确认表在：缺表时 rawQuery 返回 []，渲染出来的空表格会被读成
   "这个产品没有SDK 模块"，而事实是这个快照没采过。 */
watch(() => [store.scanId, store.tables], () => {
  all.value = store.hasTable('arkts_modules') ? loadArktsModules(store.scanId) : []
}, { immediate: true, deep: true })
</script>

<template>
  <div v-if="!store.dbLoaded" class="empty">请先选择 .db 文件</div>
  <MissingTable v-else-if="!store.hasTable('arkts_modules')"
                table="arkts_modules" collector="arkts" what="SDK 模块" />
  <div v-else class="view">
    <header><h1>SDK 模块 <span class="total">{{ all.length }} 个</span></h1></header>
    <!-- 整页跳转而不是抽屉：模块详情有实现链、声明文件和两类 Kit 关系，
         抽屉摊不开；与声明文件列表保持一致。 -->
    <EntityTable :rows="all" :columns="COLUMNS" :groups="GROUPS" :total="all.length"
                 name="模块" default-sort-key="module_key" entity="arkts_modules"
                 :row-route="row => `/e/arkts_modules/${row.id}`" />
  </div>
</template>

<style scoped>
@import '../../styles/list-view.css';
</style>
