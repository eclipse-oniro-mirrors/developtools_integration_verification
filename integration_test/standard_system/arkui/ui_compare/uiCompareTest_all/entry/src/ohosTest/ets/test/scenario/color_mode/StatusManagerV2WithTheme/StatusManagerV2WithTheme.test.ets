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

export default function statusManagerV2WithThemeTest() {
  describe('statusManagerV2WithThemeTest', () => {
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
     * @tc.number : SUB_ACE_STATUSMANAGERV2_WITHTHEME_0020
     * @tc.name   : Statusmanagerv2 withtheme
     * @tc.desc   : Verify statusmanagerv2 withtheme interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_STATUSMANAGERV2_WITHTHEME_0020', Level.LEVEL0, async (done: Function) => {
      const caseName: string ='SUB_ACE_STATUSMANAGERV2_WITHTHEME_0020';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/scenario/color_mode/StatusManagerV2WithTheme/StatusManagerV2WithTheme001');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('dark'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.id('TextPickerDialog'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_STATUSMANAGERV2_WITHTHEME_0020');
      let list: Component = await driver.waitForComponent(ON.id('screen'), 1000);
      let rect = await list.getBounds();
      console.log(`${caseName} point of List is ${JSON.stringify(rect)}`);
      await driver.click(rect.left + 20, rect.top + 20);
      await Utils.sleep(1000);
      let button3: Component = await driver.waitForComponent(ON.id('light'), 1000);
      await button3.click();
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });
  })
}