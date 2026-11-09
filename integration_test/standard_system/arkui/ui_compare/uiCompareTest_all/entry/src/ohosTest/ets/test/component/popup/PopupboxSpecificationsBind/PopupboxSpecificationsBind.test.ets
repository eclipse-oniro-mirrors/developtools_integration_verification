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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, Component } from '@kit.TestKit';

export default function popupboxSpecificationsBind() {

  describe('popupboxSpecificationsBind', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0080
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0080 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0080')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0080 = await driver.waitForComponent(ON.id('button_bind_0080'), 500)
      let message_text_bind_0080 = await driver.waitForComponent(ON.id('message_text_bind_0080'), 500)
      let show_status_bind_0080 = await driver.waitForComponent(ON.id('show_status_bind_0080'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0080.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：长按按钮打开一级菜单，观察isShow变为true
      await button_bind_0080.longClick()
      await driver.waitForIdle(500,2000)

      // 步骤5：点击带二级菜单项，打开二级菜单，subMenuExpandingMode设置为side_expand
      let menuItem = await driver.waitForComponent(ON.text('带二级菜单项'), 1000)
      await menuItem.click()
      await driver.waitForIdle(500,2000)

      // 步骤6：点击二级菜单项关闭菜单，观察isShow变为false
      let subMenuItem = await driver.waitForComponent(ON.text('二级菜单项1'), 1000)
      await subMenuItem.click()
      await driver.waitForIdle(2000,3000)

      // 步骤7：验证最终状态
      await show_status_bind_0080.click()
      await driver.waitForIdle(2000,3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0080 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0090
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0090 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0090')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0090 = await driver.waitForComponent(ON.id('button_bind_0090'), 500)
      let message_text_bind_0090 = await driver.waitForComponent(ON.id('message_text_bind_0090'), 500)
      let show_status_bind_0090 = await driver.waitForComponent(ON.id('show_status_bind_0090'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0090.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：长按按钮打开一级菜单，观察isShow变为true
      await button_bind_0090.longClick()
      await driver.waitForIdle(500,2000)

      // 步骤5：点击带二级菜单项，打开二级菜单，subMenuExpandingMode设置为stack_expand
      let menuItem = await driver.waitForComponent(ON.text('带二级菜单项'), 1000)
      await menuItem.click()
      await driver.waitForIdle(500,2000)

      // 步骤6：点击二级菜单项关闭菜单，观察isShow变为false
      let subMenuItem = await driver.waitForComponent(ON.text('二级菜单项1'), 1000)
      await subMenuItem.click()
      await driver.waitForIdle(2000,3000)

      // 步骤7：验证最终状态
      await show_status_bind_0090.click()
      await driver.waitForIdle(2000,3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0100
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0100 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0100')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0100 = await driver.waitForComponent(ON.id('button_bind_0100'), 500)
      let message_text_bind_0100 = await driver.waitForComponent(ON.id('message_text_bind_0100'), 500)
      let show_status_bind_0100 = await driver.waitForComponent(ON.id('show_status_bind_0100'), 500)
      let simulate_background_bind_0100 = await driver.waitForComponent(ON.id('simulate_background_bind_0100'), 2000)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0100.click()
      await driver.waitForIdle(2000,3000)

      // 步骤4：长按按钮打开菜单，观察isShow变为true
      await button_bind_0100.longClick()
      await driver.waitForIdle(2000,3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0110
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0110 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0110')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0110 = await driver.waitForComponent(ON.id('button_bind_0110'), 500)
      let message_text_bind_0110 = await driver.waitForComponent(ON.id('message_text_bind_0110'), 500)
      let show_status_bind_0110 = await driver.waitForComponent(ON.id('show_status_bind_0110'), 500)
      let simulate_background_bind_0110 = await driver.waitForComponent(ON.id('simulate_background_bind_0110'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0110.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：点击按钮打开菜单，观察isShow变为true
      await button_bind_0110.click()
      await driver.waitForIdle(500,2000)

      // 步骤5：模拟切后台，观察菜单关闭，isShow变为false
      await simulate_background_bind_0110.click()
      await driver.waitForIdle(500,2000)

      // 步骤6：验证最终状态
      await show_status_bind_0110.click()
      await driver.waitForIdle(500,2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0120
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0120 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0120')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0120 = await driver.waitForComponent(ON.id('button_bind_0120'), 500)
      let message_text_bind_0120 = await driver.waitForComponent(ON.id('message_text_bind_0120'), 500)
      let show_status_bind_0120 = await driver.waitForComponent(ON.id('show_status_bind_0120'), 500)
      let simulate_background_bind_0120 = await driver.waitForComponent(ON.id('simulate_background_bind_0120'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0120.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：点击按钮弹出气泡，观察isShow变为true
      await button_bind_0120.click()
      await driver.waitForIdle(500,2000)

      // 步骤5：模拟切后台，观察气泡关闭，isShow变为false
      await simulate_background_bind_0120.click()
      await driver.waitForIdle(500,2000)

      // 步骤6：验证最终状态
      await show_status_bind_0120.click()
      await driver.waitForIdle(500,2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0130
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0130 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0130')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0130 = await driver.waitForComponent(ON.id('button_bind_0130'), 500)
      let message_text_bind_0130 = await driver.waitForComponent(ON.id('message_text_bind_0130'), 500)
      let show_status_bind_0130 = await driver.waitForComponent(ON.id('show_status_bind_0130'), 500)
      let simulate_swipe_bind_0130 = await driver.waitForComponent(ON.id('simulate_swipe_bind_0130'), 500)
      let swipe_area_bind_0130 = await driver.waitForComponent(ON.id('swipe_area_bind_0130'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0130.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：点击按钮打开菜单，观察isShow变为true
      await button_bind_0130.click()
      await driver.waitForIdle(500,2000)

      // 步骤5：模拟左滑关闭菜单，观察isShow变为false
      await simulate_swipe_bind_0130.click()
      await driver.waitForIdle(500,2000)

      // 步骤6：验证最终状态
      await show_status_bind_0130.click()
      await driver.waitForIdle(500,2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0130 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0140
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0140 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0140')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0140 = await driver.waitForComponent(ON.id('button_bind_0140'), 500)
      let message_text_bind_0140 = await driver.waitForComponent(ON.id('message_text_bind_0140'), 500)
      let show_status_bind_0140 = await driver.waitForComponent(ON.id('show_status_bind_0140'), 500)
      let simulate_screen_off_bind_0140 = await driver.waitForComponent(ON.id('simulate_screen_off_bind_0140'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0140.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：点击按钮弹出气泡，观察isShow变为true
      await button_bind_0140.click()
      await driver.waitForIdle(500,2000)

      // 步骤5：模拟息屏，观察先执行动效，后isShow变为false
      await simulate_screen_off_bind_0140.click()
      await driver.waitForIdle(500,2000)

      // 步骤6：验证最终状态
      await show_status_bind_0140.click()
      await driver.waitForIdle(500,2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0150
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0150 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0150')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0150 = await driver.waitForComponent(ON.id('button_bind_0150'), 500)
      let message_text_bind_0150 = await driver.waitForComponent(ON.id('message_text_bind_0150'), 500)
      let show_status_bind_0150 = await driver.waitForComponent(ON.id('show_status_bind_0150'), 500)
      let simulate_screen_off_bind_0150 = await driver.waitForComponent(ON.id('simulate_screen_off_bind_0150'), 2000)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0150.click()
      await driver.waitForIdle(2000,3000)

      // 步骤4：长按按钮打开菜单，观察isShow变为true
      await button_bind_0150.longClick()
      await driver.waitForIdle(2000,3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0150 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0160
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0160 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0160')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0160 = await driver.waitForComponent(ON.id('button_bind_0160'), 500)
      let message_text_bind_0160 = await driver.waitForComponent(ON.id('message_text_bind_0160'), 500)
      let show_status_bind_0160 = await driver.waitForComponent(ON.id('show_status_bind_0160'), 500)
      let simulate_screen_off_bind_0160 = await driver.waitForComponent(ON.id('simulate_screen_off_bind_0160'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0160.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：点击按钮打开菜单，观察isShow变为true
      await button_bind_0160.click()
      await driver.waitForIdle(500,2000)

      // 步骤5：模拟息屏，观察先执行动效，后isShow变为false
      await simulate_screen_off_bind_0160.click()
      await driver.waitForIdle(500,2000)

      // 步骤6：验证最终状态
      await show_status_bind_0160.click()
      await driver.waitForIdle(500,2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0160 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0170
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0170 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0170')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0170 = await driver.waitForComponent(ON.id('button_bind_0170'), 500)
      let message_text_bind_0170 = await driver.waitForComponent(ON.id('message_text_bind_0170'), 500)
      let show_status_bind_0170 = await driver.waitForComponent(ON.id('show_status_bind_0170'), 500)
      let interrupt_animation_bind_0170 = await driver.waitForComponent(ON.id('interrupt_animation_bind_0170'), 2000)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0170.click()
      await driver.waitForIdle(2000,3000)

      // 步骤4：长按按钮开始菜单弹出动效
      await button_bind_0170.longClick()
      await driver.waitForIdle(2000,3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0170 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0180
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0180 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0180')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0180 = await driver.waitForComponent(ON.id('button_bind_0180'), 500)
      let message_text_bind_0180 = await driver.waitForComponent(ON.id('message_text_bind_0180'), 500)
      let show_status_bind_0180 = await driver.waitForComponent(ON.id('show_status_bind_0180'), 500)
      let interrupt_animation_bind_0180 = await driver.waitForComponent(ON.id('interrupt_animation_bind_0180'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0180.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：点击按钮开始菜单弹出动效
      await button_bind_0180.click()
      await driver.waitForIdle(200,1000)

      // 步骤5：在动效过程中人为打断
      await interrupt_animation_bind_0180.click()
      await driver.waitForIdle(500,2000)

      // 步骤6：验证最终状态
      await show_status_bind_0180.click()
      await driver.waitForIdle(500,2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0180 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0190
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0190 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0190')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0190 = await driver.waitForComponent(ON.id('button_bind_0190'), 500)
      let message_text_bind_0190 = await driver.waitForComponent(ON.id('message_text_bind_0190'), 500)
      let show_status_bind_0190 = await driver.waitForComponent(ON.id('show_status_bind_0190'), 500)
      let interrupt_animation_bind_0190 = await driver.waitForComponent(ON.id('interrupt_animation_bind_0190'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0190.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：点击按钮开始气泡弹出动效
      await button_bind_0190.click()
      await driver.waitForIdle(200,1000)

      // 步骤5：在动效过程中人为打断
      await interrupt_animation_bind_0190.click()
      await driver.waitForIdle(500,2000)

      // 步骤6：验证最终状态
      await show_status_bind_0190.click()
      await driver.waitForIdle(500,2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0190 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0200
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0200 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0200')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0200 = await driver.waitForComponent(ON.id('button_bind_0200'), 500)
      let message_text_bind_0200 = await driver.waitForComponent(ON.id('message_text_bind_0200'), 500)
      let show_status_bind_0200 = await driver.waitForComponent(ON.id('show_status_bind_0200'), 500)
      let simulate_rotation_bind_0200 = await driver.waitForComponent(ON.id('simulate_rotation_bind_0200'), 2000)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0200.click()
      await driver.waitForIdle(2000,3000)

      // 步骤4：长按按钮打开菜单，观察isShow变为true
      await button_bind_0200.longClick()
      await driver.waitForIdle(2000,3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0200 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0210
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0210 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0210')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0210 = await driver.waitForComponent(ON.id('button_bind_0210'), 500)
      let message_text_bind_0210 = await driver.waitForComponent(ON.id('message_text_bind_0210'), 500)
      let show_status_bind_0210 = await driver.waitForComponent(ON.id('show_status_bind_0210'), 500)
      let simulate_rotation_bind_0210 = await driver.waitForComponent(ON.id('simulate_rotation_bind_0210'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0210.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：点击按钮打开菜单，观察isShow变为true
      await button_bind_0210.click()
      await driver.waitForIdle(500,2000)

      // 步骤5：模拟横竖屏切换，观察先执行退出动效，后isShow变为false
      await simulate_rotation_bind_0210.click()
      await driver.waitForIdle(500,2000)

      // 步骤6：验证最终状态
      await show_status_bind_0210.click()
      await driver.waitForIdle(2000,3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0210 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0220
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0220 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0220')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0220 = await driver.waitForComponent(ON.id('button_bind_0220'), 500)
      let message_text_bind_0220 = await driver.waitForComponent(ON.id('message_text_bind_0220'), 500)
      let show_status_bind_0220 = await driver.waitForComponent(ON.id('show_status_bind_0220'), 500)
      let simulate_rotation_bind_0220 = await driver.waitForComponent(ON.id('simulate_rotation_bind_0220'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0220.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：点击按钮弹出气泡，观察isShow变为true
      await button_bind_0220.click()
      await driver.waitForIdle(500,2000)

      // 步骤5：模拟横竖屏切换，观察先执行退出动效，后isShow变为false
      await simulate_rotation_bind_0220.click()
      await driver.waitForIdle(500,2000)

      // 步骤6：验证最终状态
      await show_status_bind_0220.click()
      await driver.waitForIdle(500,2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0220 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0230
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0230 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0230')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0230 = await driver.waitForComponent(ON.id('button_bind_0230'), 500)
      let message_text_bind_0230 = await driver.waitForComponent(ON.id('message_text_bind_0230'), 500)
      let show_status_bind_0230 = await driver.waitForComponent(ON.id('show_status_bind_0230'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0230.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：点击按钮弹出气泡，观察isShow变为true
      await button_bind_0230.click()
      await driver.waitForIdle(500,2000)

      // 步骤5：点击气泡内的Close按钮，观察isShow变为false
      let close_button_bind_0230 = await driver.waitForComponent(ON.id('close_button_bind_0230'), 1000)
      await close_button_bind_0230.click()
      await driver.waitForIdle(500,2000)

      // 步骤6：验证最终状态
      await show_status_bind_0230.click()
      await driver.waitForIdle(500,2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0230 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0240
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0240 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0240')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0240 = await driver.waitForComponent(ON.id('button_bind_0240'), 500)
      let message_text_bind_0240 = await driver.waitForComponent(ON.id('message_text_bind_0240'), 500)
      let show_status_bind_0240 = await driver.waitForComponent(ON.id('show_status_bind_0240'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0240.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：点击按钮弹出气泡，观察isShow变为true
      await button_bind_0240.click()
      await driver.waitForIdle(500,2000)

      // 步骤5：点击气泡内的退出按钮，观察isShow变为false
      let exit_button_bind_0240 = await driver.waitForComponent(ON.id('exit_button_bind_0240'), 1000)
      await exit_button_bind_0240.click()
      await driver.waitForIdle(500,2000)

      // 步骤6：验证最终状态
      await show_status_bind_0240.click()
      await driver.waitForIdle(500,2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0240 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0250
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0250 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0250')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0250 = await driver.waitForComponent(ON.id('button_bind_0250'), 500)
      let message_text_bind_0250 = await driver.waitForComponent(ON.id('message_text_bind_0250'), 500)
      let show_status_bind_0250 = await driver.waitForComponent(ON.id('show_status_bind_0250'), 500)
      let simulate_blank_click_bind_0250 = await driver.waitForComponent(ON.id('simulate_blank_click_bind_0250'), 2000)
      let blank_area_bind_0250 = await driver.waitForComponent(ON.id('blank_area_bind_0250'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0250.click()
      await driver.waitForIdle(2000,3000)

      // 步骤4：长按按钮打开菜单，观察isShow变为true
      await button_bind_0250.longClick()
      await driver.waitForIdle(2000,3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0250 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0260
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0260 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0260')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0260 = await driver.waitForComponent(ON.id('button_bind_0260'), 500)
      let message_text_bind_0260 = await driver.waitForComponent(ON.id('message_text_bind_0260'), 500)
      let show_status_bind_0260 = await driver.waitForComponent(ON.id('show_status_bind_0260'), 500)
      let simulate_blank_click_bind_0260 = await driver.waitForComponent(ON.id('simulate_blank_click_bind_0260'), 500)
      let blank_area_bind_0260 = await driver.waitForComponent(ON.id('blank_area_bind_0260'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0260.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：点击按钮打开菜单，观察isShow变为true
      await button_bind_0260.click()
      await driver.waitForIdle(500,2000)

      // 步骤5：点击空白区域关闭菜单，观察isShow变为false
      await simulate_blank_click_bind_0260.click()
      await driver.waitForIdle(500,2000)

      // 步骤6：验证最终状态
      await show_status_bind_0260.click()
      await driver.waitForIdle(500,2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0260 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0270
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0270 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0270')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0270 = await driver.waitForComponent(ON.id('button_bind_0270'), 500)
      let message_text_bind_0270 = await driver.waitForComponent(ON.id('message_text_bind_0270'), 500)
      let show_status_bind_0270 = await driver.waitForComponent(ON.id('show_status_bind_0270'), 500)
      let simulate_blank_click_bind_0270 = await driver.waitForComponent(ON.id('simulate_blank_click_bind_0270'), 500)
      let blank_area_bind_0270 = await driver.waitForComponent(ON.id('blank_area_bind_0270'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0270.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：点击按钮弹出气泡，观察isShow变为true
      await button_bind_0270.click()
      await driver.waitForIdle(500,2000)

      // 步骤5：点击空白区域关闭气泡，观察isShow变为false
      await simulate_blank_click_bind_0270.click()
      await driver.waitForIdle(500,2000)

      // 步骤6：验证最终状态
      await show_status_bind_0270.click()
      await driver.waitForIdle(500,2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0270 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0280
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0280 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0280')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0280 = await driver.waitForComponent(ON.id('button_bind_0280'), 500)
      let message_text_bind_0280 = await driver.waitForComponent(ON.id('message_text_bind_0280'), 500)
      let show_status_bind_0280 = await driver.waitForComponent(ON.id('show_status_bind_0280'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0280.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：点击按钮打开菜单，观察isShow变为true
      await button_bind_0280.click()
      await driver.waitForIdle(500,2000)

      // 步骤5：点击菜单选项关闭菜单，观察isShow变为false
      let menuItem1 = await driver.waitForComponent(ON.text('菜单项1'), 1000)
      await menuItem1.click()
      await driver.waitForIdle(500,2000)

      // 步骤6：验证最终状态
      await show_status_bind_0280.click()
      await driver.waitForIdle(500,2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0280 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0290
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0290 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0290')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0290 = await driver.waitForComponent(ON.id('button_bind_0290'), 500)
      let message_text_bind_0290 = await driver.waitForComponent(ON.id('message_text_bind_0290'), 500)
      let show_status_bind_0290 = await driver.waitForComponent(ON.id('show_status_bind_0290'), 500)
      let simulate_drag_bind_0290 = await driver.waitForComponent(ON.id('simulate_drag_bind_0290'), 2000)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0290.click()
      await driver.waitForIdle(2000,3000)

      // 步骤4：长按按钮打开菜单，观察isShow变为true
      await button_bind_0290.longClick()
      await driver.waitForIdle(2000,3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0290 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0300
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0300 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0300')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0300 = await driver.waitForComponent(ON.id('button_bind_0300'), 500)
      let message_text_bind_0300 = await driver.waitForComponent(ON.id('message_text_bind_0300'), 500)
      let show_status_bind_0300 = await driver.waitForComponent(ON.id('show_status_bind_0300'), 500)
      let simulate_esc_bind_0300 = await driver.waitForComponent(ON.id('simulate_esc_bind_0300'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0300.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：点击按钮打开菜单，观察isShow变为true
      await button_bind_0300.click()
      await driver.waitForIdle(500,2000)

      // 步骤5：模拟按ESC键关闭菜单，观察isShow变为false
      await simulate_esc_bind_0300.click()
      await driver.waitForIdle(500,2000)

      // 步骤6：验证最终状态
      await show_status_bind_0300.click()
      await driver.waitForIdle(500,2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0300 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0310
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0310 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0310')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0310 = await driver.waitForComponent(ON.id('button_bind_0310'), 500)
      let message_text_bind_0310 = await driver.waitForComponent(ON.id('message_text_bind_0310'), 500)
      let show_status_bind_0310 = await driver.waitForComponent(ON.id('show_status_bind_0310'), 500)
      let toggle_show_bind_0310 = await driver.waitForComponent(ON.id('toggle_show_bind_0310'), 500)
      let start_timer_bind_0310 = await driver.waitForComponent(ON.id('start_timer_bind_0310'), 500)
      let stop_timer_bind_0310 = await driver.waitForComponent(ON.id('stop_timer_bind_0310'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0310.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：手动切换isShow状态，观察菜单显隐
      await toggle_show_bind_0310.click()
      await driver.waitForIdle(500,2000)

      // 步骤5：开始定时切换，观察状态变化
      await start_timer_bind_0310.click()
      await driver.waitForIdle(3000,5000)

      // 步骤6：停止定时切换
      await stop_timer_bind_0310.click()
      await driver.waitForIdle(500,2000)

      // 步骤7：验证最终状态
      await show_status_bind_0310.click()
      await driver.waitForIdle(500,2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0310 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0320
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0320 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0320')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0320 = await driver.waitForComponent(ON.id('button_bind_0320'), 500)
      let message_text_bind_0320 = await driver.waitForComponent(ON.id('message_text_bind_0320'), 500)
      let show_status_bind_0320 = await driver.waitForComponent(ON.id('show_status_bind_0320'), 500)
      let toggle_show_bind_0320 = await driver.waitForComponent(ON.id('toggle_show_bind_0320'), 500)
      let start_timer_bind_0320 = await driver.waitForComponent(ON.id('start_timer_bind_0320'), 500)
      let stop_timer_bind_0320 = await driver.waitForComponent(ON.id('stop_timer_bind_0320'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0320.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：手动切换isShow状态，观察菜单显隐
      await toggle_show_bind_0320.click()
      await driver.waitForIdle(500,2000)

      // 步骤5：开始定时切换，观察状态变化
      await start_timer_bind_0320.click()
      await driver.waitForIdle(3000,5000)

      // 步骤6：停止定时切换
      await stop_timer_bind_0320.click()
      await driver.waitForIdle(500,2000)

      // 步骤7：验证最终状态
      await show_status_bind_0320.click()
      await driver.waitForIdle(500,2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0320 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0330
     * @tc.name   : Popupbox specifications bind
     * @tc.desc   : Verify popupbox specifications bind interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0330 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsBind/PopupboxSpecificationsBind0330')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：查找组件
      let button_bind_0330 = await driver.waitForComponent(ON.id('button_bind_0330'), 500)
      let message_text_bind_0330 = await driver.waitForComponent(ON.id('message_text_bind_0330'), 500)
      let show_status_bind_0330 = await driver.waitForComponent(ON.id('show_status_bind_0330'), 500)
      let toggle_show_bind_0330 = await driver.waitForComponent(ON.id('toggle_show_bind_0330'), 500)
      let start_timer_bind_0330 = await driver.waitForComponent(ON.id('start_timer_bind_0330'), 500)
      let stop_timer_bind_0330 = await driver.waitForComponent(ON.id('stop_timer_bind_0330'), 500)

      // 步骤3：验证初始状态，默认isShow为false
      await show_status_bind_0330.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：手动切换isShow状态，观察气泡显隐
      await toggle_show_bind_0330.click()
      await driver.waitForIdle(500,2000)

      // 步骤5：开始定时切换，观察状态变化
      await start_timer_bind_0330.click()
      await driver.waitForIdle(3000,5000)

      // 步骤6：停止定时切换
      await stop_timer_bind_0330.click()
      await driver.waitForIdle(500,2000)

      // 步骤7：验证最终状态
      await show_status_bind_0330.click()
      await driver.waitForIdle(500,2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_BIND_0330 finish.`);
      done()
    })


  })
}