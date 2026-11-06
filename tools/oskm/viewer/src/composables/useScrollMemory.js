/* 滚动位置记忆。

   router 的 scrollBehavior 在这个项目里是摆设：每个视图自己是
   `height:100%; overflow:auto` 的容器，滚的不是 window。
   所以返回时得自己把位置放回去。

   按 fullPath 记——筛选条件变了就是另一个位置，不会串。 */
import { onBeforeUnmount, watch } from 'vue'
import { useRoute } from 'vue-router'

const memory = new Map()

export function useScrollMemory(elRef) {
  const route = useRoute()
  let el = null
  let key = route.fullPath          // 这个容器当前属于哪条 URL

  const save = () => { if (el) memory.set(key, el.scrollTop) }

  /* 数据是异步查出来的，元素出现那一帧内容往往还没铺开、滚不到位，
     所以滚一次不够，要盯着重试到真滚到为止。 */
  function restore(want, tries = 20) {
    if (!el || !want) return
    el.scrollTop = want
    if (Math.abs(el.scrollTop - want) > 1 && tries > 0) {
      requestAnimationFrame(() => restore(want, tries - 1))
    }
  }

  /* 不能只在 onMounted 里取元素：这些视图外面套着 v-if="store.dbLoaded"，
     挂载那一刻库还没加载完，容器根本不存在，监听会永远装不上。 */
  watch(elRef, next => {
    if (el) el.removeEventListener('scroll', save)
    el = next || null
    if (!el) return
    key = route.fullPath
    el.addEventListener('scroll', save, { passive: true })
    restore(memory.get(key) || 0)
  }, { immediate: true, flush: 'post' })

  /* 存档时机就是这里，不能放在 onBeforeUnmount：等卸载钩子跑的时候
     route.fullPath 早就是新地址了，存下去等于把自己的位置写进别人的键——
     实测 Build 和 Entity 会互相覆盖。这个 watch 是 pre-flush，元素还在、键还对。 */
  watch(() => route.fullPath, next => { save(); key = next })

  onBeforeUnmount(() => el?.removeEventListener('scroll', save))
}
