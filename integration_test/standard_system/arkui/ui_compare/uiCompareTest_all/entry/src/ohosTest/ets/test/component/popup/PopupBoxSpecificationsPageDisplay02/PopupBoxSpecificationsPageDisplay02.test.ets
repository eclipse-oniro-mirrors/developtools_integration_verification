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

export default function popupBoxSpecificationsPageDisplay02() {

  describe('popupBoxSpecificationsPageDisplay02', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0760
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0760', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0760 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0760')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证CustomDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭CustomDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0760 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0790
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0790', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0790 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0790')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证CustomDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭CustomDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0790 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0830
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0830', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0830 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0830')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证CustomDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭CustomDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0830 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0850
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0850', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0850 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0850')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证CustomDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭CustomDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0850 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0880
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0880', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0880 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0880')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证CustomDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭CustomDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0880 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0920
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0920', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0920 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0920')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证CustomDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭CustomDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0920 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0940
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0940', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0940 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0940')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_prompt_opencustomdialog = await driver.waitForComponent(ON.id('button_prompt_opencustomdialog'), 2000)
      if (button_prompt_opencustomdialog) {
        await button_prompt_opencustomdialog.click()
        await Utils.sleep(500)
      }
      // 验证prompt_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭prompt_openCustomDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0940 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0950
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0950', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0950 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0950')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_prompt_opencustomdialog = await driver.waitForComponent(ON.id('button_prompt_opencustomdialog'), 2000)
      if (button_prompt_opencustomdialog) {
        await button_prompt_opencustomdialog.click()
        await Utils.sleep(500)
      }
      // 验证prompt_openCustomDialog显示效果（带偏移）
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0950 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1010
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1010 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1010')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_prompt_opencustomdialog = await driver.waitForComponent(ON.id('button_prompt_opencustomdialog'), 2000)
      if (button_prompt_opencustomdialog) {
        await button_prompt_opencustomdialog.click()
        await Utils.sleep(500)
      }
      // 验证prompt_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭prompt_openCustomDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1020
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1020 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1020')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_prompt_opencustomdialog = await driver.waitForComponent(ON.id('button_prompt_opencustomdialog'), 2000)
      if (button_prompt_opencustomdialog) {
        await button_prompt_opencustomdialog.click()
        await Utils.sleep(500)
      }
      // 验证prompt_openCustomDialog显示效果（带偏移）
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1040
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1040 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1040')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_prompt_opencustomdialog = await driver.waitForComponent(ON.id('button_prompt_opencustomdialog'), 2000)
      if (button_prompt_opencustomdialog) {
        await button_prompt_opencustomdialog.click()
        await Utils.sleep(500)
      }
      // 验证prompt_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭prompt_openCustomDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为当前页面顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1090
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1090 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1090')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_prompt_opencustomdialog = await driver.waitForComponent(ON.id('button_prompt_opencustomdialog'), 2000)
      if (button_prompt_opencustomdialog) {
        await button_prompt_opencustomdialog.click()
        await Utils.sleep(500)
      }
      // 验证prompt_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭prompt_openCustomDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1100
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1100 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1100')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_prompt_opencustomdialog = await driver.waitForComponent(ON.id('button_prompt_opencustomdialog'), 2000)
      if (button_prompt_opencustomdialog) {
        await button_prompt_opencustomdialog.click()
        await Utils.sleep(500)
      }
      // 验证prompt_openCustomDialog显示效果（带偏移）
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1130
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1130 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1130')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_prompt_opencustomdialog = await driver.waitForComponent(ON.id('button_prompt_opencustomdialog'), 2000)
      if (button_prompt_opencustomdialog) {
        await button_prompt_opencustomdialog.click()
        await Utils.sleep(500)
      }
      // 验证prompt_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭prompt_openCustomDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1140
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1140 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1140')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:OVERLAY (已内置)
      // 步骤3：设置ImmersiveMode.DEFAULT (已内置)
      // 步骤4：点击向下偏移
      let button_offset = await driver.waitForComponent(ON.text('4. 点击向下偏移'), 2000)
      if (button_offset) {
        await button_offset.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击prompt_openCustomDialog
      let button_prompt_opencustomdialog = await driver.waitForComponent(ON.text('5. 点击prompt_openCustomDialog'), 2000)
      if (button_prompt_opencustomdialog) {
        await button_prompt_opencustomdialog.click()
        await Utils.sleep(500)
      }
      // 验证prompt_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 步骤6：点击最上方的返回首页
      let button_home = await driver.waitForComponent(ON.text('返回首页'), 2000)
      if (button_home) {
        await button_home.click()
        await Utils.sleep(500)
      }
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1160
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1160 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1160')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:OVERLAY (已内置)
      // 步骤3：设置ImmersiveMode.EXTEND (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.text('4. 点击100%mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击prompt_openCustomDialog
      let button_prompt_opencustomdialog = await driver.waitForComponent(ON.text('5. 点击prompt_openCustomDialog'), 2000)
      if (button_prompt_opencustomdialog) {
        await button_prompt_opencustomdialog.click()
        await Utils.sleep(500)
      }
      // 验证prompt_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭prompt_openCustomDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1170
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1170 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1170')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:OVERLAY (已内置)
      // 步骤3：设置ImmersiveMode.EXTEND (已内置)
      // 步骤4：点击向下偏移
      let button_offset = await driver.waitForComponent(ON.text('4. 点击向下偏移'), 2000)
      if (button_offset) {
        await button_offset.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击prompt_openCustomDialog
      let button_prompt_opencustomdialog = await driver.waitForComponent(ON.text('5. 点击prompt_openCustomDialog'), 2000)
      if (button_prompt_opencustomdialog) {
        await button_prompt_opencustomdialog.click()
        await Utils.sleep(500)
      }
      // 验证prompt_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 步骤6：点击最上方的返回首页
      let button_home = await driver.waitForComponent(ON.text('返回首页'), 2000)
      if (button_home) {
        await button_home.click()
        await Utils.sleep(500)
      }
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1200
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1200 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1200')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:OVERLAY (已内置)
      // 步骤3：设置ImmersiveMode设置为异常值 (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.text('4. 点击100%mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击prompt_openCustomDialog
      let button_prompt_opencustomdialog = await driver.waitForComponent(ON.text('5. 点击prompt_openCustomDialog'), 2000)
      if (button_prompt_opencustomdialog) {
        await button_prompt_opencustomdialog.click()
        await Utils.sleep(500)
      }
      // 验证prompt_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭prompt_openCustomDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1210
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1210 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1210')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:OVERLAY (已内置)
      // 步骤3：设置ImmersiveMode设置为异常值 (已内置)
      // 步骤4：点击向下偏移
      let button_offset = await driver.waitForComponent(ON.text('4. 点击向下偏移'), 2000)
      if (button_offset) {
        await button_offset.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击prompt_openCustomDialog
      let button_prompt_opencustomdialog = await driver.waitForComponent(ON.text('5. 点击prompt_openCustomDialog'), 2000)
      if (button_prompt_opencustomdialog) {
        await button_prompt_opencustomdialog.click()
        await Utils.sleep(500)
      }
      // 验证prompt_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 步骤6：点击最上方的返回首页
      let button_home = await driver.waitForComponent(ON.text('返回首页'), 2000)
      if (button_home) {
        await button_home.click()
        await Utils.sleep(500)
      }
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1220
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1220 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1220')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_prompt_opencustomdialog = await driver.waitForComponent(ON.id('button_prompt_opencustomdialog'), 2000)
      if (button_prompt_opencustomdialog) {
        await button_prompt_opencustomdialog.click()
        await Utils.sleep(500)
      }
      // 验证prompt_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭prompt_openCustomDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1230
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1230 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1230')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证CustomDialog显示效果（带偏移）
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1250
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1250 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1250')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证CustomDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭CustomDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1260
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1260 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1260')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证CustomDialog显示效果（带偏移）
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1290
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1290 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1290')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证CustomDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭CustomDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1300
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1300 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1300')
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
      // 步骤5：点击prompt_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证CustomDialog显示效果（带偏移）
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1310
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1310 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1310')
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
      // 步骤5：点击ShowActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ShowActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ShowActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1320
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1320 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1320')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:EMBEDDED (已内置)
      // 步骤3：设置ImmersiveMode.DEFAULT，设置levelUniqueId为异常值 (已内置)
      // 步骤4：设置isModal为false (已内置)
      // 步骤5：点击ShowActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ShowActionSheet显示效果
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1360
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1360 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1360')
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
      // 步骤5：点击ShowActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ShowActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ShowActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1370
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1370 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1370')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:EMBEDDED (已内置)
      // 步骤3：设置ImmersiveMode.EXTEND，设置levelUniqueId为异常值 (已内置)
      // 步骤4：设置isModal为false (已内置)
      // 步骤5：点击ShowActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ShowActionSheet显示效果
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1380
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1380 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1380')
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
      // 步骤5：点击ShowActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ShowActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ShowActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为当前页面顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1400
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1400 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1400')
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
      // 步骤5：点击ShowActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ShowActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ShowActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1410
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1410 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1410')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:EMBEDDED (已内置)
      // 步骤3：设置ImmersiveMode设置为异常值，设置levelUniqueId为异常值 (已内置)
      // 步骤4：点击设置isModal为false (已内置)
      // 步骤5：点击ShowActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ShowActionSheet显示效果
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1440
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1440 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1440')
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
      // 步骤5：点击ShowActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ShowActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ShowActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1450
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1450 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1450')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:OVERLAY (已内置)
      // 步骤3：设置ImmersiveMode.DEFAULT (已内置)
      // 步骤4：设置isModal为false (已内置)
      // 步骤5：点击ShowActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ShowActionSheet显示效果
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1460
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1460 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1460')
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
      // 步骤5：点击ShowActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ShowActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ShowActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1470
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1470 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1470')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:OVERLAY (已内置)
      // 步骤3：设置ImmersiveMode.EXTEND (已内置)
      // 步骤4：设置isModal为false (已内置)
      // 步骤5：点击ShowActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ShowActionSheet显示效果
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1480
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1480 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1480')
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
      // 步骤5：点击ShowActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ShowActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ShowActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1490
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1490 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1490')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:OVERLAY (已内置)
      // 步骤3：设置ImmersiveMode设置为异常值 (已内置)
      // 步骤4：设置isModal为false (已内置)
      // 步骤5：点击ShowActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ShowActionSheet显示效果
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1500
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1500 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1500')
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
      // 步骤5：点击ShowActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ShowActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ShowActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1520
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1520 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1520')
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
      // 步骤5：点击ShowActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ShowActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ShowActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1540
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1540 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1540')
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
      // 步骤5：点击ShowActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ShowActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ShowActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1560
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1560 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1560')
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
      // 步骤5：点击showDialog
      let button_show_dialog = await driver.waitForComponent(ON.id('button_show_dialog'), 2000)
      if (button_show_dialog) {
        await button_show_dialog.click()
        await Utils.sleep(500)
      }
      // 验证showDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭showDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1560 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1570
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1570 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1570')
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
      // 步骤5：点击showDialog
      let button_show_dialog = await driver.waitForComponent(ON.id('button_show_dialog'), 2000)
      if (button_show_dialog) {
        await button_show_dialog.click()
        await Utils.sleep(500)
      }
      // 验证showDialog显示效果
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1580
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1580 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1580')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:EMBEDDED (已内置)
      // 步骤3：设置ImmersiveMode.DEFAULT，设置levelUniqueId为正常值 (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击showDialog
      let button_show_dialog = await driver.waitForComponent(ON.id('button_show_dialog'), 2000)
      if (button_show_dialog) {
        await button_show_dialog.click()
        await Utils.sleep(500)
      }
      // 验证showDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭showDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为当前页面顶层，仅遮罩页面，不遮罩状态栏导航条
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1610
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1610 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1610')
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
      // 步骤5：点击showDialog
      let button_show_dialog = await driver.waitForComponent(ON.id('button_show_dialog'), 2000)
      if (button_show_dialog) {
        await button_show_dialog.click()
        await Utils.sleep(500)
      }
      // 验证showDialog显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭showDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1610 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1620
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1620 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1620')
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
      // 步骤5：点击showDialog
      let button_show_dialog = await driver.waitForComponent(ON.id('button_show_dialog'), 2000)
      if (button_show_dialog) {
        await button_show_dialog.click()
        await Utils.sleep(500)
      }
      // 验证showDialog显示效果
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1620 finish.`);
      done()
    })

  })

}