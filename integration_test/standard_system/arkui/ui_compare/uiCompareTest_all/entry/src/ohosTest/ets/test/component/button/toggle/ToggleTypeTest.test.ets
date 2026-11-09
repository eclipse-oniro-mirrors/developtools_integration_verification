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

export default function toggleTypeTest() {
  describe('toggleTypeTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0010
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0010 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 单击switch
      let toggleSwitch: Component = await driver.waitForComponent(ON.id('toggle_switch_01'), 1000);
      await toggleSwitch.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0010')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0020
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0020 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 双击switch
      let toggleSwitch: Component = await driver.waitForComponent(ON.id('toggle_switch_02'), 1000);
      await toggleSwitch.click();
      await Utils.sleep(200);
      await toggleSwitch.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0020')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0030
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0030 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 单击switch
      let toggleSwitch: Component = await driver.waitForComponent(ON.id('toggle_switch_03'), 1000);
      await toggleSwitch.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0030')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0040
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0040 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 双击switch
      let toggleSwitch: Component = await driver.waitForComponent(ON.id('toggle_switch_04'), 1000);
      await toggleSwitch.click();
      await Utils.sleep(200);
      await toggleSwitch.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0040')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0050
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0050 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 单击checkbox
      let toggleCheckbox: Component = await driver.waitForComponent(ON.id('toggle_checkbox_05'), 1000);
      await toggleCheckbox.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0050')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0060
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0060 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 单击勾选的checkbox
      let toggleCheckbox: Component = await driver.waitForComponent(ON.id('toggle_checkbox_06'), 1000);
      await toggleCheckbox.click();
      await driver.waitForIdle(500, 2000);

      // 双击勾选的checkbox
      await toggleCheckbox.click();
      await Utils.sleep(200);
      await toggleCheckbox.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0060')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0070
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0070 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 单击checkbox
      let toggleCheckbox: Component = await driver.waitForComponent(ON.id('toggle_checkbox_07'), 1000);
      await toggleCheckbox.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0070')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0080
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0080 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType08')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击未勾选的checkbox
      let toggleCheckbox: Component = await driver.waitForComponent(ON.id('toggle_checkbox_08'), 1000);
      await toggleCheckbox.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0080')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0090
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0090 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 单击button
      let toggleButton: Component = await driver.waitForComponent(ON.id('toggle_button_09'), 1000);
      await toggleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0090')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0100
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0100 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType10')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 单击已选中的"status button"
      let toggleButton: Component = await driver.waitForComponent(ON.id('toggle_button_10'), 1000);
      await toggleButton.click();
      await driver.waitForIdle(500, 2000);

      // 双击"status button"
      await toggleButton.click();
      await Utils.sleep(200);
      await toggleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0100')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0110
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0110 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 单击button
      let toggleButton: Component = await driver.waitForComponent(ON.id('toggle_button_11'), 1000);
      await toggleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0110')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0130
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0130 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType13')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击changeEnable按钮
      let changeEnableButton: Component = await driver.waitForComponent(ON.id('change_enable_13'), 1000);
      await changeEnableButton.click();
      await driver.waitForIdle(500, 2000);

      // 单击开启的switch
      let toggleSwitch: Component = await driver.waitForComponent(ON.id('toggle_switch_13'), 1000);
      await toggleSwitch.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0130')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0140
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0140 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType14')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击changeEnable按钮
      let changeEnableButton: Component = await driver.waitForComponent(ON.id('change_enable_14'), 1000);
      await changeEnableButton.click();
      await driver.waitForIdle(500, 2000);

      // 单击关闭的switch
      let toggleSwitch: Component = await driver.waitForComponent(ON.id('toggle_switch_14'), 1000);
      await toggleSwitch.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0140')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0150
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0150 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType15')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击changeEnable按钮
      let changeEnableButton: Component = await driver.waitForComponent(ON.id('change_enable_15'), 1000);
      await changeEnableButton.click();
      await driver.waitForIdle(500, 2000);

      // 单击选中的checkbox
      let toggleCheckbox: Component = await driver.waitForComponent(ON.id('toggle_checkbox_15'), 1000);
      await toggleCheckbox.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0150')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0160
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0160 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType16')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击changeEnable按钮
      let changeEnableButton: Component = await driver.waitForComponent(ON.id('change_enable_16'), 1000);
      await changeEnableButton.click();
      await driver.waitForIdle(500, 2000);

      // 单击未勾选的checkbox
      let toggleCheckbox: Component = await driver.waitForComponent(ON.id('toggle_checkbox_16'), 1000);
      await toggleCheckbox.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0160')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0170
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0170 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType17')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击changeEnable按钮
      let changeEnableButton: Component = await driver.waitForComponent(ON.id('change_enable_17'), 1000);
      await changeEnableButton.click();
      await driver.waitForIdle(500, 2000);

      // 单击已选中的"status button"
      let toggleButton: Component = await driver.waitForComponent(ON.id('toggle_button_17'), 1000);
      await toggleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0170')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0180
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0180 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType18')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击changeEnable按钮
      let changeEnableButton: Component = await driver.waitForComponent(ON.id('change_enable_18'), 1000);
      await changeEnableButton.click();
      await driver.waitForIdle(500, 2000);

      // 单击未选中的"status button"
      let toggleButton: Component = await driver.waitForComponent(ON.id('toggle_button_18'), 1000);
      await toggleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0180')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0190
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0190 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType19')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 单击switch使获焦
      let toggleSwitch: Component = await driver.waitForComponent(ON.id('toggle_switch_19'), 1000);
      await toggleSwitch.click();
      await driver.waitForIdle(500, 2000);

      // 切换横屏
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0190')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('portrait');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0200
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0200 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType20')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 单击switch使获焦
      let toggleSwitch: Component = await driver.waitForComponent(ON.id('toggle_switch_20'), 1000);
      await toggleSwitch.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0200')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0220
     * @tc.name   : Button toggle type
     * @tc.desc   : Verify button toggle type interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0220 start.`);
      Settings.createWindow('testability/pages/component/button/toggle/toggleType22')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 单击switch
      let toggleSwitch: Component = await driver.waitForComponent(ON.id('toggle_switch_22'), 1000);
      await toggleSwitch.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0220_01')
      await Utils.sleep(1000)

      // 点击changeType按钮切换为checkbox并点击
      let changeTypeButton: Component = await driver.waitForComponent(ON.id('change_type_22'), 1000);
      await changeTypeButton.click();
      await driver.waitForIdle(500, 2000);

      let toggleCheckbox: Component = await driver.waitForComponent(ON.id('toggle_checkbox_22'), 1000);
      await toggleCheckbox.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0220_02')
      await Utils.sleep(1000)

      // 继续点击changeType按钮切换为button并点击
      await changeTypeButton.click();
      await driver.waitForIdle(500, 2000);

      let toggleButton: Component = await driver.waitForComponent(ON.id('toggle_button_22'), 1000);
      await toggleButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0220_03')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_TYPE_0220 finish.`);
      done()
    })

  })
}
