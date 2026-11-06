<script setup>
/* 侧边抽屉的外壳。内容由调用方填，这里只管"抽屉"这件事：
   位置、滑入、Esc 关闭、窄屏退化成整屏。

   不做成模态：不加遮罩、不锁焦点——左边的列表要保持可读、可点。
   但点到抽屉外面就关：抽屉盖住了右边小半屏，看完不关会一直挡着。

   点列表里的下一行是例外：那一下既要关掉当前的、又要开下一个，
   由行的点击处理去覆盖 detail，这里不插手。 */
import { onBeforeUnmount, onMounted, ref } from 'vue'
import Icon from '../ui/Icon.vue'

const props = defineProps({
  open: { type: Boolean, default: false },
  tag: { type: String, default: '详情' },     // 左上角那个小标签
  width: { type: String, default: '460px' },
})
const emit = defineEmits(['close'])

const panel = ref(null)
function onKey(e) { if (e.key === 'Escape' && props.open) emit('close') }

/* 用捕获阶段的 pointerdown，不用 click：click 要等到按键抬起，
   期间列表的 hover 态已经变了，关闭看起来会"慢半拍"。 */
function onPointerDown(e) {
  if (!props.open) return
  if (panel.value?.contains(e.target)) return
  /* 弹层（popover / select / dropdown）渲染在 body 下、不在抽屉里，
     点它们不算点外面，否则抽屉里的下拉一点就把抽屉关了 */
  if (e.target.closest?.('.el-popper, .el-select-dropdown, .el-overlay')) return
  /* 点列表的另一行：那一下该换内容，不该先关掉——让行的点击处理去覆盖 detail */
  if (e.target.closest?.('.el-table__row')) return
  emit('close')
}

onMounted(() => {
  window.addEventListener('keydown', onKey)
  document.addEventListener('pointerdown', onPointerDown, true)
})
onBeforeUnmount(() => {
  window.removeEventListener('keydown', onKey)
  document.removeEventListener('pointerdown', onPointerDown, true)
})
</script>

<template>
  <Transition name="slide">
    <aside v-if="open" ref="panel" class="drawer" :style="{ width }"
           role="complementary" :aria-label="tag">
      <header class="bar">
        <span class="tag">{{ tag }}</span>
        <slot name="actions" />
        <button class="x" aria-label="关闭（Esc）" title="关闭（Esc）" @click="emit('close')">
          <Icon name="close" :size="15" />
        </button>
      </header>
      <div class="body"><slot /></div>
    </aside>
  </Transition>
</template>

<style scoped>
.drawer {
  position: fixed; top: 52px; right: 0; bottom: 0; max-width: 100vw;
  display: flex; flex-direction: column; z-index: var(--z-overlay);
  background: var(--surface-default);
  border-left: 1px solid var(--border-default);
  box-shadow: var(--shadow-2);
}
.bar {
  flex: none; display: flex; align-items: center; gap: var(--space-3);
  padding: var(--space-2) var(--space-3);
  border-bottom: 1px solid var(--border-subtle);
}
.tag {
  font-size: var(--text-xs); color: var(--text-secondary);
  text-transform: uppercase; letter-spacing: .06em;
}
.bar :slotted(*) { margin-left: auto }
.x {
  display: inline-flex; align-items: center; justify-content: center;
  width: 26px; height: 26px; padding: 0; margin-left: auto;
  color: var(--text-secondary); background: none; border: 0;
  border-radius: var(--radius-sm); cursor: pointer;
}
.bar :slotted(*) ~ .x { margin-left: 0 }
.x:hover { background: var(--surface-raised); color: var(--text-primary) }
.body { flex: 1; min-height: 0; overflow: auto; padding: var(--space-4) }

.slide-enter-active, .slide-leave-active { transition: transform var(--motion-base) var(--ease-decelerate) }
.slide-enter-from, .slide-leave-to { transform: translateX(100%) }

/* 顶栏在窄屏会换行变高，抽屉改为整屏，免得被压住 */
@media (max-width: 860px) {
  .drawer { top: 0; width: 100vw !important; border-left: 0 }
}
@media (prefers-reduced-motion: reduce) {
  .slide-enter-active, .slide-leave-active { transition: none }
}
</style>
