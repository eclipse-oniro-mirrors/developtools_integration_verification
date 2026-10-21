<script setup>
import { ref, computed } from 'vue'

const props = defineProps({
  node: { type: Object, required: true },
  depth: { type: Number, default: 0 },
  open: { type: Function, required: true },
  sort: { type: Function, required: true },
  selected: { type: [String, Number], default: null },   // 抽屉正在显示哪个文件
})
defineEmits(['toggle', 'pick'])

/* 一个目录里可能有上千个文件（system/lib 直接文件就有 1100+）。
   一次性铺进 DOM 会拖垮滚动，所以分批——比虚拟滚动简单，且"还有 N 个"
   本身就是有用的信息。 */
const PAGE = 100
const shown = ref(PAGE)
const files = computed(() => props.node.files.slice(0, shown.value))
const more = computed(() => props.node.files.length - shown.value)
</script>

<template>
  <div class="dir" :style="{ paddingLeft: depth * 14 + 'px' }"
       role="treeitem" :aria-expanded="open(node.path)" tabindex="0"
       @click="$emit('toggle', node.path)" @keyup.enter="$emit('toggle', node.path)">
    <span class="caret" aria-hidden="true">{{ open(node.path) ? '▾' : '▸' }}</span>
    <span class="name mono">{{ node.name }}/</span>
    <span class="meta">
      {{ node.count }} 个文件<template v-if="node.parts.size"> · {{ node.parts.size }} 个部件</template>
    </span>
  </div>

  <template v-if="open(node.path)">
    <TreeNode v-for="d in sort(node)" :key="d.path"
              :node="d" :depth="depth + 1" :open="open" :sort="sort" :selected="selected"
              @toggle="p => $emit('toggle', p)" @pick="f => $emit('pick', f)" />
    <div v-for="f in files" :key="f.dest" class="file"
         :class="{ on: String(f.id) === String(selected) }"
         :style="{ paddingLeft: (depth + 1) * 14 + 14 + 'px' }"
         tabindex="0" @click.stop="$emit('pick', f)" @keyup.enter="$emit('pick', f)">
      <span class="name mono">{{ f.name }}</span>
      <span class="owner">{{ f.component || '—' }}</span>
    </div>
    <button v-if="more > 0" class="more" :style="{ marginLeft: (depth + 1) * 14 + 14 + 'px' }"
            @click.stop="shown += 500">还有 {{ more }} 个文件 ▾</button>
  </template>
</template>

<style scoped>
.dir, .file {
  display: flex; align-items: center; gap: var(--space-2);
  height: var(--row-height); cursor: pointer; border-radius: var(--radius-sm);
  padding-right: var(--space-3);
}
.dir:hover, .file:hover { background: var(--surface-raised) }
/* 抽屉开着时得看得出在看哪一个——不然连着点几个文件比对就是盲点 */
.file.on { background: var(--surface-raised); box-shadow: inset 2px 0 0 var(--entity-module) }
.file.on .name { color: var(--text-primary) }
.caret { width: 12px; color: var(--text-tertiary); flex-shrink: 0 }
.mono { font-family: var(--font-mono); font-size: var(--text-sm) }
.dir .name { color: var(--text-primary); font-weight: 600 }
.file .name { color: var(--text-secondary) }
.more {
  font: inherit; font-size: var(--text-sm); color: var(--entity-component);
  background: none; border: 0; cursor: pointer; padding: var(--space-1) 0;
}
.more:hover { text-decoration: underline }
.meta, .owner { margin-left: auto; font-size: var(--text-sm); color: var(--text-tertiary) }
.owner { color: var(--entity-component); font-family: var(--font-mono) }
</style>
