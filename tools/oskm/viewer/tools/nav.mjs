/* 回归：跳转之后上下文不许丢。

   对应 docs/navigation-options.md 的三层损失：
     L2 状态 —— 筛选/展开/滚动位置，返回后必须原样还在
     L1 来路 —— 深链接直接打开也要有面包屑
     L3 位置 —— "返回"必须是真返回，不能往历史里再压一格

   这些都测不出来于构建期：语法全对，坏的是运行时行为。 */
import { BASE_URL as base, launchBrowser } from './browser.mjs'

const browser = await launchBrowser()
const page = await browser.newPage({ viewport: { width: 1440, height: 900 } })
let bad = 0
const say = (ok, name, extra = '') => { if (!ok) bad++; console.log(`${ok ? '✓' : '✗'} ${name}${extra ? '  ' + extra : ''}`) }
const hash = () => decodeURIComponent(page.url().split('#')[1] || '')

const errors = []
page.on('console', m => { if (m.type() === 'error') errors.push(m.text()) })
page.on('pageerror', e => errors.push(String(e)))

async function go(h) {
  await page.goto(`${base}/?db=knowledge.db#${h}`)
  await page.waitForFunction(() => document.querySelector('main')?.innerText.trim().length > 10,
                             null, { timeout: 20000 })
  await page.waitForTimeout(250)
}
/* 运行视图是表格，行即运行单元 */
const rows = () => page.locator('.el-table__row')
/* 点行要点在没有链接的那一格：行中心常常正好压在某个链接上，
   而链接是 @click.stop 的，点中它测的就不是"点行"了 */
const firstCell = () => page.locator('.el-table__row td').first()
/* 点一行并等抽屉真的出来。固定 waitForTimeout 在整串用例里会被前一段的
   残留状态拖慢，等状态比等时间可靠。 */
async function openRow() {
  await firstCell().click()
  await page.locator('aside.drawer').waitFor({ state: 'visible', timeout: 5000 })
  await page.waitForTimeout(150)
}

/* ---------------------------------------------- L2：筛选进 URL，返回后还在 */
console.log('— 筛选状态 —')
await go('/runtime/services')
await page.getByRole('tab', { name: /驱动宿主/ }).click()
await page.waitForTimeout(200)
await page.waitForTimeout(200)
const filtered = await rows().count()
say(hash().includes('kind=hdf'), '筛选写进 URL', hash())
say(filtered > 0 && filtered < 160, `筛选生效（${filtered} 行，全集 164）`)

/* 列表行 → 抽屉；要整页从抽屉右上角走 */
await openRow()
say(hash().includes('detail=services/'), '点行浮出详情抽屉', hash())
await page.locator('aside.drawer a.expand').click()
await page.waitForURL(/#\/e\/services\//, { timeout: 5000 }).catch(() => {})
say(hash().startsWith('/e/services/'), '抽屉「在新页面打开」进整页', hash())

await page.goBack()
await page.waitForTimeout(400)
say(await rows().count() === filtered, '后退后筛选仍在', `${await rows().count()} 行`)

/* 筛选是 replace 不是 push：连点三次历史深度不许涨，
   否则想退回上一个页面得按四次 */
await go('/runtime/services')
const h0 = await page.evaluate(() => history.length)
for (const n of [/SA 宿主/, /驱动宿主/, /守护进程/]) {
  await page.getByRole('tab', { name: n }).click(); await page.waitForTimeout(150)
}
const h1 = await page.evaluate(() => history.length)
say(h1 === h0, '筛选用 replace，不堆历史', `history.length ${h0} → ${h1}`)

/* ---------------------------------------------- L2：滚动位置 */
console.log('\n— 滚动位置 —')
/* 列表视图的滚动容器是 el-table 的 body-wrapper，不是页面本身 */
await go('/parts/components')
const SCROLLER = '.el-table__body-wrapper .el-scrollbar__wrap'
await page.locator(SCROLLER).evaluate(el => { el.scrollTop = 900 })
await page.waitForTimeout(250)
const before = await page.locator(SCROLLER).evaluate(el => el.scrollTop)
/* 必须点此刻就在视野里的行：playwright 会为了点击把列表自动滚回顶部，
   点第一行等于自己把滚动位置清零，测了个寂寞 */
const visible = await page.evaluate(() => {
  const box = document.querySelector('.el-table__body-wrapper').getBoundingClientRect()
  return [...document.querySelectorAll('.el-table__row')].findIndex(r => {
    const b = r.getBoundingClientRect()
    return b.top > box.top + 80 && b.bottom < box.bottom
  })
})
await page.locator('.el-table__row').nth(visible).locator('button.link').first().click()
await page.waitForTimeout(400)
await page.goBack()
await page.waitForTimeout(800)
const after = await page.locator(SCROLLER).evaluate(el => el.scrollTop)
say(before > 0 && Math.abs(after - before) < 60, '返回后滚动位置恢复', `${before} → ${after}`)

/* ---------------------------------------------- L3：叶子开抽屉，不离开列表 */
console.log('\n— 叶子抽屉 —')
await go('/image')
/* .tree 限定不能省：顶栏里"打开本地 .db 文件"那个 label 也叫 .file，
   而且是隐藏的，不限定就会卡在一个永远点不到的元素上 */
const rowsBefore = await page.locator('.tree .dir, .tree .file').count()
await page.locator('.tree .file').first().click()
await page.waitForTimeout(400)
say(await page.locator('aside.drawer').isVisible(), '点文件浮出抽屉')
say(hash().includes('detail=install_targets'), '抽屉状态进 URL', hash())
say(await page.locator('.tree .dir, .tree .file').count() === rowsBefore, '列表与展开状态原封不动')
say(hash().startsWith('/files/image'), '没有离开镜像视图')
say(await page.locator('.tree .file.on').count() === 1, '树里点亮了正在看的那个文件')

/* 连着点第二个：抽屉换内容，高亮跟着走，列表仍然不动 */
await page.locator('.tree .file').nth(3).click()
await page.waitForTimeout(350)
say(await page.locator('aside.drawer').isVisible() &&
    await page.locator('.tree .file').nth(3).evaluate(e => e.classList.contains('on')),
    '连点下一个文件：抽屉换内容、高亮跟随')

await page.keyboard.press('Escape')
await page.waitForTimeout(300)
say(!(await page.locator('aside.drawer').isVisible()), 'Esc 关闭抽屉')
say(!hash().includes('detail='), '关闭后 URL 清掉 detail')

await page.locator('.tree .file').first().click()
await page.waitForTimeout(350)
await page.goBack()
await page.waitForTimeout(350)
say(!(await page.locator('aside.drawer').isVisible()), '后退键也能关掉抽屉')

/* 详情只有一种形态：枢纽也走抽屉，不再按叶子/枢纽分流 */
await go('/parts/components')
await openRow()
say(hash().includes('detail=components/'), '枢纽实体同样走抽屉（不再分流）', hash())
say(await page.locator('aside.drawer').isVisible(), '抽屉可见')
/* 抽屉里点关联实体，仍然留在抽屉里换内容 */
const rel = page.locator('aside.drawer .line button.link').first()
if (await rel.count()) {
  await rel.click(); await page.waitForTimeout(450)
  say(await page.locator('aside.drawer').isVisible() && !hash().startsWith('/e/'),
      '抽屉内跳关联实体仍留在抽屉', hash())
}

/* ---------------------------------------------- 质量页：解释 + 抽屉 */
console.log('\n— 质量页 —')
await go('/findings')
const firstRow = page.locator('.row').first()
say((await firstRow.innerText()).includes('驱动的 so 在镜像里找不到'), '问题码旁边有人话标题')
const listTop = await page.locator('.findings').evaluate(el => el.scrollTop)
await firstRow.click()
await page.waitForTimeout(350)
say(await page.locator('aside.drawer').isVisible(), '点开走抽屉，不是展开在下方')
say(hash().includes('issue=hdi%2FLIBRARY_UNMATCHED') || hash().includes('issue=hdi/LIBRARY_UNMATCHED'),
    '展开状态进 URL', hash())
const dt = await page.locator('aside.drawer .why dt').allInnerTexts()
say(dt.join('/') === '这是什么/为什么要管/怎么处理', '解释三段齐全', dt.join(' · '))
say(await page.locator('.findings').evaluate(el => el.scrollTop) === listTop, '列表没有被顶走')
say(await page.locator('.row.on').count() === 1, '当前这条高亮')

/* details 里的具体信息要落到实例上，否则看完解释还是不知道是哪一个 */
await go('/findings?issue=components%2FCOMPONENT_DEP_UNRESOLVED')
say((await page.locator('aside.drawer .items li').first().innerText()).includes('unresolved='),
    '实例带出 details 的具体字段')
say(await page.locator('aside.drawer .parts li').count() <= 13, '部件 chip 收了口，实例不会被挤出屏幕')
await page.keyboard.press('Escape')
await page.waitForTimeout(300)
say(!(await page.locator('aside.drawer').isVisible()) && !hash().includes('issue='), '质量页抽屉 Esc 可关')

/* ---------------------------------------------- L1：面包屑与来路 */
console.log('\n— 来路 —')
/* 自带前置：别依赖上一段恰好把我们留在档案页上，
   在中间插一段新检查就会把这种隐式依赖打断 */
await go('/parts/components')
await openRow()
await page.locator('aside.drawer a.expand').click()
await page.waitForURL(/#\/e\//, { timeout: 5000 }).catch(() => {})
say(await page.locator('.back button').isVisible(), '整页档案有「返回来源」按钮',
    `${hash()} · ${(await page.locator('.back button').innerText().catch(() => '—')).trim()}`)

/* 真·深链接要开一张全新的页：同一个文档里 goto 另一个 hash 仍然留着来路，
   那测的就不是"别人把链接贴给我"这个场景了 */
const fresh = await browser.newPage({ viewport: { width: 1440, height: 900 } })
await fresh.goto(`${base}/?db=knowledge.db#/e/install_targets/4210`)
await fresh.waitForFunction(() => document.querySelector('nav.trail, .empty'), null, { timeout: 20000 })
await fresh.waitForTimeout(300)
const trail = fresh.locator('nav.trail .crumb')
const n = await trail.count()
say(n >= 2, '深链接直开也有结构面包屑', `${n} 级：` + (await trail.allInnerTexts()).join(' › '))
say(!(await fresh.locator('.back button').isVisible()), '无来路时不显示返回按钮')
await trail.first().click()
await fresh.waitForTimeout(350)
const fhash = decodeURIComponent(fresh.url().split('#')[1] || '')
say(fhash.startsWith('/e/'), '面包屑可点', fhash)
await fresh.close()

/* ---------------------------------------------- L3：真返回 */
console.log('\n— 真返回 —')
/* 不能用 location.hash 制造导航：那是浏览器行为，不经 vue-router，
   history.state.back 是空的，goBackTo 会判定"没有来路"而改走 push——
   测试方法自己把被测对象破坏了。只用界面上真实存在的入口。 */

/* a) 从 SA 列表点宿主进程进运行单元：来路不是系统服务列表，
      ← 应当 push 一个干净地址，而不是把人退回 SA 列表 */
await go('/runtime/sa')
await page.locator('.el-table__row button.link').first().click()
await page.waitForURL(/#\/runtime\/unit\//, { timeout: 5000 }).catch(() => {})
say(hash().startsWith('/runtime/unit/'), '从 SA 列表可进运行单元', hash())
await page.locator('.crumb a').click()
await page.waitForTimeout(400)
say(hash().startsWith('/runtime/services'), '「← 系统服务」落到系统服务列表', hash())

/* b) 真返回：列表 → 抽屉 → 整页档案 → 「返回来源」，
      应当走 history.back，历史深度不增，且筛选还在 */
await go('/runtime/services?kind=hdf')
const n0 = await rows().count()
await openRow()
await page.locator('aside.drawer a.expand').click()
await page.waitForURL(/#\/e\/services\//, { timeout: 5000 }).catch(() => {})
const depth = await page.evaluate(() => history.state?.position ?? 0)
await page.locator('.back button').click()
await page.waitForTimeout(450)
const depth2 = await page.evaluate(() => history.state?.position ?? 0)
say(depth2 < depth, '「返回来源」走的是 history.back 而不是 push', `position ${depth} → ${depth2}`)
say(await rows().count() === n0, '返回后筛选仍在', `${await rows().count()} / ${n0} 行`)

/* ---------------------------------------------- 全局 ?scan= */
console.log('\n— 全局参数 —')
await go('/runtime/services?scan=1')
await page.locator('a.tab:has-text("部件信息")').click()
await page.waitForTimeout(400)
say(hash().includes('scan=1'), '?scan= 跨路由保持', hash())

/* ---------------------------------------------- 首页 */
console.log('\n— 首页 —')
await go('/')
const homeH = await page.evaluate(() => document.querySelector('.home')?.scrollHeight ?? 0)
say(homeH <= 900 * 1.2, '首页装得进一屏（原先 1316px）', `${homeH}px / 视口 900`)
say(await page.locator('.health').isVisible(), '扫描可信度在首屏，不在页脚')
say((await page.locator('.health .go').innerText()).includes('采集器'),
    '明说有几个采集器没读全', (await page.locator('.health .go').innerText()).trim())
say(await page.locator('.ask input').isVisible(), '反查输入框在首页有实体位置')

/* 每个方块的落点必须是它标注的那个视图。
   上一轮新增四个视图时，首页 7 个节点有 5 个落错了地方却没人发现——
   因为首页的入口和实际视图是两套各自维护的东西。这条断言就是为它加的。

   判据用"落地页的标题要和方块名对上"，不维护一张期望路由表：
   加一个视图（ELF 模块就是这么来的）不该让这条测试失效。 */
const names = (await page.locator('.node .nl').allInnerTexts()).map(t => t.trim())
say(names.length >= 7, `首页列出 ${names.length} 个入口`, names.join(' · '))
const wrong = []
for (let i = 0; i < names.length; i++) {
  await go('/')
  await page.locator('.node').nth(i).click()
  await page.waitForTimeout(400)
  const h1 = (await page.locator('h1').first().innerText().catch(() => '')).trim()
  if (!h1.startsWith(names[i])) wrong.push(`${names[i]}→「${h1.split('\n')[0]}」`)
}
say(wrong.length === 0, '每个方块都落在它标注的视图上',
    wrong.join(' ') || `${names.length}/${names.length}`)

/* ---------------------------------------------- 两级菜单 */
console.log('\n— 两级菜单 —')
await go('/runtime/sa')
say(await page.locator('a.tab.on:has-text("运行时进程")').count() === 1, '一级高亮在正确的组')
say(await page.locator('.subnav .sub.on:has-text("SA 服务")').count() === 1, '二级高亮在当前视图')
const subs = (await page.locator('.subnav .sub').allInnerTexts()).map(t => t.replace(/\s+/g, ' ').trim())
say(subs.length === 3 && subs[0].includes('164') && subs[1].includes('165'),
    '子导航常驻显示同组全部子项与条数', subs.join(' | '))

/* 一级点击要一步到位，不是先展开再选 */
await page.locator('a.tab:has-text("系统文件")').click()
await page.waitForTimeout(400)
say(hash().startsWith('/files/'), '点一级直达该组第一个子项（一次点击）', hash())
say(!(await page.locator('.subnav').isVisible().catch(() => false)) === false, '该组有子导航条')

await go('/')
say(await page.locator('.subnav').count() === 0, '首页不显示子导航条')

/* 旧地址要还能打开，否则别人存的链接全废 */
for (const [old, now] of [['/runtime', '/runtime/services'], ['/build', '/parts/repos'],
                          ['/image', '/files/image']]) {
  await go(old)
  say(hash().split('?')[0] === now, `旧地址 ${old} 重定向到 ${now}`, hash())
}

console.log(errors.length ? `\n控制台报错 ${errors.length} 条：\n  ${errors.slice(0, 5).join('\n  ')}` : '\n控制台无报错')
if (errors.length) bad++

await browser.close()
console.log(bad ? `\n${bad} 项不通过` : '\n全部通过')
process.exit(bad ? 1 : 0)
