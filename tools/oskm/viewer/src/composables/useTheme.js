import { ref, watchEffect } from 'vue'

/* 主题只改 tokens.css 里的变量；组件不感知主题。
   默认跟随系统，用户选择后记住。 */
const KEY = 'oskm.theme'
const saved = localStorage.getItem(KEY)
const prefersLight = window.matchMedia?.('(prefers-color-scheme: light)').matches
export const theme = ref(saved || (prefersLight ? 'light' : 'dark'))

watchEffect(() => {
  document.documentElement.classList.toggle('dark', theme.value === 'dark')
  document.documentElement.classList.toggle('light', theme.value === 'light')
  document.documentElement.style.colorScheme = theme.value
})

export function toggleTheme() {
  theme.value = theme.value === 'dark' ? 'light' : 'dark'
  localStorage.setItem(KEY, theme.value)
}
