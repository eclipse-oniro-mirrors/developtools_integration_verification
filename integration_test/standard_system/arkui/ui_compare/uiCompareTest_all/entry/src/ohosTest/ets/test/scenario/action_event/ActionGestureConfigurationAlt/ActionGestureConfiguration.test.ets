/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
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
import { Driver, ON, Component } from '@kit.TestKit'

export default function actionGestureConfigurationTest() {
  describe('actionGestureConfigurationTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
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
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1120
     * @tc.name   : Action gesture configuration
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1120 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_04/ActionGestureConfiguration001');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1120');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1120 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1130
     * @tc.name   : Action gesture configuration
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1130', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1130 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_04/ActionGestureConfiguration002');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1130');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1130 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1140
     * @tc.name   : Action gesture configuration
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1140 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_04/ActionGestureConfiguration003');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1140');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1140 finish.`);
      done();
    });
  })
}