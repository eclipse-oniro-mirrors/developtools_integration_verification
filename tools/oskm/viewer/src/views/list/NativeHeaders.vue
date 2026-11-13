<script setup>
/* Native SDK 头文件映射：把应用可链接的 C API 库和 interface/sdk_c 的源码头文件对上。 */
import { computed, shallowRef, watch } from 'vue'
import { useViewerStore } from '../../stores/viewer.js'
import { loadNativeHeaders } from '../../model/lists.js'
import { COLUMNS, GROUPS, MATCH_STRATEGIES } from '../../model/columns/native_headers.js'
import { useQueryState } from '../../composables/useQueryState.js'
import EntityTable from '../../components/EntityTable.vue'

const store = useViewerStore()
const all = shallowRef([])
const strategy = useQueryState('strategy', '')
const subsystem = useQueryState('subsystem', '')

const subsystems = computed(() =>
  [...new Set(all.value.map(r => r.subsystem).filter(Boolean))].sort())
const libraryCount = computed(() => new Set(all.value.map(r => `${r.elf_module_id}/${r.dest}`)).size)
const rows = computed(() => all.value
  .filter(r => !strategy.value || r.match_strategy === strategy.value)
  .filter(r => !subsystem.value || r.subsystem === subsystem.value));
const tag = computed(() => [strategy.value, subsystem.value].filter(Boolean).join('_'));

watch(() => store.scanId, id => { all.value = loadNativeHeaders(id) }, { immediate: true });
</script>

<template>
  <div v-if="!store.dbLoaded" class="empty">请先选择 .db 文件</div>
  <div v-else class="view">
    <header>
      <h1>Native SDK 头文件 <span class="total">{{ all.length.toLocaleString('en-US') }} 个映射 ·
        {{ libraryCount.toLocaleString('en-US') }} 个 Native SDK 库</span></h1>
      <p class="lede">每行回答“这个 Native SDK 库由哪个源码头文件描述”。BUILD.gn 声明是主证据；
        @library 标签和符号匹配只用于补缺口。</p>
    </header>

    <EntityTable :rows="rows" :columns="COLUMNS" :groups="GROUPS"
                 :search-keys="['header_path', 'dest', 'soname', 'file_name', 'component', 'label']"
                 :total="all.length" name="Native SDK头文件" :tag="tag"
                 default-sort-key="header_path" entity="native_headers">
      <template #filters>
        <el-select v-model="strategy" placeholder="按匹配方式" clearable size="small"
                   style="width: 150px">
          <el-option v-for="(label, value) in MATCH_STRATEGIES" :key="value"
                     :label="label" :value="value" />
        </el-select>
        <el-select v-model="subsystem" placeholder="按子系统" clearable filterable
                   size="small" style="width: 170px">
          <el-option v-for="s in subsystems" :key="s" :label="s" :value="s" />
        </el-select>
      </template>
    </EntityTable>
  </div>
</template>

<style scoped>
@import '../../styles/list-view.css';
</style>
