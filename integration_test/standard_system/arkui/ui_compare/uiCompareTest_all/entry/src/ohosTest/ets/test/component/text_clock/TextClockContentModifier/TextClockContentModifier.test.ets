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

export default function textClockContentModifier() {

  describe('textClockContentModifier', () => {
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
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0080
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0080 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0110
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0110', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0110 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0260
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0260', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0260 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0260')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0260 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0300
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0300', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0300 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0300')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0300 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0290
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0290', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0290 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0290')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextClockContentModifier0290_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0290 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0310
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0310', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0310 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0310')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0310 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0350
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0350', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0350 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0350')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextClockContentModifier0350_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('TextClockContentModifier0350_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0350 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0390
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0390', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0390 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0390')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextClockContentModifier0390_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('TextClockContentModifier0390_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0390 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0380
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0380', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0380 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0380')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextClockContentModifier0380_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('TextClockContentModifier0380_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0380 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0400
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0400', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0400 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0400')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextClockContentModifier0400_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0400 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0420
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0420', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0420 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0420')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextClockContentModifier0420_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('TextClockContentModifier0420_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0420 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0280
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0280', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0280 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0280')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextClockContentModifier0280_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0280 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0370
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0370', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0370 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0370')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextClockContentModifier0370_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0370 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0430
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0430', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0430 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0430')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextClockContentModifier0430_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0430 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0450
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0450', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0450 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0450')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextClockContentModifier0450_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0450 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0440
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0440', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0440 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0440')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextClockContentModifier0440_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0440 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0410
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0410', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0410 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0410')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextClockContentModifier0410_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('TextClockContentModifier0410_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0410 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0070
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0070 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0140
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0140', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0140 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0140')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0040
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0040 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0060
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0060 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0020
     * @tc.name   : ArkUI TextClock contentModifier
     * @tc.desc   : Verify ArkUI TextClock contentModifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0020 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockContentModifier/TextClockContentModifier0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTCLOCK_CONTENTMODIFIER_0020 finish.`);
      done()
    })




  })
}