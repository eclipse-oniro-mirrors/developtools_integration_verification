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

export default function popupBoxAlertdialogScenarios() {

  describe('popupBoxAlertdialogScenarios', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0010
     * @tc.name   : Popupbox alertdialog scenarios
     * @tc.desc   : Verify popupbox alertdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0010 start.`);
      // 步骤1-3：页面初始化，创建无按钮弹窗警告弹窗，无蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupBoxAlertdialogScenarios/PopupBoxAlertdialogScenarios0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,3000)
      
      // 步骤4-5：点击按钮弹出不带button的弹框
      let showDialogButton = await driver.waitForComponent(ON.id('show_dialog_button_0010'), 500)
      await showDialogButton.click()
      await driver.waitForIdle(2000,3000)
      
      // 预期结果：测试hap的弹框不消失（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0020
     * @tc.name   : Popupbox alertdialog scenarios
     * @tc.desc   : Verify popupbox alertdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0020 start.`);
      // 步骤1-3：页面初始化，创建无按钮弹窗警告弹窗，有蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupBoxAlertdialogScenarios/PopupBoxAlertdialogScenarios0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,3000)
      
      // 步骤4-5：点击按钮弹出不带button的弹框
      let showDialogButton = await driver.waitForComponent(ON.id('show_dialog_button_0020'), 500)
      await showDialogButton.click()
      await driver.waitForIdle(2000,3000)
      
      // 预期结果：测试hap的弹框不消失（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0030
     * @tc.name   : Popupbox alertdialog scenarios
     * @tc.desc   : Verify popupbox alertdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0030 start.`);
      // 步骤1-3：页面初始化，创建有按钮弹窗警告弹窗，无蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupBoxAlertdialogScenarios/PopupBoxAlertdialogScenarios0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,3000)
      
      // 步骤4-5：点击按钮弹出带button的弹框
      let showDialogButton = await driver.waitForComponent(ON.id('show_dialog_button_0030'), 500)
      await showDialogButton.click()
      await driver.waitForIdle(2000,3000)
      
      // 预期结果：图库能获焦（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0040
     * @tc.name   : Popupbox alertdialog scenarios
     * @tc.desc   : Verify popupbox alertdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0040 start.`);
      // 步骤1-3：页面初始化，创建有按钮弹窗警告弹窗，有蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupBoxAlertdialogScenarios/PopupBoxAlertdialogScenarios0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,3000)
      
      // 步骤4-5：点击按钮弹出带button的弹框
      let showDialogButton = await driver.waitForComponent(ON.id('show_dialog_button_0040'), 500)
      await showDialogButton.click()
      await driver.waitForIdle(2000,3000)
      
      // 预期结果：图库能获焦（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0050
     * @tc.name   : Popupbox alertdialog scenarios
     * @tc.desc   : Verify popupbox alertdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0050 start.`);
      // 步骤1：页面初始化，编译hap并安装
      Settings.createWindow('testability/pages/component/popup/PopupBoxAlertdialogScenarios/PopupBoxAlertdialogScenarios0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,3000)
      
      // 步骤2：点击"警告弹窗"按钮
      let alertDialogButton = await driver.waitForComponent(ON.id('alert_dialog_button_0050'), 500)
      await alertDialogButton.click()
      await driver.waitForIdle(2000,3000)
      
      // 步骤3：点击"场景测试"按钮
      let scenarioTestButton = await driver.waitForComponent(ON.id('scenario_test_button_0050'), 500)
      await scenarioTestButton.click()
      await driver.waitForIdle(2000,3000)
      
      // 步骤4：点击"AlertDialogParamWithConfirm测试用例1"按钮
      let confirmTestButton = await driver.waitForComponent(ON.id('confirm_test_button_0050'), 500)
      await confirmTestButton.click()
      await driver.waitForIdle(2000,3000)
      
      // 预期结果：多层弹窗堆叠显示，可通过键盘TAB、空格、ESC键进行操作
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0080
     * @tc.name   : Popupbox alertdialog scenarios
     * @tc.desc   : Verify popupbox alertdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0080 start.`);
      // 步骤1：进入警告弹窗界面
      Settings.createWindow('testability/pages/component/popup/PopupBoxAlertdialogScenarios/PopupBoxAlertdialogScenarios0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,3000)
      
      // 步骤2：点击"two button dialog"按钮
      let twoButtonDialog = await driver.waitForComponent(ON.id('two_button_dialog_0080'), 500)
      await twoButtonDialog.click()
      await driver.waitForIdle(2000,3000)
      
      // 步骤3：点击警告弹窗内的"button"按钮
      let buttonInDialog = await driver.waitForComponent(ON.text('button'), 500)
      await buttonInDialog.click()
      await driver.waitForIdle(2000,3000)
      
      // 预期结果：警告弹窗正常弹出和退出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0090
     * @tc.name   : Popupbox alertdialog scenarios
     * @tc.desc   : Verify popupbox alertdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0090 start.`);
      // 步骤1：页面初始化，设置两个按钮都绑定警告弹窗事件，都设置cancel函数
      Settings.createWindow('testability/pages/component/popup/PopupBoxAlertdialogScenarios/PopupBoxAlertdialogScenarios0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,3000)

      // 步骤2：点击"one button dialog"，再点击遮障层
      let oneButtonDialog = await driver.waitForComponent(ON.id('one_button_dialog_0090'), 500)
      await oneButtonDialog.click()
      await driver.waitForIdle(2000,3000)

      // 点击遮障层关闭弹窗（通过点击弹窗外部区域）
      await driver.click(100, 100)
      await driver.waitForIdle(2000,3000)

      // 步骤3：点击"two button dialog"，再点击遮障层
      let twoButtonDialog = await driver.waitForComponent(ON.id('two_button_dialog_0090'), 500)
      await twoButtonDialog.click()
      await driver.waitForIdle(2000,3000)

      // 点击遮障层关闭弹窗（通过点击弹窗外部区域）
      await driver.click(100, 100)
      await driver.waitForIdle(2000,3000)

      // 预期结果：验证cancel回调正确触发，日志显示"Alert1 Close"和"Alert2 Close"
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_SCENARIOS_0090 finish.`);
      done()
    })






  })
}