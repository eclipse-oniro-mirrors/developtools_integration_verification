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

export default function textClockPrefixed() {

  describe('textClockPrefixed', () => {
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
     * @tc.number : SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0040
     * @tc.name   : ArkUI text clock prefixed
     * @tc.desc   : Verify ArkUI text clock prefixed interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0040 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockPrefixed/TextClockPrefixed0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0080
     * @tc.name   : ArkUI text clock prefixed
     * @tc.desc   : Verify ArkUI text clock prefixed interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0080 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockPrefixed/TextClockPrefixed0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0090
     * @tc.name   : ArkUI text clock prefixed
     * @tc.desc   : Verify ArkUI text clock prefixed interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0090', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0090 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockPrefixed/TextClockPrefixed0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0100
     * @tc.name   : ArkUI text clock prefixed
     * @tc.desc   : Verify ArkUI text clock prefixed interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0100', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0100 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockPrefixed/TextClockPrefixed0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0050
     * @tc.name   : ArkUI text clock prefixed
     * @tc.desc   : Verify ArkUI text clock prefixed interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0050 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockPrefixed/TextClockPrefixed0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0070
     * @tc.name   : ArkUI text clock prefixed
     * @tc.desc   : Verify ArkUI text clock prefixed interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0070 start.`);
      Settings.createWindow('testability/pages/component/text_clock/TextClockPrefixed/TextClockPrefixed0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXT_CLOCK_PREFIXED_0_0070 finish.`);
      done()
    })






  })
}