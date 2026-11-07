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
import { BusinessError } from '@kit.BasicServicesKit'

export default function dialogAvoidTest() {
  describe('dialogAvoidTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }
      Settings.windowClass.destroyWindow((err: BusinessError) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0020
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0020 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 2、AvoidMode按钮点击为"AvoidMode 1/1"状态（在打开弹窗前点击，避免弹窗遮挡）
      let avoidModeButton: Component = await driver.waitForComponent(ON.id('avoidModeButton_01'), 1000);
      await avoidModeButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_01'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 3、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_01'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 4、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_01'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 5、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0020')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0030
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0030 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_02'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_02'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_02'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0030')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0050
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0050 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、点击distance按钮为"distance 16"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_03'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_03'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_03'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_03'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0050')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0060
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0060 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、点击distance按钮为"distance 50"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_04'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_04'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_04'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_04'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0060')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0070
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0070 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、点击distance按钮为"distance 49"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_05'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_05'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_05'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_05'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0070')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0080
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0080 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、点击distance按钮为"distance 100"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_06'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_06'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_06'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_06'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0080')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0090
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0090 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、点击distance按钮为"distance undefined"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_07'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_07'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_07'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_07'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0090')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0100
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0100 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid08')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、点击distance按钮为"distance 0"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_08'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_08'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_08'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_08'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0100')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0110
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0110 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、点击distance按钮为"distance -10"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_09'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_09'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_09'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_09'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0110')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0120
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0120 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid10')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、点击distance按钮为"distance 9999"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_10'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_10'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_10'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_10'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0120')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0130
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0130 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_11'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_11'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_11'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_11'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0130')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0140
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0140 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid12')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.2、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_12'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1.5、点击distance按钮为"distance 16"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_12'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_12'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_12'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_12'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0140')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0150
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0150 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid13')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.2、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_13'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1.5、点击distance按钮为"distance 50"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_13'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_13'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_13'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_13'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0150')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0160
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0160 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid14')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.2、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_14'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1.5、点击distance按钮为"distance 49"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_14'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_14'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_14'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_14'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0160')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0170
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0170 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid15')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.2、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_15'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1.5、点击distance按钮为"distance 100"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_15'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_15'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_15'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_15'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0170')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0180
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0180 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid16')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.2、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_16'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1.5、点击distance按钮为"distance undefined"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_16'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_16'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_16'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_16'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0180')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0190
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0190 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid17')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.2、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_17'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1.5、点击distance按钮为"distance 0"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_17'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_17'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_17'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_17'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0190')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0200
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0200 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid18')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.2、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_18'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1.5、点击distance按钮为"distance -10"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_18'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_18'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_18'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_18'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0200')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0210
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0210 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid19')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.2、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_19'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1.5、点击distance按钮为"distance 9999"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_19'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"CustomDialog"按钮
      let customDialogButton: Component = await driver.waitForComponent(ON.id('customDialogButton_19'), 1000);
      await customDialogButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_19'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_19'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0210')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0230
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0230 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid20')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 2、AvoidMode按钮点击为"AvoidMode 1"状态（在打开弹窗前点击，避免弹窗遮挡）
      let avoidModeButton: Component = await driver.waitForComponent(ON.id('avoidModeButton_20'), 1000);
      await avoidModeButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_20'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 3、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_20'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 4、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_20'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 5、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0230')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0240
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0240 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid21')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_21'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_21'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_21'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0240')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0250
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0250 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid22')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、点击distance按钮为"distance 16"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_22'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_22'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_22'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_22'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0250')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0260
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0260 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid23')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、点击distance按钮为"distance 50"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_23'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_23'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_23'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_23'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0260')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0270
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0270 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid24')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、点击distance按钮为"distance 49"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_24'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_24'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_24'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_24'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0270')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0280
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0280 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid25')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、点击distance按钮为"distance 100"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_25'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_25'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_25'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_25'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0280')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0290
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0290 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid26')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、点击distance按钮为"distance undefined"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_26'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_26'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_26'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_26'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0290')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0300
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0300 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid27')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、点击distance按钮为"distance 0"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_27'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_27'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_27'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_27'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0300')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0310
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0310 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid28')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、点击distance按钮为"distance -10"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_28'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_28'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_28'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_28'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0310')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0320
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0320 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid29')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、点击distance按钮为"distance 9999"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_29'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_29'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_29'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_29'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0320')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0330
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0330 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid30')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.5、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_30'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_30'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_30'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_30'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0330')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0340
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0340 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid31')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.2、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_31'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1.5、点击distance按钮为"distance 16"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_31'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_31'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_31'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_31'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0340')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0350
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0350 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid32')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.2、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_32'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1.5、点击distance按钮为"distance 50"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_32'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_32'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_32'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_32'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0350')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0360
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0360 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid33')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.2、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_33'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1.5、点击distance按钮为"distance 49"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_33'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_33'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_33'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_33'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0360')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0370
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0370 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid34')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.2、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_34'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1.5、点击distance按钮为"distance 100"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_34'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_34'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_34'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_34'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0370')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0380
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0380 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid35')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.2、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_35'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1.5、点击distance按钮为"distance undefined"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_35'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_35'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_35'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_35'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0380')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0390
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0390 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid36')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.2、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_36'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1.5、点击distance按钮为"distance 0"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_36'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_36'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_36'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_36'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0390')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0400
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0400 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid37')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.2、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_37'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1.5、点击distance按钮为"distance -10"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_37'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_37'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_37'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_37'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0400')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_DIALOGAVOID_0410
     * @tc.name   : Dialogavoid
     * @tc.desc   : Verify dialogavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0410 start.`);
      Settings.createWindow('testability/pages/component/popup/dialog/dialogAvoid38')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.2、showInSub按钮点击为"showInSub false"状态（在打开弹窗前点击，避免弹窗遮挡）
      let showInSubButton: Component = await driver.waitForComponent(ON.id('showInSubButton_38'), 1000);
      await showInSubButton.click();
      await driver.waitForIdle(500, 2000);

      // 1.5、点击distance按钮为"distance 9999"（在打开弹窗前点击，避免弹窗遮挡）
      let distanceButton: Component = await driver.waitForComponent(ON.id('distanceButton_38'), 1000);
      await distanceButton.click();
      await driver.waitForIdle(500, 2000);

      // 1、点击"promptAction.openCustomDialog"按钮
      let promptActionButton: Component = await driver.waitForComponent(ON.id('promptActionButton_38'), 1000);
      await promptActionButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、点击"click me"按钮
      let clickMeButton: Component = await driver.waitForComponent(ON.id('clickMeButton_38'), 1000);
      await clickMeButton.click();
      await driver.waitForIdle(500, 2000);

      // 3、点击输入框
      let textInput: Component = await driver.waitForComponent(ON.id('textInput_38'), 1000);
      await textInput.click();
      await driver.waitForIdle(1000, 2000);

      // 4、横竖屏切换
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_DIALOGAVOID_0410')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_DIALOGAVOID_0410 finish.`);
      done()
    })
  })
}
