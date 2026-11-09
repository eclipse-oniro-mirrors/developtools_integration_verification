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

export default function sliderAgingTest() {
  describe('sliderAgingTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0010
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0010 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 系统切换为特大一档、特大二挡、特大三挡
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0010_175')
      await Utils.sleep(1000)

      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0010_200')
      await Utils.sleep(1000)

      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0010_320')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0020
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0020 start.`);
      // 先设置字体大小
      await uiAppearance.setFontScale(1.75);
      await Utils.sleep(500)
      await uiAppearance.setFontScale(2.0);
      await Utils.sleep(500)
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500)

      Settings.createWindow('testability/pages/component/form/slider/sliderAging02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0020_175')
      await Utils.sleep(1000)

      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0020_200')
      await Utils.sleep(1000)

      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0020_320')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0030
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0030 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击"1.75"按钮
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0030')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0040
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0040 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0040_01')
      await Utils.sleep(1000)

      // 进入"ArkUIHDS_Slider_Elder_0200"页面
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0040_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0050
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0050 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0050')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0060
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0060 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0060')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0070
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0070 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0070')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0080
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0080 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging08')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0080')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0090
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0090 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0090')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0100
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0100 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging10')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0100')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0110
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0110 start.`);
      await uiAppearance.setFontScale(1.75);
      await Utils.sleep(500)

      Settings.createWindow('testability/pages/component/form/slider/sliderAging11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 竖屏转横屏
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0110')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0120
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0120 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging12')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 系统切换为特大一档、特大二挡、特大三挡
      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0120_175')
      await Utils.sleep(1000)

      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0120_200')
      await Utils.sleep(1000)

      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0120_320')
      await Utils.sleep(1000)

      // 锁屏后启动（模拟）
      await Utils.sleep(2000)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0120_after_lock')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0150
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0150 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging13')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击"3.2"按钮
      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0150')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0160
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0160 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging14')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0160_01')
      await Utils.sleep(1000)

      // 进入"ArkUIHDS_Slider_Elder_0200"页面
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0160_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0170
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0170 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging15')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0170_01')
      await Utils.sleep(1000)

      // 进入"ArkUIHDS_Slider_Elder_0200"页面
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0170_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0180
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0180 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging16')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0180')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0190
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0190 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging17')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0190')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0200
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0200 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging18')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0200')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0210
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0210 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging19')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0210')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0220
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0220 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging20')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0220')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0230
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0230 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging21')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0230')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0240
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0240 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging22')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0240')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0250
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0250 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging23')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0250')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0260
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0260 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging24')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0260')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0270
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0270 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging25')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0270')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0280
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0280 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging26')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0280')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0290
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0290 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging27')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(1.75);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0290')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0300
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0300 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging28')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0300')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0310
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0310 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging29')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0310')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0320
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0320 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging30')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0320')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0330
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0330 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging31')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0330')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0340
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0340 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging32')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0340')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0350
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0350 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging33')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      await uiAppearance.setFontScale(3.2);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0350')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0360
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0360 start.`);
      await uiAppearance.setFontScale(2.0);
      await Utils.sleep(500)

      Settings.createWindow('testability/pages/component/form/slider/sliderAging34')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 竖屏转横屏
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0360')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0370
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0370 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500)

      Settings.createWindow('testability/pages/component/form/slider/sliderAging35')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 竖屏转横屏
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0370')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0380
     * @tc.name   : Button slider suitableforaging
     * @tc.desc   : Verify button slider suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0380 start.`);
      Settings.createWindow('testability/pages/component/form/slider/sliderAging36')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击"2"按钮
      await uiAppearance.setFontScale(2.0);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0380')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SUITABLEFORAGING_0380 finish.`);
      done()
    })

  })
}