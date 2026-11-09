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
import { Driver, ON ,Component, UiWindow } from '@kit.TestKit';
import { uiAppearance } from '@kit.ArkUI';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';


let TAG = 'RunTimeTest';

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function uIComponentGridEvent() {
  describe('uIComponentGridEvent', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_0010
     * @tc.name   : Grid event
     * @tc.desc   : Verify grid event interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_0010', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_0010';
      let pageName = 'UIComponentGridEvent0010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEvent/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await grid.getBoundsCenter();
      let bounds = await grid.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseMoveTo(center);
      await driver.drag(center.x, center.y, bounds.right - 10, center.y);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_0020
     * @tc.name   : Grid event
     * @tc.desc   : Verify grid event interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_0020', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_0020';
      let pageName = 'UIComponentGridEvent0020';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEvent/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await grid.getBoundsCenter();
      let bounds = await grid.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseMoveTo(center);
      await driver.drag(center.x, center.y, bounds.right - 10, center.y);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_0030
     * @tc.name   : Grid event
     * @tc.desc   : Verify grid event interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_0030', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_0030';
      let pageName = 'UIComponentGridEvent0030';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEvent/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let center = await grid.getBoundsCenter();
      let bounds = await grid.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseMoveTo(center);
      await driver.drag(center.x, center.y, bounds.right - 10, center.y);
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(3000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_0040
     * @tc.name   : Grid event
     * @tc.desc   : Verify grid event interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_0040', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_0040';
      let pageName = 'UIComponentGridEvent0040';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEvent/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let center = await grid.getBoundsCenter();
      let bounds = await grid.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseMoveTo(center);
      await driver.drag(center.x, center.y, bounds.right - 10, center.y);
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(3000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_0090
     * @tc.name   : Grid event
     * @tc.desc   : Verify grid event interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_0090', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_0090';
      let pageName = 'UIComponentGridEvent0090';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEvent/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await grid.getBoundsCenter();
      let bounds = await grid.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseMoveTo(center);
      await driver.drag(center.x, center.y, bounds.right - 10, center.y);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_0100
     * @tc.name   : Grid event
     * @tc.desc   : Verify grid event interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_0100', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_0100';
      let pageName = 'UIComponentGridEvent0100';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEvent/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let center = await grid.getBoundsCenter();
      let listBounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseMoveTo(center);
      await driver.drag(center.x, center.y, center.x, listBounds.bottom - 20);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_0110
     * @tc.name   : Grid event
     * @tc.desc   : Verify grid event interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_0110', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_0110';
      let pageName = 'UIComponentGridEvent0110';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEvent/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await grid.getBoundsCenter();
      let bounds = await grid.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.fling({x: center.x, y: bounds.bottom - 50}, {x: center.x, y: bounds.top + 50}, 100, 3000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}