<script setup>
/* 所有列表视图共用的表格。七个二级视图里六个要它，
   照抄六遍是两千行重复、改一个 bug 改六处。

   分工：
     视图  —— 取数、分面筛选（chips / 下拉），把**已筛好**的 rows 传进来
     这里  —— 搜索、排序、分页、列显隐、导出、带 ⓘ 的表头、单元格渲染

   状态（q / sort / dir / hide / page / size）全部进 URL。每个视图是独立路由，
   参数名不会撞车，所以不加前缀。 */
import { computed, onMounted, ref, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { distribution, sortRows, humanBytes } from '../model/fields.js'
import { toCSV, toJSON, download } from '../model/export.js'
import { useQueryState, csvList } from '../composables/useQueryState.js'
import { openEntity, openDetail } from '../model/nav.js'

import { useScrollMemory } from '../composables/useScrollMemory.js'
import PathChip from './PathChip.vue'
import GnLabel from './GnLabel.vue'

const props = defineProps({
  rows: { type: Array, required: true },       // 已经过视图分面筛选
  columns: { type: Array, required: true },    // model/fields/*.js 的列目录
  groups: { type: Array, default: () => [] },  // 列显隐面板的分组顺序
  total: { type: Number, default: null },      // 未筛选时的总数，用于"N / M"
  name: { type: String, default: '记录' },     // 导出文件名用
  tag: { type: String, default: '' },          // 导出文件名里的筛选标记
  defaultSortKey: { type: String, default: '' },
  defaultSortDesc: { type: Boolean, default: false },
  /* 点一行看详情时，开的是哪张表的档案。不填则整行不可点。 */
  entity: { type: String, default: '' },
  /* 行点击导航到整页（而非开抽屉）。提供时优先于 entity。
     部件详情页是自定义 Tab 页面，不走通用抽屉模板。 */
  rowRoute: { type: Function, default: null },
})

const route = useRoute()
const router = useRouter()

/* 滚动容器是 el-table 内部的 .el-scrollbar__wrap，不是本组件的任何一个元素，
   所以要等它渲染出来再拿。拿不到就没有滚动记忆，返回时回到顶部——
   列表动辄上千行，那等于每次返回都要重新找位置。 */
const tableRef = ref(null)
const scroller = ref(null)
useScrollMemory(scroller)
onMounted(() => {
  const find = (tries = 20) => {
    const el = tableRef.value?.$el?.querySelector('.el-scrollbar__wrap')
    if (el) scroller.value = el
    else if (tries > 0) requestAnimationFrame(() => find(tries - 1))
  }
  find()
})

const q = useQueryState('q', '')
const sortKey = useQueryState('sort', props.defaultSortKey)
const sortDir = useQueryState('dir', props.defaultSortDesc ? 'desc' : 'asc')
const hidden = useQueryState('hide', [], csvList)
const page = useQueryState('page', '1')
const size = useQueryState('size', '100')

const byKey = computed(() => Object.fromEntries(props.columns.map(c => [c.key, c])))
const DEFAULT_HIDDEN = computed(() => props.columns.filter(c => !c.show).map(c => c.key))
/* URL 里没出现过 hide 就用默认集；出现过就听 URL 的。
   判据是参数在不在，不能看数组空不空——"全部显示"本身是有效状态，
   而它序列化出来正好是空串。 */
const hiddenSet = computed(() => new Set(
  route.query.hide === undefined ? DEFAULT_HIDDEN.value : hidden.value.filter(k => k !== '-')))
const shownCols = computed(() => props.columns.filter(c => !hiddenSet.value.has(c.key)))
const colHidden = key => hiddenSet.value.has(key)
function toggleCol(key) {
  const next = new Set(hiddenSet.value)
  next.has(key) ? next.delete(key) : next.add(key)
  // '-' 是哨兵：空串会被当默认值从 URL 删掉，那样就回到默认集了
  hidden.value = next.size ? [...next] : ['-']
}

/* ---------------------------------------------------------------- 取值与渲染 */
const raw = (row, col) => (col.value ? col.value(row) : row[col.key])
const blank = v => v === null || v === undefined || v === ''
function text(row, col) {
  const v = raw(row, col)
  if (blank(v)) return ''
  if (Array.isArray(v)) return v.join(' ')
  if (col.type === 'bool') return v ? '是' : '否'
  if (col.type === 'bool3') return v ? '是' : '否'
  return String(v)
}
/* 超量内容：dest 最长 108 字符、label 159、record 上万。
   截断 + 悬停提示对几十字符够用，再长就得能展开、能选中复制。 */
const LONG = 90

const isLong = (row, col) => text(row, col).length > (col.full ?? LONG)

/* ---------------------------------------------------------------- 搜索 / 排序 / 分页 */
function matches(row, needle) {
  // 搜索覆盖所有可见列——"搜不到"最常见的原因是只搜了名字
  return shownCols.value.some(c => text(row, c).toLowerCase().includes(needle))
}
const searched = computed(() => {
  const needle = q.value.trim().toLowerCase()
  return needle ? props.rows.filter(r => matches(r, needle)) : props.rows
})
const sorted = computed(() =>
  sortRows(searched.value, byKey.value[sortKey.value], sortDir.value === 'desc'))

const SIZES = [50, 100, 200, 500]
const pageSize = computed(() => Number(size.value) || 0)
const pageNo = computed(() => Math.max(1, Number(page.value) || 1))
const paged = computed(() => {
  if (!pageSize.value) return sorted.value
  const from = (pageNo.value - 1) * pageSize.value
  return sorted.value.slice(from, from + pageSize.value)
})

function onSort({ prop, order }) {
  if (!order) { sortKey.value = props.defaultSortKey; sortDir.value = props.defaultSortDesc ? 'desc' : 'asc' }
  else { sortKey.value = prop; sortDir.value = order === 'descending' ? 'desc' : 'asc' }
  page.value = '1'
}
const defaultSort = computed(() => ({
  prop: sortKey.value, order: sortDir.value === 'desc' ? 'descending' : 'ascending',
}))
/* 筛选或搜索变了，当前页可能已经越界——回到第一页，
   否则会看到一张空表却以为是"没有数据" */
watch(() => [props.rows, q.value], () => { if (pageNo.value > 1) page.value = '1' })

/* ---------------------------------------------------------------- 导出 */
/* 导出的是**整个筛选结果**，不是当前这一页——分页只是渲染手段。
   按钮上的数字就是将要导出的行数，不会有歧义。 */
function exportAs(fmt) {
  const label = `${props.name}${props.tag ? '_' + props.tag : ''}${q.value ? '_搜-' + q.value : ''}_${sorted.value.length}行`
  const cols = shownCols.value
  if (fmt === 'csv') download(toCSV(sorted.value, cols, raw), `${label}.csv`, 'text/csv')
  else download(toJSON(sorted.value, cols, raw), `${label}.json`, 'application/json')
}

/* ---------------------------------------------------------------- 字段说明 */
/* 表头 ⓘ 里的"本次扫描的分布"。两处必须一起改，否则 3520 行的表每渲染一次白算十万次：

   1. el-popover 默认 persistent=true，内容在挂载时就渲染（不是点开才算），
      所以每个可见列的分布都会算；加 :persistent="false" 后只有点开的那一列才算。
   2. 模板里同一列调了三次 dist()，缓存到"这一批 rows"的生命周期内只算一次。
   实测：ELF 表 8 个可见列 × 3 次 × 3520 行 ≈ 31 ms/次渲染，且每次改筛选都重来。 */
const distCache = computed(() => {
  const rows = props.rows
  const by = byKey.value
  const done = new Map()
  return key => {
    if (!done.has(key)) done.set(key, distribution(rows, key, by[key]))
    return done.get(key)
  }
})
const dist = key => distCache.value(key)
const esc = s => s.replace(/[&<>"]/g, c =>
  ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c]))
const rich = t => esc(t || '').replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
                              .replace(/`(.+?)`/g, '<code>$1</code>')

/* ---------------------------------------------------------------- 链接 */
/* 行点击：rowRoute 优先（导航到整页），否则开抽屉。
    部件有自定义详情页，用 rowRoute 跳转；其他实体仍走抽屉。 */
function onRowClick(row) {
  if (props.rowRoute) {
    const dest = props.rowRoute(row)
    if (dest) { router.push(dest); return }
  }
  if (props.entity) openDetail(router, route, props.entity, row.id)
}
const openId = computed(() => {
  const raw = route.query.detail
  if (typeof raw !== 'string' || !props.entity) return null
  const [t, id] = [raw.slice(0, raw.indexOf('/')), raw.slice(raw.indexOf('/') + 1)]
  return t === props.entity ? id : null
})
/* 抽屉开着时得看得出在看哪一行 */
const rowClass = ({ row }) => (String(row.id) === String(openId.value) ? 'is-open' : '')

function go(row, col) {
  const target = col.link?.(row)
  if (!target) return
  if (target.path) router.push(target.path)
  else if (target.entity) openEntity(router, route, target.entity, target.id)
}
const linkable = (row, col) => !!col.link?.(row)
</script>

<template>
  <div class="et">
    <div class="bar">
      <slot name="facets" />
      <div class="right">
        <el-input v-model="q" size="small" clearable placeholder="搜索（覆盖所有可见列）"
                  style="width: 210px" />
        <slot name="filters" />
        <el-dropdown trigger="click" :hide-on-click="false">
          <el-button size="small">列 {{ shownCols.length }}/{{ columns.length }} ▾</el-button>
          <template #dropdown>
            <div class="cols">
              <template v-for="g in groups" :key="g">
                <p class="cols-head">{{ g }}</p>
                <el-checkbox v-for="c in columns.filter(x => x.group === g)" :key="c.key"
                             :model-value="!colHidden(c.key)" :disabled="c.fixed"
                             size="small" @change="toggleCol(c.key)">{{ c.label }}</el-checkbox>
              </template>
            </div>
          </template>
        </el-dropdown>
        <el-dropdown trigger="click" @command="exportAs">
          <el-button size="small">导出 {{ sorted.length }} 行 ▾</el-button>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item command="csv">CSV（Excel）</el-dropdown-item>
              <el-dropdown-item command="json">JSON</el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
        <slot name="actions" />
      </div>
    </div>

    <p class="count">
      显示 <b>{{ sorted.length }}</b><template v-if="total !== null"> / {{ total }}</template> 行<template
      v-if="pageSize && sorted.length > pageSize">（本页 {{ paged.length }} 行）</template> ·
      点表头排序 · 点列名旁的 <span class="i">ⓘ</span> 看字段说明<template
      v-if="entity"> · 点任意一行看详情</template>
    </p>

    <el-table ref="tableRef" :data="paged" size="small" height="100%" :default-sort="defaultSort"
              row-key="id" class="grid" :class="{ clickable: !!entity }"
              :row-class-name="rowClass" @sort-change="onSort" @row-click="onRowClick">

      <el-table-column v-for="c in shownCols" :key="c.key" :prop="c.key" :label="c.label"
                       :width="c.width" :min-width="c.min" :align="c.align || 'left'"
                       :fixed="c.fixed ? 'left' : false"
                       sortable="custom" show-overflow-tooltip>
        <template #header>
          <span class="th">
            {{ c.label }}
            <el-popover placement="bottom-start" :width="340" trigger="click" :persistent="false">
              <template #reference>
                <button class="info" :aria-label="`${c.label} 字段说明`" @click.stop>ⓘ</button>
              </template>
              <div class="help">
                <p class="help-name">{{ c.label }} <code>{{ c.key }}</code></p>
                <p class="help-t">含义</p><p v-html="rich(c.meaning)" />
                <p class="help-t">在 oskm 里怎么来的</p><p v-html="rich(c.reading)" />
                <p class="help-t">本次扫描的分布</p>
                <p class="help-d">
                  {{ dist(c.key).present }} / {{ dist(c.key).total }} 行有值 ·
                  {{ dist(c.key).distinct }} 个不同值
                </p>
                <ul class="help-top">
                  <li v-for="[v, n] in dist(c.key).top" :key="v">
                    <code>{{ v }}</code><span>{{ n }}</span>
                  </li>
                </ul>
              </div>
            </el-popover>
          </span>
        </template>

        <template #default="{ row }">
          <!-- 超量内容的 ⤢ 是**追加**在内容后面，不是替换内容。
               曾经写成第一个分支，于是 66% 的 label（超过 64 字符的那些）
               连同链接和去源码的 ↗ 一起被吃掉了。 -->
          <GnLabel v-if="c.type === 'label' && text(row, c)" :label="text(row, c)">
            <button v-if="linkable(row, c)" class="link mono" @click.stop="go(row, c)">
              {{ text(row, c) }}</button>
            <span v-else class="mono">{{ text(row, c) }}</span>
          </GnLabel>
          <button v-else-if="linkable(row, c)" class="link"
                  :class="{ strong: c.primary, mono: c.type !== 'text' || c.mono !== false }"
                  @click.stop="go(row, c)">{{ text(row, c) || '—' }}</button>
          <span v-else-if="c.type === 'badge'" class="badge" :class="c.badgeClass?.(row)">
            {{ text(row, c) }}</span>
          <span v-else-if="c.type === 'tags'" class="tags"
                :class="{ dim: !Array.isArray(raw(row, c)) || !raw(row, c).length }">
            <template v-if="Array.isArray(raw(row, c)) && raw(row, c).length">
              <span v-for="tag in raw(row, c)" :key="tag" class="badge b-module">{{ tag }}</span>
            </template>
            <template v-else>—</template>
          </span>
          <PathChip v-else-if="c.type === 'path' && raw(row, c)" :path="String(raw(row, c))" :max="40" />
          <span v-else-if="c.type === 'bool'">
            <span v-if="raw(row, c)" class="warn">{{ c.trueText?.(row) ?? '是' }}</span>
            <span v-else class="dim">—</span>
          </span>
          <span v-else-if="c.type === 'list'">
            <el-tooltip v-if="Array.isArray(raw(row, c)) && raw(row, c).length"
                        :content="raw(row, c).join(', ')" placement="top">
              <span class="mono">{{ raw(row, c).length }} 个</span>
            </el-tooltip>
            <span v-else class="dim">—</span>
          </span>
          <!-- 三态：0 与"未声明"必须看得出区别 -->
          <span v-else-if="c.type === 'bool3' || c.type === 'num3'"
                :class="blank(raw(row, c)) ? 'dim' : 'mono'">
            {{ blank(raw(row, c)) ? '未声明'
               : c.type === 'bool3' ? (raw(row, c) ? '是' : '否') : raw(row, c) }}
          </span>
          <span v-else-if="c.type === 'bytes'" class="mono"
                :class="{ dim: blank(raw(row, c)) }"
                :title="blank(raw(row, c)) ? '包里没有这个文件' : `${raw(row, c)} 字节`">
            {{ blank(raw(row, c)) ? '—' : humanBytes(raw(row, c)) }}
          </span>
          <span v-else-if="c.type === 'num'" class="mono"
                :class="{ dim: !raw(row, c), warn: c.warn && raw(row, c) }">
            {{ raw(row, c) || '—' }}
          </span>
          <span v-else :class="text(row, c) ? 'mono' : 'dim'">{{ text(row, c) || '—' }}</span>

          <!-- persistent=false：不然每个"超量内容"单元格都在挂载时就把弹层内容渲染出来，
               一页 100 行里 dest / label 超长的有几十格，白建几十个 popper。 -->
          <el-popover v-if="isLong(row, c)" placement="bottom-start" :width="560" trigger="click"
                      :persistent="false">
            <template #reference>
              <button class="xpand" :title="`${text(row, c).length} 字符，点击查看全文`"
                      @click.stop>⤢</button>
            </template>
            <p class="help-name">{{ c.label }} <code>{{ text(row, c).length }} 字符</code></p>
            <pre class="full">{{ text(row, c) }}</pre>
          </el-popover>
        </template>
      </el-table-column>

      <template #empty><span class="dim">没有符合条件的记录</span></template>
    </el-table>

    <!-- 分页只分"渲染"：排序、搜索、导出都在全量上做。
         5804 行一次铺完要 33 秒，这是实测，见 docs/nav-two-level-proposal.md §2 -->
    <div class="pager">
      <el-pagination small background layout="total, sizes, prev, pager, next, jumper"
                     :total="sorted.length" :page-size="pageSize || sorted.length || 1"
                     :current-page="pageNo" :page-sizes="SIZES"
                     @update:current-page="v => page = String(v)"
                     @update:page-size="v => { size = String(v); page = '1' }" />
      <span class="all">
        <el-button size="small" text :disabled="!pageSize"
                   @click="size = '0'; page = '1'">显示全部（{{ sorted.length }} 行，会慢）</el-button>
      </span>
    </div>
  </div>
</template>

<style scoped>
.et { height: 100%; display: flex; flex-direction: column; min-height: 0 }
.bar { display: flex; align-items: center; gap: var(--space-3); flex-wrap: wrap;
       margin-bottom: var(--space-2) }
.right { margin-left: auto; display: flex; gap: var(--space-2); align-items: center }

.count { margin: 0 0 var(--space-2); font-size: var(--text-sm); color: var(--text-secondary) }
.count b { font-family: var(--font-mono); color: var(--text-primary) }
.count .i { color: var(--text-primary) }

.grid { flex: 1; min-height: 0 }
.pager { flex: none; padding: var(--space-2) 0; display: flex; justify-content: flex-end;
         align-items: center; gap: var(--space-2) }
.all { flex: none }

.th { display: inline-flex; align-items: center; gap: 4px }
.info { font: inherit; font-size: var(--text-sm); line-height: 1; padding: 0;
        color: var(--text-secondary); background: none; border: 0; cursor: pointer }
.info:hover { color: var(--entity-component) }

.grid.clickable :deep(.el-table__row) { cursor: pointer }
/* 用 raised 不用 overlay：行里有 --entity-component 的链接，
   它在 overlay 上只有 4.31:1（见 tokens.css 的"浮层底色"一节） */
.grid :deep(.el-table__row.is-open) { background: var(--surface-raised) }
.grid :deep(.el-table__row.is-open td:first-child) {
  box-shadow: inset 2px 0 0 var(--entity-component) }
.link { font: inherit; font-size: var(--text-sm); color: var(--entity-component);
        background: none; border: 0; padding: 0; cursor: pointer; text-align: left }
.link:hover { text-decoration: underline }
.strong { font-weight: 600 }
.xpand { font: inherit; font-size: var(--text-xs); margin-left: 4px; padding: 0;
         color: var(--text-secondary); background: none; border: 0; cursor: pointer }
.xpand:hover { color: var(--entity-component) }
.full { margin: var(--space-2) 0 0; padding: var(--space-2); max-height: 50vh; overflow: auto;
        background: var(--surface-sunken); border: 1px solid var(--border-subtle);
        border-radius: var(--radius-sm); font-family: var(--font-mono);
        font-size: var(--text-sm); color: var(--text-secondary);
        white-space: pre-wrap; word-break: break-all; user-select: text }

.mono { font-family: var(--font-mono); font-size: var(--text-sm) }
.dim { color: var(--text-secondary) }
.warn { color: var(--severity-warning); font-weight: 600 }
.badge { font-size: var(--text-xs); padding: 1px var(--space-2); border-radius: var(--radius-full);
         border: 1px solid var(--border-default); color: var(--text-secondary) }
.badge.b-sa     { border-color: var(--entity-sa) }
.badge.b-hdf    { border-color: var(--entity-hdi) }
.badge.b-daemon { border-color: var(--entity-service) }
.badge.b-module { border-color: var(--entity-module) }
.badge.b-repo   { border-color: var(--entity-repo) }
.tags { display: inline-flex; flex-wrap: wrap; gap: 4px; max-width: 100% }
.tags.dim { font-family: var(--font-mono); font-size: var(--text-sm) }

.cols { padding: var(--space-2); max-height: 420px; overflow: auto;
        display: flex; flex-direction: column }
.cols-head { margin: var(--space-2) 0 2px; font-size: var(--text-xs); color: var(--text-secondary);
             text-transform: uppercase; letter-spacing: .05em }
.cols-head:first-child { margin-top: 0 }

.help p { margin: 0 }
.help-name { font-weight: 600; color: var(--text-primary); margin-bottom: var(--space-2) !important }
.help-name code { font-family: var(--font-mono); font-size: var(--text-xs);
                  color: var(--text-secondary); margin-left: var(--space-1) }
.help-t { margin-top: var(--space-3) !important; font-size: var(--text-xs);
          color: var(--text-secondary); letter-spacing: .05em }
.help :deep(strong) { color: var(--text-primary) }
.help :deep(code) { font-family: var(--font-mono); font-size: var(--text-xs) }
.help-d { font-family: var(--font-mono); font-size: var(--text-sm) }
.help-top { list-style: none; margin: var(--space-1) 0 0; padding: 0 }
.help-top li { display: flex; justify-content: space-between; gap: var(--space-3);
               font-size: var(--text-sm) }
.help-top code { font-family: var(--font-mono); overflow: hidden; text-overflow: ellipsis;
                 white-space: nowrap }
.help-top span { font-family: var(--font-mono); color: var(--text-secondary) }

@media (max-width: 760px) { .right { margin-left: 0; width: 100%; flex-wrap: wrap } }
</style>
