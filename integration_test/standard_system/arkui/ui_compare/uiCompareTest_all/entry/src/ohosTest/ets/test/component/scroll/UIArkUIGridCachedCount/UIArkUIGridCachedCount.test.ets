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

export default function uIArkUIGridCachedCountTest() {
  describe('uIArkUIGridCachedCountTest', () => {
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
     * @tc.number : SUB_ACE_UI_ARKUI_GRID_CACHEDCOUNT_0010
     * @tc.name   : ArkUI grid cachedcount
     * @tc.desc   : Verify ArkUI grid cachedcount interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ARKUI_GRID_CACHEDCOUNT_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_GRID_CACHEDCOUNT_0010 start.`);
      Settings.createWindow('testability/pages/component/scroll/UIArkUIGridCachedCount/UIArkUIGridCachedCount001');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ARKUI_GRID_CACHEDCOUNT_0010_01');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_GRID_CACHEDCOUNT_0010 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_GRID_CACHEDCOUNT_0020
     * @tc.name   : ArkUI grid cachedcount
     * @tc.desc   : Verify ArkUI grid cachedcount interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ARKUI_GRID_CACHEDCOUNT_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_GRID_CACHEDCOUNT_0020 start.`);
      Settings.createWindow('testability/pages/component/scroll/UIArkUIGridCachedCount/UIArkUIGridCachedCount002');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ARKUI_GRID_CACHEDCOUNT_0020_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_GRID_CACHEDCOUNT_0020 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_GRID_CACHEDCOUNT_0090
     * @tc.name   : ArkUI grid cachedcount
     * @tc.desc   : Verify ArkUI grid cachedcount interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ARKUI_GRID_CACHEDCOUNT_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_GRID_CACHEDCOUNT_0090 start.`);
      Settings.createWindow('testability/pages/component/scroll/UIArkUIGridCachedCount/UIArkUIGridCachedCount003');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ARKUI_GRID_CACHEDCOUNT_0090_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_GRID_CACHEDCOUNT_0090 finish.`);
      done();
    });
  })
}