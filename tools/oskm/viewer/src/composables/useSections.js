/* 折叠区的开合状态。按"区块名"记，不按实体记——换一个实体不该让人重新展开一遍。

   存 localStorage 而不是 URL：这是浏览偏好，属于人不属于页面
   （与主题同类，见 url-spec §5）。 */
import { reactive, watch } from 'vue'

const KEY = 'oskm.sections'
let state = null

export function useSections(defaults = {}) {
  if (!state) {
    let saved = {}
    try { saved = JSON.parse(localStorage.getItem(KEY) || '{}') } catch { /* 坏了就当没有 */ }
    state = reactive(saved)
    watch(state, v => { try { localStorage.setItem(KEY, JSON.stringify(v)) } catch { /* 隐私模式 */ } },
          { deep: true })
  }
  for (const [k, v] of Object.entries(defaults)) if (!(k in state)) state[k] = v
  return {
    isOpen: k => state[k] !== false,
    toggle: k => { state[k] = state[k] === false },
  }
}
