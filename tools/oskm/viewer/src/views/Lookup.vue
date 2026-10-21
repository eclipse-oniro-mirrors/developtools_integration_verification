<script setup>
import { computed, ref, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { lookup, KIND_LABEL } from '../model/lookup.js'
import { openEntity } from '../model/nav.js'
import { useScrollMemory } from '../composables/useScrollMemory.js'
import PathChip from '../components/PathChip.vue'

const route = useRoute()
const router = useRouter()
const store = useViewerStore()
const result = ref({ query: '', groups: [] })
const scroller = ref(null)
useScrollMemory(scroller)
const go = (table, id) => openEntity(router, route, table, id)

watch(() => [route.query.q, store.scanId],
      () => { result.value = lookup(store.scanId, route.query.q) }, { immediate: true })

const q = computed(() => route.query.q || '')
const total = computed(() => result.value.groups.reduce((s, g) => s + g.hits.length, 0))
const CLUES = ['安装路径 system/lib/libfoo.z.so', '文件名 libfoo.z.so',
               '进程 / 服务名 foundation', 'GN label //a/b:c', '部件名 accessibility', '仓名 / 仓路径']
</script>

<template>
  <div ref="scroller" class="lookup">
    <h1>反查 <code>{{ q }}</code></h1>

    <p v-if="!store.dbLoaded" class="hint">请先加载数据库</p>

    <template v-else-if="total">
      <p class="kind">共 {{ total }} 条，按证据强度排列</p>

      <section v-for="g in result.groups" :key="g.kind">
        <h2>{{ KIND_LABEL[g.kind] }} <span class="n">{{ g.hits.length }}</span></h2>
        <article v-for="(h, i) in g.hits" :key="i" class="hit">
          <template v-if="h.dest">
            <button class="dest" @click="go('install_modules', h.module_id)">
              <PathChip :path="h.dest" :max="120" />
            </button>
            <ul class="chain">
              <li><span class="k">模块</span><span class="v mono">{{ h.label || '(无 label)' }}</span>
                  <span class="t">{{ h.module_type }}</span></li>
              <li v-if="h.component"><span class="k">部件</span>
                  <span class="v">{{ h.component }}</span>
                  <span class="t">{{ h.subsystem }}</span></li>
              <li v-else class="miss"><span class="k">部件</span><span class="v">归属未解析</span></li>
              <li v-if="h.repo"><span class="k">仓</span><span class="v mono">{{ h.repo }}</span></li>
            </ul>
            <p v-if="h.roles?.length" class="roles">
              运行形态：
              <button v-for="(r, j) in h.roles" :key="j" class="role" :disabled="!r.id"
                      @click="r.id && router.push(`/runtime/unit/${r.id}`)">
                {{ r.text }}<span v-if="r.sub" class="dim"> · {{ r.sub }}</span>
              </button>
            </p>
          </template>

          <template v-else-if="h.name && h.cfg">
            <p class="title mono">{{ h.name }}</p>
            <ul class="chain"><li><span class="k">cfg</span><PathChip :path="h.cfg" :max="100" /></li></ul>
            <p class="roles">
              <button class="role" @click="router.push(`/runtime/unit/${h.id}`)">在运行视图中查看 →</button>
            </p>
          </template>

          <template v-else-if="h.component">
            <p class="title">{{ h.component }} <span class="dim">{{ h.subsystem }}</span></p>
            <PathChip v-if="h.manifest" :path="h.manifest" :max="100" />
            <p class="roles">
              <button class="role" @click="go('components', h.component_id)">
                打开部件档案 →</button>
            </p>
          </template>

          <template v-else-if="h.repo">
            <p class="title mono">{{ h.repo }}</p>
            <PathChip :path="h.path" :max="100" />
          </template>
        </article>
      </section>
    </template>

    <div v-else-if="q" class="none">
      <p>未匹配到任何安装产物 / 进程 / 部件。</p>
      <p class="dim">可识别的线索：</p>
      <ul><li v-for="c in CLUES" :key="c" class="mono">{{ c }}</li></ul>
    </div>
    <p v-else class="hint">在顶栏输入一条线索（⌘K）</p>
  </div>
</template>

<style scoped>
.lookup { height: 100%; overflow: auto; padding: var(--space-5); max-width: 880px }
h1 { margin: 0 0 var(--space-2); font-size: var(--text-xl); font-weight: 600 }
h1 code { font-family: var(--font-mono); color: var(--entity-component) }
h2 {
  margin: var(--space-5) 0 var(--space-2); font-size: var(--text-base); font-weight: 600;
  color: var(--text-secondary);
}
h2 .n { font-family: var(--font-mono); color: var(--text-tertiary); margin-left: var(--space-1) }
section:first-of-type h2 { margin-top: var(--space-3) }
.kind { margin: 0 0 var(--space-4); font-size: var(--text-sm); color: var(--text-secondary) }
.hint, .none { color: var(--text-secondary); font-size: var(--text-base) }
.none ul { margin: var(--space-2) 0 0; padding-left: var(--space-5); font-size: var(--text-sm) }
.none li { color: var(--text-tertiary); margin-bottom: 2px }

.hit {
  padding: var(--space-4); margin-bottom: var(--space-3);
  background: var(--surface-raised); border: 1px solid var(--border-subtle);
  border-left: 3px solid var(--entity-module); border-radius: var(--radius-md);
}
.title { margin: 0 0 var(--space-2); font-size: var(--text-md); font-weight: 600 }
.chain { list-style: none; margin: var(--space-3) 0 0; padding: 0 0 0 var(--space-3);
         border-left: 1px dashed var(--border-default) }
.chain li { display: flex; gap: var(--space-3); align-items: baseline; padding: var(--space-1) 0;
            font-size: var(--text-base) }
.chain .k { width: 42px; color: var(--text-tertiary); font-size: var(--text-sm); flex-shrink: 0 }
.chain .v { color: var(--text-primary) }
.chain .t { color: var(--text-tertiary); font-size: var(--text-sm) }
.chain .miss .v { color: var(--severity-warning) }
.mono { font-family: var(--font-mono); font-size: var(--text-sm) }
.dest { display: block; font: inherit; background: none; border: 0; padding: 0;
        text-align: left; cursor: pointer }
.dest:hover :deep(.path) { color: var(--entity-component) }
.dim { color: var(--text-tertiary) }

.roles { margin: var(--space-3) 0 0; font-size: var(--text-sm); color: var(--text-secondary) }
.role {
  font: inherit; font-size: var(--text-sm); margin-right: var(--space-2);
  padding: var(--space-1) var(--space-3); color: var(--entity-sa);
  background: var(--surface-sunken); border: 1px solid var(--border-default);
  border-radius: var(--radius-full); cursor: pointer;
}
.role:hover:not(:disabled) { border-color: var(--entity-sa) }
.role:disabled { color: var(--text-tertiary); cursor: default }
</style>
