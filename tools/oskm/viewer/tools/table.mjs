/* 回归：运行视图表格。

   重点在三件构建期测不出、肉眼也容易放过的事：
     1. 三态排序——未声明的必须恒定排末尾，升序降序都一样。
        （交给 el-table 的 sort-method 就会在降序时把一百多行空白翻到最前面）
     2. 导出的内容必须等于屏幕上看到的：当前筛选 × 当前可见列 × 当前排序。
     3. 0 与"未声明"在界面上必须分得出来。 */
import { BASE_URL as base, launchBrowser } from './browser.mjs'
const browser = await launchBrowser()
const ctx = await browser.newContext({ viewport: { width: 1600, height: 900 }, acceptDownloads: true })
const page = await ctx.newPage()
let bad = 0
const say = (ok, name, extra = '') => { if (!ok) bad++; console.log(`${ok ? '✓' : '✗'} ${name}${extra ? '  ' + extra : ''}`) }
const hash = () => decodeURIComponent(page.url().split('#')[1] || '')
const errors = []
page.on('console', m => { if (m.type() === 'error') errors.push(m.text()) })
page.on('pageerror', e => errors.push(String(e)))

async function go(h) {
  await page.goto(`${base}/?db=knowledge.db#${h}`)
  await page.waitForFunction(() => document.querySelectorAll('.el-table__row').length > 0,
                             null, { timeout: 20000 })
  await page.waitForTimeout(300)
}
const colIndex = async label => (await page.locator('.el-table__header th').allInnerTexts())
  .findIndex(t => t.trim().startsWith(label))
const column = async label => {
  const i = await colIndex(label)
  return page.locator(`.el-table__body tr td:nth-child(${i + 1})`).allInnerTexts()
    .then(a => a.map(s => s.trim()))
}

/* 六个列表视图跑同一组通用断言：有行、有人话列名、能排序、分页存在。
   这是抽出 EntityTable 的回报——一处断言覆盖六个视图。 */
console.log('— 六个列表视图通用 —')
for (const [path, title] of [
  ['/runtime/services', '系统服务'], ['/runtime/sa', 'SA 服务'], ['/runtime/hdi', 'HDI 服务'],
  ['/parts/components', '部件'], ['/parts/repos', '代码仓'],
  ['/files/targets', '安装目标'], ['/files/elf', 'ELF 模块'],
]) {
  await go(path)
  const n = await page.locator('.el-table__row').count()
  const heads = (await page.locator('.el-table__header th').allInnerTexts()).map(s => s.trim()).filter(Boolean)
  const ok = n > 0 && heads.length >= 4 && !heads.some(h => /^[a-z_]+ⓘ?$/.test(h.replace(/\s/g, '')))
  say(ok, `${title}：有数据且列名是人话`, `${n} 行 · ${heads.length} 列`)
  say(await page.locator('.pager .el-pagination').isVisible(), `${title}：有分页条`)
  say((await page.locator('.el-table__header th button.info').count()) >= 4,
      `${title}：每列都有 ⓘ 字段说明`)
}

console.log('\n— 基本 —')
await go('/runtime/services')
/* 默认分页 100 条。5804 行一次铺完要 33 秒，所以分页是有意的，
   不是遗漏——这条断言跟着改，而不是把分页去掉。 */
say(await page.locator('.el-table__row').count() === 100, '默认每页 100 行')
say((await page.locator('.count').innerText()).includes('164'), '行数统计仍是全集 164')
const heads = (await page.locator('.el-table__header th').allInnerTexts()).map(s => s.trim()).filter(Boolean)
say(heads.some(h => h.startsWith('进程名')) && heads.some(h => h.startsWith('运行用户')),
    '列名是人话不是字段名', heads.slice(0, 4).join(' / '))

console.log('\n— 排序 —')
await page.locator('.el-table__header th', { hasText: '运行用户' }).click()
await page.waitForTimeout(300)
say(hash().includes('sort=uid'), '排序进 URL', hash())
let uids = (await column('运行用户')).filter(v => v !== '—')
say(uids.join() === [...uids].sort((a, b) => a.localeCompare(b)).join(),
    'uid 按名字排（不是按数值）', uids.slice(0, 3).join(' < '))

/* 三态列：未声明必须恒定在末尾。
   必须挑一个有多种取值的列——「沙箱」的有值行全是 0，升降序看起来一模一样，
   用它测等于没测（这个假阳性已经骗过一次）。「按需启动」有 是/否 两种。 */
await go('/runtime/services?hide=-')               // 全部列显示出来
const seen = []
for (const dir of ['升序', '降序']) {
  await page.locator('.el-table__header th', { hasText: '按需启动' }).click()
  await page.waitForTimeout(350)
  const col = await column('按需启动')
  const firstBlank = col.indexOf('未声明')
  const lastValue = col.map((v, i) => (v !== '未声明' ? i : -1)).reduce((a, b) => Math.max(a, b), -1)
  say(firstBlank === -1 || firstBlank > lastValue,
      `三态排序：未声明恒在末尾（${dir}）`, `首个未声明 @${firstBlank}，最后一个有值 @${lastValue}`)
  seen.push(col.filter(v => v !== '未声明').join())
}
say(seen[0] !== seen[1], '升序与降序确实不同（证明方向真的生效）',
    `${seen[0].slice(0, 12)}… vs ${seen[1].slice(0, 12)}…`)

const sandbox = await column('沙箱')
say(sandbox.includes('否') && sandbox.includes('未声明'),
    '0 与「未声明」分得出来', `否 ${sandbox.filter(v => v === '否').length} · 未声明 ${sandbox.filter(v => v === '未声明').length}`)

console.log('\n— 筛选与搜索 —')
await go('/runtime/services')
await page.locator('.warnlink').click()
await page.waitForTimeout(300)
say(hash().includes('mixed=1'), '「13 个混装」可点成筛选', hash())
say(await page.locator('.el-table__row').count() === 13, '筛出 13 行')
await go('/runtime/services?q=hdf_devhost')
say(await page.locator('.el-table__row').count() > 0 &&
    await page.locator('.el-table__row').count() < 164, '搜索命中可见列的内容',
    `${await page.locator('.el-table__row').count()} 行`)

console.log('\n— 列显隐 —')
await go('/runtime/services')
const before = await page.locator('.el-table__header th').count()
await page.locator('button:has-text("列 ")').click()
await page.waitForTimeout(250)
await page.locator('.el-checkbox:has-text("子系统")').click()
await page.waitForTimeout(350)
say(await page.locator('.el-table__header th').count() === before + 1, '勾上一列，表格多一列')
say(hash().includes('hide='), '列显隐进 URL', hash().slice(0, 60))

console.log('\n— 字段说明 —')
await page.keyboard.press('Escape')
await page.locator('.el-table__header th button.info').first().click()
await page.waitForTimeout(350)
const help = await page.locator('.el-popover:visible').innerText()
say(/含义/.test(help) && /在 oskm 里怎么来的/.test(help) && /本次扫描的分布/.test(help),
    '说明三段齐全（含义 / 来源 / 分布）',
    help.split('\n').filter(l => l.trim()).slice(1, 2).join(''))
say(/\d+ \/ 164 行有值/.test(help), '分布是实时算的，不是写死的',
    (help.match(/\d+ \/ 164 行有值[^\n]*/) || [''])[0])

console.log('\n— 行详情走抽屉 —')
await go('/runtime/services')
say(await page.locator('.el-table__expand-icon').count() === 0, '表格里没有行展开了')
await page.locator('.el-table__row').nth(2).click()
await page.waitForTimeout(450)
say(await page.locator('aside.drawer').isVisible(), '点任意一行浮出抽屉')
say(hash().includes('detail=services/'), '抽屉状态进 URL', hash())
say(await page.locator('.el-table__row.is-open').count() === 1, '当前行高亮')
say(await page.locator('.el-table__row').count() === 100, '列表没有被换掉')

/* 点另一行要换内容，不是先关再开 */
await page.locator('.el-table__row').nth(6).click()
await page.waitForTimeout(450)
say(await page.locator('aside.drawer').isVisible() &&
    await page.locator('.el-table__row.is-open').count() === 1,
    '点下一行：抽屉换内容而不是关掉')

/* 失焦自动关 */
await page.mouse.click(300, 125)
await page.waitForTimeout(400)
say(!(await page.locator('aside.drawer').isVisible()), '点抽屉外面自动关闭')
say(!hash().includes('detail='), '关闭后 URL 清掉 detail')

/* 抽屉内部的弹层不能把抽屉点没了 */
await page.locator('.el-table__row').nth(1).click()
await page.waitForTimeout(400)
const rec = page.locator('aside.drawer .h2btn')
if (await rec.count()) {
  await rec.first().click(); await page.waitForTimeout(300)
  say(await page.locator('aside.drawer').isVisible(), '点抽屉内部不会误关')
}

console.log('\n— 抽屉详情的内容 —')
await go('/runtime/services?detail=services/51')
await page.locator('aside.drawer').waitFor({ state: 'visible', timeout: 10000 })
await page.waitForTimeout(400)
const secs = await page.locator('aside.drawer .fs .t').allInnerTexts()
say(secs.join('/') === '属性/其它声明/关联/原始声明 record', '四个区块齐全', secs.join(' · '))

/* 属性是两列表格，不是上下堆叠 */
/* 跳过分组表头行（.gh 只有一个跨列 th，没有 td） */
const firstData = page.locator('aside.drawer .ft tr:not(.gh)').first()
say(await firstData.locator('th').count() === 1 && await firstData.locator('td').count() === 1,
    '属性是两列表格')
say((await page.locator('aside.drawer .ft th').allInnerTexts()).some(t => t.includes('启动配置')),
    '字段名用人话，不是库里的列名')
say(await page.locator('aside.drawer .ft th button.info').count() >= 5, '字段名旁有 ⓘ 说明')

/* 未声明的字段也要能看到——"没声明"本身是事实 */
/* 限定到属性区：关联区现在也有一个"还有 N 条" */
const more = page.locator('aside.drawer .a-props .more')
say((await more.innerText()).includes('未声明'), '提示还有未声明的字段', (await more.innerText()).trim())
const nBefore = await page.locator('aside.drawer .a-props .ft tr').count()
await more.click(); await page.waitForTimeout(250)
say(await page.locator('aside.drawer .a-props .ft tr').count() > nBefore,
    '展开后能看到未声明的字段')

/* record 里没成列的键要露出来——services 有 21 个只在 record 里 */
const extras = await page.locator('aside.drawer .a-extras .ft tr:not(.gh) th').allInnerTexts()
say(extras.some(t => t.trim() === 'caps') && extras.some(t => t.trim() === 'permission'),
    'record 里未成列的字段也列了出来', `${extras.length} 个：` + extras.slice(0, 4).map(t => t.trim()).join(' '))

/* 折叠要能收起，并且记得住 */
await page.locator('aside.drawer .fs .head').first().click()
await page.waitForTimeout(250)
say(!(await page.locator('aside.drawer .ft').first().isVisible()), '区块可折叠')
await go('/runtime/services?detail=services/85')
await page.locator('aside.drawer').waitFor({ state: 'visible', timeout: 10000 })
await page.waitForTimeout(400)
say(!(await page.locator('aside.drawer .ft').first().isVisible()), '折叠状态记得住（换实体也保持）')
await page.locator('aside.drawer .fs .head').first().click()
await page.waitForTimeout(200)

console.log('\n— GN label 源码链接 —')
await go('/files/targets')
const src = page.locator('.el-table__row a.src').first()
say(await src.count() > 0, 'label 旁有去源码的 ↗')
const href = await src.getAttribute('href')
say(/^https:\/\/[^/]+\/.+\/tree\/[0-9a-f]{7,}\/.*BUILD\.gn$/.test(href || ''),
    'URL 由仓地址 + 扫描时的提交 + 相对路径拼成', href)
const title = await src.getAttribute('title') || ''
say(title.includes('.gni'), '提示里说明了"目标也可能不在这个 BUILD.gn 里"')

/* 超量内容的 ⤢ 必须是**追加**，不能替换掉单元格本身的链接。
   曾经写成第一个分支，66% 的 label（超过 64 字符的那些）连同链接和 ↗ 一起没了。 */
/* 定向筛出 label 超长的那批，而不是指望第一页碰巧有：
   收录 symlink_file 之后第一页的内容变了，按 dest 升序排在前面的那些 label 都不长。 */
await go('/files/targets?q=innerkits')
/* 按表头找列，不要写死 nth-child——加一列就会错位（size/link_target 上线时就错了） */
const labIdx = (await page.locator('.el-table__header th').allInnerTexts())
  .findIndex(t => t.trim().startsWith('安装模块'))
const labCells = page.locator(`.el-table__body tr td:nth-child(${labIdx + 1})`)
const nRows = await page.locator('.el-table__row').count()
say(await labCells.locator('button.link').count() === nRows, '每一行的安装模块都可点开详情',
    `${await labCells.locator('button.link').count()} / ${nRows}`)
say(await labCells.locator('a.src').count() === nRows, '每一行的安装模块都有去源码的 ↗')
/* 本质断言：有 ⤢ 的格子**同时**要有链接。按比例断言不行——
   首页按 dest 升序排的是 ramdisk 那批、label 普遍较短，不代表全集的 66%。 */
const nX = await labCells.locator('button.xpand').count()
const bothOK = await page.evaluate(i => [...document.querySelectorAll(`.el-table__body tr td:nth-child(${i})`)]
  .filter(td => td.querySelector('button.xpand'))
  .every(td => td.querySelector('button.link') && td.querySelector('a.src')), labIdx + 1)
say(nX > 0 && bothOK, '超长的格子里 ⤢ 与链接、↗ 并存（追加而非替换）',
    `${nX} / ${nRows} 行超长，全部保有链接`)

console.log('\n— 文件大小与软链接 —')
await go('/files/targets?sort=size&dir=desc')
const sizeIdx = (await page.locator('.el-table__header th').allInnerTexts())
  .findIndex(t => t.trim().startsWith('大小'))
say(sizeIdx >= 0, '安装目标有「大小」列')
const topSizes = await page.locator(`.el-table__body tr td:nth-child(${sizeIdx + 1})`)
  .allInnerTexts().then(a => a.map(t => t.trim()))
say(/MB|KB|B$/.test(topSizes[0]) && !/^\d{5,}$/.test(topSizes[0]),
    '大小按人看的单位显示', topSizes.slice(0, 3).join(' · '))

/* 排序必须按字节数，不能按显示出来的字符串——"9 B" 不该排在 "141.1 MB" 前面 */
const toBytes = t => {
  const m = /^([\d.]+)\s*(B|KB|MB|GB)$/.exec(t)
  if (!m) return null
  return +m[1] * { B: 1, KB: 1024, MB: 1024 ** 2, GB: 1024 ** 3 }[m[2]]
}
const nums = topSizes.map(toBytes).filter(v => v !== null)
say(nums.every((v, i) => i === 0 || nums[i - 1] >= v), '按字节数排序，不是按显示的字符串',
    `首位 ${topSizes[0]}`)

/* symlink_file 收录进来之后：软链接是 install_targets 里的一等条目 */
await go('/files/targets')
const typeIdx = (await page.locator('.el-table__header th').allInnerTexts())
  .findIndex(t => t.trim().startsWith('类型'))
say(typeIdx >= 0, '安装目标有「类型」列（文件 / 软链接 / 整目录）')
await go('/files/targets?q=platformsdk/libcjson')
const first = (await page.locator('.el-table__row').first().innerText()).replace(/\s+/g, ' ')
say(first.includes('软链接'), '以前查不到的 symlink_file 路径现在能查到并标为软链接',
    first.slice(0, 90))
say(first.includes('cJSON'), '而且归属到了正确的部件')

/* 软链接记的是链接自身的字节，不是它指向的那个文件的 */
await go('/files/targets?q=etsstdlib.abc&hide=-')
const row = page.locator('.el-table__row').first()
const cells = (await row.locator('td').allInnerTexts()).map(t => t.trim())
say(cells.some(t => t === '34 B'), '软链接记的是自身大小（34 B），不是目标的 1.9 MB',
    cells.filter(Boolean).slice(0, 6).join(' | '))
say(cells.some(t => t.startsWith('system/framework/')), '软链接指向作为一列列出')

console.log('\n— 部件档案的三项优化 —')
await page.goto(`${base}/?db=knowledge.db#/e/components/204`)
await page.locator('.dossier').waitFor({ state: 'visible', timeout: 20000 })
await page.waitForTimeout(500)

/* 甲：属性按列目录的分组分段，不再按 PRAGMA 物理列序平铺 */
const segs = (await page.locator('.a-props tr.gh th').allInnerTexts()).map(t => t.trim())
/* 不写死段数：components 去掉 features/syscap 两列之后"产出"段就空了
   （它们移到"其它声明"）。要验的是分段这件事本身，以及顺序跟着列目录。 */
say(segs.length >= 2 && segs[0] === '身份', '属性区按列目录分段', segs.join(' | '))
const extraLabels = (await page.locator('.a-extras tr:not(.gh) th').allInnerTexts())
  .map(t => t.trim().replace('ⓘ', ''))
say(extraLabels.includes('feature 声明') && extraLabels.includes('syscap 声明'),
    'features/syscap 已不是列，落到"其它声明"且仍有人话名', extraLabels.join(' · '))
const labels = await page.locator('.a-props tr:not(.gh) th').allInnerTexts()
/* 要匹配**裸列名**，不能用前缀——"syscap 声明"也会被 /^syscap/ 命中 */
const bare = new Set(['deps', 'syscap', 'features'])
say(!labels.some(t => bare.has(t.trim().replace('ⓘ', ''))),
    '原始列也有人话名（deps / syscap / features 不再裸奔）',
    labels.map(t => t.trim().replace('ⓘ', '')).join(' · '))

/* 乙：反向关联默认露前几条，不是只给一个折叠计数 */
const relItems = await page.locator('.a-rel .items li').count()
say(relItems >= 6, '反向关联默认就露出条目，不用先点开', `${relItems} 条可见`)
say((await page.locator('.a-rel .more').first().innerText()).includes('还有'),
    '超出的部分给"还有 N 条"', (await page.locator('.a-rel .more').first().innerText()).trim())

/* 丙：纯自述计数的镜头不显示——部件的三镜头和关联区说的是同一批数字 */
say(await page.locator('.a-lens li').count() === 0,
    '部件不再显示自述型三镜头（与关联区重复）')
/* 档案页没有表格，不能用等 .el-table__row 的 go() */
await page.goto(`${base}/?db=knowledge.db#/e/sas/1`)
await page.locator('.dossier').waitFor({ state: 'visible', timeout: 20000 })
await page.waitForTimeout(400)
say(await page.locator('.a-lens li').count() > 0,
    'SA 仍保留三镜头——它指向的是别的实体，不是自述',
    (await page.locator('.a-lens').innerText()).replace(/\n+/g, ' | ').slice(0, 70))

console.log('\n— 整页档案的布局 —')
await page.setViewportSize({ width: 1760, height: 900 })
await page.goto(`${base}/?db=knowledge.db#/e/components/204`)
await page.locator('.dossier').waitFor({ state: 'visible', timeout: 20000 })
await page.waitForTimeout(400)
const lay = await page.evaluate(() => {
  const pg = document.querySelector('.page').getBoundingClientRect()
  const a = document.querySelector('.a-props')?.getBoundingClientRect()
  const b2 = document.querySelector('.a-rel')?.getBoundingClientRect()
  return { w: Math.round(pg.width), vw: innerWidth, twoCol: !!(a && b2 && Math.abs(a.top - b2.top) < 40) }
})
say(lay.w > lay.vw * 0.9, '整页不再掐宽度（原先封顶 940px）', `${lay.w} / ${lay.vw}px`)
say(lay.twoCol, '宽屏下分两栏：属性在左、关联在右')
await page.setViewportSize({ width: 1000, height: 900 })
await page.waitForTimeout(500)
say(!(await page.evaluate(() => {
  const a = document.querySelector('.a-props')?.getBoundingClientRect()
  const b2 = document.querySelector('.a-rel')?.getBoundingClientRect()
  return a && b2 && Math.abs(a.top - b2.top) < 40
})), '窄屏自动回到单栏')
await page.setViewportSize({ width: 1440, height: 900 })

console.log('\n— 导出 —')
await go('/runtime/services?kind=hdf')
const rows = await page.locator('.el-table__row').count()
const cols = (await page.locator('.el-table__header th').allInnerTexts()).map(s => s.trim()).filter(Boolean)
await page.locator('button:has-text("导出")').click()
await page.waitForTimeout(250)
const [dl] = await Promise.all([
  page.waitForEvent('download'),
  page.locator('.el-dropdown-menu__item:has-text("CSV")').click(),
])
const text = await (await import('fs')).promises.readFile(await dl.path(), 'utf8')
const lines = text.replace(/^﻿/, '').trim().split('\r\n')
say(lines.length === rows + 1, '导出行数 = 当前筛选的行数', `${lines.length - 1} vs ${rows}`)
say(lines[0].split(',').length === cols.length, '导出列数 = 当前可见列数',
    `${lines[0].split(',').length} vs ${cols.length}`)
say(lines[0].includes('进程名') && lines[0].includes('运行用户'), '表头用人话列名')
say(/驱动宿主/.test(dl.suggestedFilename()) && /行/.test(dl.suggestedFilename()),
    '文件名带上筛选条件', dl.suggestedFilename())

console.log(errors.length ? `\n控制台报错 ${errors.length} 条：\n  ${errors.slice(0, 4).join('\n  ')}` : '\n控制台无报错')
if (errors.length) bad++
await browser.close()
console.log(bad ? `\n${bad} 项不通过` : '\n全部通过')
process.exit(bad ? 1 : 0)
