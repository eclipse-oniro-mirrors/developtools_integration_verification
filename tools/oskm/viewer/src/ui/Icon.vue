<script setup>
/* 内联 SVG 图标。不用 emoji：跨平台渲染不一致，缺字体时直接变豆腐块；
   也不用图标字体（FOIT、不可访问）。见 implementation-plan §4 决策 5。 */
defineProps({
  name: { type: String, required: true },
  size: { type: [Number, String], default: 16 },
})
const P = {
  home:    'M3 9.5 12 3l9 6.5V20a1 1 0 0 1-1 1h-5v-6H9v6H4a1 1 0 0 1-1-1z',
  runtime: 'M8 5v14l11-7z',
  build:   'M14.7 6.3a4 4 0 0 1-5 5L4 17v3h3l5.7-5.7a4 4 0 0 1 5-5l-3-3 3-3 3 3z',
  image:   'M21 8.5 12 3 3 8.5v7L12 21l9-5.5zM12 12 3 8.5M12 12l9-3.5M12 12v9',
  search:  'M11 4a7 7 0 1 0 0 14 7 7 0 0 0 0-14M20 20l-4-4',
  tools:   'M7 3v6M4 6h6M17 15v6M14 18h6M4 20 20 4',
  shield:  'M12 3 5 6v6c0 4 3 7.5 7 9 4-1.5 7-5 7-9V6z',
  chip:    'M9 9h6v6H9zM4 9h2M4 15h2M18 9h2M18 15h2M9 4v2M15 4v2M9 18v2M15 18v2M6 6h12v12H6z',
  box:     'M3 7l9-4 9 4v10l-9 4-9-4z',
  node:    'M12 3v18M5 7l7-4 7 4',
  arrow:   'M5 12h14M13 6l6 6-6 6',
  down:    'M6 9l6 6 6-6',
  right:   'M9 6l6 6-6 6',
  check:   'M4 12l5 5L20 6',
  close:   'M6 6l12 12M18 6 6 18',
  warn:    'M12 3 2 20h20zM12 10v4M12 17h.01',
  moon:    'M20 14.5A8.5 8.5 0 0 1 9.5 4a8.5 8.5 0 1 0 10.5 10.5',
  sun:     'M12 6a6 6 0 1 0 0 12 6 6 0 0 0 0-12M12 2v2M12 20v2M4.2 4.2l1.4 1.4M18.4 18.4l1.4 1.4M2 12h2M20 12h2M4.2 19.8l1.4-1.4M18.4 5.6l1.4-1.4',
}
</script>

<template>
  <svg class="icon" :width="size" :height="size" viewBox="0 0 24 24" fill="none"
       stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"
       aria-hidden="true" focusable="false">
    <path :d="P[name]" />
  </svg>
</template>

<style scoped>
.icon { display: inline-block; vertical-align: -2px; flex-shrink: 0 }
</style>
