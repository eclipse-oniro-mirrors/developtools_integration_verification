/* 回归：下拉菜单必须能真的用鼠标移进去点到。
   曾经的 bug —— 菜单与按钮之间 4px 间隙在容器盒子之外，
   mouseleave 在指针进入间隙时触发，菜单当场消失。 */
import { BASE_URL as base, launchBrowser } from './browser.mjs'
const browser = await launchBrowser()
const page = await browser.newPage({ viewport: { width: 1440, height: 900 } })
let bad = 0
const say = (ok, name, extra = '') => { if (!ok) bad++; console.log(`${ok ? '✓' : '✗'} ${name} ${extra}`) }

await page.goto(`${base}/?db=knowledge.db#/runtime/services`)
await page.waitForFunction(() => document.querySelector('main')?.innerText.trim().length > 10,
                           null, { timeout: 20000 })

for (const [label, button, item] of [
  ['数据调测菜单', 'button:has-text("数据")', '.menu-item:has-text("components")'],
  ['数据库菜单',   'button.db',               '.file'],
]) {
  await page.locator(button).click()
  const menu = page.locator('.menu:visible').first()
  await menu.waitFor({ state: 'visible', timeout: 2000 })

  // 真·鼠标移动：从按钮中心一路移到菜单项，中途必经那 4px 间隙
  const b = await page.locator(button).boundingBox()
  const m = await menu.locator(item).first().boundingBox()
  await page.mouse.move(b.x + b.width / 2, b.y + b.height / 2)
  for (let i = 1; i <= 8; i++) {
    await page.mouse.move(b.x + b.width / 2 + (m.x + 20 - b.x - b.width / 2) * i / 8,
                          b.y + b.height / 2 + (m.y + m.height / 2 - b.y - b.height / 2) * i / 8)
    await page.waitForTimeout(20)
  }
  say(await menu.isVisible(), `${label}：鼠标移入后仍可见`)

  // 点击外部要能关
  await page.mouse.click(700, 500)
  await page.waitForTimeout(100)
  say(!(await menu.isVisible()), `${label}：点击外部关闭`)

  // Esc 也要能关
  await page.locator(button).click()
  await menu.waitFor({ state: 'visible', timeout: 2000 })
  await page.keyboard.press('Escape')
  await page.waitForTimeout(100)
  say(!(await menu.isVisible()), `${label}：Esc 关闭`)
}

// 菜单项真的能点到并导航
await page.locator('button:has-text("数据")').click()
await page.locator('.menu-item:has-text("services")').click()
await page.waitForTimeout(300)
say(page.url().includes('/data/services'), '菜单项可点击并跳转', page.url().split('#')[1] || '')

await browser.close()
console.log(bad ? `\n${bad} 项不通过` : '\n全部通过')
process.exit(bad ? 1 : 0)
