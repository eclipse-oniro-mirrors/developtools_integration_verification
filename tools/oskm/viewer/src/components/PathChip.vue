<script setup>
import { computed } from 'vue'
const props = defineProps({
  path: { type: String, default: '' },
  max: { type: Number, default: 48 },
})
/* 中间省略，不是尾部省略：文件名才是关键信息，
   text-overflow: ellipsis 会把它砍掉。见 implementation-plan §3.1 */
const shown = computed(() => {
  const p = props.path || ''
  if (p.length <= props.max) return p
  const tail = p.split('/').pop()
  const head = p.slice(0, Math.max(0, props.max - tail.length - 3))
  return `${head}…/${tail}`
})
</script>

<template>
  <span class="path" :title="path">{{ shown }}</span>
</template>

<style scoped>
.path {
  font-family: var(--font-mono);
  font-size: var(--text-sm);
  color: var(--text-secondary);
  word-break: break-all;
}
</style>
