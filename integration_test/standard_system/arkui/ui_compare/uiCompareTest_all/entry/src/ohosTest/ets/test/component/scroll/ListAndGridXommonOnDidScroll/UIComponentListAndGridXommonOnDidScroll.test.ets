/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { Driver, ON ,Component, UiWindow, UiDirection, PointerMatrix } from '@kit.TestKit';
import { uiAppearance } from '@kit.ArkUI';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';


let TAG = 'RunTimeTest';

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function uIComponentListAndGridXommonOnDidScroll() {
  describe('uIComponentListAndGridXommonOnDidScroll', () => {
    beforeAll(() => {

    })
    beforeEach(() => {

    })

    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error(`[${TAG}_afterEach]`, `Failed to destroy the window. Cause : ${JSON.stringify(err)}`);
          return;
        }
        Logger.info(`[${TAG}_afterEach]`, `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done();
    })

    afterAll(() => {

    })

    
    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONDIDSCROLL_0010
     * @tc.name   : Listandgrid xommon ondidscroll
     * @tc.desc   : Verify listandgrid xommon ondidscroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONDIDSCROLL_0010', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONDIDSCROLL_0010';
      let pageName = 'UIComponentListAndGridXommonOnDidScroll0010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonOnDidScroll/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let log: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await scroll.getBoundsCenter();
      let bounds = await scroll.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await log.scrollToBottom(4000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONDIDSCROLL_0020
     * @tc.name   : Listandgrid xommon ondidscroll
     * @tc.desc   : Verify listandgrid xommon ondidscroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONDIDSCROLL_0020', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONDIDSCROLL_0020';
      let pageName = 'UIComponentListAndGridXommonOnDidScroll0020';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonOnDidScroll/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let log: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await scroll.getBoundsCenter();
      let bounds = await scroll.getBounds();
      let pointers: PointerMatrix = PointerMatrix.create(1, 3);
      pointers.setPoint(0, 0, {x: center.x, y: center.y});
      pointers.setPoint(0, 1, {x: center.x, y: bounds.bottom - 20});
      pointers.setPoint(0, 2, {x: center.x, y: bounds.top + 20});
      await driver.waitForIdle(1000, 2000);
      await driver.fling({x: center.x, y: bounds.bottom - 20}, {x: center.x, y: center.y}, 5, 40000);
      await driver.injectMultiPointerAction(pointers, 1000);
      await driver.waitForIdle(1000, 2000);
      await log.scrollToBottom(4000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONDIDSCROLL_0030
     * @tc.name   : Listandgrid xommon ondidscroll
     * @tc.desc   : Verify listandgrid xommon ondidscroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONDIDSCROLL_0030', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONDIDSCROLL_0030';
      let pageName = 'UIComponentListAndGridXommonOnDidScroll0030';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonOnDidScroll/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let log: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await scroll.getBoundsCenter();
      let bounds = await scroll.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.fling({x: center.x, y: bounds.bottom - 20}, {x: center.x, y: center.y}, 5, 40000);
      await driver.waitForIdle(1000, 2000);
      await log.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}