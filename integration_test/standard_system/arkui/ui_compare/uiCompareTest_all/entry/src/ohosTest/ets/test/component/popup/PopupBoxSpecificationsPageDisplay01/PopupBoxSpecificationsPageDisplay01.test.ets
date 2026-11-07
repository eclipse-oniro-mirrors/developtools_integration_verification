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

export default function popupBoxSpecificationsPageDisplay01() {

  describe('popupBoxSpecificationsPageDisplay01', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0010
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0010 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0010')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500) // 增加等待时间，确保页面完全加载
      // 步骤2：点击【1. 点击100%mask】
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤3：点击【2. 点击ActionSheet】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 步骤4：验证ActionSheet显示效果
      await Utils.sleep(2000) // 等待ActionSheet完全显示
      // 步骤5：点击遮蔽层关闭ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0020
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0020 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0020')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500) // 增加等待时间，确保页面完全加载
      // 步骤2：点击【4. 点击向下偏移】
      let button_offset_down = await driver.waitForComponent(ON.id('button_offset_down'), 2000)
      if (button_offset_down) {
        await button_offset_down.click()
        await Utils.sleep(500)
      }
      // 步骤3：点击【5. 点击ActionSheet】
      let button_show_actionsheet = await driver.waitForComponent(ON.id('button_show_actionsheet'), 2000)
      if (button_show_actionsheet) {
        await button_show_actionsheet.click()
        await Utils.sleep(500)
      }
      // 步骤4：验证ActionSheet显示效果（带偏移）
      await Utils.sleep(2000) // 等待ActionSheet完全显示
      // 步骤5：点击【返回首页】按钮
      let button_return_home = await driver.waitForComponent(ON.id('button_return_home'), 2000)
      if (button_return_home) {
        await button_return_home.click()
        await Utils.sleep(500)
      }
      // 步骤6：验证页面切换和弹窗跟随
      await Utils.sleep(1000) // 等待页面切换完成
      // 预期结果：切换界面，弹窗跟随在新的页面中显示
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0050
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0050', Level.LEVEL3,
      async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0050 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0050')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500) // 增加等待时间，确保页面完全加载
      // 步骤2：点击【4. 点击100%mask】
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤3：点击【5. 点击ActionSheet】
      let button_show_actionsheet = await driver.waitForComponent(ON.id('button_show_actionsheet'), 2000)
      if (button_show_actionsheet) {
        await button_show_actionsheet.click()
        await Utils.sleep(500)
      }
      // 步骤4：验证ActionSheet在子窗口中的显示效果
      await Utils.sleep(2000) // 等待ActionSheet完全显示
      // 步骤5：点击【返回首页】按钮
      let button_return_home = await driver.waitForComponent(ON.id('button_return_home'), 2000)
      if (button_return_home) {
        await button_return_home.click()
        await Utils.sleep(500)
      }
      // 步骤6：验证embedded模式在子窗口中的行为
      await Utils.sleep(1000) // 等待页面切换完成
      // 预期结果：embedded只在非子窗上显示，showInSubWindow=true后不生效
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0060
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0060 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0060')
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
      // 步骤5：点击ActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0070
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0070 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0070')
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
      // 步骤5：点击ActionSheet
      let button_show_actionsheet = await driver.waitForComponent(ON.id('button_show_actionsheet'), 2000)
      if (button_show_actionsheet) {
        await button_show_actionsheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果（带偏移）
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0080
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0080 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0080')
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
      // 步骤5：点击ActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为当前页面顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0100
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0100 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0100')
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
      // 步骤5：点击ActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0110
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0110 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0110')
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
      // 步骤5：点击ActionSheet
      let button_show_actionsheet = await driver.waitForComponent(ON.id('button_show_actionsheet'), 2000)
      if (button_show_actionsheet) {
        await button_show_actionsheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果（带偏移）
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0120
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0120 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0120')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:EMBEDDED (已内置)
      // 步骤3：设置ImmersiveMode设置为异常值，设置levelUniqueId为正常值 (已内置)
      // 步骤4：点击100%mask
      let button_100_mask = await driver.waitForComponent(ON.id('button_100_mask'), 2000)
      if (button_100_mask) {
        await button_100_mask.click()
        await Utils.sleep(500)
      }
      // 步骤5：点击ActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为当前页面顶层，仅遮罩页面，不遮罩状态栏导航条
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0140
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0140 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0140')
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
      // 步骤5：点击ActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0150
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0150 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0150')
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
      // 步骤5：点击ActionSheet
      let button_show_actionsheet = await driver.waitForComponent(ON.id('button_show_actionsheet'), 2000)
      if (button_show_actionsheet) {
        await button_show_actionsheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果（带偏移）
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0160
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0160 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0160')
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
      // 步骤5：点击ActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0170
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0170 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0170')
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
      // 步骤5：点击ActionSheet
      let button_show_actionsheet = await driver.waitForComponent(ON.id('button_show_actionsheet'), 2000)
      if (button_show_actionsheet) {
        await button_show_actionsheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果（带偏移）
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0180
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0180 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0180')
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
      // 步骤5：点击ActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0190
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0190 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0190')
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
      // 步骤5：点击ActionSheet
      let button_show_actionsheet = await driver.waitForComponent(ON.id('button_show_actionsheet'), 2000)
      if (button_show_actionsheet) {
        await button_show_actionsheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果（带偏移）
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0200
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0200 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0200')
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
      // 步骤5：点击ActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0210
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0210 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0210')
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
      // 步骤5：点击ActionSheet
      let button_show_actionsheet = await driver.waitForComponent(ON.id('button_show_actionsheet'), 2000)
      if (button_show_actionsheet) {
        await button_show_actionsheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果（带偏移）
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0220
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0220 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0220')
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
      // 步骤5：点击ActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0230
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0230 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0230')
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
      // 步骤5：点击ActionSheet
      let button_show_actionsheet = await driver.waitForComponent(ON.id('button_show_actionsheet'), 2000)
      if (button_show_actionsheet) {
        await button_show_actionsheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果（带偏移）
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0240
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0240 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0240')
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
      // 步骤5：点击ActionSheet
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 2000)
      if (button_action_sheet) {
        await button_action_sheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0250
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0250 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0250')
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
      // 步骤5：点击ActionSheet
      let button_show_actionsheet = await driver.waitForComponent(ON.id('button_show_actionsheet'), 2000)
      if (button_show_actionsheet) {
        await button_show_actionsheet.click()
        await Utils.sleep(500)
      }
      // 验证ActionSheet显示效果（带偏移）
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0260
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0260 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0260')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0270
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0270 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0270')
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
      // 预期结果：切换界面，弹窗跟随在新的页面中显示，左滑或者点击空白，弹窗退出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0320
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0320 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0320')
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
      // 预期结果：切换界面，弹窗跟随在新的页面中显示，左滑或者点击空白，弹窗退出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0330
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0330 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0330')
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
      // 预期结果：dialog节点为当前页面顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0350
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0350 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0350')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0360
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0360 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0360')
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
      // 预期结果：切换界面，弹窗跟随在新的页面中显示，左滑或者点击空白，弹窗退出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0390
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0390 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0390')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0400
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0400 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0400')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0410
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0410 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0410')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0420
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0420 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0420')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0430
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0430 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0430')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0440
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0440 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0440')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0450
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0450 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0450')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0460
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0460 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0460')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0470
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0470 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0470')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0480
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0480 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0480')
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
      // 步骤6：点击最上方的返回首页
      let button_return_home = await driver.waitForComponent(ON.id('button_return_home'), 2000)
      if (button_return_home) {
        await button_return_home.click()
        await Utils.sleep(1000)
      }
      // 验证弹窗跟随到新页面
      await Utils.sleep(2000)
      // 点击空白区域关闭AlertDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog可以被层覆盖控制，切换界面dialog跟随到新页面，点击空白处或按钮能关闭dialog
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0490
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0490 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0490')
      let driver: Driver = Driver.create();
      await Utils.sleep(1500)
      // 步骤2：设置LevelMode:异常值 (已内置)
      // 步骤3：设置ImmersiveMode设置为异常值 (已内置)
      // 步骤4：设置100%mask
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
      // 点击确认按钮关闭AlertDialog
      let dialog_confirm_button = await driver.waitForComponent(ON.text('确认'), 2000)
      if (dialog_confirm_button) {
        await dialog_confirm_button.click()
        await Utils.sleep(500)
      }
      // 预期结果：dialog占点为全屏窗口对象，弹窗正常显示
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0500
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0500 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0500')
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
      // 步骤6：点击最上方的返回首页
      let button_return_home = await driver.waitForComponent(ON.id('button_return_home'), 2000)
      if (button_return_home) {
        await button_return_home.click()
        await Utils.sleep(1000)
      }
      // 验证弹窗跟随到新页面
      await Utils.sleep(2000)
      // 点击空白区域关闭AlertDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog可以被层覆盖控制，切换界面dialog跟随到新页面，点击空白处或按钮能关闭dialog
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0570
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0570 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0570')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0580
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0580 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0580')
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
      // 预期结果：切换界面，弹窗跟随在新的页面中显示，左滑或者点击空白，弹窗退出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0640
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0640 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0640')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0640 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0650
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0650 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0650')
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
      // 预期结果：切换界面，弹窗跟随在新的页面中显示，左滑或者点击空白，弹窗退出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0650 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0670
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0670', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0670 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0670')
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
      // 预期结果：dialog节点为当前页面顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0670 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0720
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0720', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0720 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay0720')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0720 finish.`);
      done()
    })

  })
}