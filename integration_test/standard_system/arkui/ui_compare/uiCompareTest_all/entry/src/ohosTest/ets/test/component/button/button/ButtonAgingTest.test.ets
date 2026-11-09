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
import { uiAppearance } from '@kit.ArkUI';
import { Driver, ON, Component } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit'

export default function buttonAgingTest() {
  describe('buttonAgingTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0420
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0420 start.`);
      Settings.createWindow('testability/pages/component/button/button/button01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置controlSize为SMALL
      let controlSizeButton: Component = await driver.waitForComponent(ON.id('controlSize_small_01'), 1000);
      await controlSizeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0420')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1060
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1060 start.`);
      Settings.createWindow('testability/pages/component/button/button/button02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置fontSize为30
      let fontSizeButton: Component = await driver.waitForComponent(ON.id('fontSize_30_02'), 1000);
      await fontSizeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1060')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0400
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0400 start.`);
      Settings.createWindow('testability/pages/component/button/button/button03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置controlSize为NORMAL
      let controlSizeButton: Component = await driver.waitForComponent(ON.id('controlSize_normal_03'), 1000);
      await controlSizeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0400')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1100
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1100 start.`);
      Settings.createWindow('testability/pages/component/button/button/button04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置fontSize为30fp
      let fontSizeButton: Component = await driver.waitForComponent(ON.id('fontSize_30fp_04'), 1000);
      await fontSizeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1100')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0370
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0370 start.`);
      Settings.createWindow('testability/pages/component/button/button/button05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置type为Normal
      let typeButton: Component = await driver.waitForComponent(ON.id('type_normal_05'), 1000);
      await typeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0370')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1090
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1090 start.`);
      Settings.createWindow('testability/pages/component/button/button/button06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置fontSize为100
      let fontSizeButton: Component = await driver.waitForComponent(ON.id('fontSize_100_06'), 1000);
      await fontSizeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1090')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0430
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0430 start.`);
      Settings.createWindow('testability/pages/component/button/button/button07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置controlSize为SMALL
      let controlSizeButton: Component = await driver.waitForComponent(ON.id('controlSize_small_07'), 1000);
      await controlSizeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0430')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1070
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1070 start.`);
      Settings.createWindow('testability/pages/component/button/button/button08')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置fontSize为100
      let fontSizeButton: Component = await driver.waitForComponent(ON.id('fontSize_100_08'), 1000);
      await fontSizeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1070')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0390
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0390 start.`);
      Settings.createWindow('testability/pages/component/button/button/button09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置type为Normal
      let typeButton: Component = await driver.waitForComponent(ON.id('type_normal_09'), 1000);
      await typeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0390')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1040
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1040 start.`);
      Settings.createWindow('testability/pages/component/button/button/button10')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置fontSize为30
      let fontSizeButton: Component = await driver.waitForComponent(ON.id('fontSize_30_10'), 1000);
      await fontSizeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1040')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0410
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0410 start.`);
      Settings.createWindow('testability/pages/component/button/button/button11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置controlSize为NORMAL
      let controlSizeButton: Component = await driver.waitForComponent(ON.id('controlSize_normal_11'), 1000);
      await controlSizeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0410')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1080
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1080 start.`);
      Settings.createWindow('testability/pages/component/button/button/button12')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置fontSize为100
      let fontSizeButton: Component = await driver.waitForComponent(ON.id('fontSize_100_12'), 1000);
      await fontSizeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1080')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0440
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0440 start.`);
      Settings.createWindow('testability/pages/component/button/button/button13')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置controlSize为SMALL
      let controlSizeButton: Component = await driver.waitForComponent(ON.id('controlSize_small_13'), 1000);
      await controlSizeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0440')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1050
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1050 start.`);
      Settings.createWindow('testability/pages/component/button/button/button14')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置fontSize为30
      let fontSizeButton: Component = await driver.waitForComponent(ON.id('fontSize_30_14'), 1000);
      await fontSizeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1050')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0840
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0840', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0840 start.`);
      Settings.createWindow('testability/pages/component/button/button/button15')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0840')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0840 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0660
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0660 start.`);
      Settings.createWindow('testability/pages/component/button/button/button16')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置overflow为Ellipsis
      let overflowButton: Component = await driver.waitForComponent(ON.id('overflow_ellipsis_16'), 1000);
      await overflowButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0660')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0830
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0830', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0830 start.`);
      Settings.createWindow('testability/pages/component/button/button/button17')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0830')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0830 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0680
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0680', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0680 start.`);
      Settings.createWindow('testability/pages/component/button/button/button18')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0680')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0680 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0810
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0810', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0810 start.`);
      Settings.createWindow('testability/pages/component/button/button/button19')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0810')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0810 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0640
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0640 start.`);
      Settings.createWindow('testability/pages/component/button/button/button20')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1倍
      await uiAppearance.setFontScale(1.0);
      await driver.waitForIdle(500, 2000);

      // 设置type为Normal
      let typeButton: Component = await driver.waitForComponent(ON.id('type_normal_20'), 1000);
      await typeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0640')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0640 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0450
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0450 start.`);
      Settings.createWindow('testability/pages/component/button/button/button21')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置buttonStyle为EMPHASIZED
      let buttonStyleButton: Component = await driver.waitForComponent(ON.id('buttonStyle_emphasized_21'), 1000);
      await buttonStyleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0450')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0620
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0620 start.`);
      Settings.createWindow('testability/pages/component/button/button/button22')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1倍
      await uiAppearance.setFontScale(1.0);
      await driver.waitForIdle(500, 2000);

      // 设置type为Capsule
      let typeButton: Component = await driver.waitForComponent(ON.id('type_capsule_22'), 1000);
      await typeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0620')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0620 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0380
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0380 start.`);
      Settings.createWindow('testability/pages/component/button/button/button23')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置type为Normal
      let typeButton: Component = await driver.waitForComponent(ON.id('type_normal_23'), 1000);
      await typeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0380')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0630
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0630 start.`);
      Settings.createWindow('testability/pages/component/button/button/button24')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1倍
      await uiAppearance.setFontScale(1.0);
      await driver.waitForIdle(500, 2000);

      // 设置type为Circle
      let typeButton: Component = await driver.waitForComponent(ON.id('type_circle_24'), 1000);
      await typeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0630')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0630 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0850
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0850', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0850 start.`);
      Settings.createWindow('testability/pages/component/button/button/button25')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0850')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0850 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0800
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0800', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0800 start.`);
      Settings.createWindow('testability/pages/component/button/button/button26')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0800')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0800 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0650
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0650 start.`);
      Settings.createWindow('testability/pages/component/button/button/button27')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置overflow为Ellipsis
      let overflowButton: Component = await driver.waitForComponent(ON.id('overflow_ellipsis_27'), 1000);
      await overflowButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0650')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0650 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0670
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0670', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0670 start.`);
      Settings.createWindow('testability/pages/component/button/button/button28')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1倍
      await uiAppearance.setFontScale(1.0);
      await driver.waitForIdle(500, 2000);

      // button28页面测试字体缩放，无需点击overflow按钮
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0670')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0670 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0920
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0920', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0920 start.`);
      Settings.createWindow('testability/pages/component/button/button/button29')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置maxLines为2
      let maxLinesButton: Component = await driver.waitForComponent(ON.id('maxLines_2_29'), 1000);
      await maxLinesButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0920')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0920 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0700
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0700 start.`);
      Settings.createWindow('testability/pages/component/button/button/button30')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1倍
      await uiAppearance.setFontScale(1.0);
      await driver.waitForIdle(500, 2000);

      // 设置overflow为Clip
      let overflowButton: Component = await driver.waitForComponent(ON.id('overflow_clip_30'), 1000);
      await overflowButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0700')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0700 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0320
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0320 start.`);
      Settings.createWindow('testability/pages/component/button/button/button31')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // button31页面测试字体缩放，无需点击type按钮
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0320')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1110
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1110 start.`);
      Settings.createWindow('testability/pages/component/button/button/button32')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // button32页面测试字体缩放，无需点击fontSize按钮
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1110')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0860
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0860', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0860 start.`);
      Settings.createWindow('testability/pages/component/button/button/button33')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0860')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0860 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0690
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0690', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0690 start.`);
      Settings.createWindow('testability/pages/component/button/button/button34')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // button34页面测试字体缩放，无需点击overflow按钮
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0690')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0690 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0950
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0950', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0950 start.`);
      Settings.createWindow('testability/pages/component/button/button/button35')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置maxLines为3
      let maxLinesButton: Component = await driver.waitForComponent(ON.id('maxLines_3_35'), 1000);
      await maxLinesButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0950')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0950 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0720
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0720', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0720 start.`);
      Settings.createWindow('testability/pages/component/button/button/button36')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // button36页面测试字体缩放，无需点击overflow按钮
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0720')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0720 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0080
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0080 start.`);
      Settings.createWindow('testability/pages/component/button/button/button37')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0080')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0890
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0890', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0890 start.`);
      Settings.createWindow('testability/pages/component/button/button/button38')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置maxLines为1
      let maxLinesButton: Component = await driver.waitForComponent(ON.id('maxLines_1_38'), 1000);
      await maxLinesButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0890')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0890 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0710
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0710 start.`);
      Settings.createWindow('testability/pages/component/button/button/button39')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置overflow为Clip
      let overflowButton: Component = await driver.waitForComponent(ON.id('overflow_clip_39'), 1000);
      await overflowButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0710')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0710 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0020
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0020 start.`);
      Settings.createWindow('testability/pages/component/button/button/button40')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 系统切换为特大一档、特大二挡、特大三挡
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0020_175')
      await Utils.sleep(1000)

      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0020_200')
      await Utils.sleep(1000)

      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0020_320')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0880
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0880', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0880 start.`);
      Settings.createWindow('testability/pages/component/button/button/button41')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体大小为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置转折符号
      let lineBreakButton: Component = await driver.waitForComponent(ON.id('line_break'), 1000);
      await lineBreakButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0880')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0880 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0740
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0740', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0740 start.`);
      Settings.createWindow('testability/pages/component/button/button/button42')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0740')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0740 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0090
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0090 start.`);
      Settings.createWindow('testability/pages/component/button/button/button43')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置type为Capsule
      let typeButton: Component = await driver.waitForComponent(ON.id('type_capsule_43'), 1000);
      await typeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0090')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0870
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0870', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0870 start.`);
      Settings.createWindow('testability/pages/component/button/button/button44')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0870')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0870 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0730
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0730', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0730 start.`);
      Settings.createWindow('testability/pages/component/button/button/button45')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1倍
      await uiAppearance.setFontScale(1.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0730')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0730 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0040
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0040 start.`);
      Settings.createWindow('testability/pages/component/button/button/button46')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0040')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0930
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0930', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0930 start.`);
      Settings.createWindow('testability/pages/component/button/button/button47')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置maxLines为2
      let maxLinesButton: Component = await driver.waitForComponent(ON.id('maxLines_2_47'), 1000);
      await maxLinesButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0930')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0930 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0770
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0770', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0770 start.`);
      Settings.createWindow('testability/pages/component/button/button/button48')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 内部不包含其他组件,超长字符串,不设置maxLines - 直接截图验证默认状态
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0770')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0770 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0050
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0050 start.`);
      Settings.createWindow('testability/pages/component/button/button/button49')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置controlSize为NORMAL
      let controlSizeButton: Component = await driver.waitForComponent(ON.id('controlSize_normal_49'), 1000);
      await controlSizeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0050')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0910
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0910', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0910 start.`);
      Settings.createWindow('testability/pages/component/button/button/button50')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置maxLines为2
      let maxLinesButton: Component = await driver.waitForComponent(ON.id('maxLines_2_50'), 1000);
      await maxLinesButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0910')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0910 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0760
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0760', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0760 start.`);
      Settings.createWindow('testability/pages/component/button/button/button51')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 内部不包含其他组件,超长字符串,不设置maxLines - 直接截图验证默认状态
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0760')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0760 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0070
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0070 start.`);
      Settings.createWindow('testability/pages/component/button/button/button52')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置role为NORMAL
      let roleButton: Component = await driver.waitForComponent(ON.id('role_normal_52'), 1000);
      await roleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0070')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0900
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0900', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0900 start.`);
      Settings.createWindow('testability/pages/component/button/button/button53')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置maxLines为1
      let maxLinesButton: Component = await driver.waitForComponent(ON.id('maxLines_1_53'), 1000);
      await maxLinesButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0900')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0900 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0750
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0750', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0750 start.`);
      Settings.createWindow('testability/pages/component/button/button/button54')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0750')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0750 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0010
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0010 start.`);
      Settings.createWindow('testability/pages/component/button/button/button55')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 系统切换为特大一档、特大二挡、特大三挡
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0010_175')
      await Utils.sleep(1000)

      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0010_200')
      await Utils.sleep(1000)

      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0010_320')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0940
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0940', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0940 start.`);
      Settings.createWindow('testability/pages/component/button/button/button56')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置maxLines为3
      let maxLinesButton: Component = await driver.waitForComponent(ON.id('maxLines_3_56'), 1000);
      await maxLinesButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0940')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0940 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1130
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1130 start.`);
      Settings.createWindow('testability/pages/component/button/button/button57')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置fontWeight为Normal
      let fontWeightButton: Component = await driver.waitForComponent(ON.id('fontWeight_normal_57'), 1000);
      await fontWeightButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1130')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0100
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0100 start.`);
      Settings.createWindow('testability/pages/component/button/button/button58')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1倍
      await uiAppearance.setFontScale(1.0);
      await driver.waitForIdle(500, 2000);

      // 设置overflow为Ellipsis
      let overflowButton: Component = await driver.waitForComponent(ON.id('overflow_ellipsis_58'), 1000);
      await overflowButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0100')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0820
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0820', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0820 start.`);
      Settings.createWindow('testability/pages/component/button/button/button59')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置type属性，改变按钮样式,内部不包含其他组件
      let typeButton: Component = await driver.waitForComponent(ON.id('type_normal_59'), 1000);
      await typeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0820')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0820 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1120
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1120 start.`);
      Settings.createWindow('testability/pages/component/button/button/button60')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置fontSize为30fp
      let fontSizeButton: Component = await driver.waitForComponent(ON.id('fontSize_30fp_60'), 1000);
      await fontSizeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1120')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0160
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0160 start.`);
      Settings.createWindow('testability/pages/component/button/button/button61')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置type属性，改变按钮样式,内部包含其他组件
      let typeButton: Component = await driver.waitForComponent(ON.id('type_normal_61'), 1000);
      await typeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0160')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0460
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0460 start.`);
      Settings.createWindow('testability/pages/component/button/button/button62')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置buttonStyle为EMPHASIZED
      let buttonStyleButton: Component = await driver.waitForComponent(ON.id('buttonStyle_emphasized_62'), 1000);
      await buttonStyleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0460')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1160
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1160 start.`);
      Settings.createWindow('testability/pages/component/button/button/button63')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置fontWeight为Lighter
      let fontWeightButton: Component = await driver.waitForComponent(ON.id('fontWeight_lighter_63'), 1000);
      await fontWeightButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1160')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0120
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0120 start.`);
      Settings.createWindow('testability/pages/component/button/button/button64')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置横屏
      await Settings.changeWindowOrientation('landscape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0120')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0470
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0470 start.`);
      Settings.createWindow('testability/pages/component/button/button/button65')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置buttonStyle为NORMAL
      let buttonStyleButton: Component = await driver.waitForComponent(ON.id('buttonStyle_normal_65'), 1000);
      await buttonStyleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0470')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1200
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1200 start.`);
      Settings.createWindow('testability/pages/component/button/button/button66')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置fontWeight为Bolder
      let fontWeightButton: Component = await driver.waitForComponent(ON.id('fontWeight_bolder_66'), 1000);
      await fontWeightButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1200')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0110
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0110 start.`);
      Settings.createWindow('testability/pages/component/button/button/button67')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 内部不包含其他组件,超长字符串,不设置maxLines - 直接截图验证默认状态
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0110')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0480
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0480 start.`);
      Settings.createWindow('testability/pages/component/button/button/button68')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置buttonStyle为NORMAL
      let buttonStyleButton: Component = await driver.waitForComponent(ON.id('buttonStyle_normal_68'), 1000);
      await buttonStyleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0480')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1150
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1150 start.`);
      Settings.createWindow('testability/pages/component/button/button/button69')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置fontWeight为Lighter
      let fontWeightButton: Component = await driver.waitForComponent(ON.id('fontWeight_lighter_69'), 1000);
      await fontWeightButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1150')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0030
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0030 start.`);
      Settings.createWindow('testability/pages/component/button/button/button70')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0030')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0510
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0510 start.`);
      Settings.createWindow('testability/pages/component/button/button/button71')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置buttonStyle为TEXTUAL
      let buttonStyleButton: Component = await driver.waitForComponent(ON.id('buttonStyle_textual_71'), 1000);
      await buttonStyleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0510')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1140
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1140 start.`);
      Settings.createWindow('testability/pages/component/button/button/button72')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置fontWeight为Normal
      let fontWeightButton: Component = await driver.waitForComponent(ON.id('fontWeight_normal_72'), 1000);
      await fontWeightButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1140')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0060
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0060 start.`);
      Settings.createWindow('testability/pages/component/button/button/button73')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置buttonStyle为EMPHASIZED
      let buttonStyleButton: Component = await driver.waitForComponent(ON.id('buttonStyle_emphasized_73'), 1000);
      await buttonStyleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0060')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0490
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0490 start.`);
      Settings.createWindow('testability/pages/component/button/button/button74')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置buttonStyle为NORMAL
      let buttonStyleButton: Component = await driver.waitForComponent(ON.id('buttonStyle_normal_74'), 1000);
      await buttonStyleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0490')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1180
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1180 start.`);
      Settings.createWindow('testability/pages/component/button/button/button75')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置fontWeight为Bolder
      let fontWeightButton: Component = await driver.waitForComponent(ON.id('fontWeight_bolder_75'), 1000);
      await fontWeightButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1180')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0140
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0140 start.`);
      Settings.createWindow('testability/pages/component/button/button/button76')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 开启预览器测试
      // 系统切换为特大一档、特大二挡、特大三挡
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0140_175')
      await Utils.sleep(1000)

      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0140_200')
      await Utils.sleep(1000)

      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0140_320')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0500
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0500 start.`);
      Settings.createWindow('testability/pages/component/button/button/button77')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置buttonStyle为TEXTUAL
      let buttonStyleButton: Component = await driver.waitForComponent(ON.id('buttonStyle_textual_77'), 1000);
      await buttonStyleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0500')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1240
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1240 start.`);
      Settings.createWindow('testability/pages/component/button/button/button78')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置fontStyle为Italic
      let fontStyleButton: Component = await driver.waitForComponent(ON.id('fontStyle_italic_78'), 1000);
      await fontStyleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1240')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0150
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0150 start.`);
      Settings.createWindow('testability/pages/component/button/button/button79')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0150')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0520
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0520 start.`);
      Settings.createWindow('testability/pages/component/button/button/button80')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置buttonStyle为TEXTUAL
      let buttonStyleButton: Component = await driver.waitForComponent(ON.id('buttonStyle_textual_80'), 1000);
      await buttonStyleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0520')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1220
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1220 start.`);
      Settings.createWindow('testability/pages/component/button/button/button81')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置fontStyle为Normal
      let fontStyleButton: Component = await driver.waitForComponent(ON.id('fontStyle_normal_81'), 1000);
      await fontStyleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1220')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0130
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0130 start.`);
      Settings.createWindow('testability/pages/component/button/button/button82')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 系统切换为特大一档、特大二挡、特大三挡
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0130_175')
      await Utils.sleep(1000)

      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0130_200')
      await Utils.sleep(1000)

      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0130_320')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0540
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0540 start.`);
      Settings.createWindow('testability/pages/component/button/button/button83')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置role为Normal
      let roleButton: Component = await driver.waitForComponent(ON.id('role_normal_83'), 1000);
      await roleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0540')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1210
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1210 start.`);
      Settings.createWindow('testability/pages/component/button/button/button84')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置fontStyle为Normal
      let fontStyleButton: Component = await driver.waitForComponent(ON.id('fontStyle_normal_84'), 1000);
      await fontStyleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1210')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0190
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0190 start.`);
      Settings.createWindow('testability/pages/component/button/button/button85')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0190')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0560
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0560 start.`);
      Settings.createWindow('testability/pages/component/button/button/button86')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置role为Error
      let roleButton: Component = await driver.waitForComponent(ON.id('role_error_86'), 1000);
      await roleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0560')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0560 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1250
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1250 start.`);
      Settings.createWindow('testability/pages/component/button/button/button87')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置fontStyle为Italic
      let fontStyleButton: Component = await driver.waitForComponent(ON.id('fontStyle_italic_87'), 1000);
      await fontStyleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1250')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0180
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0180 start.`);
      Settings.createWindow('testability/pages/component/button/button/button88')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0180')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0600
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0600 start.`);
      Settings.createWindow('testability/pages/component/button/button/button89')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0600')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1170
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1170 start.`);
      Settings.createWindow('testability/pages/component/button/button/button90')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置fontWeight为Lighter
      let fontWeightButton: Component = await driver.waitForComponent(ON.id('fontWeight_lighter_90'), 1000);
      await fontWeightButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1170')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0200
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0200 start.`);
      Settings.createWindow('testability/pages/component/button/button/button91')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0200')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0230
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0230 start.`);
      Settings.createWindow('testability/pages/component/button/button/button92')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0230')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0530
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0530 start.`);
      Settings.createWindow('testability/pages/component/button/button/button93')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置role为Normal
      let roleButton: Component = await driver.waitForComponent(ON.id('role_normal_93'), 1000);
      await roleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0530')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0570
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0570 start.`);
      Settings.createWindow('testability/pages/component/button/button/button94')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置role为Error
      let roleButton: Component = await driver.waitForComponent(ON.id('role_error_94'), 1000);
      await roleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0570')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1230
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1230 start.`);
      Settings.createWindow('testability/pages/component/button/button/button95')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置fontStyle为Italic
      let fontStyleButton: Component = await driver.waitForComponent(ON.id('fontStyle_italic_95'), 1000);
      await fontStyleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1230')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0780
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0780', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0780 start.`);
      Settings.createWindow('testability/pages/component/button/button/button96')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0780')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0780 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0240
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0240 start.`);
      Settings.createWindow('testability/pages/component/button/button/button97')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置fontSize为16
      let fontSizeButton: Component = await driver.waitForComponent(ON.id('fontSize_16_97'), 1000);
      await fontSizeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0240')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0580
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0580 start.`);
      Settings.createWindow('testability/pages/component/button/button/button98')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0580')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1260
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1260 start.`);
      Settings.createWindow('testability/pages/component/button/button/button99')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置横屏
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1260')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0220
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0220 start.`);
      Settings.createWindow('testability/pages/component/button/button/button100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置maxLines为1
      let maxLinesButton: Component = await driver.waitForComponent(ON.id('maxLines_1_100'), 1000);
      await maxLinesButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0220')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0550
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0550 start.`);
      Settings.createWindow('testability/pages/component/button/button/button101')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置role为Error
      let roleButton: Component = await driver.waitForComponent(ON.id('role_error_101'), 1000);
      await roleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0550')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1270
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1270 start.`);
      Settings.createWindow('testability/pages/component/button/button/button102')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置横屏
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1270')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0170
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0170 start.`);
      Settings.createWindow('testability/pages/component/button/button/button103')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0170')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0590
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0590 start.`);
      Settings.createWindow('testability/pages/component/button/button/button104')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0590')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0790
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0790', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0790 start.`);
      Settings.createWindow('testability/pages/component/button/button/button105')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0790')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0790 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0260
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0260 start.`);
      Settings.createWindow('testability/pages/component/button/button/button106')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置fontStyle为Normal
      let fontStyleButton: Component = await driver.waitForComponent(ON.id('fontStyle_normal_106'), 1000);
      await fontStyleButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0260')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0610
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0610 start.`);
      Settings.createWindow('testability/pages/component/button/button/button107')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0610')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0610 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1190
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1190 start.`);
      Settings.createWindow('testability/pages/component/button/button/button108')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置fontWeight为Bolder
      let fontWeightButton: Component = await driver.waitForComponent(ON.id('fontWeight_bolder_108'), 1000);
      await fontWeightButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1190')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0250
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0250 start.`);
      Settings.createWindow('testability/pages/component/button/button/button109')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置fontWeight为Normal
      let fontWeightButton: Component = await driver.waitForComponent(ON.id('fontWeight_normal_109'), 1000);
      await fontWeightButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0250')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0960
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0960', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0960 start.`);
      Settings.createWindow('testability/pages/component/button/button/button110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置maxLines为3
      let maxLinesButton: Component = await driver.waitForComponent(ON.id('maxLines_3_110'), 1000);
      await maxLinesButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0960')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0960 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0210
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0210 start.`);
      Settings.createWindow('testability/pages/component/button/button/button111')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0210')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0970
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0970', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0970 start.`);
      Settings.createWindow('testability/pages/component/button/button/button112')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置maxLines为4
      let maxLinesButton: Component = await driver.waitForComponent(ON.id('maxLines_4_112'), 1000);
      await maxLinesButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0970')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0970 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0340
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0340 start.`);
      Settings.createWindow('testability/pages/component/button/button/button113')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为1.75倍
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      // 设置type为Circle
      let typeButton: Component = await driver.waitForComponent(ON.id('type_circle_113'), 1000);
      await typeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0340')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0980
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0980', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0980 start.`);
      Settings.createWindow('testability/pages/component/button/button/button114')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置maxLines为4
      let maxLinesButton: Component = await driver.waitForComponent(ON.id('maxLines_4_114'), 1000);
      await maxLinesButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0980')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0980 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0360
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0360 start.`);
      Settings.createWindow('testability/pages/component/button/button/button115')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0360')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1010
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1010 start.`);
      Settings.createWindow('testability/pages/component/button/button/button116')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1010')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0310
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0310 start.`);
      Settings.createWindow('testability/pages/component/button/button/button117')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0310')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1000
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1000', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1000 start.`);
      Settings.createWindow('testability/pages/component/button/button/button118')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1000')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1000 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0350
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0350 start.`);
      Settings.createWindow('testability/pages/component/button/button/button119')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0350')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1030
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1030 start.`);
      Settings.createWindow('testability/pages/component/button/button/button120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置fontSize为16
      let fontSizeButton: Component = await driver.waitForComponent(ON.id('fontSize_16_3x'), 1000);
      await fontSizeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1030')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0300
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0300 start.`);
      Settings.createWindow('testability/pages/component/button/button/button121')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0300')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1020
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1020 start.`);
      Settings.createWindow('testability/pages/component/button/button/button122')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为2倍
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      // 设置fontSize为16
      let fontSizeButton: Component = await driver.waitForComponent(ON.id('fontSize_16_2x'), 1000);
      await fontSizeButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1020')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_1020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0330
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0330 start.`);
      Settings.createWindow('testability/pages/component/button/button/button123')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0330')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0990
     * @tc.name   : Button suitableforaging
     * @tc.desc   : Verify button suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0990', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0990 start.`);
      Settings.createWindow('testability/pages/component/button/button/button124')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 设置字体为3.2倍
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      // 设置maxLines为4
      let maxLinesButton: Component = await driver.waitForComponent(ON.id('maxLines_4_124'), 1000);
      await maxLinesButton.click();
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0990')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_SUITABLEFORAGING_0990 finish.`);
      done()
    })
  })
}