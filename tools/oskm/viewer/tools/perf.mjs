/* 性能预算核验（implementation-plan §5）。
   区分两件事：首页不依赖 db 的首屏，和加载 db（示例库已长到十几 MB）后的可交互时间。 */
import { BASE_URL as base, launchBrowser } from './browser.mjs'
const browser = await launchBrowser()
let bad = 0
const check = (name, ms, limit, extra = '') => {
  const ok = ms <= limit
  if (!ok) bad++
  console.log(`${ok ? '✓' : '✗'} ${name.padEnd(26)} ${String(Math.round(ms)).padStart(5)} ms  (预算 ${limit}) ${extra}`)
}

// 1) 首页不加载 db：LCP
{
  const page = await browser.newPage({ viewport: { width: 1440, height: 900 } })
  await page.goto(`${base}/#/`, { waitUntil: 'load' })
  const lcp = await page.evaluate(() => new Promise(r => {
    new PerformanceObserver(l => { const e = l.getEntries(); r(e[e.length - 1].startTime) })
      .observe({ type: 'largest-contentful-paint', buffered: true })
    setTimeout(() => r(performance.now()), 3000)
  }))
  check('首页 LCP（未加载 db）', lcp, 1000)
  await page.close()
}

// 2) 加载 db 后各视图可交互
/* #/files/elf 的度数必须先按 callee 聚合成派生表再 JOIN；
   相关子查询曾在 3520 行上造成明显回表。这条预算防止实现退回去。 */
for (const [hash, limit] of [['#/runtime/services', 3000], ['#/parts/components', 3000],
                             ['#/files/image', 3000], ['#/files/elf', 3000]]) {
  const page = await browser.newPage({ viewport: { width: 1440, height: 900 } })
  const t0 = Date.now()
  await page.goto(`${base}/?db=knowledge.db${hash}`)
  await page.waitForFunction(() => document.querySelector('main')?.innerText.trim().length > 20,
                             null, { timeout: 20000 })
  const ms = Date.now() - t0
  const nodes = await page.evaluate(() => document.querySelectorAll('main *').length)
  check(`${hash}（含 db 冷启动）`, ms, limit, `DOM ${nodes} 节点`)
  await page.close()
}

/* 3) ELF 大闭包：libutils 反向闭包 2900+，必须懒计算且默认有界渲染。 */
{
  const page = await browser.newPage({ viewport: { width: 1440, height: 900 } })
  const t0 = Date.now()
  await page.goto(`${base}/?db=knowledge.db#/e/elf_modules/220`)
  await page.waitForSelector('.closure-node', { timeout: 20000 })
  const ms = Date.now() - t0
  const rendered = await page.locator('.closure-node').count()
  check('ELF 大闭包档案（冷启动）', ms, 3000, `渲染 ${rendered} 条`)
  if (rendered > 100) bad++
  await page.close()
}

/* 4) 交互延迟：运行视图切筛选

   历史：卡片网格时 65 ms；改 el-table 后 164 行 × 9 列重建要 ~420 ms，预算一度放宽到 600；
   加了分页（默认 100 行/页）之后回到 ~220 ms，预算随之收紧到 400。
   下面这段是当初放宽时的记录，留着是因为结论仍然成立——行数上千时还会再遇到。

   ——————
   预算从 100 ms 放宽到 600 ms，是一次有代价的取舍，不是迁就实现：
   卡片网格时是 65 ms；换成 el-table 后，164 行 × 9 列重建要 ~420 ms。
   实测过的优化都不解决问题——把整个单元格模板塌成一个纯插值仍要 420 ms，
   去掉 PathChip / show-overflow-tooltip 各只省十几毫秒，
   说明开销在 el-table 自身的每行机制里，不在我们的渲染上。

   能真正解决的只有两条，都要砍掉已承诺的功能：
     · el-table-v2 虚拟滚动 —— 但它的展开行只支持树形数据，
       装不下"展开看装载的 SA 清单"这种自定义面板
     · 分页 —— 164 行一次铺完才能 Ctrl-F，分页是倒退
   换来的是十几列可排序/可筛选/可导出的信息密度。记在这里，
   将来行数真的上千时回来重新权衡。 */
{
  const page = await browser.newPage({ viewport: { width: 1440, height: 900 } })
  await page.goto(`${base}/?db=knowledge.db#/runtime/services`)
  await page.waitForSelector('.el-table__row')
  const t0 = Date.now()
  await page.getByRole('tab', { name: /驱动宿主/ }).click()
  await page.waitForFunction(() => document.querySelectorAll('.el-table__row').length === 28)
  check('运行视图切换筛选', Date.now() - t0, 400)
  await page.close()
}

await browser.close()
console.log(bad ? `\n${bad} 项超预算` : '\n全部在预算内')
process.exit(bad ? 1 : 0)
