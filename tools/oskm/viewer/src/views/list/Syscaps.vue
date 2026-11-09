<script setup>
import { ref, watch } from 'vue'
import { useViewerStore } from '../../stores/viewer.js'
import { loadSyscaps } from '../../model/lists.js'
import { COLUMNS, GROUPS } from '../../model/columns/syscaps.js'
import EntityTable from '../../components/EntityTable.vue'

const store = useViewerStore()
const all = ref([])
watch(() => store.scanId, id => { all.value = loadSyscaps(id) }, { immediate: true })
</script>

<template>
  <div v-if="!store.dbLoaded" class="empty">请先选择 .db 文件</div>
  <div v-else class="view">
    <header><h1>SysCap <span class="total">{{ all.length }} 个</span></h1></header>
    <EntityTable :rows="all" :columns="COLUMNS" :groups="GROUPS" :total="all.length"
                 name="能力" default-sort-key="value" entity="syscaps"
                 :row-route="row => `/e/syscaps/${row.id}`" />
  </div>
</template>

<style scoped>
@import '../../styles/list-view.css';
</style>
