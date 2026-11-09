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

export default function privacySensitiveGauge() {

  describe('privacySensitiveGauge', () => {
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
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0040
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0040 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0040_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0040_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0040_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button4: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0040_004'),1000);
      await Button4.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0100
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0100', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0100 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0100_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0170
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0170', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0170 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0170')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0170 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0160
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0160', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0160 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0160')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0160 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0060
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0060 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0060_001'),1000);
      await Button1.click();
      await driver.waitForIdle(1000,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0110
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0110', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0110 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0110_001'),1000);
      await Button1.click();
      await driver.waitForIdle(1000,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0110 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0150
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0150', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0150 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0150')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0150_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0150_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0150_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button4: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0150_004'),1000);
      await Button4.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0150 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0030
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0030 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0190
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0190', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0190 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0190')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0190_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0190 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0070
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0070 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0070')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0070_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0070_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0070_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button4: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0070_004'),1000);
      await Button4.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0050
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0050 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0050')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0050_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0080
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0080 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0080')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0080_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0120
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0120', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0120 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0090
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0090', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0090 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0090')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0090_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0090_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0090_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button4: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0090_004'),1000);
      await Button4.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0130
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0130', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0130 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0130')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0130 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0200
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0200', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0200 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0200')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0200_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0200_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0200_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button4: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0200_004'),1000);
      await Button4.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0200 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0180
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0180', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0180 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0180')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0180_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0180_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0180_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button4: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0180_004'),1000);
      await Button4.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0180 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0230
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0230', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0230 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0230')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0230_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0230 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0140
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0140', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0140 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0140')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0140_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0220
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0220', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0220 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0220')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0220_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0220_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0220_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button4: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0220_004'),1000);
      await Button4.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0220 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0210
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0210', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0210 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0210')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0210_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0210 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0260
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0260', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0260 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0260')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0260_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0260_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0260_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button4: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0260_004'),1000);
      await Button4.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0260 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0240
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0240', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0240 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0240')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0240 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0250
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0250', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0250 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0250')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0250_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0250 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0270
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0270', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0270 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0270')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('PrivacySensitiveGauge0270_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0270 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0020
     * @tc.name   : ArkUI privacysensitive gauge
     * @tc.desc   : Verify ArkUI privacysensitive gauge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0020 start.`);
      Settings.createWindow('testability/pages/component/gauge/PrivacySensitiveGauge/PrivacySensitiveGauge0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_GAUGE_0020 finish.`);
      done()
    })


  })
}