<script setup>
/* 1.3 HDI服务：57 个设备。 */
import { computed, ref, watch } from 'vue'
import { useViewerStore } from '../../stores/viewer.js'
import { loadHdis } from '../../model/lists.js'
import { COLUMNS, GROUPS } from '../../model/columns/hdis.js'
import { useQueryState } from '../../composables/useQueryState.js'
import EntityTable from '../../components/EntityTable.vue'

const store = useViewerStore()
const all = ref([])
const host = useQueryState('host', '')
const part = useQueryState('part', '')

const hosts = computed(() => [...new Set(all.value.map(r => r.host).filter(Boolean))].sort())
const parts = computed(() => [...new Set(all.value.map(r => r.component).filter(Boolean))].sort())
const unowned = computed(() => all.value.filter(r => !r.component_id).length)
const rows = computed(() => all.value
  .filter(r => !host.value || r.host === host.value)
  .filter(r => !part.value || r.component === part.value))
const tag = computed(() => [host.value, part.value].filter(Boolean).join('_'))

watch(() => store.scanId, id => { all.value = loadHdis(id) }, { immediate: true })
</script>

<template>
  <div v-if="!store.dbLoaded" class="empty">请先选择 .db 文件</div>
  <div v-else class="view">
    <header>
      <h1>HDI 服务 <span class="total">{{ all.length }} 个设备</span></h1>
      <p class="lede">硬件设备接口。驱动跑在 hdf_devhost 宿主进程里，同一宿主内共享崩溃域。<template
        v-if="unowned"> 其中 <strong class="warn">{{ unowned }} 个</strong>因驱动库在镜像里找不到而归属未知。</template></p>
    </header>
    <EntityTable :rows="rows" :columns="COLUMNS" :groups="GROUPS" :total="all.length"
                 name="HDI服务" :tag="tag" default-sort-key="service_name" entity="hdis"
                 :row-route="row => `/e/hdis/${row.id}`">
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

<style scoped>
@import '../../styles/list-view.css';
.warn { color: var(--severity-warning) }
</style>
