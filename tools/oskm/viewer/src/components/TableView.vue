<script setup>
import { computed, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { useDatabase } from '../composables/useDatabase.js'
import { TABLE_CONFIG } from '../utils/columns.js'
import { openEntity } from '../model/nav.js'

const props = defineProps({
  configKey: { type: String, required: true },
})

const route = useRoute()
const router = useRouter()
const store = useViewerStore()
const { queryWithScan } = useDatabase()

const config = TABLE_CONFIG[props.configKey]
const loading = ref(false)
const rows = ref([])
const total = ref(0)

const page = computed(() => parseInt(route.query.page) || 1)
const pageSize = computed(() => parseInt(route.query.limit) || 50)
const sortProp = ref(route.query.sort || config.defaultSort)
const sortOrder = ref(route.query.order === 'desc' ? 'descending' : (route.query.order === 'asc' ? 'ascending' : null))

// Filter values
const filterValues = ref({})
for (const col of config.columns) {
  if (col.filterKey && route.query[col.filterKey]) {
    filterValues.value[col.filterKey] = [route.query[col.filterKey]]
  }
}

function buildSQL() {
  const a = config.alias
  const cols = []
  if (!config.noId) cols.push(`${a}.id`)
  for (const c of config.columns) {
    if (c.computed) continue
    cols.push(`${a}.${c.key}`)
  }
  if (config.extraCols) cols.push(config.extraCols)

  const where = [`${a}.scan_id = __SCAN__`]
  const params = []

  // Search
  const q = route.query.q
  if (q) {
    const searchCols = config.search || ['name']
    const ors = searchCols.map(c => {
      const expr = typeof c === 'string' ? `${a}.${c}` : c.expr
      return `${expr} LIKE ?`
    }).join(' OR ')
    where.push(`(${ors})`)
    searchCols.forEach(() => params.push(`%${q}%`))
  }

  // Filters from URL
  for (const col of config.columns) {
    if (col.filterKey && route.query[col.filterKey] !== undefined) {
      const val = route.query[col.filterKey]
      if (['advisory'].includes(col.filterKey)) {
        where.push(`${a}.${col.filterKey} = ?`)
        params.push(parseInt(val))
      } else if (col.filterKey === 'has_issues') {
        where.push(`EXISTS(SELECT 1 FROM issues WHERE scan_id = __SCAN__ AND component = ${a}.name)`)
      } else if (col.filterMode === 'json-array') {
        const values = Array.isArray(val) ? val : [val]
        const placeholders = values.map(() => '?').join(', ')
        where.push(`EXISTS (SELECT 1 FROM json_each(${a}.${col.filterKey}) tag WHERE tag.value IN (${placeholders}))`)
        params.push(...values)
      } else {
        where.push(`${a}.${col.filterKey} = ?`)
        params.push(val)
      }
    }
  }

  const joinStr = config.joins ? config.joins.replace(/__SCAN__/g, store.scanId) : ''
  const whereStr = where.join(' AND ')

  const sortCol = (config.columns.find(c => c.key === sortProp.value)?.computed || config.noId) ? sortProp.value : `${a}.${sortProp.value}`
  const orderDir = sortOrder.value === 'descending' ? 'DESC' : 'ASC'

  const sql = `SELECT ${cols.join(', ')} FROM ${config.table} ${a} ${joinStr} WHERE ${whereStr} ORDER BY ${sortCol} ${orderDir} LIMIT ? OFFSET ?`
  const countSQL = `SELECT COUNT(*) as c FROM ${config.table} ${a} ${joinStr} WHERE ${whereStr}`
  return { sql, countSQL, params }
}

function parseTags(value) {
  if (Array.isArray(value)) return value
  try {
    const parsed = JSON.parse(value)
    return Array.isArray(parsed) ? parsed : []
  } catch {
    return []
  }
}

function fetchData() {
  if (!store.scanId) { rows.value = []; total.value = 0; return }
  loading.value = true
  const { sql, countSQL, params } = buildSQL()
  const allParams = [...params, pageSize.value, (page.value - 1) * pageSize.value]
  rows.value = queryWithScan(sql, store.scanId, allParams)
  const countRows = queryWithScan(countSQL, store.scanId, params)
  total.value = countRows[0]?.c ?? 0
  loading.value = false
}

function onSort({ prop, order }) {
  sortProp.value = prop || config.defaultSort
  sortOrder.value = order
  const newQuery = { ...route.query, sort: sortProp.value, order: order === 'descending' ? 'desc' : 'asc', page: 1 }
  router.push({ query: newQuery })
}

function onPageChange(newPage) {
  router.push({ query: { ...route.query, page: newPage } })
}

function onSizeChange(newSize) {
  router.push({ query: { ...route.query, limit: newSize, page: 1 } })
}

function onFilterChange() {
  const newQuery = { ...route.query, page: 1 }
  for (const col of config.columns) {
    if (col.filterKey) {
      const val = filterValues.value[col.filterKey]
      if (val && val.length) {
        newQuery[col.filterKey] = val[0]
      } else {
        delete newQuery[col.filterKey]
      }
    }
  }
  router.push({ query: newQuery })
}

function onRowClick(row) {
  if (row.id) openEntity(router, route, config.table, row.id)
}

function formatVal(val) {
  if (val === null || val === undefined) return ''
  return val
}

function truncate(val, len) {
  if (!val || typeof val !== 'string') return val
  return val.length > len ? val.slice(0, len - 1) + '…' : val
}

import { watch } from 'vue'
watch(() => route.query, fetchData, { deep: true, immediate: true })
watch(() => store.scanId, fetchData)
</script>

<template>
  <div class="table-page">
    <el-table
      :data="rows"
      v-loading="loading"
      style="width: 100%"
      height="100%"
      stripe
      highlight-current-row
      @row-click="onRowClick"
      @sort-change="onSort"
      :default-sort="{ prop: sortProp, order: sortOrder }"
      :header-cell-style="{ background: '#1c2128', color: '#768390', fontSize: '12px' }"
    >
      <el-table-column
        v-for="col in config.columns"
        :key="col.key"
        :prop="col.key"
        :label="col.label"
        :sortable="col.sort ? 'custom' : false"
        :width="col.truncate ? Math.min(col.truncate * 8, 300) : undefined"
        show-overflow-tooltip
      >
        <template v-if="col.filterKey" #header>
          <el-tooltip :content="col.label" placement="top">
            <span>{{ col.label }}</span>
          </el-tooltip>
        </template>

        <template v-if="col.filterKey && col.filterOptions" #filter="{ model }">
          <el-select v-model="filterValues[col.filterKey]" multiple placeholder="全部" @change="onFilterChange" style="width: 140px">
            <el-option v-for="opt in col.filterOptions" :key="opt" :label="opt" :value="opt" />
          </el-select>
        </template>

        <template #default="{ row }">
          <el-tag v-if="col.badge === 'severity'" :type="row[col.key] === 'error' ? 'danger' : row[col.key] === 'warning' ? 'warning' : 'info'" size="small" effect="dark">
            {{ row[col.key] }}
          </el-tag>
          <el-tag v-else-if="col.badge" :type="row[col.key] === 'sa' ? 'success' : row[col.key] === 'hdf' ? 'warning' : 'info'" size="small" effect="plain">
            {{ row[col.key] }}
          </el-tag>
        <span v-else-if="col.type === 'tags'" class="tag-list">
          <el-tag v-for="tag in parseTags(row[col.key])" :key="tag" size="small" effect="plain">
            {{ tag }}
          </el-tag>
        </span>
          <span v-else-if="col.type === 'bool'">{{ row[col.key] ? '✓' : '✗' }}</span>
          <span v-else>{{ formatVal(row[col.key]) }}</span>
        </template>
      </el-table-column>
    </el-table>

    <el-pagination
      :current-page="page"
      :page-size="pageSize"
      :total="total"
      :page-sizes="[20, 50, 100, 200]"
      layout="total, sizes, prev, pager, next, jumper"
      @current-change="onPageChange"
      @size-change="onSizeChange"
      style="padding: 8px 16px; justify-content: flex-end;"
    />
  </div>
</template>

<style scoped>
.table-page { display: flex; flex-direction: column; height: 100%; overflow: hidden }
.table-page :deep(.el-table) { flex: 1; overflow: auto }
.tag-list { display: inline-flex; flex-wrap: wrap; gap: 4px }
</style>
