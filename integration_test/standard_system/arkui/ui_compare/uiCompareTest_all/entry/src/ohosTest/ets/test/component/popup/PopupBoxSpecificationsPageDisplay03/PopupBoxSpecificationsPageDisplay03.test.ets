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

export default function popupBoxSpecificationsPageDisplay03() {

  describe('popupBoxSpecificationsPageDisplay03', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1630
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1630 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1630')
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
      // 预期结果：dialog节点为当前页面顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1630 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1650
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1650 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1650')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1650 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1660
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1660 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1660')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1670
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1670', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1670 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1670')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1670 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1690
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1690', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1690 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1690')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1690 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1700
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1700 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1700')
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
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1700 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1710
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1710 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1710')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1710 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1720
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1720', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1720 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1720')
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
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1720 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1730
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1730', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1730 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1730')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1730 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1740
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1740', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1740 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1740')
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
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1740 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1750
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1750', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1750 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1750')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1750 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1760
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1760', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1760 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1760')
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
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1760 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1770
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1770', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1770 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1770')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1770 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1780
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1780', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1780 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1780')
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
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1780 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1790
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1790', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1790 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1790')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1790 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1800
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1800', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1800 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1800')
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
      // 预期结果：此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1800 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1810
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1810', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1810 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1810')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭openCustomDialogWithController
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1810 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1820
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1820', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1820 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1820')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1820 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1880
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1880', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1880 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1880')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
      await Utils.sleep(2000)
      // 点击遮蔽层关闭openCustomDialogWithController
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1880 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1890
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1890', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1890 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1890')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1890 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1910
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1910', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1910 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1910')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为当前页面顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1910 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1960
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1960', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1960 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1960')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1960 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1970
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1970', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1970 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay1970')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1970 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2000
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2000', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2000 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2000')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2000 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2010
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2010 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2010')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2030
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2030 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2030')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2040
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2040 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2040')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2070
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2070 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2070')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2080
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2080 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2080')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2090
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2090 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2090')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller_on_mask'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2100
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2100 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2100')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2120
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2120 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2120')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller_on_mask'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2130
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2130 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2130')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2160
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2160 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2160')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller_on_mask'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为全局窗口顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2170
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2170 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2170')
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
      // 步骤5：点击uiContext_openCustomDialogWithController
      let button_custom_dialog_controller = await driver.waitForComponent(ON.id('button_custom_dialog_controller'), 2000)
      if (button_custom_dialog_controller) {
        await button_custom_dialog_controller.click()
        await Utils.sleep(500)
      }
      // 验证openCustomDialogWithController显示效果
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2180
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2180 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2180')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2190
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2190 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2190')
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
      // 预期结果：切换界面，弹窗跟随在新的页面中显示，左滑或者点击空白，弹窗退出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2250
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2250 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2250')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2260
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2260 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2260')
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
      // 预期结果：切换界面，弹窗跟随在新的页面中显示，左滑或者点击空白，弹窗退出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2290
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2290 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2290')
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
      // 步骤5：点击uiContext_openCustomDialog
      let button_custom_dialog = await driver.waitForComponent(ON.id('button_custom_dialog_on_mask'), 2000)
      if (button_custom_dialog) {
        await button_custom_dialog.click()
        await Utils.sleep(500)
      }
      // 验证uiContext_openCustomDialog显示效果
      await Utils.sleep(2000)
      // 预期结果：dialog节点为当前页面顶层，遮罩整个窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2330
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2330 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2330')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2340
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2340 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2340')
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
      // 预期结果：切换界面，弹窗跟随在新的页面中显示，左滑或者点击空白，弹窗退出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2370
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2370 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2370')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2380
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2380 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2380')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2400
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2400 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2400')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2410
     * @tc.name   : Popupbox specifications pagedisplay
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2410 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay2410')
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2410 finish.`);
      done()
    })

  })

}