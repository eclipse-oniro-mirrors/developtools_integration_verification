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

export default function infomationGaugeUi() {

  describe('infomationGaugeUi', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0040
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0040 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0070
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0070 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0070_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0070_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0070_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0080
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0080 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0080_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0080_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0080_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0060
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0060 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0060_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0060_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0060_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0120
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Functio
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0120', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0120 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0110
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0110', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0110 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0050
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0050 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0130
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0130', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0130 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0130')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0130 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0180
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0180', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0180 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0180')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0180_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0180 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0090
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0090', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0090 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0090_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0190
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0190', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0190 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0190')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0190_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0190 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0150
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0150', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0150 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0150')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0150_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0150 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0140
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0140', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0140 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0140')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0140_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0170
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0170', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0170 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0170')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0170_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0170 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0160
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0160', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0160 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0160')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0160_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0160 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0100
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0100', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0100 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0030
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0030 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0030_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0030_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0030_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button4: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0030_004'),1000);
      await Button4.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0020
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0020 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0020_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0020_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0020_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button4: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0020_004'),1000);
      await Button4.click();
      await driver.waitForIdle(500,2000)
      let Button5: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0020_005'),1000);
      await Button5.click();
      await driver.waitForIdle(500,2000)
      let Button6: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0020_006'),1000);
      await Button6.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0010
     * @tc.name   : Information gauge ui
     * @tc.desc   : Verify information gauge ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0010', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0010 start.`);
      Settings.createWindow('testability/pages/component/gauge/InfomationGaugeUi/InfomationGaugeUi0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0010_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0010_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0010_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button4: Component = await driver.waitForComponent(ON.id('InfomationGaugeUi0010_004'),1000);
      await Button4.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_GAUGE_UI_0010 finish.`);
      done()
    })





  })
}