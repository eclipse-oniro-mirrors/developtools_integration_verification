/* SDK 接口视图的回归。

   两条主线：
   1) 能力门控——库里没有 arkts_* 时，菜单置灰、视图给出明确说明，
      **不能渲染成一个正常的空表格**（那会被读成"这个产品没有 SDK 模块"）。
   2) 三个列表视图本身能用：有数据、点行进整页详情、筛选进 URL。
   3) 三个详情页把字段讲明白——每个字段名底下有解释，枚举值翻成人话。

   第 1 条用一份人工裁掉 arkts_* 的库验证，而不是靠猜。 */
import { execFileSync } from 'node:child_process'
import { copyFileSync, rmSync } from 'node:fs'
import { join } from 'node:path'
import { BASE_URL as base, launchBrowser } from './browser.mjs'

let bad = 0
const say = (ok, name, extra = '') => { if (!ok) bad++; console.log(`${ok ? '✓' : '✗'} ${name.padEnd(36)} ${extra}`) }

/* 造一份没有 arkts_* 的库，放进 public/ 让 dev server 能取到。
   直接复制再 DROP，比维护一份手写夹具更贴近"旧快照"的真实形态。 */
const legacy = 'legacy-no-arkts.db'
const legacyPath = join('public', legacy)
copyFileSync('knowledge.db', legacyPath)
const drops = ['arkts_kit_relations', 'arkts_sources',
               'arkts_modules', 'arkts_kits', 'arkts_links_run']
execFileSync('python3', ['-c', `
import sqlite3
c = sqlite3.connect(${JSON.stringify(legacyPath)})
for t in ${JSON.stringify(drops)}:
    c.execute('DROP TABLE IF EXISTS ' + t)
c.execute("DELETE FROM collector_runs WHERE collector LIKE 'arkts%'")
c.commit()
`])

/* 列头帮助：EntityTable 的帮助面板固定渲染"含义"和"在 oskm 里怎么来的"两段，
   少一段就是一个空标题。这里在起浏览器之前先静态查一遍，缺了直接点名。 */
for (const f of ['arkts_modules', 'arkts_kits', 'arkts_sources']) {
  const { COLUMNS } = await import(`../src/model/columns/${f}.js`)
  const miss = COLUMNS.filter(c => !c.meaning || !c.reading).map(c => c.key)
  say(!miss.length, `${f} 每列都有含义与来源说明`, miss.join(',') || `${COLUMNS.length} 列`)
}

const browser = await launchBrowser()
const page = await browser.newPage({ viewport: { width: 1440, height: 900 } })
const errs = []
page.on('pageerror', e => errs.push(e.message))

const go = async (hash, db = 'knowledge.db') => {
  await page.goto(`${base}/?db=${db}${hash}`)
  await page.waitForLoadState('networkidle')
  await page.waitForFunction(() => document.querySelector('main')?.innerText.trim().length > 10,
                             null, { timeout: 20000 })
  await page.waitForTimeout(250)
}
const text = async () => (await page.locator('main').innerText()).replace(/\s+/g, ' ')

/* ---------------------------------------------------------- 1. 能力门控 */
await go('#/sdk/modules', legacy)
{
  const t = await text()
  say(t.includes('本快照未采集'), '缺表时给出明确说明', t.slice(0, 44))
  say(!(await page.locator('.el-table').count()), '缺表时不渲染空表格')
  const muted = await page.locator('.subnav .sub.muted').count()
  say(muted === 3, '缺表时三个子菜单置灰', `${muted} 项`)
  const tab = await page.locator('.nav .tab.muted:has-text("SDK")').count()
  say(tab === 1, '缺表时一级入口置灰')
  const badge = await page.locator('.subnav .sub .n').count()
  say(badge === 0, '缺表时不显示计数徽标（0 会被读成"采到 0 条"）')
}

/* ---------------------------------------------------------- 2. 正常库 */
await go('#/sdk/modules')
const counts = {}
for (const [hash, label, want] of [['#/sdk/modules', '模块', 1319],
                                   ['#/sdk/kits', 'Kit', 51],
                                   /* 1567 而不是 1568：napi-map.json 是随采集器打包的
                                      参考数据，不是 sdk-js 仓里的文件，不进这份清单 */
                                   ['#/sdk/declarations', '声明文件', 1567]]) {
  await go(hash)
  const t = await text()
  const head = +(/([\d,]+) [个份]/.exec(t)?.[1] || '0').replace(/,/g, '')
  const total = +(/显示 [\d,]+ \/ ([\d,]+) 行/.exec(t)?.[1] || '0').replace(/,/g, '')
  counts[label] = head
  /* 不写死条数会更稳，但这三个数字正是重建模的结论（1567 份文件 → 1319 个模块），
     写死能在它们再次漂移时立刻叫出来。自洽同时也要成立。 */
  say(head === want && head === total, `${label}列表计数自洽`, `表头 ${head} = 表格 ${total}`)
  say(!(await page.locator('.sub.muted').count()), `${label}：有数据时子菜单不置灰`)
}

/* 实现映射这一列必须真的连到 ELF，否则这个视图只是又一个孤立清单 */
await go('#/sdk/modules')
{
  /* 列表里的关联渲染成 button.link（不是 <a>），点下去才导航 */
  const link = page.locator('.el-table__row button.link').first()
  const has = await link.count() > 0
  say(has, '模块列表里有可点的关联链接')
  if (has) {
    await link.click()
    await page.waitForTimeout(400)
    const url = decodeURIComponent(page.url())
    say(/\/e\/(elf_modules|components)\//.test(url), '实现链接通往 ELF / 部件', url.split('#')[1] || '')
  }
}

/* ------------------------------------------------- 3. 声明文件：外链 + 整页详情 */
await go('#/sdk/declarations')
{
  const t = await text()
  say(!t.includes('napi-map') && !t.includes('oskm:'), '参考数据不入库，也不出现在清单里')
  /* 1,567 份里只有 50 份 Kit 入口，按路径排序全在最后一页——首页"所属 Kit"
     整列是空的，像坏了。分面把这层结构摆到明面上。 */
  say(/模块声明 1517/.test(t) && /Kit 入口 50/.test(t), '按文件类型分面，计数正确')
  await page.getByRole('tab', { name: /Kit 入口/ }).click()
  await page.waitForTimeout(500)
  const kitPage = await text()
  say(kitPage.includes('@kit.'), '筛 Kit 入口后"所属 Kit"列有值')
  say(/[?&]role=kit_entry/.test(decodeURIComponent(page.url())), '分面进 URL')
  await page.getByRole('tab', { name: '全部' }).click()
  await page.waitForTimeout(400)
  const a = page.locator('.el-table__row a[target="_blank"]').first()
  const href = await a.count() ? await a.getAttribute('href') : ''
  const mirrorFiles = /^https:\/\/[^/]+\/.+\/files\?ref=.+&filePath=.+&isFile=true/.test(href)
  const blobCommit = /\/blob\/[0-9a-f]{40}\//.test(href)
  say(mirrorFiles || blobCommit, '源码外链按代码仓宿主规则拼接', href.slice(0, 96))
  await page.locator('.el-table__row').first().click()
  await page.waitForTimeout(700)
  say(/\/e\/arkts_sources\/\d+/.test(decodeURIComponent(page.url())), '点行跳整页详情')
  say(!(await page.locator('aside.drawer').isVisible().catch(() => false)),
      '声明文件不用抽屉（内容摊不开）')
  const d = await text()
  say(['文件事实', '声明的实体', '关系证据'].every(k => d.includes(k)), '详情分三个子 tab')
  say(['提取能力', '判定依据', '适用模式'].every(k => d.includes(k)), '文件事实讲清三组字段')
  await page.getByRole('tab', { name: /关系证据/ }).click()
  await page.waitForTimeout(400)
  say(/[?&]tab=evidence/.test(decodeURIComponent(page.url())), 'tab 状态进 URL',
      decodeURIComponent(page.url().split('#')[1] || ''))
}

/* 模块与 Kit 都有定制详情页了，点行整页跳转。抽屉摊不开这些内容：
   模块要并排摆"声明路径 vs 镜像实际位置"，Kit 要并排摆两条成员来路。 */
await go('#/sdk/kits')
await page.locator('.el-table__row').first().click()
await page.waitForTimeout(700)
say(/\/e\/arkts_kits\/\d+/.test(decodeURIComponent(page.url())), 'Kit 点行跳整页详情',
    decodeURIComponent(page.url().split('#')[1] || ''))
say(!(await page.locator('aside.drawer').isVisible().catch(() => false)), 'Kit 不再用抽屉')
{
  const t = await text()
  say(['基本信息', '成员模块', '引用证据'].every(k => t.includes(k)), 'Kit 详情分子 tab')
  /* 两条来路的差集是这一页的核心结论，不能只给一个合计数字 */
  say(['两边都有', '仅有标签', '仅被引用'].every(k => t.includes(k)), 'Kit 并排摆两条成员来路')
  say(t.includes('业务键') && t.includes('这个 Kit 是怎么被发现的'), 'Kit 每个字段有解释')
  await page.getByRole('tab', { name: /成员模块/ }).click()
  await page.waitForTimeout(400)
  say(/[?&]tab=members/.test(decodeURIComponent(page.url())), 'Kit tab 进 URL')
  const m = await text()
  say(/两者|仅标签|仅引用/.test(m), '成员表标出每条关系的来路')
}
/* 用面包屑回列表，不用 page.goBack()：go() 是 page.goto 的纯 hash 跳转，
   vue-router 在 popstate 上补 ?scan= 时会把那个历史条目吃掉，后退会越过
   列表落到上一个详情页。那是夹具的导航方式造成的，不是详情页的行为——
   真实用户从菜单进列表不会这样。这里验的是页面自己提供的返回入口。 */
await page.getByRole('button', { name: '← Kit' }).click()
await page.waitForTimeout(600)
say(/#\/sdk\/kits/.test(decodeURIComponent(page.url())), '面包屑回到 Kit 列表',
    decodeURIComponent(page.url().split('#')[1] || ''))

await go('#/sdk/modules')
await page.locator('.el-table__row').first().click()
await page.waitForTimeout(700)
say(/\/e\/arkts_modules\/\d+/.test(decodeURIComponent(page.url())), '模块点行跳整页详情',
    decodeURIComponent(page.url().split('#')[1] || ''))
{
  const t = await text()
  say(['基本信息', '实现', '声明文件'].every(k => t.includes(k)), '模块详情分子 tab')
  say(t.includes('去掉语言后缀') && t.includes('纯路径事实'), '模块每个字段有解释')
  await page.getByRole('tab', { name: /^实现/ }).click()
  await page.waitForTimeout(400)
  const impl = await text()
  /* 声明路径按 64 位写、本产品是 32 位，两行必须并排，否则这个差异看不见 */
  say(impl.includes('声明路径') && impl.includes('镜像实际位置'), '实现页并排摆两个路径')
  say(/NAPI 原生模块|ArkUI 引擎|纯类型声明|未知/.test(impl), '实现方式翻成人话')
  await page.getByRole('tab', { name: /Kit 关系/ }).click().catch(() => {})
  await page.waitForTimeout(400)
  const kits = await text()
  say(!kits.includes('Kit 关系') || kits.includes('两类关系，不要混着读'),
      '模块页点明两类 Kit 关系的区别')
}

say(errs.length === 0, '无页面报错', errs.slice(0, 2).join(' | '))

await browser.close()
rmSync(legacyPath, { force: true })        // 别把夹具库留在 public/ 里被打包
console.log(bad ? `\n${bad} 项不通过` : '\n全部通过')
process.exit(bad ? 1 : 0)
