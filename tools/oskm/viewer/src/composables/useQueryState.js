/* URL 即状态（ux-design §10、navigation-options §3 方案 1A）。

   把一个 query 参数当 ref 用：

     const kind = useQueryState('kind', 'all')
     <button @click="kind = 'driver'">

   两条规矩，都不是风格问题：

   1. 写状态一律 `router.replace`，跳转才 `router.push`。
      筛选不是"去了别处"，不该在历史里留一格——否则点五个筛选条件，
      后退键要按五次才回得到上一个页面。
   2. 等于默认值时把参数删掉，URL 保持短。

   这样做之后，"返回"不需要任何额外代码：浏览器退回上一条 URL，
   筛选条件就跟着回来了。 */
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'

/* 同一轮里连写两个参数时，第二次读到的 route.query 还是旧的（路由更新是异步的），
   后写的会把先写的冲掉。攒一个批次合并，避免这种丢写。 */
let batch = null
let seq = 0

function patch(router, route, key, value) {
  if (!batch || batch.path !== route.path) batch = { path: route.path, query: { ...route.query } }
  if (value === '' || value == null) delete batch.query[key]
  else batch.query[key] = value

  const mine = ++seq
  router.replace({ path: batch.path, query: { ...batch.query } })
        .finally(() => { if (seq === mine) batch = null })
}

/**
 * @param key        query 参数名
 * @param fallback   默认值（URL 里没有该参数时的取值）
 * @param codec      非字符串状态的编解码，见下方 pathSet
 */
export function useQueryState(key, fallback = '', codec = null) {
  const route = useRoute()
  const router = useRouter()
  const encode = v => (codec ? codec.serialize(v) : (v == null ? '' : String(v)))
  const blank = encode(fallback)

  return computed({
    get() {
      const raw = route.query[key]
      if (raw == null) return fallback
      return codec ? codec.parse(String(raw)) : String(raw)
    },
    set(v) {
      const s = encode(v)
      patch(router, route, key, s === blank ? '' : s)
    },
  })
}

/* 逗号分隔的一串值（隐藏的列、多选筛选）。 */
export const csvList = {
  serialize: list => (list || []).join(','),
  parse: s => s.split(',').filter(Boolean),
}

/* 目录展开集合的编解码：只写最深的路径，祖先由前缀推回来。
   镜像树实测最深 6 层，这样 URL 增量不到 60 字符；
   全量写入的话展开几层就是一串几百字符的噪声。 */
export const pathSet = {
  serialize(set) {
    const all = [...set]
    return all.filter(p => !all.some(o => o !== p && o.startsWith(p + '/')))
              .sort().join(',')
  },
  parse(s) {
    const out = new Set()
    for (const p of s.split(',').filter(Boolean)) {
      const segs = p.split('/')
      for (let i = 1; i <= segs.length; i++) out.add(segs.slice(0, i).join('/'))
    }
    return out
  },
}
