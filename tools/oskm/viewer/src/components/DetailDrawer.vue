<script setup>
/* 叶子实体的侧边抽屉（navigation-options §4 方案 3D）。

   由 URL 驱动：`?detail=install_targets/4210`。这一条决定了它的全部性质——
   可分享、刷新还在、后退键能关掉；原先那个 Pinia 驱动的 DetailSidebar 三样都没有。

   抽屉外壳在 SideDrawer.vue，与质量页共用。 */
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { closeDetail } from '../model/nav.js'
import SideDrawer from './SideDrawer.vue'
import EntityDossier from './EntityDossier.vue'

const route = useRoute()
const router = useRouter()

const target = computed(() => {
  const raw = route.query.detail
  if (typeof raw !== 'string') return null
  const i = raw.indexOf('/')
  if (i <= 0) return null
  const table = raw.slice(0, i), id = raw.slice(i + 1)
  /* 表名直接进 SQL，必须挡住非标识符 */
  return /^[a-z_][a-z0-9_]*$/.test(table) && id ? { table, id } : null
})

const close = () => closeDetail(router, route)
</script>

<template>
  <SideDrawer :open="!!target" tag="详情" @close="close">
    <template #actions>
      <!-- 不要再调 close()：跳到新路径时 detail 自然就没了，
           两个导航同时发出会互相抢，实测 close 的 replace 会把跳转吃掉 -->
      <router-link v-if="target" class="expand" :to="`/e/${target.table}/${target.id}`">
        在新页面打开 ↗
      </router-link>
    </template>
    <EntityDossier v-if="target" :key="`${target.table}/${target.id}`"
                   :table="target.table" :id="target.id" compact />
  </SideDrawer>
</template>

<style scoped>
.expand { font-size: var(--text-sm) }
</style>
