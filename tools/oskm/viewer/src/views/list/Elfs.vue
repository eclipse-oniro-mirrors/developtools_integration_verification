<script setup>
/* 3.2 ELF 模块：安装产物中可被动态链接器识别的子集。
   列表只展示模块与一跳度数；完整闭包在 ELF 档案页按需计算。 */
import { computed, ref, watch } from 'vue'
import { useViewerStore } from '../../stores/viewer.js'
import { loadElfModules } from '../../model/lists.js'
import { API_TYPES, ELF_CATEGORIES as CATEGORIES, COLUMNS, GROUPS } from '../../model/columns/elf.js'
import { csvList, useQueryState } from '../../composables/useQueryState.js'
import EntityTable from '../../components/EntityTable.vue'

const store = useViewerStore()
const all = ref([])
const partition = useQueryState('partition', '')
const part = useQueryState('part', '')
const subsystemState = useQueryState('subsystem', '')
const apiTypeState = useQueryState('api_type', '')
const categoryState = useQueryState('category', [], csvList)

const partitions = computed(() => {
  const by = new Map()
  for (const r of all.value) by.set(r.partition, (by.get(r.partition) || 0) + 1)
  return [...by.entries()].sort((a, b) => b[1] - a[1])
})
const parts = computed(() => [...new Set(all.value.map(r => r.component).filter(Boolean))].sort())
const subsystems = computed(() => [...new Set(all.value.map(r => r.subsystem).filter(Boolean))].sort())
const categoryCol = computed(() => COLUMNS.find(c => c.key === 'category'))

const rows = computed(() => all.value
  .filter(r => !partition.value || r.partition === partition.value)
  .filter(r => !part.value || r.component === part.value)
  .filter(r => !subsystemState.value || r.subsystem === subsystemState.value)
  .filter(r => !apiTypeState.value || r.api_type === apiTypeState.value)
  .filter(r => !categoryState.value.length
              || categoryState.value.some(category => categoryCol.value.value(r).includes(category))))
const tag = computed(() =>
  [partition.value, part.value, subsystemState.value,
   apiTypeState.value, ...categoryState.value].filter(Boolean).join('_'))

watch(() => store.scanId, id => { all.value = loadElfModules(id) }, { immediate: true })
</script>

<template>
  <div v-if="!store.dbLoaded" class="empty">请先选择 .db 文件</div>
  <div v-else class="view">
    <header>
      <h1>ELF 模块 <span class="total">{{ all.length.toLocaleString('en-US') }} 个 ELF 模块 ·
        {{ new Set(all.map(r => r.install_module_id)).size.toLocaleString('en-US') }} 个安装模块</span></h1>
      <p class="lede">安装产物里，可被识别为 ELF 的文件在这里按一行一个展示；依赖边只先显示一跳度数，
        避免把高入度基础库展开成数千行。</p>
    </header>

    <EntityTable :rows="rows" :columns="COLUMNS" :groups="GROUPS" :total="all.length"
                 name="ELF模块" :tag="tag" default-sort-key="dependents" default-sort-desc
                 entity="elf_modules">
      <template #facets>
        <div class="kinds">
          <button class="chip" :class="{ on: !partition }" @click="partition = ''">
            全部分区 <span class="n">{{ all.length }}</span></button>
          <button v-for="[p, n] in partitions" :key="p" class="chip"
                  :class="{ on: partition === p }" @click="partition = p">
            {{ p }} <span class="n">{{ n }}</span>
          </button>
        </div>
      </template>
      <template #filters>
        <el-select v-model="part" placeholder="按部件" clearable filterable
                   size="small" style="width: 150px">
          <el-option v-for="p in parts" :key="p" :label="p" :value="p" />
        </el-select>
        <el-select v-model="subsystemState" placeholder="按子系统" clearable filterable
                   size="small" style="width: 150px">
          <el-option v-for="s in subsystems" :key="s" :label="s" :value="s" />
        </el-select>
        <el-select v-model="apiTypeState" placeholder="按 API 类型" clearable
                   size="small" style="width: 150px">
          <el-option v-for="apiType in API_TYPES" :key="apiType"
                     :label="apiType" :value="apiType" />
        </el-select>
        <el-select v-model="categoryState" placeholder="按 Category（任一命中）" clearable multiple
                   collapse-tags size="small" style="width: 210px">
          <el-option v-for="category in CATEGORIES" :key="category"
                     :label="category" :value="category" />
        </el-select>
      </template>
    </EntityTable>
  </div>
</template>

<style scoped>
@import '../../styles/list-view.css';
</style>
