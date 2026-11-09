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

export default function popupboxFollowdialog() {

  describe('popupboxFollowdialog', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0030
     * @tc.name   : Set the targetBuilder parameter to undefined
     * @tc.desc   : Verify popupbox followdialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0030 start.`);
      // 步骤1：在IDE中注意开targetBuilder设置为undefined的代码行
      Settings.createWindow('testability/pages/component/popup/PopupboxFollowdialog/PopupboxFollowdialog0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0040
     * @tc.name   : Set the visible parameter to false
     * @tc.desc   : Verify popupbox followdialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0040 start.`);
      // 步骤1：打开PopoverDialog1弹窗的页面
      Settings.createWindow('testability/pages/component/popup/PopupboxFollowdialog/PopupboxFollowdialog0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击false按钮，查看弹窗是否弹出
      let falseButton = await driver.waitForComponent(ON.id('PopupboxFollowdialog0040_001'), 500)
      await falseButton.click()
      await Utils.sleep(1000)
      // 步骤3：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0050
     * @tc.name   : Set the visible parameter to true
     * @tc.desc   : Verify popupbox followdialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0050 start.`);
      // 步骤1：打开PopoverDialog1弹窗的页面
      Settings.createWindow('testability/pages/component/popup/PopupboxFollowdialog/PopupboxFollowdialog0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击true按钮，查看弹窗是否弹出
      let trueButton = await driver.waitForComponent(ON.id('PopupboxFollowdialog0050_001'), 500)
      await trueButton.click()
      await Utils.sleep(1000)
      // 步骤3：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0060
     * @tc.name   : Set the visible parameter to undefined
     * @tc.desc   : Verify popupbox followdialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0060 start.`);
      // 步骤1：打开PopoverDialog1弹窗的页面
      Settings.createWindow('testability/pages/component/popup/PopupboxFollowdialog/PopupboxFollowdialog0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击undefined按钮，查看弹窗是否弹出
      let undefinedButton = await driver.waitForComponent(ON.id('PopupboxFollowdialog0060_001'), 500)
      await undefinedButton.click()
      await Utils.sleep(1000)
      // 步骤3：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0070
     * @tc.name   : Dynamically switch visible property value
     * @tc.desc   : Verify popupbox followdialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0070 start.`);
      // 步骤1：打开PopoverDialog1弹窗的页面
      Settings.createWindow('testability/pages/component/popup/PopupboxFollowdialog/PopupboxFollowdialog0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击PopoverDialog打开弹窗
      let openButton = await driver.waitForComponent(ON.id('PopupboxFollowdialog0070_001'), 500)
      await openButton.click()
      await Utils.sleep(1000)
      // 步骤3：点击弹窗内容中的false按钮
      let falseButton = await driver.waitForComponent(ON.id('PopupboxFollowdialog0070_002'), 500)
      await falseButton.click()
      await Utils.sleep(1000)
      // 步骤4：重复步骤2，点击弹窗内容中的true按钮
      let trueButton = await driver.waitForComponent(ON.id('PopupboxFollowdialog0070_003'), 500)
      await trueButton.click()
      await Utils.sleep(1000)
      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0090
     * @tc.name   : Verify arrowOffset less than radius arrow display position and style
     * @tc.desc   : Verify popupbox followdialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0090 start.`);
      // 步骤1：打开PopoverDialog3弹窗的页面
      Settings.createWindow('testability/pages/component/popup/PopupboxFollowdialog/PopupboxFollowdialog0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：arrowOffset设置为25，radius设置默认值32
      // 步骤3：点击Click me按钮，查看气泡的弹窗显示
      let clickMeButton = await driver.waitForComponent(ON.text('Click me'), 500)
      await clickMeButton.click()
      await Utils.sleep(1000)
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0100
     * @tc.name   : Verify popover dynamically switch arrowPointPosition property value display
     * @tc.desc   : Verify popupbox followdialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0100 start.`);
      // 步骤1：打开PopoverDialog3弹窗的页面
      Settings.createWindow('testability/pages/component/popup/PopupboxFollowdialog/PopupboxFollowdialog0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：arrowPointPosition设置为Center，点击Click me按钮，查看气泡的箭头的显示位置
      let centerButton = await driver.waitForComponent(ON.id('PopupboxFollowdialog0100_001'), 500)
      await centerButton.click()
      await Utils.sleep(500)
      let clickMeButton = await driver.waitForComponent(ON.text('Click me'), 500)
      await clickMeButton.click()
      await Utils.sleep(1000)
      // 步骤3：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0110
     * @tc.name   : Verify popover dynamically switch Placement property value display
     * @tc.desc   : Verify popupbox followdialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0110 start.`);
      // 步骤1：打开PopoverDialog3弹窗的页面
      Settings.createWindow('testability/pages/component/popup/PopupboxFollowdialog/PopupboxFollowdialog0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：width设置为200
      // 步骤3：Placement设置为Left，点击Click me按钮，查看气泡的弹窗显示位置
      let leftButton = await driver.waitForComponent(ON.id('PopupboxFollowdialog0110_001'), 500)
      await leftButton.click()
      await Utils.sleep(500)
      let clickMeButton = await driver.waitForComponent(ON.text('Click me'), 500)
      await clickMeButton.click()
      await Utils.sleep(1000)
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0120
     * @tc.name   : Verify popover dynamically switch popup style property value display
     * @tc.desc   : Verify popupbox followdialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0120 start.`);
      // 步骤1：打开PopoverDialog2弹窗的页面
      Settings.createWindow('testability/pages/component/popup/PopupboxFollowdialog/PopupboxFollowdialog0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击PopoverDialog打开弹窗
      let openButton = await driver.waitForComponent(ON.id('PopupboxFollowdialog0120_001'), 500)
      await openButton.click()
      await Utils.sleep(1000)
      // 步骤3：多次点击弹窗内容中的test++按钮，动态切换样式属性的值，查看弹窗的样式是否和设置的属性值保持一致
      let testButton = await driver.waitForComponent(ON.id('PopupboxFollowdialog0120_002'), 500)
      await testButton.click()
      await Utils.sleep(500)
      await testButton.click()
      await Utils.sleep(500)
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0130
     * @tc.name   : Verify popover parameter is required
     * @tc.desc   : Verify popupbox followdialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0130 start.`);
      // 步骤1：在IDE中注释后含popover参数的代码行
      Settings.createWindow('testability/pages/component/popup/PopupboxFollowdialog/PopupboxFollowdialog0130')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0130 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0140
     * @tc.name   : Verify targetBuilder parameter is required
     * @tc.desc   : Verify popupbox followdialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0140 start.`);
      // 步骤1：在IDE中注释后含targetBuilder参数的代码行
      Settings.createWindow('testability/pages/component/popup/PopupboxFollowdialog/PopupboxFollowdialog0140')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0150
     * @tc.name   : Verify visible parameter is required
     * @tc.desc   : Verify popupbox followdialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0150 start.`);
      // 步骤1：在IDE中注释后含visible参数的代码行
      Settings.createWindow('testability/pages/component/popup/PopupboxFollowdialog/PopupboxFollowdialog0150')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FOLLOWDIALOG_0150 finish.`);
      done()
    })


  })
}