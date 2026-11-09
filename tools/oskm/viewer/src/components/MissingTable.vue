<!-- 这个快照里没有这张表时的占位。

     不能让列表渲染成空表格：`rawQuery` 查不存在的表会捕获异常返回 []，
     结果看起来像"这个产品没有数据"，而事实是"这个库没采过这个域"。
     采集侧对同一件事的处理是返回 COLLECTOR_NOT_RUN 而不是空清单，前端照做。 -->
<script setup>
import { computed } from 'vue'
import { useViewerStore } from '../stores/viewer.js'
import Icon from '../ui/Icon.vue'

const props = defineProps({
  /** 缺失的表名，用于说明文字 */
  table: { type: String, required: true },
  /** 产出这张表的采集器名，用于给出可执行的下一步 */
  collector: { type: String, required: true },
  /** 这个视图本来展示什么 */
  what: { type: String, default: '' },
})

const store = useViewerStore()
/* 采集器跑过但表不在，和整个库都旧，是两回事：前者说明 schema 变了。 */
const ran = computed(() => store.collectorsRun.includes(props.collector))
</script>

<template>
  <div class="missing" role="status">
    <Icon name="shield" :size="28" class="mark" />
    <h2>本快照未采集 {{ what || table }}</h2>
    <p>
      当前数据库里没有 <code>{{ table }}</code> 表。
      <template v-if="ran">该快照记录了 <code>{{ collector }}</code> 的运行，但表结构与当前 viewer 不符，说明它是旧版 schema。</template>
      <template v-else>这不表示这个产品没有 {{ what || table }}，而是这次扫描没有产出它。</template>
    </p>
    <p class="how">
      用当前版本重新扫描后再打开：
      <code>python3 oskm.py scan --workspace-root &lt;code&gt; --product &lt;product&gt; --db &lt;db&gt;</code>
    </p>
  </div>
</template>

<style scoped>
.missing {
  max-width: 44rem; margin: var(--space-8) auto; padding: var(--space-6);
  border: 1px solid var(--border-subtle); border-radius: var(--radius-lg);
  background: var(--surface-raised); text-align: center;
}
.mark { color: var(--text-tertiary); margin-bottom: var(--space-3) }
h2 { margin: 0 0 var(--space-3); font-size: var(--text-lg); color: var(--text-primary) }
p { margin: 0 0 var(--space-2); color: var(--text-secondary); line-height: 1.7 }
.how { margin-top: var(--space-4); font-size: var(--text-sm) }
code {
  padding: 1px 5px; border-radius: var(--radius-sm);
  background: var(--surface-default); font-family: var(--font-mono); font-size: .92em;
}
</style>
