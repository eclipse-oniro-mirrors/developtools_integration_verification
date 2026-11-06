<script setup>
/* 3.1 安装产物：5804 个装进镜像的文件，并上所属安装模块的信息。

   5804 行一次铺完要 33 秒（实测），所以默认分页 100 条/页。
   分的只是渲染：排序、搜索、导出都在全量上做。 */
import { computed, ref, watch } from 'vue'
import { useViewerStore } from '../../stores/viewer.js'
import { loadTargets } from '../../model/lists.js'
import { COLUMNS, GROUPS } from '../../model/columns/targets.js'
import { useQueryState } from '../../composables/useQueryState.js'
import EntityTable from '../../components/EntityTable.vue'

const store = useViewerStore()
const all = ref([])
const partition = useQueryState('partition', '')
const part = useQueryState('part', '')
const onlyMulti = useQueryState('multi', '')

const partitions = computed(() => {
  const by = new Map()
  for (const t of all.value) by.set(t.partition, (by.get(t.partition) || 0) + 1)
  return [...by.entries()].sort((a, b) => b[1] - a[1])
})
const parts = computed(() => [...new Set(all.value.map(t => t.component).filter(Boolean))].sort())
const multiTotal = computed(() => all.value.filter(t => t.siblings > 1).length)
const links = computed(() => all.value.filter(t => t.link_target_path).length)
const files = computed(() => all.value.length - links.value)

const rows = computed(() => all.value
  .filter(t => !partition.value || t.partition === partition.value)
  .filter(t => !part.value || t.component === part.value)
  .filter(t => !onlyMulti.value || t.siblings > 1))
const tag = computed(() =>
  [partition.value, part.value, onlyMulti.value && '一模块多文件'].filter(Boolean).join('_'))

watch(() => store.scanId, id => { all.value = loadTargets(id) }, { immediate: true })
</script>

<template>
  <div v-if="!store.dbLoaded" class="empty">请先选择 .db 文件</div>
  <div v-else class="view">
    <header>
      <h1>安装产物 <span class="total">{{ all.length }} 个条目（{{ files }} 文件 · {{
        links }} 软链接）· 来自 {{ new Set(all.map(t => t.module_id)).size }} 个安装模块</span></h1>
      <p class="lede">一行 = 一个装进镜像的文件，同时带上装出它的安装模块。模块与条目是 1:N——<button
        class="link strong" :class="{ on: onlyMulti }"
        @click="onlyMulti = onlyMulti ? '' : '1'">{{ multiTotal }} 个条目</button>来自放出多个条目的模块，点任意一行可看它与所属模块的详情。</p>
    </header>
    <EntityTable :rows="rows" :columns="COLUMNS" :groups="GROUPS" :total="all.length"
                 name="安装产物" :tag="tag" default-sort-key="dest" entity="install_targets"
                 :row-route="row => `/e/install_targets/${row.id}`">
      <template #facets>
        <div class="kinds">
          <button class="chip" :class="{ on: !partition }" @click="partition = ''">
            全部 <span class="n">{{ all.length }}</span></button>
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
      </template>
    </EntityTable>
  </div>
</template>

<style scoped>
@import '../../styles/list-view.css';
.strong { font-weight: 600 }
.link.on { text-decoration: underline }
</style>
