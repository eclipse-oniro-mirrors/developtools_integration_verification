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

export default function selectFuzzyTest() {
  describe('selectFuzzyTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0010
     * @tc.name   : select menuBackgroundBlurStyle设置为BlurStyle.NONE
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0010 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置menuBackgroundBlurStyle为BlurStyle.NONE
      let blurStyleButton: Component = await driver.waitForComponent(ON.id('blurStyle_none_01'), 1000);
      await blurStyleButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0010')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0020
     * @tc.name   : select menuBackgroundBlurStyle设置为BlurStyle.BACKGROUND_REGULAR
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0020 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置menuBackgroundBlurStyle为BlurStyle.BACKGROUND_REGULAR
      let blurStyleButton: Component = await driver.waitForComponent(ON.id('blurStyle_background_regular_02'), 1000);
      await blurStyleButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0020')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0030
     * @tc.name   : select menuBackgroundBlurStyle设置为BlurStyle.COMPONENT_THIN
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0030 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置menuBackgroundBlurStyle为BlurStyle.COMPONENT_THIN
      let blurStyleButton: Component = await driver.waitForComponent(ON.id('blurStyle_component_thin_03'), 1000);
      await blurStyleButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0030')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0040
     * @tc.name   : select menuBackgroundBlurStyle设置为undefined
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0040 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置menuBackgroundBlurStyle为undefined
      let blurStyleButton: Component = await driver.waitForComponent(ON.id('blurStyle_undefined_04'), 1000);
      await blurStyleButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0040')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0050
     * @tc.name   : select menuBackgroundBlurStyle设置为null
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0050 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置menuBackgroundBlurStyle为null
      let blurStyleButton: Component = await driver.waitForComponent(ON.id('blurStyle_null_05'), 1000);
      await blurStyleButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0050')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0060
     * @tc.name   : select menuBackgroundBlurStyle设置为-9.9
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0060 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置menuBackgroundBlurStyle为-9.9
      let blurStyleButton: Component = await driver.waitForComponent(ON.id('blurStyle_negative_06'), 1000);
      await blurStyleButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0060')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0070
     * @tc.name   : select menuBackgroundBlurStyle设置为9999
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0070 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置menuBackgroundBlurStyle为9999
      let blurStyleButton: Component = await driver.waitForComponent(ON.id('blurStyle_large_07'), 1000);
      await blurStyleButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0070')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0080
     * @tc.name   : select menuBackgroundBlurStyle异常值改为正常值
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0080 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy08')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置menuBackgroundBlurStyle异常值改为正常值
      let blurStyleButton: Component = await driver.waitForComponent(ON.id('blurStyle_abnormal_to_normal_08'), 1000);
      await blurStyleButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0080')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0090
     * @tc.name   : select menuBackgroundBlurStyle正常值改为异常值
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0090 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置menuBackgroundBlurStyle正常值改为异常值
      let blurStyleButton: Component = await driver.waitForComponent(ON.id('blurStyle_normal_to_abnormal_09'), 1000);
      await blurStyleButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0090')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0100
     * @tc.name   : select menuBackgroundBlurStyle异常值改为异常值
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0100 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy10')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置menuBackgroundBlurStyle异常值改为异常值
      let blurStyleButton: Component = await driver.waitForComponent(ON.id('blurStyle_abnormal_to_abnormal_10'), 1000);
      await blurStyleButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0100')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0110
     * @tc.name   : select selectedOptionBgColor设置为Color.Red
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0110 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置selectedOptionBgColor为Color.Red
      let bgColorButton: Component = await driver.waitForComponent(ON.id('selectedOptionBgColor_red_11'), 1000);
      await bgColorButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0110')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0120
     * @tc.name   : select selectedOptionBgColor设置为undefined
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0120 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy12')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置selectedOptionBgColor为undefined
      let bgColorButton: Component = await driver.waitForComponent(ON.id('selectedOptionBgColor_undefined_12'), 1000);
      await bgColorButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0120')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0130
     * @tc.name   : select optionBgColor设置为Color.Green
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0130 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy13')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置optionBgColor为Color.Green
      let bgColorButton: Component = await driver.waitForComponent(ON.id('optionBgColor_green_13'), 1000);
      await bgColorButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0130')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0140
     * @tc.name   : select optionBgColor设置为undefined
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0140 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy14')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置optionBgColor为undefined
      let bgColorButton: Component = await driver.waitForComponent(ON.id('optionBgColor_undefined_14'), 1000);
      await bgColorButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0140')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0150
     * @tc.name   : select menuBackgroundColor设置为Color.Blue
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0150 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy15')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置menuBackgroundColor为Color.Blue
      let bgColorButton: Component = await driver.waitForComponent(ON.id('menuBackgroundColor_blue_15'), 1000);
      await bgColorButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0150')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0160
     * @tc.name   : select menuBackgroundColor设置为undefined
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0160 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy16')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置menuBackgroundColor为undefined
      let bgColorButton: Component = await driver.waitForComponent(ON.id('menuBackgroundColor_undefined_16'), 1000);
      await bgColorButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0160')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0170
     * @tc.name   : select menuBackgroundBlurStyle设置为数字类型1
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0170 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy17')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置menuBackgroundBlurStyle为数字类型1
      let blurStyleButton: Component = await driver.waitForComponent(ON.id('blurStyle_number_1_17'), 1000);
      await blurStyleButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0170')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0180
     * @tc.name   : select menuBackgroundBlurStyle设置为数字类型2
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0180 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy18')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置menuBackgroundBlurStyle为数字类型2
      let blurStyleButton: Component = await driver.waitForComponent(ON.id('blurStyle_number_2_18'), 1000);
      await blurStyleButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0180')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0190
     * @tc.name   : select menuBackgroundBlurStyle设置为数字类型3
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0190 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy19')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置menuBackgroundBlurStyle为数字类型3
      let blurStyleButton: Component = await driver.waitForComponent(ON.id('blurStyle_number_3_19'), 1000);
      await blurStyleButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0190')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0200
     * @tc.name   : select menuBackgroundBlurStyle设置为数字类型"30%"
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0200 start.`);
      Settings.createWindow('testability/pages/component/select/select/selectFuzzy20')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 设置menuBackgroundBlurStyle为数字类型"30%"
      let blurStyleButton: Component = await driver.waitForComponent(ON.id('blurStyle_percent_30_20'), 1000);
      await blurStyleButton.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0200')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0200 finish.`);
      done()
    })
  })
}