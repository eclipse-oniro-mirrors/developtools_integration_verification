<script setup>
/* 镜像视图：路径树。实测 334 个目录、最大深度 6、5804 个文件。
   逐层展开，只渲染展开的分支，所以不需要虚拟化。见 docs/ux-design.md §7 */
import { computed, ref, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { useDatabase } from '../composables/useDatabase.js'
import { useQueryState, pathSet } from '../composables/useQueryState.js'
import { useScrollMemory } from '../composables/useScrollMemory.js'
import { openEntity } from '../model/nav.js'
import TreeNode from '../components/TreeNode.vue'

const store = useViewerStore()
const router = useRouter()
const route = useRoute()
const { rawQuery } = useDatabase()
const scroller = ref(null)
useScrollMemory(scroller)

const files = ref([])
/* 展开到哪儿进 URL（只存最深路径，祖先推导），否则看完一个文件回来，
   334 个目录的树又塌回默认两层 */
const expanded = useQueryState('open', new Set(), pathSet)
const q = useQueryState('q', '')

watch(() => store.scanId, id => {
  files.value = id ? rawQuery(`
    SELECT t.id, t.dest, t.directory, m.id AS module_id, m.label, c.name AS component
      FROM install_targets t
      JOIN install_modules m ON m.id = t.module_id
      LEFT JOIN components c ON c.id = m.component_id
     WHERE t.scan_id = ? ORDER BY t.dest`, [id]) : []
}, { immediate: true })

/* 路径 -> 树。节点带聚合信息：文件数、涉及几个部件。 */
const tree = computed(() => {
  const root = { name: '', path: '', dirs: new Map(), files: [], parts: new Set(), count: 0 }
  const filter = q.value.toLowerCase()
  for (const f of files.value) {
    if (filter && !f.dest.toLowerCase().includes(filter)) continue
    const segs = f.dest.split('/')
    const leaf = segs.pop()
    let node = root
    let path = ''
    for (const s of segs) {
      path = path ? `${path}/${s}` : s
      if (!node.dirs.has(s)) node.dirs.set(s, { name: s, path, dirs: new Map(), files: [], parts: new Set(), count: 0 })
      node = node.dirs.get(s)
      node.count++
      if (f.component) node.parts.add(f.component)
    }
    node.files.push({ ...f, name: leaf })
    root.count++
  }
  return root
})

/* 按文件数倒序：system(5020) 应当排在 chip_prod(1) 前面，
   字母序会把最该先看的东西压到最后。 */
function sortedDirs(node) {
  return [...node.dirs.values()].sort((a, b) => b.count - a.count || a.name.localeCompare(b.name))
}

function toggle(path) {
  const next = new Set(expanded.value)
  next.has(path) ? next.delete(path) : next.add(path)
  expanded.value = next
}
const isOpen = p => expanded.value.has(p) || !!q.value

/* 抽屉里正在看的那个文件，用来在树里点亮 */
const selected = computed(() => {
  const d = route.query.detail
  return typeof d === 'string' && d.startsWith('install_targets/') ? d.slice(16) : null
})

/* 默认展开最大的分区及其最大的一级子目录，让首屏就有内容。
   URL 里已经带了展开状态就不插手——那是用户上次停的地方。

   immediate 的 watch 一律放文件末尾：它定义那一刻就会跑，
   引用到下面才声明的 const 会 TDZ 报错、整页白屏（见 §14.9） */
watch(tree, root => {
  if (expanded.value.size || !root.count) return
  const top = sortedDirs(root)[0]
  if (!top) return
  const second = sortedDirs(top)[0]
  expanded.value = new Set(second ? [top.path, second.path] : [top.path])
}, { immediate: true })
</script>

<template>
  <div v-if="!store.dbLoaded" class="empty">请先加载数据库</div>
  <div v-else ref="scroller" class="image">
    <header>
      <h1>镜像视图 <span class="total">{{ files.length }} 个安装文件</span></h1>
      <el-input v-model="q" size="small" clearable placeholder="按路径筛选（输入后自动展开）"
                style="width: 280px" />
    </header>

    <div class="tree" role="tree">
      <template v-for="d in sortedDirs(tree)" :key="d.path">
        <TreeNode :node="d" :depth="0" :open="isOpen" :sort="sortedDirs" :selected="selected"
                  @toggle="toggle"
                  @pick="f => openEntity(router, route, 'install_targets', f.id)" />
      </template>
    </div>
    <p v-if="!tree.count" class="empty">没有匹配的路径</p>
  </div>
</template>

<style scoped>
.image { height: 100%; display: flex; flex-direction: column; padding: var(--space-5) var(--space-5) 0 }
header { display: flex; align-items: center; gap: var(--space-4); margin-bottom: var(--space-4) }
h1 { margin: 0; font-size: var(--text-xl); font-weight: 600 }
.total { font-size: var(--text-base); font-weight: 400; color: var(--text-secondary); margin-left: var(--space-2) }
.tree { flex: 1; overflow: auto; padding-bottom: var(--space-7); font-size: var(--text-base) }
.empty { padding: var(--space-7); text-align: center; color: var(--text-secondary) }
</style>
