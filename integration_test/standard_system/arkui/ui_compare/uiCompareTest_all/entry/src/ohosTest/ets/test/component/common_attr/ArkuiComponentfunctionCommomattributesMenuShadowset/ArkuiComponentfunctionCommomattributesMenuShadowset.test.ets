/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, afterEach, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'

export default function arkuiComponentfunctionCommomattributesMenuShadowset() {
  describe('arkuiComponentfunctionCommomattributesMenuShadowset', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        done()
        return
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window.Cause :${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0190
     * @tc.name   : Verify that the shadow is displayed normally when bindMenu sets showInSubWindow to true in light mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0190', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0190')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击bindMenu设置showinSub为true
      let button_menu = await driver.waitForComponent(ON.id('button_menu_0190'), 500)
      await button_menu.click()
      await Utils.sleep(500)

      // 预期效果1：菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0190_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0200
     * @tc.name   : Verify that the shadow of the select dropdown menu is displayed normally in light mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0200', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0200')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击select组件，下拉出菜单
      let select_component = await driver.waitForComponent(ON.id('select_menu_0200'), 500)
      await select_component.click()
      await Utils.sleep(500)

      // 预期效果1：菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0200_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0210
     * @tc.name   : Verify that the shadow of the menu without arrows is displayed normally in light mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0210', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0210')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击bindmenu不带箭头
      let button_no_arrow = await driver.waitForComponent(ON.id('button_no_arrow_0210'), 500)
      await button_no_arrow.click()
      await Utils.sleep(500)

      // 预期效果1：菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0210_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0220
     * @tc.name   : Verify that the shadow of the menu with arrows is displayed normally in light mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0220', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0220')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击bindMenu带箭头
      let button_with_arrow = await driver.waitForComponent(ON.id('button_with_arrow_0220'), 500)
      await button_with_arrow.click()
      await Utils.sleep(500)

      // 预期效果1：菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0220_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0230
     * @tc.name   : Verify that the shadow of the menu with preview image is displayed normally in light mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0230', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0230')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：长按带预览图的菜单
      let button_preview = await driver.waitForComponent(ON.id('button_preview_0230'), 500)
      await button_preview.longClick()
      await Utils.sleep(500)

      // 预期效果1：菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0230_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0240
     * @tc.name   : Verify that the shadow of the menu with subMenuExpandingMode set to embedded_expand is displayed normally in light mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0240', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0240')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：长按embedded_expand，点击倒数第二个菜单选项
      let button_embedded = await driver.waitForComponent(ON.id('button_embedded_0240'), 500)
      await button_embedded.longClick()
      await Utils.sleep(500)

      let menu_item_submenu = await driver.waitForComponent(ON.id('menu_item_submenu_0240'), 500)
      await menu_item_submenu.click()
      await Utils.sleep(500)

      // 预期效果1：子菜单和主菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0240_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0250
     * @tc.name   : Verify that the shadow of the menu with subMenuExpandingMode set to side_expand is displayed normally in light mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0250', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0250')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：长按side_expand，点击倒数第二个菜单选项
      let button_side = await driver.waitForComponent(ON.id('button_side_0250'), 500)
      await button_side.longClick()
      await Utils.sleep(500)

      let menu_item_submenu = await driver.waitForComponent(ON.id('menu_item_submenu_0250'), 500)
      await menu_item_submenu.click()
      await Utils.sleep(500)

      // 预期效果1：子菜单和主菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0250_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0260
     * @tc.name   : Verify that the shadow of the menu with subMenuExpandingMode set to stack_expand is displayed normally in light mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0260', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0260')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：长按stack_expand，点击倒数第二个菜单选项
      let button_stack = await driver.waitForComponent(ON.id('button_stack_0260'), 500)
      await button_stack.longClick()
      await Utils.sleep(500)

      let menu_item_submenu = await driver.waitForComponent(ON.id('menu_item_submenu_0260'), 500)
      await menu_item_submenu.click()
      await Utils.sleep(500)

      // 预期效果1：子菜单和主菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0260_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0270
     * @tc.name   : Verify that the shadow of the web menu opened by right-clicking the mouse is displayed normally in light mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0270', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0270')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：长按Web组件打开菜单
      let web_component = await driver.waitForComponent(ON.id('web_component_0270'), 500)
      await web_component.longClick()
      await Utils.sleep(1000)

      // 预期效果1：菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0270_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0280
     * @tc.name   : Verify that the shadow is displayed normally when bindMenu sets showInSubWindow to true in dark mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0280', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0280')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：切换到深色模式
      let button_dark_mode = await driver.waitForComponent(ON.id('button_dark_mode_0280'), 500)
      await button_dark_mode.click()
      await Utils.sleep(500)

      // 步骤3：点击bindMenu设置showinSub为true
      let button_menu = await driver.waitForComponent(ON.id('button_menu_0280'), 500)
      await button_menu.click()
      await Utils.sleep(500)

      // 预期效果1：菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0280_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0290
     * @tc.name   : Verify that the shadow of the select dropdown menu is displayed normally in dark mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0290', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0290')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：切换到深色模式
      let button_dark_mode = await driver.waitForComponent(ON.id('button_dark_mode_0290'), 500)
      await button_dark_mode.click()
      await Utils.sleep(500)

      // 步骤3：点击select组件，下拉出菜单
      let select_component = await driver.waitForComponent(ON.id('select_menu_0290'), 500)
      await select_component.click()
      await Utils.sleep(500)

      // 预期效果1：菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0290_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0300
     * @tc.name   : Verify that the shadow of the menu without arrows is displayed normally in dark mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0300', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0300')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：切换到深色模式
      let button_dark_mode = await driver.waitForComponent(ON.id('button_dark_mode_0300'), 500)
      await button_dark_mode.click()
      await Utils.sleep(500)

      // 步骤3：点击bindmenu不带箭头
      let button_no_arrow = await driver.waitForComponent(ON.id('button_no_arrow_0300'), 500)
      await button_no_arrow.click()
      await Utils.sleep(500)

      // 预期效果1：菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0300_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0310
     * @tc.name   : Verify that the shadow of the menu with arrows is displayed normally in dark mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0310', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0310')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：切换到深色模式
      let button_dark_mode = await driver.waitForComponent(ON.id('button_dark_mode_0310'), 500)
      await button_dark_mode.click()
      await Utils.sleep(500)

      // 步骤3：点击bindMenu带箭头
      let button_with_arrow = await driver.waitForComponent(ON.id('button_with_arrow_0310'), 500)
      await button_with_arrow.click()
      await Utils.sleep(500)

      // 预期效果1：菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0310_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0320
     * @tc.name   : Verify that the shadow of the menu with preview image is displayed normally in dark mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0320', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0320')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：切换到深色模式
      let button_dark_mode = await driver.waitForComponent(ON.id('button_dark_mode_0320'), 500)
      await button_dark_mode.click()
      await Utils.sleep(500)

      // 步骤3：长按带预览图的菜单
      let button_preview = await driver.waitForComponent(ON.id('button_preview_0320'), 500)
      await button_preview.longClick()
      await Utils.sleep(500)

      // 预期效果1：菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0320_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0330
     * @tc.name   : Verify that the shadow of the menu with subMenuExpandingMode set to embedded_expand is displayed normally in dark mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0330', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0330')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：切换到深色模式
      let button_dark_mode = await driver.waitForComponent(ON.id('button_dark_mode_0330'), 500)
      await button_dark_mode.click()
      await Utils.sleep(500)

      // 步骤3：长按embedded_expand，点击倒数第二个菜单选项
      let button_embedded = await driver.waitForComponent(ON.id('button_embedded_0330'), 500)
      await button_embedded.longClick()
      await Utils.sleep(500)

      let menu_item_submenu = await driver.waitForComponent(ON.id('menu_item_submenu_0330'), 500)
      await menu_item_submenu.click()
      await Utils.sleep(500)

      // 预期效果1：子菜单和主菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0330_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0340
     * @tc.name   : Verify that the shadow of the menu with subMenuExpandingMode set to side_expand is displayed normally in dark mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0340', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0340')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：切换到深色模式
      let button_dark_mode = await driver.waitForComponent(ON.id('button_dark_mode_0340'), 500)
      await button_dark_mode.click()
      await Utils.sleep(500)

      // 步骤3：长按side_expand，点击倒数第二个菜单选项
      let button_side = await driver.waitForComponent(ON.id('button_side_0340'), 500)
      await button_side.longClick()
      await Utils.sleep(500)

      let menu_item_submenu = await driver.waitForComponent(ON.id('menu_item_submenu_0340'), 500)
      await menu_item_submenu.click()
      await Utils.sleep(500)

      // 预期效果1：子菜单和主菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0340_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0350
     * @tc.name   : Verify that the shadow of the menu with subMenuExpandingMode set to stack_expand is displayed normally in dark mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0350', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0350')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：切换到深色模式
      let button_dark_mode = await driver.waitForComponent(ON.id('button_dark_mode_0350'), 500)
      await button_dark_mode.click()
      await Utils.sleep(500)

      // 步骤3：长按stack_expand，点击倒数第二个菜单选项
      let button_stack = await driver.waitForComponent(ON.id('button_stack_0350'), 500)
      await button_stack.longClick()
      await Utils.sleep(500)

      let menu_item_submenu = await driver.waitForComponent(ON.id('menu_item_submenu_0350'), 500)
      await menu_item_submenu.click()
      await Utils.sleep(500)

      // 预期效果1：子菜单和主菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0350_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0360
     * @tc.name   : Verify that the shadow of the web menu opened by right-clicking the mouse is displayed normally in dark mode on a straight-bar device
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0360', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/common_attr/ArkuiComponentfunctionCommomattributesMenuShadowset/ArkuiComponentfunctionCommomattributesMenuShadowset0360')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：切换到深色模式
      let button_dark_mode = await driver.waitForComponent(ON.id('button_dark_mode_0360'), 500)
      await button_dark_mode.click()
      await Utils.sleep(500)

      // 步骤3：长按Web组件打开菜单
      let web_component = await driver.waitForComponent(ON.id('web_component_0360'), 500)
      await web_component.longClick()
      await Utils.sleep(1000)

      // 预期效果1：菜单的阴影显示正常
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0360_01')
      await Utils.sleep(1000)

      done();
    })

  })
}