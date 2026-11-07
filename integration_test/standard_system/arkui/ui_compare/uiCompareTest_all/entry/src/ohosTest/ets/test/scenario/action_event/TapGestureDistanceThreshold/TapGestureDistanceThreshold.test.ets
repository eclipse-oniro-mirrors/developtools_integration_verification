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

export default function tapGestureDistanceThreshold() {

  describe('tapGestureDistanceThreshold', () => {
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
     * @tc.number : SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0220
     * @tc.name   : Tapgesture distancethreshold
     * @tc.desc   : Verify tapgesture distancethreshold interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0220 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/TapGestureDistanceThreshold/TapGestureDistanceThreshold0220')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0230
     * @tc.name   : Tapgesture distancethreshold
     * @tc.desc   : Verify tapgesture distancethreshold interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0230 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/TapGestureDistanceThreshold/TapGestureDistanceThreshold0230')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0240
     * @tc.name   : Tapgesture distancethreshold
     * @tc.desc   : Verify tapgesture distancethreshold interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0240 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/TapGestureDistanceThreshold/TapGestureDistanceThreshold0240')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0250
     * @tc.name   : Tapgesture distancethreshold
     * @tc.desc   : Verify tapgesture distancethreshold interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0250 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/TapGestureDistanceThreshold/TapGestureDistanceThreshold0250')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0260
     * @tc.name   : Tapgesture distancethreshold
     * @tc.desc   : Verify tapgesture distancethreshold interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0260 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/TapGestureDistanceThreshold/TapGestureDistanceThreshold0260')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0270
     * @tc.name   : Tapgesture distancethreshold
     * @tc.desc   : Verify tapgesture distancethreshold interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0270 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/TapGestureDistanceThreshold/TapGestureDistanceThreshold0270')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0280
     * @tc.name   : Tapgesture distancethreshold
     * @tc.desc   : Verify tapgesture distancethreshold interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0280 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/TapGestureDistanceThreshold/TapGestureDistanceThreshold0280')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0290
     * @tc.name   : Tapgesture distancethreshold
     * @tc.desc   : Verify tapgesture distancethreshold interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0290 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/TapGestureDistanceThreshold/TapGestureDistanceThreshold0290')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0300
     * @tc.name   : Tapgesture distancethreshold
     * @tc.desc   : Verify tapgesture distancethreshold interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0300 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/TapGestureDistanceThreshold/TapGestureDistanceThreshold0300')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0310
     * @tc.name   : Tapgesture distancethreshold
     * @tc.desc   : Verify tapgesture distancethreshold interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0310 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/TapGestureDistanceThreshold/TapGestureDistanceThreshold0310')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0320
     * @tc.name   : Tapgesture distancethreshold
     * @tc.desc   : Verify tapgesture distancethreshold interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0320 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/TapGestureDistanceThreshold/TapGestureDistanceThreshold0320')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0340
     * @tc.name   : Tapgesture distancethreshold
     * @tc.desc   : Verify tapgesture distancethreshold interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0340 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/TapGestureDistanceThreshold/TapGestureDistanceThreshold0340')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0350
     * @tc.name   : Tapgesture distancethreshold
     * @tc.desc   : Verify tapgesture distancethreshold interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0350 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/TapGestureDistanceThreshold/TapGestureDistanceThreshold0350')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TAPGESTURE_DISTANCETHRESHOLD_0350 finish.`);
      done()
    })

  })
}