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
import { Driver, ON } from '@kit.TestKit';

export default function popupBoxSpecificationsPageDisplay04() {

  describe('popupBoxSpecificationsPageDisplay04', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2440
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2440 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2440')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:OVERLAY (已内置)
      // 步骤3：设置ImmersiveMode设置为异常值 (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog_on_mask'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2450
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2450 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2450')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:OVERLAY (已内置)
      // 步骤3：设置ImmersiveMode设置为异常值 (已内置)
      // 步骤4：点击向下偏移
      let button_offset_down = await driver.waitForComponent(ON.id('button_offset_down'), 2000)
      if (button_offset_down) {
        await button_offset_down.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 步骤6：点击最上方的返回首页
      let button_return_home = await driver.waitForComponent(ON.id('button_return_home'), 2000)
      if (button_return_home) {
        await button_return_home.click()
        await Utils.sleep(500)
      }
      // 验证页面切换和弹窗跟随
      await Utils.sleep(1000)
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2460
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2460 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2460')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:异常值 (已内置)
      // 步骤3：设置ImmersiveMode.DEFAULT (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog_on_mask'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2490
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2490 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2490')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:异常值 (已内置)
      // 步骤3：设置ImmersiveMode.EXTEND (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog_on_mask'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2500
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2500 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2500')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:异常值 (已内置)
      // 步骤3：设置ImmersiveMode.EXTEND (已内置)
      // 步骤4：点击向下偏移
      let button_offset_down = await driver.waitForComponent(ON.id('button_offset_down'), 2000)
      if (button_offset_down) {
        await button_offset_down.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 步骤6：点击最上方的返回首页
      let button_return_home = await driver.waitForComponent(ON.id('button_return_home'), 2000)
      if (button_return_home) {
        await button_return_home.click()
        await Utils.sleep(500)
      }
      // 验证页面切换和弹窗跟随
      await Utils.sleep(1000)
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2530
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2530 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2530')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:异常值 (已内置)
      // 步骤3：设置ImmersiveMode设置为异常值 (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog_on_mask'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2540
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2540 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2540')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:异常值 (已内置)
      // 步骤3：设置ImmersiveMode设置为异常值 (已内置)
      // 步骤4：点击向下偏移
      let button_offset_down = await driver.waitForComponent(ON.id('button_offset_down'), 2000)
      if (button_offset_down) {
        await button_offset_down.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 步骤6：点击最上方的返回首页
      let button_return_home = await driver.waitForComponent(ON.id('button_return_home'), 2000)
      if (button_return_home) {
        await button_return_home.click()
        await Utils.sleep(500)
      }
      // 验证页面切换和弹窗跟随
      await Utils.sleep(1000)
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2550
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2550 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2550')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:EMBEDDED (已内置)
      // 步骤3：设置ImmersiveMode.DEFAULT，设置levelUniqueId为异常值 (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog_on_mask'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2560
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2560 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2560')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:EMBEDDED (已内置)
      // 步骤3：设置ImmersiveMode.DEFAULT，设置levelUniqueId为异常值 (已内置)
      // 步骤4：点击向下偏移
      let button_offset_down = await driver.waitForComponent(ON.id('button_offset_down'), 2000)
      if (button_offset_down) {
        await button_offset_down.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 步骤6：点击最上方的返回首页
      let button_return_home = await driver.waitForComponent(ON.id('button_return_home'), 2000)
      if (button_return_home) {
        await button_return_home.click()
        await Utils.sleep(500)
      }
      // 验证页面切换和弹窗跟随
      await Utils.sleep(1000)
      // 预期结果：切换界面，弹窗跟随在新的页面中显示，左滑或者点击空白，弹窗退出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2560 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2620
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2620 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2620')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:EMBEDDED (已内置)
      // 步骤3：设置ImmersiveMode.EXTEND，设置levelUniqueId为异常值 (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog_on_mask'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2620 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2630
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2630 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2630')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:EMBEDDED (已内置)
      // 步骤3：设置ImmersiveMode.EXTEND，设置levelUniqueId为异常值 (已内置)
      // 步骤4：点击向下偏移
      let button_offset_down = await driver.waitForComponent(ON.id('button_offset_down'), 2000)
      if (button_offset_down) {
        await button_offset_down.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 步骤6：点击最上方的返回首页
      let button_return_home = await driver.waitForComponent(ON.id('button_return_home'), 2000)
      if (button_return_home) {
        await button_return_home.click()
        await Utils.sleep(500)
      }
      // 验证页面切换和弹窗跟随
      await Utils.sleep(1000)
      // 预期结果：切换界面，弹窗跟随在新的页面中显示，左滑或者点击空白，弹窗退出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2630 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2650
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2650 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2650')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:EMBEDDED (已内置)
      // 步骤3：设置ImmersiveMode.EXTEND，设置levelUniqueId为正常值 (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog_on_mask'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为当前页面顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2650 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2700
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2700 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2700')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:EMBEDDED (已内置)
      // 步骤3：设置ImmersiveMode设置为异常值，设置levelUniqueId为异常值 (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog_on_mask'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2700 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2710
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2710 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2710')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:EMBEDDED (已内置)
      // 步骤3：设置ImmersiveMode设置为异常值，设置levelUniqueId为异常值 (已内置)
      // 步骤4：点击向下偏移
      let button_offset_down = await driver.waitForComponent(ON.id('button_offset_down'), 2000)
      if (button_offset_down) {
        await button_offset_down.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 步骤6：点击最上方的返回首页
      let button_return_home = await driver.waitForComponent(ON.id('button_return_home'), 2000)
      if (button_return_home) {
        await button_return_home.click()
        await Utils.sleep(500)
      }
      // 验证页面切换和弹窗跟随
      await Utils.sleep(1000)
      // 预期结果：切换界面，弹窗跟随在新的页面中显示，左滑或者点击空白，弹窗退出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2710 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2740
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2740', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2740 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2740')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:OVERLAY (已内置)
      // 步骤3：设置ImmersiveMode.DEFAULT (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog_on_mask'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2740 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2750
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2750', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2750 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2750')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:OVERLAY (已内置)
      // 步骤3：设置ImmersiveMode.DEFAULT (已内置)
      // 步骤4：点击向下偏移
      let button_offset_down = await driver.waitForComponent(ON.id('button_offset_down'), 2000)
      if (button_offset_down) {
        await button_offset_down.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 步骤6：点击最上方的返回首页
      let button_return_home = await driver.waitForComponent(ON.id('button_return_home'), 2000)
      if (button_return_home) {
        await button_return_home.click()
        await Utils.sleep(500)
      }
      // 验证页面切换和弹窗跟随
      await Utils.sleep(1000)
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2750 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2770
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2770', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2770 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2770')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:OVERLAY (已内置)
      // 步骤3：设置ImmersiveMode.EXTEND (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog_on_mask'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2770 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2780
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2780', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2780 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2780')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:OVERLAY (已内置)
      // 步骤3：设置ImmersiveMode.EXTEND (已内置)
      // 步骤4：点击向下偏移
      let button_offset_down = await driver.waitForComponent(ON.id('button_offset_down'), 2000)
      if (button_offset_down) {
        await button_offset_down.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 步骤6：点击最上方的返回首页
      let button_return_home = await driver.waitForComponent(ON.id('button_return_home'), 2000)
      if (button_return_home) {
        await button_return_home.click()
        await Utils.sleep(500)
      }
      // 验证页面切换和弹窗跟随
      await Utils.sleep(1000)
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2780 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2810
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2810', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2810 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2810')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:OVERLAY (已内置)
      // 步骤3：设置ImmersiveMode设置为异常值 (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog_on_mask'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2810 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2820
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2820', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2820 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2820')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:OVERLAY (已内置)
      // 步骤3：设置ImmersiveMode设置为异常值 (已内置)
      // 步骤4：点击向下偏移
      let button_offset_down = await driver.waitForComponent(ON.id('button_offset_down'), 2000)
      if (button_offset_down) {
        await button_offset_down.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 步骤6：点击最上方的返回首页
      let button_return_home = await driver.waitForComponent(ON.id('button_return_home'), 2000)
      if (button_return_home) {
        await button_return_home.click()
        await Utils.sleep(500)
      }
      // 验证页面切换和弹窗跟随
      await Utils.sleep(1000)
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2820 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2830
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2830', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2830 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2830')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:异常值 (已内置)
      // 步骤3：设置ImmersiveMode.DEFAULT (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog_on_mask'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2830 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2840
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2840', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2840 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2840')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:异常值 (已内置)
      // 步骤3：设置ImmersiveMode.DEFAULT (已内置)
      // 步骤4：点击向下偏移
      let button_offset_down = await driver.waitForComponent(ON.id('button_offset_down'), 2000)
      if (button_offset_down) {
        await button_offset_down.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 步骤6：点击最上方的返回首页
      let button_return_home = await driver.waitForComponent(ON.id('button_return_home'), 2000)
      if (button_return_home) {
        await button_return_home.click()
        await Utils.sleep(500)
      }
      // 验证页面切换和弹窗跟随
      await Utils.sleep(1000)
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2840 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2860
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2860', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2860 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2860')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:异常值 (已内置)
      // 步骤3：设置ImmersiveMode.EXTEND (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog_on_mask'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2860 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2870
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2870', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2870 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2870')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:异常值 (已内置)
      // 步骤3：设置ImmersiveMode.EXTEND (已内置)
      // 步骤4：点击向下偏移
      let button_offset_down = await driver.waitForComponent(ON.id('button_offset_down'), 2000)
      if (button_offset_down) {
        await button_offset_down.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 步骤6：点击最上方的返回首页
      let button_return_home = await driver.waitForComponent(ON.id('button_return_home'), 2000)
      if (button_return_home) {
        await button_return_home.click()
        await Utils.sleep(500)
      }
      // 验证页面切换和弹窗跟随
      await Utils.sleep(1000)
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2870 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2900
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2900', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2900 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2900')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:异常值 (已内置)
      // 步骤3：设置ImmersiveMode设置为异常值 (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog_on_mask'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2900 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2910
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2910', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2910 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2910')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:异常值 (已内置)
      // 步骤3：设置ImmersiveMode设置为异常值 (已内置)
      // 步骤4：点击向下偏移
      let button_offset_down = await driver.waitForComponent(ON.id('button_offset_down'), 2000)
      if (button_offset_down) {
        await button_offset_down.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击uiContext_presentCustomDialog
      let button_present_custom_dialog = await driver.waitForComponent(ON.id('button_present_custom_dialog'), 2000)
      if (button_present_custom_dialog) {
        await button_present_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_presentCustomDialog显示效果
      await Utils.sleep(2000)
      // 步骤6：点击最上方的返回首页
      let button_return_home = await driver.waitForComponent(ON.id('button_return_home'), 2000)
      if (button_return_home) {
        await button_return_home.click()
        await Utils.sleep(500)
      }
      // 验证页面切换和弹窗跟随
      await Utils.sleep(1000)
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2910 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2920
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2920', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2920 start.`);
      // 步骤1：打开测试hap
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2920')
      let driver: Driver = Driver.create();
      await Utils.sleep(2000)
      Logger.info('TEST', '步骤1完成：测试hap已打开');
      // 步骤2：设置isModel为false，设置levelMode为embeded，设置UniqueId为正常值，设置immersiveMode为extend，点击自定义弹窗
      let button_first_custom_dialog = await driver.waitForComponent(ON.id('button_first_custom_dialog'), 3000)
      if (button_first_custom_dialog) {
        await button_first_custom_dialog.click()
        await Utils.sleep(1000)
        Logger.info('TEST', '步骤2完成：第一个自定义弹窗已显示（isModel:false, levelMode:EMBEDDED, immersiveMode:EXTEND）');
      } else {
        Logger.info('TEST', '步骤2失败：未找到第一个自定义弹窗按钮');
      }
      // 验证第一个弹窗状态
      await windowSnap.snapShot()
      Logger.info('TEST', '第一个弹窗显示状态截图完成');
      // 步骤3：设置isModel为true，设置levelMode为embeded，设置UniqueId为正常值，设置immersiverMode为default，设置maskRecr为100%mask，点击prompt_openCustomDialog
      let button_second_custom_dialog = await driver.waitForComponent(ON.id('button_second_custom_dialog'), 3000)
      if (button_second_custom_dialog) {
        await button_second_custom_dialog.click()
        await Utils.sleep(1000)
        Logger.info('TEST', '步骤3完成：第二个prompt_openCustomDialog已显示（isModel:true, levelMode:EMBEDDED, immersiveMode:DEFAULT, maskRect:100%）');
      } else {
        Logger.info('TEST', '步骤3失败：未找到第二个prompt_openCustomDialog按钮');
      }
      // 验证两个弹窗同时显示的状态
      await windowSnap.snapShot()
      Logger.info('TEST', '双弹窗显示状态截图完成');
      // 步骤4：点击router跳转
      let button_router_jump = await driver.waitForComponent(ON.id('button_router_jump'), 3000)
      if (button_router_jump) {
        await button_router_jump.click()
        await Utils.sleep(2000)
        Logger.info('TEST', '步骤4完成：router跳转已执行');
      } else {
        Logger.info('TEST', '步骤4失败：未找到router跳转按钮');
      }
      // 验证跳转后状态 - 弹窗应该消失
      await windowSnap.snapShot()
      Logger.info('TEST', 'router跳转后状态截图完成 - 验证弹窗已消失');
      // 点击返回按钮回到原页面
      let button_back_to_previous = await driver.waitForComponent(ON.id('button_back_to_previous'), 3000)
      if (button_back_to_previous) {
        await button_back_to_previous.click()
        await Utils.sleep(2000)
        Logger.info('TEST', '返回原页面完成');
      } else {
        Logger.info('TEST', '未找到返回按钮');
      }
      // 验证返回后状态 - 弹窗应该重新出现
      await windowSnap.snapShot()
      Logger.info('TEST', '返回原页面后状态截图完成 - 验证弹窗重新出现');
      // 预期结果验证
      Logger.info('TEST', '预期结果：两个dialog在新页面中消失，回到之前的页面，弹窗依然存在。仅遮罩页面，不遮罩状态栏导航条。');
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2920 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2930
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2930', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2930 start.`);
      // 步骤1：打开测试hap
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2930')
      let driver: Driver = Driver.create();
      await Utils.sleep(2000)
      Logger.info('TEST', '步骤1完成：测试hap已打开');
      // 步骤2：设置isModel为false，设置levelMode为embeded，设置UniqueId为正常值，设置immersiveMode为default，点击showdialog
      let button_first_dialog = await driver.waitForComponent(ON.id('button_first_dialog'), 3000)
      if (button_first_dialog) {
        await button_first_dialog.click()
        await Utils.sleep(1000)
        Logger.info('TEST', '步骤2完成：第一个showDialog已显示（isModel:false, levelMode:EMBEDDED, UniqueId:正常值, immersiveMode:DEFAULT）');
      } else {
        Logger.info('TEST', '步骤2失败：未找到第一个showDialog按钮');
      }
      // 验证第一个弹窗状态
      await windowSnap.snapShot()
      Logger.info('TEST', '第一个showDialog显示状态截图完成');
      // 步骤3：设置isModel为true，设置levelMode为embeded，设置UniqueId为异常值，设置immersiverMode为extend，点击uicontext_openCustomDialog
      let button_second_dialog = await driver.waitForComponent(ON.id('button_second_dialog'), 3000)
      if (button_second_dialog) {
        await button_second_dialog.click()
        await Utils.sleep(1000)
        Logger.info('TEST', '步骤3完成：第二个uicontext_openCustomDialog已显示（isModel:true, levelMode:EMBEDDED, UniqueId:异常值, immersiveMode:EXTEND）');
      } else {
        Logger.info('TEST', '步骤3失败：未找到第二个uicontext_openCustomDialog按钮');
      }
      // 验证两个弹窗同时显示的状态
      await windowSnap.snapShot()
      Logger.info('TEST', '双弹窗显示状态截图完成');
      // 步骤4：点击返回首页/点击router跳转
      let button_router_jump = await driver.waitForComponent(ON.id('button_router_jump'), 3000)
      if (button_router_jump) {
        await button_router_jump.click()
        await Utils.sleep(2000)
        Logger.info('TEST', '步骤4完成：router跳转已执行');
      } else {
        Logger.info('TEST', '步骤4失败：未找到router跳转按钮');
      }
      // 验证跳转后状态 - uicontext_openCustomDialog跟随页面显示，showDialog消失
      await windowSnap.snapShot()
      Logger.info('TEST', 'router跳转后状态截图完成 - 验证uicontext_openCustomDialog跟随页面显示，showDialog消失');
      // 点击返回按钮回到原页面
      let button_back_to_previous = await driver.waitForComponent(ON.id('button_back_to_previous'), 3000)
      if (button_back_to_previous) {
        await button_back_to_previous.click()
        await Utils.sleep(2000)
        Logger.info('TEST', '返回原页面完成');
      } else {
        Logger.info('TEST', '未找到返回按钮');
      }
      // 验证返回后状态 - uicontext_openCustomDialog依然存在，showDialog已消失
      await windowSnap.snapShot()
      Logger.info('TEST', '返回原页面后状态截图完成 - 验证uicontext_openCustomDialog依然存在，showDialog已消失');
      // 预期结果验证
      Logger.info('TEST', '预期结果：uicontext_openCustomDialog跟随着页面切换在新页面中显示，showDialog在新页面中消失，回到之前的页面，警告弹窗依然存在');
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2930 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2940
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2940', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2940 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2940')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 点击列表选择弹窗
      let button_first_dialog = await driver.waitForComponent(ON.id('button_first_dialog'), 2000)
      if (button_first_dialog) {
        await button_first_dialog.click()
        await Utils.sleep(800)
      }
      // 点击警告弹窗
      let button_second_dialog = await driver.waitForComponent(ON.id('button_second_dialog'), 2000)
      if (button_second_dialog) {
        await button_second_dialog.click()
        await Utils.sleep(800)
      }
      await windowSnap.snapShot()
      // 点击router按钮
      let button_router_jump = await driver.waitForComponent(ON.id('button_router_jump'), 2000)
      if (button_router_jump) {
        await button_router_jump.click()
        await Utils.sleep(1500)
      }
      await windowSnap.snapShot()
      // 点击返回按钮
      let button_back_to_previous = await driver.waitForComponent(ON.id('button_back_to_previous'), 2000)
      if (button_back_to_previous) {
        await button_back_to_previous.click()
        await Utils.sleep(1500)
      }
      await windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2940 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2950
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2950', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2950 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2950')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 点击页面级dialog
      let button_page_level_dialog = await driver.waitForComponent(ON.id('button_page_level_dialog'), 2000)
      if (button_page_level_dialog) {
        await button_page_level_dialog.click()
        await Utils.sleep(800)
      }
      // 点击非页面级dialog
      let button_non_page_level_dialog = await driver.waitForComponent(ON.id('button_non_page_level_dialog'), 2000)
      if (button_non_page_level_dialog) {
        await button_non_page_level_dialog.click()
        await Utils.sleep(800)
      }
      await windowSnap.snapShot()
      // 点击router按钮
      let button_router_jump = await driver.waitForComponent(ON.id('button_router_jump'), 2000)
      if (button_router_jump) {
        await button_router_jump.click()
        await Utils.sleep(1500)
      }
      await windowSnap.snapShot()
      // 点击返回按钮
      let button_back_to_previous = await driver.waitForComponent(ON.id('button_back_to_previous'), 2000)
      if (button_back_to_previous) {
        await button_back_to_previous.click()
        await Utils.sleep(1500)
      }
      await windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2950 finish.`);
      done()
    })
  })

}