<script setup>
/* 两列的字段表：人话列名（带 ⓘ） | 值。

   为什么是表格不是 dl 堆叠：原先 compact 下字段名与值各占一行，
   5 个字段就吃掉 220px，抽屉里一屏看不到两个区块。
   两列之后同样的内容占不到一半高度。

   库里的原始列名不另起一行显示——那会让每行高度翻倍。
   它在表头的 title 和 ⓘ 弹层里，要查的时候找得到。 */
import { humanBytes } from '../model/fields.js'
import GnLabel from './GnLabel.vue'
import PathChip from './PathChip.vue'
import JsonValue from './JsonValue.vue'

defineProps({
  /* [{ key, label, value, text, meaning, reading, missing }] */
  fields: { type: Array, required: true },
  compact: { type: Boolean, default: false },
  links: { type: Function, default: null },     // JSON 里的部件名 -> 路由
})
const emit = defineEmits(['go'])

const isJson = v => typeof v === 'string' && (v.trim()[0] === '{' || v.trim()[0] === '[')
const isLabel = v => typeof v === 'string' && v.startsWith('//') && v.includes(':')
const isPath = v => typeof v === 'string' && v.includes('/') && !isLabel(v) && v.length < 200
</script>

<template>
  <table class="ft" :class="{ compact }">
    <tbody>
      <template v-for="f in fields" :key="f.key">
        <!-- 分组表头：字段按列目录的 group 分段（身份 / 依赖 / 产出 …），
             不再按 PRAGMA 的物理列序平铺 -->
        <tr v-if="f.groupHead" class="gh"><th colspan="2" scope="colgroup">{{ f.group }}</th></tr>
      <tr :class="{ missing: f.missing }">
        <th scope="row" :title="f.label === f.key ? '' : `库里的列名：${f.key}`">
          <span class="nm">{{ f.label }}</span>
          <el-popover v-if="f.meaning" placement="left-start" :width="320" trigger="click">
            <template #reference><button class="info" :aria-label="`${f.label} 说明`">ⓘ</button></template>
            <div class="help">
              <p class="hn">{{ f.label }} <code>{{ f.key }}</code></p>
              <p class="ht">含义</p><p>{{ f.meaning }}</p>
              <template v-if="f.reading">
                <p class="ht">在 oskm 里怎么来的</p><p>{{ f.reading }}</p>
              </template>
            </div>
          </el-popover>
        </th>
        <td>
          <span v-if="f.missing" class="dim">未声明</span>
          <span v-else-if="f.type === 'bytes'" class="mono" :title="`${f.text} 字节`">
            {{ humanBytes(f.text) }}</span>
          <JsonValue v-else-if="isJson(f.text)" :value="f.text" :links="links"
                     @go="to => emit('go', to)" />
          <GnLabel v-else-if="isLabel(f.text)" :label="f.text">
            <span class="mono">{{ f.text }}</span>
          </GnLabel>
          <PathChip v-else-if="isPath(f.text)" :path="f.text" :max="compact ? 52 : 110" />
          <span v-else class="mono">{{ f.text }}</span>
        </td>
      </tr>
      </template>
    </tbody>
  </table>
</template>

<style scoped>
.ft { width: 100%; border-collapse: collapse; table-layout: fixed }
.ft th {
  width: 148px; text-align: left; font-weight: 400; vertical-align: top;
  padding: var(--space-1) var(--space-3) var(--space-1) 0;
  color: var(--text-secondary); font-size: var(--text-sm);
}
.ft.compact th { width: 116px }
.ft td { padding: var(--space-1) 0; vertical-align: top; overflow-wrap: anywhere }
.ft tr + tr th, .ft tr + tr td { border-top: 1px solid var(--border-subtle) }
.ft tr.gh th {
  width: auto; padding: var(--space-3) 0 var(--space-1); border-top: 0;
  font-size: var(--text-xs); font-weight: 600; color: var(--text-secondary);
  letter-spacing: .05em;
}
.ft tr.gh + tr th, .ft tr.gh + tr td { border-top: 0 }
.ft tr.missing td { color: var(--text-secondary) }
.nm { margin-right: 2px }
.info { font: inherit; font-size: var(--text-xs); line-height: 1; padding: 0;
        color: var(--text-secondary); background: none; border: 0; cursor: pointer }
.info:hover { color: var(--entity-component) }
.mono { font-family: var(--font-mono); font-size: var(--text-sm) }
.dim { color: var(--text-secondary) }

.help p { margin: 0 }
.hn { font-weight: 600; color: var(--text-primary); margin-bottom: var(--space-2) !important }
.hn code { font-family: var(--font-mono); font-size: var(--text-xs);
           color: var(--text-secondary); margin-left: var(--space-1) }
.ht { margin-top: var(--space-3) !important; font-size: var(--text-xs);
      color: var(--text-secondary); letter-spacing: .05em }
</style>
