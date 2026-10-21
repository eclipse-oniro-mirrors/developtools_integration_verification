<script setup>
import { computed, ref, watch, onMounted, onBeforeUnmount } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { useDatabase } from '../composables/useDatabase.js'
import { PRODUCT_NAV, groupOf, entryOf } from '../model/nav.js'
import Icon from '../ui/Icon.vue'
import { theme, toggleTheme } from '../composables/useTheme.js'

const route = useRoute()
const router = useRouter()
const store = useViewerStore()
const { loadDatabase } = useDatabase()

const lookup = ref('')
const dbOpen = ref(false)
const lookupBox = ref(null)
const dbMenu = ref(null)

const path = computed(() => route.path)
const group = computed(() => groupOf(path.value))
const onItem = i => (i.children ? group.value?.key === i.key : path.value === i.route)
/* 子导航条只在产品面的分组里出现；首页、档案页、质量都不显示 */
const subnav = computed(() => group.value?.children || null)
const onChild = c => {
  if (path.value.startsWith(c.route)) return true
  /* 实体详情页 /e/<table>/<id> → 按 table 高亮对应子项 */
  const m = path.value.match(/^\/e\/(\w+)\//)
  return !!(m && c.table === m[1])
}
const scan = computed(() => store.scans.find(s => s.id === store.scanId))

async function pick(file) {
  if (!file) return
  await loadDatabase(file)
  store.dbLoaded = true
  store.loadScans(route.query.scan)
  dbOpen.value = false
}

/* ?scan= 进 URL：watch store.scanId → 同步 URL。
    原先只在 pickScan 里手动 router.replace，loadScans / 其他调用方
    改了 scanId 后 URL 不会跟——刷新或贴链接就脱节。
    集中到 watcher，不管谁改 scanId，URL 都保持同步。 */
watch(() => store.scanId, id => {
  if (id == null) return
  const current = route.query.scan
  if (current !== String(id)) {
    router.replace({ path: route.path, query: { ...route.query, scan: String(id) } })
  }
}, { flush: 'sync' })

/* 用户在下拉菜单里选一条 scan。URL 同步由上面的 watcher 负责，这里只改 store。 */
function pickScan(id) {
  store.selectScan(id)
  dbOpen.value = false
}

function submitLookup() {
  const q = lookup.value.trim()
  if (q) router.push({ path: '/lookup', query: { q } })
}

/* ⌘K / Ctrl-K 聚焦反查 —— 测试集成的主入口，值得一个快捷键 */
function onKey(e) {
  if ((e.metaKey || e.ctrlKey) && e.key === 'k') { e.preventDefault(); lookupBox.value?.focus() }
  if (e.key === 'Escape') { dbOpen.value = false }
}

/* 点击打开的菜单就该点击外部才关。
    之前用 mouseleave 关，而菜单与按钮之间有 4px 间隙、且间隙在容器盒子之外，
    鼠标往下移一进间隙就触发 mouseleave，菜单当场消失，根本点不到。 */
function onPointerDown(e) {
  if (dbOpen.value && !dbMenu.value?.contains(e.target)) dbOpen.value = false
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
  <header class="bar">
    <router-link to="/" class="brand">oskm</router-link>

    <nav class="nav" aria-label="视角">
      <router-link v-for="i in PRODUCT_NAV" :key="i.key || i.route" :to="entryOf(i)"
                   class="tab" :class="{ on: onItem(i), muted: i.needsDb && !store.dbLoaded }">
        <Icon :name="i.icon" :size="15" /><span class="t">{{ i.label }}</span>
      </router-link>
    </nav>

    <div class="grow" />

    <form class="lookup" role="search" @submit.prevent="submitLookup">
      <Icon name="search" :size="14" class="lens" />
      <input ref="lookupBox" v-model="lookup" :disabled="!store.dbLoaded"
             placeholder="反查：路径 / so 名 / 进程 / label" aria-label="反查">
      <kbd>⌘K</kbd>
    </form>

    <!-- 次级入口：质量与调测，刻意与视角 tab 区隔 -->
    <router-link to="/findings" class="aux" :class="{ on: path.startsWith('/findings') }">
      <Icon name="shield" :size="14" /><span class="t">质量</span>
    </router-link>

    <button class="aux theme" :title="`切换到${theme === 'dark' ? '浅色' : '深色'}主题`"
            :aria-label="`切换到${theme === 'dark' ? '浅色' : '深色'}主题`" @click="toggleTheme">
      <Icon :name="theme === 'dark' ? 'moon' : 'sun'" :size="15" />
    </button>

    <div ref="dbMenu" class="aux-menu">
      <button class="db" :class="{ empty: !store.dbLoaded }" :aria-expanded="dbOpen"
              @click="dbOpen = !dbOpen">
        <template v-if="scan">{{ scan.product }} <span class="dim">#{{ scan.id }}</span></template>
        <template v-else>选择 .db</template>
        <span class="caret" aria-hidden="true">▾</span>
      </button>
      <div v-show="dbOpen" class="menu wide">
        <label class="file">
          <input type="file" accept=".db,.sqlite" hidden
                 @change="e => pick(e.target.files[0])">
          <span>打开本地 .db 文件…</span>
        </label>
        <template v-if="store.scans.length">
          <p class="menu-head">扫描快照</p>
          <button v-for="s in store.scans" :key="s.id" class="menu-item"
                  :class="{ on: s.id === store.scanId }"
                  @click="pickScan(s.id)">
            <span class="mono">#{{ s.id }} {{ s.product }}</span>
            <span class="n">{{ (s.started_at || '').slice(0, 10) }}</span>
          </button>
        </template>
      </div>
    </div>
  </header>

  <!-- 二级：常驻子导航条。子项常驻可见，不点开就知道同组还有什么、各多少条 -->
  <nav v-if="subnav" class="subnav" :aria-label="`${group.label} 子视图`">
    <router-link v-for="c in subnav" :key="c.route" :to="c.route"
                 class="sub" :class="{ on: onChild(c) }">
      {{ c.label }}
      <span v-if="c.table && store.tableCounts[c.table] !== undefined" class="n">
        {{ store.tableCounts[c.table] }}</span>
    </router-link>
  </nav>
</template>

<style scoped>
.subnav {
  display: flex; align-items: center; gap: var(--space-1); flex-shrink: 0;
  height: 36px; padding: 0 var(--space-4);
  background: var(--surface-default);
  border-bottom: 1px solid var(--border-subtle);
  overflow-x: auto;
}
.sub {
  display: inline-flex; align-items: baseline; gap: var(--space-2);
  height: 26px; padding: 0 var(--space-3); border-radius: var(--radius-full);
  font-size: var(--text-sm); color: var(--text-secondary); text-decoration: none;
  white-space: nowrap; line-height: 26px;
}
.sub:hover { background: var(--surface-raised); color: var(--text-primary); text-decoration: none }
.sub.on { background: var(--surface-raised); color: var(--text-primary); font-weight: 600;
          box-shadow: inset 0 0 0 1px var(--entity-component) }
.sub .n { font-family: var(--font-mono); font-size: var(--text-xs); color: var(--text-secondary) }

.bar {
  display: flex; align-items: center; gap: var(--space-2); flex-shrink: 0;
  height: 52px; padding: 0 var(--space-4);
  background: var(--surface-default);
  border-bottom: 1px solid var(--border-subtle);
}
.brand {
  font-size: var(--text-lg); font-weight: 700; letter-spacing: -.01em;
  color: var(--text-primary); text-decoration: none; margin-right: var(--space-3);
}
.brand:hover { text-decoration: none }

.nav { display: flex; align-items: center; gap: var(--space-1); height: 100% }
.tab {
  display: inline-flex; align-items: center; gap: var(--space-2);
  height: 32px; padding: 0 var(--space-3); border-radius: var(--radius-md);
  font-size: var(--text-base); color: var(--text-secondary); text-decoration: none;
  transition: background var(--motion-fast) var(--ease-standard),
              color var(--motion-fast) var(--ease-standard);
}
.tab:hover { background: var(--surface-raised); color: var(--text-primary); text-decoration: none }
.tab.on { background: var(--surface-raised); color: var(--text-primary); font-weight: 600 }
.tab.muted { opacity: .45 }
.tab .icon { opacity: .75 }
.tab.on .icon { opacity: 1 }
.grow { flex: 1 }

.lookup {
  display: flex; align-items: center; gap: var(--space-2);
  height: 32px; padding: 0 var(--space-2) 0 var(--space-3); min-width: 260px;
  background: var(--surface-sunken);
  border: 1px solid var(--border-default); border-radius: var(--radius-md);
}
.lookup:focus-within { border-color: var(--entity-component) }
.lookup .lens { color: var(--text-disabled) }
.lookup input {
  flex: 1; min-width: 0; background: none; border: 0; outline: none;
  color: var(--text-primary); font: inherit; font-size: var(--text-sm);
}
.lookup input::placeholder { color: var(--text-disabled) }
.lookup kbd {
  font-family: var(--font-mono); font-size: var(--text-xs); color: var(--text-disabled);
  border: 1px solid var(--border-default); border-radius: var(--radius-sm); padding: 0 4px;
}

.aux {
  height: 32px; display: inline-flex; align-items: center; gap: var(--space-1); padding: 0 var(--space-3);
  font: inherit; font-size: var(--text-sm); color: var(--text-tertiary);
  background: none; border: 0; border-radius: var(--radius-md);
  text-decoration: none; cursor: pointer;
}
.aux:hover { color: var(--text-secondary); background: var(--surface-raised); text-decoration: none }
.aux.on { color: var(--text-primary); background: var(--surface-raised) }
/* 调测入口用警示色：让"离开产品界面"成为可见信号 */
.aux.debug.on { color: var(--severity-warning) }
.aux.theme { padding: 0 var(--space-2) }

.aux-menu { position: relative }
/* 按钮与菜单之间那 4px 视觉间隙，用一条透明桥接住，指针不会"掉出"容器 */
.aux-menu::after { content: ''; position: absolute; inset: 100% 0 auto; height: 4px }
.menu {
  position: absolute; right: 0; top: 100%; margin-top: 4px; z-index: var(--z-dropdown);
  min-width: 220px; padding: var(--space-1);
  background: var(--surface-overlay); border: 1px solid var(--border-default);
  border-radius: var(--radius-md); box-shadow: var(--shadow-2);
}
.menu.wide { min-width: 260px }
.menu-head {
  margin: var(--space-1) var(--space-2) var(--space-1);
  font-size: var(--text-xs); color: var(--text-secondary); text-transform: uppercase;
  letter-spacing: .04em;
}
.menu-item, .file {
  display: flex; justify-content: space-between; align-items: center; gap: var(--space-3);
  width: 100%; padding: var(--space-2) var(--space-2);
  font: inherit; font-size: var(--text-sm); text-align: left;
  color: var(--text-secondary); background: none; border: 0;
  border-radius: var(--radius-sm); text-decoration: none; cursor: pointer;
}
.menu-item:hover, .file:hover { background: var(--surface-raised); color: var(--text-primary); text-decoration: none }
.menu-item.on { color: var(--text-primary); font-weight: 600;
                box-shadow: inset 2px 0 0 var(--entity-component) }
.n { color: var(--text-secondary); font-size: var(--text-xs); font-family: var(--font-mono) }
.mono { font-family: var(--font-mono) }

.db {
  height: 32px; padding: 0 var(--space-3); display: inline-flex; align-items: center; gap: var(--space-2);
  font: inherit; font-size: var(--text-sm); color: var(--text-primary);
  background: var(--surface-raised); border: 1px solid var(--border-default);
  border-radius: var(--radius-md); cursor: pointer; white-space: nowrap;
}
.db:hover { border-color: var(--border-strong) }
.db.empty { color: var(--entity-component); border-color: var(--entity-component) }
.db .dim { color: var(--text-secondary); font-family: var(--font-mono) }
.caret { color: var(--text-disabled); font-size: var(--text-xs) }

@media (max-width: 1100px) { .lookup { min-width: 180px } .tab { padding: 0 var(--space-2) } }

/* 窄屏：让顶栏换行而不是溢出。视角只剩图标，反查独占第二行。
   （360px 下曾横向溢出 —— tools/a11y.mjs 会守住这条） */
@media (max-width: 860px) {
  .bar { flex-wrap: wrap; height: auto; padding: var(--space-2); row-gap: var(--space-2) }
  .brand { margin-right: var(--space-2) }
  .tab .t, .aux .t { display: none }
  .tab, .aux { padding: 0 var(--space-2) }
  .grow { display: none }
  .lookup { order: 9; flex: 1 0 100%; min-width: 0 }
  .lookup kbd { display: none }
  .db { margin-left: auto }
}
@media (max-width: 420px) { .brand { display: none } }
</style>
