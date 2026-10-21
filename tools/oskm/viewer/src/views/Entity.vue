<script setup>
/* 枢纽实体的整页档案。所有实体共用一条路由 #/e/<table>/<id>。
   内容本体在 EntityDossier.vue，与侧边抽屉共用；这里只管整页的外壳与返回。
   叶子实体通常不走这条路由——它们浮在原页上的抽屉里（nav.js openEntity）。 */
import { computed, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { cameFrom } from '../model/nav.js'
import { useScrollMemory } from '../composables/useScrollMemory.js'
import EntityDossier from '../components/EntityDossier.vue'

const route = useRoute()
const router = useRouter()
const scroller = ref(null)
useScrollMemory(scroller)

/* 进页面那一刻的来路；后续在页内跳转不该让这个按钮跟着变 */
const from = cameFrom()
const table = computed(() => route.params.table)
const id = computed(() => route.params.id)
</script>

<template>
  <div ref="scroller" class="page">
    <nav v-if="from" class="back">
      <button @click="router.back()">← 返回{{ from.name }}</button>
    </nav>
    <EntityDossier :key="`${table}/${id}`" :table="table" :id="id" />
  </div>
</template>

<style scoped>
/* 不设 max-width：整页就该用满窗口。
   单行过长的问题由 EntityDossier 的两栏布局解决，不是靠把整页掐窄。 */
.page { height: 100%; overflow: auto; padding: var(--space-5) var(--space-6) var(--space-7) }
.back { margin-bottom: var(--space-3) }
.back button {
  font: inherit; font-size: var(--text-sm); padding: 0;
  background: none; border: 0; cursor: pointer; color: var(--entity-component);
}
.back button:hover { text-decoration: underline }
</style>
