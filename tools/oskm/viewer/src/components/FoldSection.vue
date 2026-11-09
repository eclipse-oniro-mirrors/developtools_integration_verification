<script setup>
/* 可折叠的区块。标题行常驻，右侧给个计数，便于不展开也知道里面有多少。 */
import Icon from '../ui/Icon.vue'

defineProps({
  title: { type: String, required: true },
  count: { type: [Number, String], default: null },
  hint: { type: String, default: '' },
  open: { type: Boolean, default: true },
})
defineEmits(['toggle'])
</script>

<template>
  <section class="fs">
    <button class="head" :aria-expanded="open" @click="$emit('toggle')">
      <Icon :name="open ? 'down' : 'right'" :size="13" />
      <span class="t">{{ title }}</span>
      <span v-if="count !== null" class="n">{{ count }}</span>
      <span v-if="hint" class="hint">{{ hint }}</span>
    </button>
    <div v-show="open" class="body"><slot /></div>
  </section>
</template>

<style scoped>
.fs + .fs { margin-top: var(--space-4) }
.head {
  display: flex; align-items: center; gap: var(--space-2); width: 100%;
  padding: var(--space-1) 0; margin-bottom: var(--space-2);
  font: inherit; text-align: left; background: none; border: 0; cursor: pointer;
  border-bottom: 1px solid var(--border-subtle);
}
.head:hover .t { color: var(--text-primary) }
.head .icon { color: var(--text-secondary) }
.t { font-size: var(--text-sm); font-weight: 600; color: var(--text-secondary);
     letter-spacing: .04em }
.n { font-family: var(--font-mono); font-size: var(--text-sm); color: var(--entity-component) }
.hint { margin-left: auto; font-size: var(--text-xs); color: var(--text-secondary) }
</style>
