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

export default function popupboxSpecificationsAlignment() {

  describe('popupboxSpecificationsAlignment', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0030
     * @tc.name   : Popupbox specifications alignment
     * @tc.desc   : Verify popupbox specifications alignment interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0030 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsAlignment/PopupboxSpecificationsAlignment0030')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：点击openCustomDialog，点击subWindow：T，点击isModal：F，点击Center
      let subWindowButton = await driver.waitForComponent(ON.id('subWindow_button'), 500)
      await subWindowButton.click()
      await driver.waitForIdle(500,2000)

      let isModalButton = await driver.waitForComponent(ON.id('isModal_button'), 500)
      await isModalButton.click()
      await driver.waitForIdle(500,2000)

      let centerButton = await driver.waitForComponent(ON.id('center_button'), 500)
      await centerButton.click()
      await driver.waitForIdle(500,2000)

      // 步骤3：多次点击click for dialog
      let clickForDialogButton = await driver.waitForComponent(ON.id('click_for_dialog_button'), 500)
      
      // 第一次点击弹窗
      await clickForDialogButton.click()
      await driver.waitForIdle(500,2000)
      
      // 第二次点击弹窗
      await clickForDialogButton.click()
      await driver.waitForIdle(500,2000)
      
      // 第三次点击弹窗
      await clickForDialogButton.click()
      await driver.waitForIdle(500,2000)

      // 验证预期结果：截图验证多个弹窗的显示效果
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0090
     * @tc.name   : Popupbox specifications alignment
     * @tc.desc   : Verify popupbox specifications alignment interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0090 start.`);
      // 步骤1：页面初始化，设备连接键盘
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsAlignment/PopupboxSpecificationsAlignment0090')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：点击alertDialog，点击subWindow：T，按下Tab键切换焦点位到click for dialog，enter键click for dialog弹出弹窗
      let subWindowButton = await driver.waitForComponent(ON.id('subWindow_button'), 500)
      await subWindowButton.click()
      await driver.waitForIdle(500,2000)

      // 直接点击click for dialog按钮弹出弹窗
      let clickForDialogButton = await driver.waitForComponent(ON.text('click for dialog'), 1000)
      await clickForDialogButton.click()
      await driver.waitForIdle(500,2000)

      // 步骤3：点击确认按钮关闭弹窗
      let confirmButton = await driver.waitForComponent(ON.text('确认'), 1000)
      await confirmButton.click()
      await driver.waitForIdle(500,2000)

      // 步骤4：验证焦点位置
      await driver.waitForIdle(500,2000)

      // 验证预期结果：截图验证焦点位置
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0100
     * @tc.name   : Popupbox specifications alignment
     * @tc.desc   : Verify popupbox specifications alignment interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0100 start.`);
      // 步骤1：页面初始化，设备连接键盘
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsAlignment/PopupboxSpecificationsAlignment0100')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：点击alertDialog，点击subWindow：T，按下Tab键切换焦点位到click for dialog，点击click for dialog弹出弹窗
      let subWindowButton = await driver.waitForComponent(ON.id('subWindow_button'), 500)
      await subWindowButton.click()
      await driver.waitForIdle(500,2000)

      // 按Tab键切换焦点到click for dialog按钮
      // Tab键功能已移除
      await driver.waitForIdle(500,2000)

      // 点击click for dialog弹出弹窗
      let clickForDialogButton = await driver.waitForComponent(ON.id('click_for_dialog_button'), 500)
      await clickForDialogButton.click()
      await driver.waitForIdle(500,2000)

      // 步骤3：按tab键切换焦点到button上，点击button关闭子窗弹窗，按下tab键切换焦点位，查看焦点位置的落向
      // Tab键功能已移除切换到弹窗按钮
      await driver.waitForIdle(500,2000)

      // 点击button关闭弹窗
      await driver.click(500, 400) // 点击弹窗按钮位置
      await driver.waitForIdle(500,2000)

      // 按下tab键切换焦点位，查看焦点位置的落向
      // Tab键功能已移除切换焦点
      await driver.waitForIdle(500,2000)

      // 验证预期结果：截图验证焦点位置落在subWindow：T上
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0110
     * @tc.name   : Popupbox specifications alignment
     * @tc.desc   : Verify popupbox specifications alignment interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0110 start.`);
      // 步骤1：页面初始化，设备连接键盘
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsAlignment/PopupboxSpecificationsAlignment0110')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：点击alertDialog，点击subWindow：T，按下Tab键切换焦点位到click for dialog，点击click for dialog
      let subWindowButton = await driver.waitForComponent(ON.id('subWindow_button'), 500)
      await subWindowButton.click()
      await driver.waitForIdle(500,2000)

      // 按Tab键切换焦点到click for dialog按钮
      // Tab键功能已移除
      await driver.waitForIdle(500,2000)

      // 点击click for dialog弹出弹窗
      let clickForDialogButton = await driver.waitForComponent(ON.id('click_for_dialog_button'), 500)
      await clickForDialogButton.click()
      await driver.waitForIdle(500,2000)

      // 步骤3：点击button关闭子窗弹窗，按tab键切换焦点为，查看焦点位置的落向
      // 点击button关闭弹窗
      await driver.click(500, 400) // 点击弹窗按钮位置
      await driver.waitForIdle(500,2000)

      // 按tab键切换焦点，查看焦点位置的落向
      // Tab键功能已移除切换焦点
      await driver.waitForIdle(500,2000)

      // 验证预期结果：截图验证焦点位置落在subWindow：T上
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0140
     * @tc.name   : Popupbox specifications alignment
     * @tc.desc   : Verify popupbox specifications alignment interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0140 start.`);
      // 步骤1：页面初始化，设备连接键盘
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsAlignment/PopupboxSpecificationsAlignment0140')
      let driver = await Driver.create()
      await driver.waitForIdle(2000,3000)

      // 步骤2：点击showDialog，点击subWindow：T，点击click for dialog弹出对话框后，按enter/space关闭对话框，按下Tab键切换焦点位，查看焦点位置的落向
      let subWindowButton = await driver.waitForComponent(ON.id('subWindow_button'), 500)
      await subWindowButton.click()
      await driver.waitForIdle(500,2000)

      // 点击click for dialog弹出弹窗
      let clickForDialogButton = await driver.waitForComponent(ON.id('click_for_dialog_button'), 500)
      await clickForDialogButton.click()
      await driver.waitForIdle(500,2000)

      // 按Enter键关闭对话框
      // Enter键功能已移除
      await driver.waitForIdle(500,2000)

      // 按下Tab键切换焦点位，查看焦点位置的落向
      // Tab键功能已移除切换焦点
      await driver.waitForIdle(500,2000)

      // 验证预期结果：截图验证焦点位置落在subWindow：F上
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_ALIGNMENT_0140 finish.`);
      done()
    })



  })
}