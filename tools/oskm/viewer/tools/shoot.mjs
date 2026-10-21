/* 无头截图自检：对每个视图截图并抓控制台错误。
   用法：node tools/shoot.mjs [baseURL] */
import { mkdirSync } from 'fs'
import { BASE_URL, launchBrowser } from './browser.mjs'

const base = process.argv[2] || BASE_URL
const db = '?db=knowledge.db'
const SHOTS = [
  ['home',        '#/',        1440, 900],
  ['home-narrow', '#/',         820, 900],
  ['runtime',     '#/runtime/services', 1440, 900],
  ['runtime-unit','#/runtime/unit/51', 1440, 900],
  ['parts-components', '#/parts/components', 1440, 900],
  ['parts-repos',      '#/parts/repos',      1440, 900],
  ['runtime-sa',       '#/runtime/sa',       1600, 900],
  ['runtime-hdi',      '#/runtime/hdi',      1600, 900],
  ['files-targets',    '#/files/targets',    1600, 900],
  ['image',            '#/files/image',      1440, 900],
  ['lookup',      '#/lookup?q=libaccessibleabilityms.z.so', 1440, 900],
  ['findings',    '#/findings',1440, 900],
  ['entity-component', '#/e/components/218', 1440, 900],
  ['entity-sa',        '#/e/sas/1',        1440, 900],
  ['data',        '#/data/components', 1440, 900],
  /* 叶子抽屉：列表必须还在左边看得见，这正是它存在的理由 */
  ['drawer',        '#/files/image?open=system/lib&detail=install_targets/1571', 1440, 900],
  ['drawer-narrow', '#/files/image?open=system/lib&detail=install_targets/1571',  820, 900],
  ['findings-open',  '#/findings?issue=components%2FCOMPONENT_DEP_UNRESOLVED', 1440, 900],
  ['runtime-wide',   '#/runtime/services?hide=-', 1760, 900],
  ['dossier',        '#/runtime/services?detail=services/51', 1600, 900],      // 全部 19 列
]

mkdirSync('shots', { recursive: true })
const browser = await launchBrowser()
let bad = 0

for (const [name, hash, w, h] of SHOTS) {
  const page = await browser.newPage({ viewport: { width: w, height: h } })
  await page.addInitScript(t => localStorage.setItem('oskm.theme', t), process.env.THEME || 'dark')
  const problems = []
  page.on('console', m => { if (m.type() === 'error') problems.push(m.text()) })
  page.on('pageerror', e => problems.push(`PAGEERROR ${e.message}`))
  await page.goto(`${base}/${db}${hash}`, { waitUntil: 'networkidle' })
  await page.waitForTimeout(1200)
  await page.screenshot({ path: `shots/${process.env.THEME === 'light' ? 'light-' : ''}${name}.png`, fullPage: false })

  // 可读性抽检：正文是否有过低对比度 / 元素是否溢出视口
  const audit = await page.evaluate(() => {
    const overflow = document.documentElement.scrollWidth > window.innerWidth + 2
    const empty = !document.querySelector('main')?.innerText.trim()
    return { overflow, empty, text: (document.querySelector('main')?.innerText || '').slice(0, 160) }
  })
  const flag = problems.length || audit.overflow || audit.empty
  if (flag) bad++
  console.log(`${flag ? '✗' : '✓'} ${name.padEnd(13)} ${audit.overflow ? '横向溢出 ' : ''}${audit.empty ? '内容空 ' : ''}${problems.slice(0, 2).join(' | ')}`)
  if (!flag) console.log(`    ${audit.text.replace(/\n+/g, ' / ').slice(0, 120)}`)
  await page.close()
}
await browser.close()
console.log(bad ? `\n${bad} 个视图有问题` : '\n全部通过')
process.exit(bad ? 1 : 0)
