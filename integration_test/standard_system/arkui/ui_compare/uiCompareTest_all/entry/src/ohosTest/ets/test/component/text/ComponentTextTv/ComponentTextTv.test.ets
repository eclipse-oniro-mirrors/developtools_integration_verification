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

export default function componentTextTv() {

  describe('componentTextTv', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0070
     * @tc.name   : Text tv
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Set the delay of 008.marqueeOptions to a negative number
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0070 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTv/ComponentTextTv0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0040
     * @tc.name   : Text tv
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Set the delay of 004.marqueeOptions to 0.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0040 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTv/ComponentTextTv0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0130
     * @tc.name   : Text tv
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Set the fromStart of 014.marqueeOptions to true.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0130', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0130 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTv/ComponentTextTv0130')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0130 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0150
     * @tc.name   : Text tv
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Set the loop of 016.marqueeOptions to -1.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0150', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0150 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTv/ComponentTextTv0150')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0150 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0220
     * @tc.name   : Text tv
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Do not set the step of 025.marqueeOptions.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0220', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0220 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTv/ComponentTextTv0220')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0220 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0280
     * @tc.name   : Text tv
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : When a single marquee ends, the onMarqueeStateChange callback is triggered.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0280', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0280 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTv/ComponentTextTv0280')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0280 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0270
     * @tc.name   : Text tv
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Set the step of 031.marqueeOptions to a very large positive number.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0270', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0270 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTv/ComponentTextTv0270')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(4000,5000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0270 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0290
     * @tc.name   : Text tv
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : When all marquees end, the onMarqueeStateChange callback is triggered.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0290', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0290 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTv/ComponentTextTv0290')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0290 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0360
     * @tc.name   : Text tv
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Set the marqueePolicy of 040.marqueeOptions to 0.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0360', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0360 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTv/ComponentTextTv0360')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0360 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0370
     * @tc.name   : Text tv
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Set the marqueePolicy of 041.marqueeOptions to 1.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0370', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0370 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTv/ComponentTextTv0370')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0370 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0590
     * @tc.name   : Text tv
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : The setting of containerSpan in the 021.text component, which includes span and imagespan, has an impact on the fade effect.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0590', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0590 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTv/ComponentTextTv0590')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0590 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0600
     * @tc.name   : Text tv
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Setting the imagespan subcomponent in the 022.text component affects the fade effect.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0600', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0600 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTv/ComponentTextTv0600')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0600 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0580
     * @tc.name   : Text tv
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Change the width of the 020.text component and observe the fade effect.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0580', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0580 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTv/ComponentTextTv0580')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0580 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0640
     * @tc.name   : Text tv
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Add decoration lines to the text and observe the fade effect.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0640', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0640 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTv/ComponentTextTv0640')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0640 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0610
     * @tc.name   : Text tv
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Set span, imagespan, and symbolspan in the 023.text component and observe the fade effect.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0610', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0610 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTv/ComponentTextTv0610')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0610 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0670
     * @tc.name   : Text tv
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : The effect of the fade effect previewer.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0670', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0670 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTv/ComponentTextTv0670')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0670 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0460
     * @tc.name   : Text tv
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : The fadeout setting is not effective when 008.textoverflow is not set to Marquee.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0460', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0460 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTv/ComponentTextTv0460')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0460 finish.`);
      done()
    })


  })
}