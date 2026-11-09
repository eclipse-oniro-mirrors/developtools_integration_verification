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
import { Driver, ON ,Component, UiWindow, MouseButton } from '@kit.TestKit';
import { uiAppearance } from '@kit.ArkUI';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';


let TAG = 'RunTimeTest';

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function uIComponentListAndGridGridLayout() {
  describe('uIComponentListAndGridGridLayout', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0020_965
     * @tc.name   : Listandgrid grid layout
     * @tc.desc   : Verify listandgrid grid layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0020_965', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0020_965';
      let pageName = 'UIComponentListAndGridGridLayout0020_965';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridLayout/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0030_208
     * @tc.name   : Listandgrid grid layout
     * @tc.desc   : Verify listandgrid grid layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0030_208', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0030_208';
      let pageName = 'UIComponentListAndGridGridLayout0030_208';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridLayout/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0130_500
     * @tc.name   : Listandgrid grid layout
     * @tc.desc   : Verify listandgrid grid layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0130_500', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0130_500';
      let pageName = 'UIComponentListAndGridGridLayout0130_500';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridLayout/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await grid.getBoundsCenter();
      let bounds = await grid.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(center.x, center.y, bounds.right - 10, center.y);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0140_148
     * @tc.name   : Listandgrid grid layout
     * @tc.desc   : Verify listandgrid grid layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0140_148', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0140_148';
      let pageName = 'UIComponentListAndGridGridLayout0140_148';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridLayout/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let item: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await grid.getBoundsCenter();
      let bounds = await grid.getBounds();
      let itemBounds = await item.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseClick({x: itemBounds.right + 5, y: itemBounds.bottom + 5}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(1000, 2000);
      await driver.mouseDrag({x: itemBounds.right + 5, y: itemBounds.bottom + 5}, {x: bounds.right, y: bounds.top});
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0150_305
     * @tc.name   : Listandgrid grid layout
     * @tc.desc   : Verify listandgrid grid layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0150_305', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0150_305';
      let pageName = 'UIComponentListAndGridGridLayout0150_305';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridLayout/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await grid.getBoundsCenter();
      let bounds = await grid.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(center.x, center.y, bounds.right, center.y);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0160_632
     * @tc.name   : Listandgrid grid layout
     * @tc.desc   : Verify listandgrid grid layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0160_632', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0160_632';
      let pageName = 'UIComponentListAndGridGridLayout0160_632';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridLayout/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let item: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await grid.getBoundsCenter();
      let bounds = await grid.getBounds();
      let itemBounds = await item.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseClick({x: itemBounds.right + 5, y: itemBounds.bottom + 5}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(1000, 2000);
      await driver.mouseDrag({x: itemBounds.right + 5, y: itemBounds.bottom + 5}, {x: bounds.right, y: bounds.top});
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0170_142
     * @tc.name   : Listandgrid grid layout
     * @tc.desc   : Verify listandgrid grid layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0170_142', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0170_142';
      let pageName = 'UIComponentListAndGridGridLayout0170_142';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridLayout/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await grid.getBoundsCenter();
      let bounds = await grid.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(center.x, center.y, bounds.right, center.y);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0170_193
     * @tc.name   : Listandgrid grid layout
     * @tc.desc   : Verify listandgrid grid layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0170_193', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0170_193';
      let pageName = 'UIComponentListAndGridGridLayout0170_193';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridLayout/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await grid.getBoundsCenter();
      let bounds = await grid.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(center.x, center.y, bounds.right, center.y);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0550_597
     * @tc.name   : Listandgrid grid layout
     * @tc.desc   : Verify listandgrid grid layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0550_597', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_LAYOUT_0550_597';
      let pageName = 'UIComponentListAndGridGridLayout0550_597';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridLayout/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

  })
}