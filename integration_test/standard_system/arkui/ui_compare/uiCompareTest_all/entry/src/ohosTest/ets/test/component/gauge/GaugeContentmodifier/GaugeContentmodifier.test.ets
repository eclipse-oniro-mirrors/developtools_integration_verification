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

export default function gaugeContentmodifier() {

  describe('gaugeContentmodifier', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0110
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the min value of the Gauge component to null.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0110', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0110 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0110_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0170
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the max value of the Gauge component to undefined.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0170', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0170 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0170')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0170_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0170 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0230
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Dynamically switch the value, min, and max values of the Gauge component.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0230', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0230 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0230')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0230_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0230 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0240
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Comparison between the Gauge component's builder and its native implementation.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0240', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0240 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0240')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0240_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0240 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0210
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Set the Gauge component's contentModifier to undefined.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0210', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0210 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0210')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0210 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0130
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the Gauge component's max value to 200.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0130', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0130 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0130')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0130_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0130 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0060
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the Gauge component’s value greater than max.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0060 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0060_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0030
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the Gauge component’s value to 10.5.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0030 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0030_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0020
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the Gauge component's value to -20.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0020 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0020_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0070
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the Gauge component’s value to a value less than min.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0070 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0070_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0050
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the Gauge component's value to undefined.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0050 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0050_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0010
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the Gauge component's value to 20.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0010', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0010 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0010_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0040
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the Gauge component's value to null.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0040 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0040_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0100
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the Gauge component's min value to 10.5.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0100', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0100 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0100_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0140
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the Gauge component's max value to -10.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0140', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0140 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0140')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0140_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0080
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the Gauge component's min value to 10.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0080 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0080_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0150
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the Gauge component's max value to 200.5.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0150', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0150 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0150')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0150_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0150 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0120
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the Gauge component's min value to undefined.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0120', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0120 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0120_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0090
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the Gauge component's min value to -10.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0090', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0090 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0090_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0180
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the Gauge component's max value to be less than its min value.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0180', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0180 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0180')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0180_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0180 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0200
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Place an empty ContentModifier inside the Gauge component's builder.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0200', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0200 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0200')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0200_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0200 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0190
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use contentModifier(new MyGaugeStyleWithAttrs()) to fully re-customize the content area and set value, min, and max within the Gauge component.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0190', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0190 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0190')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0190_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0190 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0160
     * @tc.name   : Information gauge contentModifier
     * @tc.desc   : Verify information gauge contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Use a ContentModifier to set the Gauge component's max value to null.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0160', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0160 start.`);
      Settings.createWindow('testability/pages/component/gauge/GaugeContentmodifier/GaugeContentmodifier0160')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('GaugeContentmodifier0160_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_CONTENTMODIFIER_0160 finish.`);
      done()
    })




  })
}