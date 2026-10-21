<script setup>
/* GN label + 一个去源码的 ↗。表格与档案页共用。
   拼法与两条诚实边界（目标未必写在那个 BUILD.gn 里、URL 形态是按惯例拼的）
   见 model/gitlink.js。 */
import { computed } from 'vue'
import { useViewerStore } from '../stores/viewer.js'
import { labelSource } from '../model/gitlink.js'

const props = defineProps({ label: { type: String, default: '' } })
const store = useViewerStore()
const src = computed(() => labelSource(store.scanId, props.label))
const tip = computed(() => src.value
  ? `在 ${src.value.repo} 中打开 ${src.value.rel === '(仓根)' ? '' : src.value.rel + '/'}BUILD.gn`
    + `（${src.value.exact ? '扫描时的提交 ' + src.value.ref.slice(0, 10) : '分支 ' + src.value.ref}）`
    + '\n注意：目标也可能定义在 .gni 或被 import 的模板里'
  : '')
</script>

<template>
  <span class="gn">
    <slot>{{ label }}</slot>
    <a v-if="src" class="src" target="_blank" rel="noopener" :href="src.url" :title="tip"
       :aria-label="tip.split('\n')[0]" @click.stop>↗</a>
  </span>
</template>

<style scoped>
.gn { overflow-wrap: anywhere }
.src { margin-left: 4px; font-size: var(--text-xs); color: var(--text-secondary);
       text-decoration: none }
.src:hover { color: var(--entity-component) }
</style>
