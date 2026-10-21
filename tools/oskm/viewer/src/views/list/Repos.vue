<script setup>
/* 2.1 代码仓：525 个仓。 */
import { computed, ref, watch } from 'vue'
import { useViewerStore } from '../../stores/viewer.js'
import { loadRepos } from '../../model/lists.js'
import { COLUMNS, GROUPS } from '../../model/columns/repos.js'
import { useQueryState } from '../../composables/useQueryState.js'
import EntityTable from '../../components/EntityTable.vue'

const store = useViewerStore()
const all = ref([])
const group = useQueryState('group', '')
const withParts = useQueryState('parts', '')

const groups = computed(() => [...new Set(all.value.flatMap(r => r.groupList))].sort())
const productive = computed(() => all.value.filter(r => r.components > 0).length)
const rows = computed(() => all.value
  .filter(r => !group.value || r.groupList.includes(group.value))
  .filter(r => !withParts.value || r.components > 0))
const tag = computed(() => [group.value, withParts.value && '有部件'].filter(Boolean).join('_'))

watch(() => store.scanId, id => { all.value = loadRepos(id) }, { immediate: true })
</script>

<template>
  <div v-if="!store.dbLoaded" class="empty">请先选择 .db 文件</div>
  <div v-else class="view">
    <header>
      <h1>代码仓 <span class="total">{{ all.length }} 个仓</span></h1>
      <p class="lede">其中<button class="link strong" :class="{ on: withParts }"
        @click="withParts = withParts ? '' : '1'">{{ productive }} 个</button>在本产品里有部件参与构建，其余多为随 manifest 检出但未参与的第三方仓。</p>
    </header>
    <EntityTable :rows="rows" :columns="COLUMNS" :groups="GROUPS" :total="all.length"
                 name="代码仓" :tag="tag" default-sort-key="components" default-sort-desc
                 entity="repos" :row-route="row => `/e/repos/${row.id}`">
      <template #filters>
        <el-select v-model="group" placeholder="按分组" clearable filterable
                   size="small" style="width: 150px">
          <el-option v-for="g in groups" :key="g" :label="g" :value="g" />
        </el-select>
      </template>
    </EntityTable>
  </div>
</template>

<style scoped>
@import '../../styles/list-view.css';
.strong { font-weight: 600 }
.link.on { text-decoration: underline }
</style>
