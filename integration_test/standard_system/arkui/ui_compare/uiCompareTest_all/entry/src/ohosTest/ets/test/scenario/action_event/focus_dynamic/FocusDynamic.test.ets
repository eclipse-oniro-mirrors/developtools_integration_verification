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
import { BusinessError } from '@kit.BasicServicesKit'

export default function focusDynamicTest() {

  describe('focusDynamicTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err:BusinessError) => {
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
     * @tc.number : SUB_ACE_FOCUS_DYNAMIC_EFFECT_017
     * @tc.name   : Focus dynamic effect
     * @tc.desc   : Verify focus dynamic effect interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FOCUS_DYNAMIC_EFFECT_017', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FOCUS_DYNAMIC_EFFECT_017 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_dynamic/focusDynamic01')
      let driver:Driver = Driver.create();
      await driver.triggerKey(2049);
      await driver.waitForIdle(200,500);
      windowSnap.snapShot('SUB_ACE_FOCUS_DYNAMIC_EFFECT_017_01')
      await Utils.sleep(1000)
      await driver.triggerKey(2049);
      await driver.waitForIdle(200,500);
      windowSnap.snapShot('SUB_ACE_FOCUS_DYNAMIC_EFFECT_017_02')
      await Utils.sleep(1000)
      await driver.triggerKey(2049);
      await driver.waitForIdle(200,500);
      windowSnap.snapShot('SUB_ACE_FOCUS_DYNAMIC_EFFECT_017_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FOCUS_DYNAMIC_EFFECT_017 finish.`);
      done()
    })
  })
}