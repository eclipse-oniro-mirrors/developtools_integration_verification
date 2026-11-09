<script setup>
import { computed, onMounted, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useViewerStore } from './stores/viewer.js'
import { useDatabase } from './composables/useDatabase.js'
import AppBar from './components/AppBar.vue'
import './composables/useTheme.js'
import DetailDrawer from './components/DetailDrawer.vue'
import zhCn from 'element-plus/es/locale/lang/zh-cn.mjs'

const store = useViewerStore()
const router = useRouter()
const route = useRoute()
const { loadDatabaseFromUrl } = useDatabase()

const error = ref('')

onMounted(async () => {
  /* db 是真实 URL 参数（?db=xxx），写在 hash 之前；
     scan 是 hash query（#/parts?scan=2），由 router 管理。
     createWebHashHistory 下 location.search 读不到 hash 里的 scan，
     要等 router ready 后从 route.query 取。 */
  const params = new URLSearchParams(location.search)
  const explicit = params.get('db')
  const candidates = explicit ? [explicit] : ['knowledge.db']
  for (const url of candidates) {
    try {
      await loadDatabaseFromUrl(url)
      store.dbLoaded = true
      await router.isReady()
      store.loadScans(route.query.scan)
      return
    } catch (e) {
      if (explicit) error.value = String(e.message || e)
    }
  }
})
</script>

<template>
  <el-config-provider :locale="zhCn">
  <AppBar />
  <main class="content">
    <p v-if="error" class="boot-error">{{ error }}</p>
    <template v-else>
      <router-view />
    </template>
  </main>
  <DetailDrawer />
  </el-config-provider>
</template>

<style scoped>
.content { flex: 1; min-height: 0; overflow: hidden; background: var(--surface-sunken);
            display: flex; flex-direction: column }
.content > * { flex: 1; min-height: 0 }
.boot-error {
  margin: var(--space-7) auto; max-width: 480px; text-align: center;
  color: var(--severity-error); font-size: var(--text-base);
}
</style>
