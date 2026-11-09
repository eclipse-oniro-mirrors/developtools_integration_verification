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

export default function progressBorderradius() {

  describe('progressBorderradius', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDERRADIUS_0025
     * @tc.name   : Dynamically modify the border radius value and border radius type.
     * @tc.desc   : Verify media Progress borderradius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDERRADIUS_0025', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDERRADIUS_0025 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBorderradius/ProgressBorderradius0025')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      let button1 = await driver.waitForComponent(ON.id('ProgressBorderradius0025_001'), 2000)
      await button1.click()
      await Utils.sleep(500)
      let button2 = await driver.waitForComponent(ON.id('ProgressBorderradius0025_002'), 2000)
      await button2.click()
      await Utils.sleep(500)
      let button3 = await driver.waitForComponent(ON.id('ProgressBorderradius0025_003'), 2000)
      await button3.click()
      await Utils.sleep(500)
      let button4 = await driver.waitForComponent(ON.id('ProgressBorderradius0025_004'), 2000)
      await button4.click()
      await Utils.sleep(500)
      let button5 = await driver.waitForComponent(ON.id('ProgressBorderradius0025_005'), 2000)
      await button5.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDERRADIUS_0025 finish.`);
      done()
    })




  })
}