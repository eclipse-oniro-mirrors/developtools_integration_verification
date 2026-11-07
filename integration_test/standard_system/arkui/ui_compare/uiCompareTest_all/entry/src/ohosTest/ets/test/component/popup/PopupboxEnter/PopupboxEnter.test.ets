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

export default function popupboxEnter() {

  describe('popupboxEnter', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0100
     * @tc.name   : AlertDialog event interaction normalization
     * @tc.desc   : Verify popupbox enter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0100 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxEnter/PopupboxEnter0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击按钮打开AlertDialog
      let AlertDialogbutton = await driver.waitForComponent(ON.id('PopupboxEnter0100_001'), 500)
      await AlertDialogbutton.click()
      await Utils.sleep(1000)
      // 步骤3：点击button按钮
      let clickbutton = await driver.waitForComponent(ON.text('button'), 500)
      await clickbutton.click()
      await Utils.sleep(1000)
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0380
     * @tc.name   : promptAction.showDialog event interaction normalization
     * @tc.desc   : Verify popupbox enter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0380 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxEnter/PopupboxEnter0380')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击按钮打开showDialog
      let showDialogButton = await driver.waitForComponent(ON.id('PopupboxEnter0380_001'), 500)
      await showDialogButton.click()
      await Utils.sleep(1000)
      // 步骤3：点击button按钮
      let clickbutton = await driver.waitForComponent(ON.text('button'), 500)
      await clickbutton.click()
      await Utils.sleep(1000)
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0380 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0390
     * @tc.name   : promptAction.showDialog keyboard direction key input, focus up
     * @tc.desc   : Verify popupbox enter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0390 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxEnter/PopupboxEnter0390')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击按钮打开showDialog
      let showDialogButton = await driver.waitForComponent(ON.id('PopupboxEnter0390_001'), 500)
      await showDialogButton.click()
      await Utils.sleep(1000)
      // 步骤3：选择向上对焦模式
      await driver.triggerKey(2012)
      await Utils.sleep(500)
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0390 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0400
     * @tc.name   : promptAction.showDialog keyboard direction key input, focus down
     * @tc.desc   : Verify popupbox enter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0400 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxEnter/PopupboxEnter0400')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击按钮打开showDialog
      let showDialogButton = await driver.waitForComponent(ON.id('PopupboxEnter0400_001'), 500)
      await showDialogButton.click()
      await Utils.sleep(1000)
      // 步骤3：选择向下对焦模式
      await driver.triggerKey(2013)
      await Utils.sleep(500)
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0400 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0420
     * @tc.name   : promptAction.showDialog keyboard direction key input, offset 30px
     * @tc.desc   : Verify popupbox enter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0420 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxEnter/PopupboxEnter0420')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击按钮打开showDialog
      let showDialogButton = await driver.waitForComponent(ON.id('PopupboxEnter0420_001'), 500)
      await showDialogButton.click()
      await Utils.sleep(1000)
      // 步骤3：选择偏移30px模式
      await driver.triggerKey(2013)
      await Utils.sleep(500)
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0420 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0430
     * @tc.name   : promptAction.showDialog masked popup
     * @tc.desc   : Verify popupbox enter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0430 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxEnter/PopupboxEnter0430')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击按钮打开外层弹窗
      let outerDialogButton = await driver.waitForComponent(ON.id('PopupboxEnter0430_001'), 500)
      await outerDialogButton.click()
      await Utils.sleep(1000)
      // 步骤3：点击打开内层弹窗按钮
      let openInnerButton = await driver.waitForComponent(ON.text('open inner'), 500)
      await openInnerButton.click()
      await Utils.sleep(1000)
      // 步骤4：按tab键改变焦点
      await driver.triggerKey(2049)
      await Utils.sleep(500)
      // 步骤5：关闭内层弹窗后按tab键观察默认焦点位置
      let innerButton = await driver.waitForComponent(ON.text('button'), 500)
      await innerButton.click()
      await Utils.sleep(1000)
      await driver.triggerKey(2049)
      await Utils.sleep(500)
      // 步骤6：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0430 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0440
     * @tc.name   : promptAction.showDialog with showInSubWindow set to true
     * @tc.desc   : Verify popupbox enter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0440 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxEnter/PopupboxEnter0440')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击按钮打开showDialog
      let showDialogButton = await driver.waitForComponent(ON.id('PopupboxEnter0440_001'), 500)
      await showDialogButton.click()
      await Utils.sleep(1000)
      // 步骤3：查看子窗口菜单焦点
      await Utils.sleep(500)
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0440 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0450
     * @tc.name   : promptAction.showDialog layer overlay popup
     * @tc.desc   : Verify popupbox enter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0450 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxEnter/PopupboxEnter0450')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击按钮打开全屏覆盖弹窗
      let fullScreenButton = await driver.waitForComponent(ON.id('PopupboxEnter0450_001'), 500)
      await fullScreenButton.click()
      await Utils.sleep(1000)
      // 步骤3：按tab键查看焦点
      await driver.triggerKey(2049)
      await Utils.sleep(500)
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0450 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0460
     * @tc.name   : promptAction.showDialog default response to ENTER key
     * @tc.desc   : Verify popupbox enter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0460 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxEnter/PopupboxEnter0460')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击按钮打开showDialog
      let showDialogButton = await driver.waitForComponent(ON.id('PopupboxEnter0460_001'), 500)
      await showDialogButton.click()
      await Utils.sleep(1000)
      // 步骤3：按enter键查看是否默认响应焦点enter键的按钮
      await driver.triggerKey(2054)
      await Utils.sleep(1000)
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0460 finish.`);
      done()
    })


  })
}