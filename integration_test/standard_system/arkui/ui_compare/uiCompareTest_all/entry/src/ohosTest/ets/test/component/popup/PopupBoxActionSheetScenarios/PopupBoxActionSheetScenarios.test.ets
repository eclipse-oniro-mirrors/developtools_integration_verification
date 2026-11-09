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

export default function popupBoxActionSheetScenarios() {

  describe('popupBoxActionSheetScenarios', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0010
     * @tc.name   : Popupbox actionsheet scenarios
     * @tc.desc   : Verify popupbox actionsheet scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0010 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupBoxActionSheetScenarios/PopupBoxActionSheetScenarios0010')
      let driver = await Driver.create()
      await driver.waitForIdle(500,3000)

      // 步骤2：查找按钮组件
      let popup_button_scenarios_0010 = await driver.waitForComponent(ON.id('popup_button_scenarios_0010'), 1000)

      // 步骤3：点击按钮弹出无按钮弹窗列表选择弹窗，无蒙层，showInSubWindow设置为true
      await popup_button_scenarios_0010.click()
      await driver.waitForIdle(2000,3000)

      // 步骤4：验证弹窗弹出效果，此时应该显示列表选择弹窗且无蒙层
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0010 finish.`);
      done()
    })






    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0020
     * @tc.name   : Popupbox actionsheet scenarios
     * @tc.desc   : Verify popupbox actionsheet scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0020 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupBoxActionSheetScenarios/PopupBoxActionSheetScenarios0020')
      let driver = await Driver.create()
      await driver.waitForIdle(500,3000)

      // 步骤2：查找按钮组件
      let popup_button_scenarios_0020 = await driver.waitForComponent(ON.id('popup_button_scenarios_0020'), 1000)

      // 步骤3：点击按钮弹出无按钮弹窗列表选择弹窗，有蒙层，showInSubWindow设置为true
      await popup_button_scenarios_0020.click()
      await driver.waitForIdle(2000,3000)

      // 步骤4：验证弹窗弹出效果，此时应该显示列表选择弹窗且有蒙层
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0030
     * @tc.name   : Popupbox actionsheet scenarios
     * @tc.desc   : Verify popupbox actionsheet scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0030 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupBoxActionSheetScenarios/PopupBoxActionSheetScenarios0030')
      let driver = await Driver.create()
      await driver.waitForIdle(500,3000)

      // 步骤2：查找按钮组件
      let popup_button_scenarios_0030 = await driver.waitForComponent(ON.id('popup_button_scenarios_0030'), 1000)

      // 步骤3：点击按钮弹出有按钮弹窗列表选择弹窗，无蒙层，showInSubWindow设置为true
      await popup_button_scenarios_0030.click()
      await driver.waitForIdle(2000,3000)

      // 步骤4：验证弹窗弹出效果，此时应该显示带按钮的列表选择弹窗且无蒙层
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0040
     * @tc.name   : Popupbox actionsheet scenarios
     * @tc.desc   : Verify popupbox actionsheet scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0040 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupBoxActionSheetScenarios/PopupBoxActionSheetScenarios0040')
      let driver = await Driver.create()
      await driver.waitForIdle(500,3000)

      // 步骤2：查找按钮组件
      let popup_button_scenarios_0040 = await driver.waitForComponent(ON.id('popup_button_scenarios_0040'), 1000)

      // 步骤3：点击按钮弹出有按钮弹窗列表选择弹窗，有蒙层，showInSubWindow设置为true
      await popup_button_scenarios_0040.click()
      await driver.waitForIdle(2000,3000)

      // 步骤4：验证弹窗弹出效果，此时应该显示带按钮的列表选择弹窗且有蒙层
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0100
     * @tc.name   : Popupbox actionsheet scenarios
     * @tc.desc   : Verify popupbox actionsheet scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0100 start.`);
      // 步骤1：页面初始化，编译列表弹窗
      Settings.createWindow('testability/pages/component/popup/PopupBoxActionSheetScenarios/PopupBoxActionSheetScenarios0100')
      let driver = await Driver.create()
      await driver.waitForIdle(500,3000)

      // 步骤2：验证编译报错情况 - 不传参数直接调用ActionSheet.show()会导致编译报错
      // 注意：此页面包含会导致编译报错的代码，用于验证编译时错误检查
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0120
     * @tc.name   : Popupbox actionsheet scenarios
     * @tc.desc   : Verify popupbox actionsheet scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0120 start.`);
      // 步骤1：进入"actionSheet"界面
      Settings.createWindow('testability/pages/component/popup/PopupBoxActionSheetScenarios/PopupBoxActionSheetScenarios0120')
      let driver = await Driver.create()
      await driver.waitForIdle(500,3000)

      // 步骤2：点击"confirm button1"弹出弹框，然后点击遮障层验证cancel回调
      let confirm_button1_scenarios_0120 = await driver.waitForComponent(ON.id('confirm_button1_scenarios_0120'), 1000)
      await confirm_button1_scenarios_0120.click()
      await driver.waitForIdle(1000,3000)

      // 模拟点击遮障层关闭弹窗，验证cancel回调是否正确触发
      // 点击弹窗外部区域（遮障层）来关闭弹窗
      await driver.click(100, 100)
      await driver.waitForIdle(1000,3000)

      // 验证cancel回调是否正确触发，应该显示"UIContext ActionSheet canceled"
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ACTIONSHEET_SCENARIOS_0120 finish.`);
      done()
    })


  })
}