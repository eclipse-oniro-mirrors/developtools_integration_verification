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

export default function uIRefreshComponentContent() {
  describe('uIRefreshComponentContent', () => {
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
     * @tc.number : SUB_ACE_UI_REFRESH_COMPONENTCONTENT_0010
     * @tc.name   : The builder parameter does not take effect when setting refreshingContent
     * @tc.desc   : Verify refresh componentcontent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_REFRESH_COMPONENTCONTENT_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_REFRESH_COMPONENTCONTENT_0010 start.`);
      Settings.createWindow('testability/pages/component/scroll/UIRefreshComponentContent/UIRefreshComponentContent001');
      let driver:Driver = Driver.create();
      let refresh2: Component = await driver.waitForComponent(ON.id('Refresh2'), 1000);
      let point2 = await refresh2.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await driver.mouseScroll({x: point2.x, y: point2.y}, true, 30);
      let refresh1: Component = await driver.waitForComponent(ON.id('Refresh1'), 1000);
      let point1 = await refresh1.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await driver.mouseScroll({x: point1.x, y: point1.y}, false, 30);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_REFRESH_COMPONENTCONTENT_0010');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_REFRESH_COMPONENTCONTENT_0010 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_REFRESH_COMPONENTCONTENT_0020
     * @tc.name   : Refresh Content function is normal
     * @tc.desc   : Verify refresh componentcontent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_REFRESH_COMPONENTCONTENT_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_REFRESH_COMPONENTCONTENT_0020 start.`);
      Settings.createWindow('testability/pages/component/scroll/UIRefreshComponentContent/UIRefreshComponentContent002');
      let driver:Driver = Driver.create();
      let refresh2: Component = await driver.waitForComponent(ON.id('Refresh2'), 1000);
      let point2 = await refresh2.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await driver.mouseScroll({x: point2.x, y: point2.y}, true, 30);
      let refresh1: Component = await driver.waitForComponent(ON.id('Refresh1'), 1000);
      let point1 = await refresh1.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await driver.mouseScroll({x: point1.x, y: point1.y}, false, 30);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_REFRESH_COMPONENTCONTENT_0020');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_REFRESH_COMPONENTCONTENT_0020 finish.`);
      done();
    });
  })
}