<script setup>
/* JSON 列的紧凑呈现。原样 dump 会让 26 个 feature 吃掉整屏，
   而这些值本来是结构化的——数组给计数+展开，deps.components 给可点链接。 */
import { computed, ref } from 'vue'
import Icon from '../ui/Icon.vue'

const props = defineProps({
  value: { type: [String, Number, Boolean, Object, Array], default: null },
  links: { type: Function, default: null },   // (name) => 路由，用于 deps.components
})
const open = ref(false)
const parsed = computed(() => {
  if (typeof props.value !== 'string') return props.value
  const h = props.value.trim()[0]
  if (h !== '{' && h !== '[') return props.value
  try { return JSON.parse(props.value) } catch { return props.value }
})
const kind = computed(() => {
  const v = parsed.value
  if (Array.isArray(v)) return v.every(x => typeof x === 'string') ? 'strings' : 'array'
  if (v && typeof v === 'object') return 'object'
  return 'scalar'
})
const entries = computed(() => kind.value === 'object'
  ? Object.entries(parsed.value).filter(([, v]) => !(Array.isArray(v) && !v.length))
  : [])
const pretty = computed(() => JSON.stringify(parsed.value, null, 2))
</script>

<template>
  <span v-if="kind === 'scalar'" class="mono">{{ parsed }}</span>

  <div v-else-if="kind === 'strings'" class="chips">
    <template v-if="parsed.length">
      <span v-for="(s, i) in (open ? parsed : parsed.slice(0, 6))" :key="i" class="chip">
        <button v-if="links && links(s)" class="as-link" @click="$emit('go', links(s))">{{ s }}</button>
        <template v-else>{{ s }}</template>
      </span>
      <button v-if="parsed.length > 6" class="toggle" @click="open = !open">
        {{ open ? '收起' : `还有 ${parsed.length - 6} 项` }}
      </button>
    </template>
    <span v-else class="dim">空</span>
  </div>

  <div v-else-if="kind === 'object'" class="obj">
    <div v-for="[k, v] in entries" :key="k" class="kv">
      <span class="k mono">{{ k }}</span>
      <JsonValue :value="v" :links="links" @go="p => $emit('go', p)" />
    </div>
    <span v-if="!entries.length" class="dim">空</span>
  </div>

  <div v-else class="raw">
    <button class="toggle" @click="open = !open">
      <Icon :name="open ? 'down' : 'right'" :size="12" /> {{ parsed.length }} 项
    </button>
    <pre v-if="open">{{ pretty }}</pre>
  </div>
</template>

<script>
export default { name: 'JsonValue', emits: ['go'] }
</script>

<style scoped>
.mono { font-family: var(--font-mono); font-size: var(--text-sm) }
.chips { display: flex; flex-wrap: wrap; gap: var(--space-1) }
.chip {
  font-family: var(--font-mono); font-size: var(--text-xs);
  padding: 1px var(--space-2); border-radius: var(--radius-sm);
  background: var(--surface-sunken); color: var(--text-secondary);
}
.as-link { font: inherit; background: none; border: 0; padding: 0; cursor: pointer;
           color: var(--entity-component) }
.as-link:hover { text-decoration: underline }
.toggle {
  font: inherit; font-size: var(--text-xs); color: var(--entity-component);
  background: none; border: 0; cursor: pointer; padding: 1px var(--space-1);
  display: inline-flex; align-items: center; gap: 2px;
}
.toggle:hover { text-decoration: underline }
.obj { display: grid; gap: 2px }
.kv { display: flex; gap: var(--space-2); align-items: baseline }
.kv .k { color: var(--text-tertiary); min-width: 84px }
.dim { color: var(--text-tertiary); font-size: var(--text-sm) }
pre { margin: var(--space-1) 0 0; padding: var(--space-2); max-height: 300px; overflow: auto;
      background: var(--surface-sunken); border-radius: var(--radius-sm);
      font-family: var(--font-mono); font-size: var(--text-xs); color: var(--text-secondary) }
</style>
