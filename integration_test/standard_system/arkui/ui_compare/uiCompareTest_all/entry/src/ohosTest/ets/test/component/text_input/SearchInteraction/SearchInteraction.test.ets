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

export default function searchInteraction() {

  describe('searchInteraction', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SEARCH_INTERACTION_0090
     * @tc.name   : Text search interaction
     * @tc.desc   : Verify text search interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SEARCH_INTERACTION_0090', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SEARCH_INTERACTION_0090 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchInteraction/SearchInteraction0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2017)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2018)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2019)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2020)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2021)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2022)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2023)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2024)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2025)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2026)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2027)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2028)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2029)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2030)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2054)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SEARCH_INTERACTION_0090 finish.`);
      done()
    })




  })
}