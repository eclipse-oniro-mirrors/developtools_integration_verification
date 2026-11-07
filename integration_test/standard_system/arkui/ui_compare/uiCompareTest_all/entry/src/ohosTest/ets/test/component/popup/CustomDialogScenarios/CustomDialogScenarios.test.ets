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

export default function customDialogScenarios() {

  describe('customDialogScenarios', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0220
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0220 start.`);
      // 步骤1：进入demo中
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0220')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      // 步骤2：弹起弹窗
      let button_open_dialog_scenarios_0220 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0220'), 500)
      await button_open_dialog_scenarios_0220.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0220_01')
      await Utils.sleep(1000)
      // 步骤3：点击空白区域范围
      await driver.click(100, 100)
      await Utils.sleep(500)
      // 预期结果3：弹窗消失，动画播放效果为减速曲线
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0010
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0010 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0010')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0010 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0010'), 500)
      await button_open_dialog_scenarios_0010.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0020
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0020 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0020')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0020 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0020'), 500)
      await button_open_dialog_scenarios_0020.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0030
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0030 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0030')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0030 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0030'), 500)
      await button_open_dialog_scenarios_0030.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0040
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0040 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0040')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0040 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0040'), 500)
      await button_open_dialog_scenarios_0040.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0080
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0080 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0080')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0080 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0080'), 500)
      await button_open_dialog_scenarios_0080.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0090
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0090 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0090')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0090 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0090'), 500)
      await button_open_dialog_scenarios_0090.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0100
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0100 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0100')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0100 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0100'), 500)
      await button_open_dialog_scenarios_0100.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0110
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0110 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0110')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0110 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0110'), 500)
      await button_open_dialog_scenarios_0110.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0120
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0120 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0120')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0120 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0120'), 500)
      await button_open_dialog_scenarios_0120.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0130
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0130 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0130')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0130 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0130'), 500)
      await button_open_dialog_scenarios_0130.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0140
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0140 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0140')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0140 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0140'), 500)
      await button_open_dialog_scenarios_0140.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0150
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0150 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0150')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0150 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0150'), 500)
      await button_open_dialog_scenarios_0150.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0160
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0160 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0160')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0160 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0160'), 500)
      await button_open_dialog_scenarios_0160.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0170
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0170 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0170')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0170 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0170'), 500)
      await button_open_dialog_scenarios_0170.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0180
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0180 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0180')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0180 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0180'), 500)
      await button_open_dialog_scenarios_0180.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0190
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0190 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0190')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0190 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0190'), 500)
      await button_open_dialog_scenarios_0190.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0200
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0200 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0200')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0200 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0200'), 500)
      await button_open_dialog_scenarios_0200.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0210
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0210 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0210')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0210 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0210'), 500)
      await button_open_dialog_scenarios_0210.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0230
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0230 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0230')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0230 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0230'), 500)
      await button_open_dialog_scenarios_0230.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0240
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0240 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0240')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0240 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0240'), 500)
      await button_open_dialog_scenarios_0240.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0250
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0250 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0250')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0250 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0250'), 500)
      await button_open_dialog_scenarios_0250.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0260
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0260 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0260')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0260 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0260'), 500)
      await button_open_dialog_scenarios_0260.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0270
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0270 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0270')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0270 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0270'), 500)
      await button_open_dialog_scenarios_0270.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0280
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0280 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0280')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0280 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0280'), 500)
      await button_open_dialog_scenarios_0280.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0290
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0290 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0290')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0290 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0290'), 500)
      await button_open_dialog_scenarios_0290.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0300
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0300 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0300')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0300 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0300'), 500)
      await button_open_dialog_scenarios_0300.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0310
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0310 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0310')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0310 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0310'), 500)
      await button_open_dialog_scenarios_0310.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0320
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0320 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0320')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0320 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0320'), 500)
      await button_open_dialog_scenarios_0320.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0330
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0330 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0330')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0330 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0330'), 500)
      await button_open_dialog_scenarios_0330.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0340
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0340 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0340')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0340 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0340'), 500)
      await button_open_dialog_scenarios_0340.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0350
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0350 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0350')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0350 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0350'), 500)
      await button_open_dialog_scenarios_0350.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0360
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0360 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0360')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0360 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0360'), 500)
      await button_open_dialog_scenarios_0360.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0370
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0370 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0370')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0370 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0370'), 500)
      await button_open_dialog_scenarios_0370.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0380
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0380 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0380')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0380 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0380'), 500)
      await button_open_dialog_scenarios_0380.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0390
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0390 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0390')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0390 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0390'), 500)
      await button_open_dialog_scenarios_0390.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0400
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0400 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0400')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0400 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0400'), 500)
      await button_open_dialog_scenarios_0400.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0410
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0410 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0410')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0410 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0410'), 500)
      await button_open_dialog_scenarios_0410.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0420
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0420 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0420')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0420 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0420'), 500)
      await button_open_dialog_scenarios_0420.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0430
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0430 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0430')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0430 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0430'), 500)
      await button_open_dialog_scenarios_0430.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0440
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0440 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0440')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0440 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0440'), 500)
      await button_open_dialog_scenarios_0440.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0450
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0450 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0450')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0450 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0450'), 500)
      await button_open_dialog_scenarios_0450.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0460
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0460 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0460')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0460 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0460'), 500)
      await button_open_dialog_scenarios_0460.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0470
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0470 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0470')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0470 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0470'), 500)
      await button_open_dialog_scenarios_0470.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0480
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0480 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0480')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0480 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0480'), 500)
      await button_open_dialog_scenarios_0480.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0490
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0490 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0490')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog_scenarios_0490 = await driver.waitForComponent(ON.id('button_open_dialog_scenarios_0490'), 500)
      await button_open_dialog_scenarios_0490.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0530
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0530 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0530')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog1_scenarios_0530 = await driver.waitForComponent(ON.id('button_open_dialog1_scenarios_0530'), 500)
      await button_open_dialog1_scenarios_0530.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0650
     * @tc.name   : Popupbox customdialog scenarios
     * @tc.desc   : Verify popupbox customdialog scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0650 start.`);
      Settings.createWindow('testability/pages/component/popup/CustomDialogScenarios/CustomDialogScenarios0650')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let button_open_dialog1_scenarios_0650 = await driver.waitForComponent(ON.id('button_open_dialog1_scenarios_0650'), 500)
      await button_open_dialog1_scenarios_0650.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      let button_open_dialog2_scenarios_0650 = await driver.waitForComponent(ON.id('button_open_dialog2_scenarios_0650'), 500)
      await button_open_dialog2_scenarios_0650.click()
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(100, 100)
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_CUSTOMDIALOG_SCENARIOS_0650 finish.`);
      done()
    })





  })
}