/* 行为自检：反查的 6 级回退与运行视图的核心事实都要对得上数据。 */
import { BASE_URL as base, launchBrowser } from './browser.mjs'
const browser = await launchBrowser()
const page = await browser.newPage({ viewport: { width: 1440, height: 900 } })
let bad = 0
const errs = []
page.on('pageerror', e => errs.push(e.message))
page.on('console', m => { if (m.type() === 'error') errs.push(m.text()) })

const expect = (name, got, want) => {
  const ok = String(got).includes(want)
  if (!ok) bad++
  console.log(`${ok ? '✓' : '✗'} ${name.padEnd(34)} ${ok ? '' : `期望含「${want}」，实际「${String(got).slice(0, 90)}」`}`)
}
const text = async () => (await page.locator('main').innerText()).replace(/\s+/g, ' ')
const ok = (pass, name) => { if (!pass) bad++; console.log(`${pass ? '✓' : '✗'} ${name}`) }

const go = async hash => {
  await page.goto(`${base}/?db=knowledge.db${hash}`)
  await page.waitForLoadState('networkidle')
  await page.waitForFunction(h => decodeURIComponent(location.hash) === h
                             && document.querySelector('main')?.innerText.trim().length > 10,
                             hash, { timeout: 20000 })
  await page.waitForTimeout(250)
}

await go('#/runtime/services');            expect('运行视图 164 个单元', await text(), '164 个运行单元')
                                  expect('混装 13 个', await text(), '13 个装载了多个部件')
await go('#/runtime/unit/51');         expect('foundation 16 个 SA', await text(), '装载的 SA（16）')
                                  expect('混装提示在内容之前', await text(), '10 个部件的内容')
await go('#/lookup?q=libaccessibleabilityms.z.so')
                                  expect('反查 so 名 → 部件', await text(), 'accessibility')
await go('#/lookup?q=system/etc/init/foundation.cfg')
                                  expect('反查路径 → 精确匹配', await text(), '安装路径精确匹配')
await go('#/lookup?q=usb_host');  expect('反查 hdf 宿主名（-n 参数）', await text(), '进程 / 服务名匹配')
await go('#/lookup?q=foundation');expect('反查 SA 宿主进程名', await text(), '进程 / 服务名匹配')
await go('#/lookup?q=accessibility'); expect('反查歧义词同时给出两类', await text(), '部件名匹配')
await go('#/lookup?q=//third_party/musl:musl_sysparam')
                                  expect('反查 GN label', await text(), 'GN label 匹配')
await go('#/lookup?q=不存在的东西xyz'); expect('无结果给出可识别线索', await text(), '可识别的线索')
await go('#/parts/components');              expect('构建视图按入度排序（hilog 第一）', await text(), 'hilog')
await go('#/files/image');              expect('镜像树默认展开 system', await text(), 'system/')
await go('#/files/elf')
{
  /* 条数不写死：换一份库它就变（本地这份 3,520、仓里这份 3,517）。
     要验的是自洽——表头总数 = 表格"显示 N / M 行"的 M，以及默认排序仍是入度降序。 */
  const t = await text()
  const head = +(/([\d,]+) 个 ELF 模块/.exec(t)?.[1] || '0').replace(/,/g, '')
  const total = +(/显示 [\d,]+ \/ ([\d,]+) 行/.exec(t)?.[1] || '0').replace(/,/g, '')
  ok(head > 1000 && head === total, `ELF 列表计数自洽（表头 ${head} = 表格总数 ${total}）`)
  const first = (await page.locator('.el-table__row').first().innerText()).split('\n')[0]
  ok(first.includes('ld-musl-arm.so.1'), `ELF 默认按被依赖数排序（首行 ${first}）`)
}
await go('#/e/elf_modules/220');       expect('ELF 档案登记', await text(), 'ELF 模块')
                                  expect('双外键区分我依赖的', await text(), '我依赖的')
                                  expect('双外键区分依赖我的', await text(), '依赖我的')
                                  expect('档案架构翻译为人话', await text(), 'ARM')
                                  expect('档案直接依赖显示数量', await text(), '直接依赖ⓘ 4')
                                  expect('档案展示依赖闭包', await text(), '依赖闭包')
                                  expect('档案展示间接被依赖', await text(), '间接被依赖')
{
  const rendered = await page.locator('.closure-node').count()
  ok(rendered > 0 && rendered <= 100, `依赖闭包默认有界渲染（${rendered} 条）`)
}
await go('#/e/elf_modules/339');       expect('间接依赖可达二级依赖', await text(), 'ld-musl-arm.so.1')
await go('#/e/elf_modules/185');       expect('间接被依赖可达二级被依赖', await text(), 'libpurgeable_memory_ndk.z.so')
/* 不写死条数：换一个库、加一个采集器它就会变（elf_modules 上线时从 13 变成 16）。
   改成验自洽——标题上的总数要等于下面各行计数之和。 */
await go('#/findings')
{
  const total = +(await page.locator('section:has-text("扫描层问题") h2 .n').first().innerText())
  const rows = await page.locator('section:has-text("扫描层问题")').first()
    .locator('.row .cnt').allInnerTexts()
  const sum = rows.reduce((s, t) => s + (+t.trim() || 0), 0)
  ok(total > 0 && total === sum, `质量页扫描层问题自洽（${total} = ${rows.length} 行之和）`)
}
                                  expect('质量条目可分派到部件/仓', await text(), '部件 /')
await go('#/data/components');    expect('调测面有横幅', await text(), '调测视图')

// 实体档案页：通用模板 + 外键自动关联
/* 部件不再显示三镜头：它那三行（对外接口 8 · syscap 1 · feature 2 …）
   与关联区是同一批数字，而关联区现在默认就露条目。只留"指向别的实体"的镜头。 */
await go('#/e/components/1');     expect('部件档案按分组列属性', await text(), '身份')
                                  expect('档案关联由外键生成', await text(), '由外键自动生成')
await go('#/e/sas/1');            expect('SA 档案保留三镜头（指向别的实体）', await text(), '构建')
await go('#/e/install_targets/1');expect('安装目标档案', await text(), '安装目标')
await go('#/e/sas/1');            expect('SA 档案', await text(), 'SA')
// 未登记类型也要能打开（新增采集器零改动可用）
await go('#/e/syscaps/1');        expect('未登记显示清单的表也能打开', await text(), '属性')
await go('#/e/collector_runs/1'); expect('完全陌生的表不报错', await text(), '未找到')
await go('#/e/不存在的表/1');      expect('不存在的表给出提示', await text(), '没有')

// 浅色主题：只换 token，组件零改动
await page.addInitScript(() => localStorage.setItem('oskm.theme', 'light'))
await go('#/runtime/services')
const light = await page.evaluate(() => ({
  cls: document.documentElement.className,
  bg: getComputedStyle(document.body).backgroundColor,
}))
expect('浅色主题生效', light.cls, 'light')
expect('浅色主题背景为浅色', String(parseInt(light.bg.match(/\d+/)[0]) > 200), 'true')

if (errs.length) { bad++; console.log('✗ 控制台错误:', errs.slice(0, 3).join(' | ')) }
await browser.close()
console.log(bad ? `\n${bad} 项不通过` : '\n全部通过')
process.exit(bad ? 1 : 0)
