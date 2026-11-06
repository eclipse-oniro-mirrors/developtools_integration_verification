/* 导出当前看到的东西：当前筛选 × 当前可见列 × 当前排序，顺序与屏幕一致。
   范围是**整个筛选结果**而不是当前这一页——分页只是渲染手段，
   导出按钮上的数字就是将要导出的行数，不留歧义。 */

const read = (row, col) => (col.value ? col.value(row) : row[col.key])

function cell(row, col) {
  const v = read(row, col)
  if (v === null || v === undefined || v === '') return ''
  if (Array.isArray(v)) return v.join(' ')
  if (col.type === 'bool' || col.type === 'bool3') return v ? '是' : '否'
  return String(v)
}

/* Excel 会把以 = + - @ 开头的单元格当公式执行。当前库里实测 0 处，
   但值随产品变化，加一个前缀的成本接近零。 */
const DANGEROUS = /^[=+\-@\t\r]/
function csvField(text) {
  const safe = DANGEROUS.test(text) ? `'${text}` : text
  return /[",\n\r]/.test(safe) ? `"${safe.replace(/"/g, '""')}"` : safe
}

export function toCSV(rows, cols) {
  const lines = [cols.map(c => csvField(c.label)).join(',')]
  for (const r of rows) lines.push(cols.map(c => csvField(cell(r, c))).join(','))
  return '﻿' + lines.join('\r\n')     // BOM：没有它 Excel 会把中文读成乱码
}

export function toJSON(rows, cols) {
  return JSON.stringify(
    rows.map(r => Object.fromEntries(cols.map(c => [c.key, read(r, c) ?? null]))), null, 2)
}

export function download(text, filename, mime) {
  const url = URL.createObjectURL(new Blob([text], { type: `${mime};charset=utf-8` }))
  const a = document.createElement('a')
  a.href = url; a.download = filename
  document.body.appendChild(a); a.click(); a.remove()
  URL.revokeObjectURL(url)
}
