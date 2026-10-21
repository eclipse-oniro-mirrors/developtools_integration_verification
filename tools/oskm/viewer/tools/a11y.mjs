/* 可访问性抽检（implementation-plan §6）：对比度、焦点可见、键盘可达、缩放不溢出 */
import { BASE_URL as base, launchBrowser } from './browser.mjs'
const THEME = process.env.THEME || 'dark'
const browser = await launchBrowser()
console.log(`主题：${THEME}`)
let bad = 0
const say = (ok, name, extra = '') => { if (!ok) bad++; console.log(`${ok ? '✓' : '✗'} ${name} ${extra}`) }

const lum = c => {
  const [r, g, b] = c.match(/\d+/g).slice(0, 3).map(Number).map(v => {
    v /= 255; return v <= .03928 ? v / 12.92 : ((v + .055) / 1.055) ** 2.4
  })
  return .2126 * r + .7152 * g + .0722 * b
}
const ratio = (a, b) => { const [x, y] = [lum(a), lum(b)].sort((p, q) => q - p); return (x + .05) / (y + .05) }

for (const hash of ['#/', '#/runtime/services', '#/parts/components',
                     /* 抽屉是新的一层表面，底色不同，对比度要单独量 */
                     '#/files/image?open=system/lib&detail=install_targets/1571',
                     '#/findings?issue=components%2FCOMPONENT_DEP_UNRESOLVED',
                     /* 抽屉详情重排过，字段表与折叠头是新的取样面 */
                     '#/runtime/services?detail=services/51']) {
  const page = await browser.newPage({ viewport: { width: 1440, height: 900 } })
  await page.addInitScript(t => localStorage.setItem('oskm.theme', t), THEME)
  await page.goto(`${base}/?db=knowledge.db${hash}`)
  await page.waitForFunction(() => document.querySelector('main')?.innerText.trim().length > 10, null, { timeout: 20000 })

  // 文本对比度
  const samples = await page.evaluate(() => {
    const out = []
    for (const el of document.querySelectorAll('main *')) {
      if (!el.childNodes.length) continue
      const txt = [...el.childNodes].filter(n => n.nodeType === 3 && n.textContent.trim()).map(n => n.textContent.trim()).join('')
      if (!txt) continue
      const s = getComputedStyle(el)
      let bg = s.backgroundColor, p = el
      while (bg === 'rgba(0, 0, 0, 0)' && p.parentElement) { p = p.parentElement; bg = getComputedStyle(p).backgroundColor }
      out.push({ txt: txt.slice(0, 24), fg: s.color, bg, size: parseFloat(s.fontSize), weight: s.fontWeight })
    }
    return out
  })
  const low = samples.filter(s => {
    const need = (s.size >= 18.66 || (s.size >= 14 && +s.weight >= 700)) ? 3 : 4.5
    return ratio(s.fg, s.bg) < need - 0.05
  })
  say(!low.length, `${hash} 文本对比度 AA（${samples.length} 处取样）`,
      low.length ? `低于标准 ${low.length} 处，例：「${low[0].txt}」 ${ratio(low[0].fg, low[0].bg).toFixed(2)}:1` : '')

  // 焦点可见
  await page.keyboard.press('Tab'); await page.keyboard.press('Tab')
  const focus = await page.evaluate(() => {
    const el = document.activeElement
    if (!el || el === document.body) return null
    const s = getComputedStyle(el)
    return { tag: el.tagName, outline: s.outlineWidth, shadow: s.boxShadow }
  })
  say(!!focus && (parseFloat(focus.outline) > 0 || focus.shadow !== 'none'), `${hash} 键盘焦点可见`,
      focus ? `(${focus.tag} outline ${focus.outline})` : '(无元素获得焦点)')

  // 400% 缩放不横向溢出
  await page.setViewportSize({ width: 360, height: 900 })
  const over = await page.evaluate(() => document.documentElement.scrollWidth > window.innerWidth + 2)
  say(!over, `${hash} 360px 宽无横向溢出`)
  await page.close()
}
await browser.close()
console.log(bad ? `\n${bad} 项不达标` : '\n全部达标')
process.exit(bad ? 1 : 0)
