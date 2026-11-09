<script setup>
/* 1.2 SA服务：165 个 SystemAbility。 */
import { computed, ref, watch } from 'vue'
import { useViewerStore } from '../../stores/viewer.js'
import { loadSas } from '../../model/lists.js'
import { COLUMNS, GROUPS } from '../../model/columns/sas.js'
import { useQueryState } from '../../composables/useQueryState.js'
import EntityTable from '../../components/EntityTable.vue'

const store = useViewerStore()
const all = ref([])
const host = useQueryState('host', '')
const part = useQueryState('part', '')

const hosts = computed(() => [...new Set(all.value.map(r => r.host).filter(Boolean))].sort())
const parts = computed(() => [...new Set(all.value.map(r => r.component).filter(Boolean))].sort())
const rows = computed(() => all.value
  .filter(r => !host.value || r.host === host.value)
  .filter(r => !part.value || r.component === part.value))
const tag = computed(() => [host.value, part.value].filter(Boolean).join('_'))

watch(() => store.scanId, id => { all.value = loadSas(id) }, { immediate: true })
</script>

<template>
  <div v-if="!store.dbLoaded" class="empty">请先选择 .db 文件</div>
  <div v-else class="view">
    <header>
      <h1>SA 服务 <span class="total">{{ all.length }} 个 SystemAbility</span></h1>
      <p class="lede">进程间调用的基本单位。多个 SA 共用一个宿主进程是常态——同一宿主内它们共享崩溃域。</p>
    </header>
    <EntityTable :rows="rows" :columns="COLUMNS" :groups="GROUPS" :total="all.length"
                 name="SA服务" :tag="tag" default-sort-key="sa_id" entity="sas"
                 :row-route="row => `/e/sas/${row.id}`">
      <template #filters>
        <el-select v-model="host" placeholder="按宿主进程" clearable filterable
                   size="small" style="width: 150px">
          <el-option v-for="h in hosts" :key="h" :label="h" :value="h" />
        </el-select>
        <el-select v-model="part" placeholder="按部件" clearable filterable
                   size="small" style="width: 140px">
          <el-option v-for="p in parts" :key="p" :label="p" :value="p" />
        </el-select>
      </template>
    </EntityTable>
  </div>
</template>

<style scoped>@import '../../styles/list-view.css';</style>
