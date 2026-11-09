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
import { screen, uiAppearance } from '@kit.ArkUI';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';


let TAG = 'RunTimeTest';

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function uIComponentListAndGridGridGetItemIndex() {
  describe('uIComponentListAndGridGridGetItemIndex', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0010
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0010', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0010';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
      let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await itemToClick.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0020
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0020', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0020';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0020';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
      let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(itemToSwipeCenter.x, itemToSwipeCenter.y, itemToSwipeCenter.x + 50, itemToSwipeCenter.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0030
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0030', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0030';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0030';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
      let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await itemToClick.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(itemToSwipeCenter.x, itemToSwipeCenter.y, itemToSwipeCenter.x + 50, itemToSwipeCenter.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0040
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0040', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0040';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0040';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
      let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await itemToClick.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(itemToSwipeCenter.x, itemToSwipeCenter.y, itemToSwipeCenter.x + 50, itemToSwipeCenter.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0050
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0050', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0050';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0050';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
      let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await itemToClick.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(itemToSwipeCenter.x, itemToSwipeCenter.y, itemToSwipeCenter.x, itemToSwipeCenter.y + 50, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0060
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0060', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0060';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0060';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
      let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await itemToClick.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(itemToSwipeCenter.x, itemToSwipeCenter.y, itemToSwipeCenter.x + 50, itemToSwipeCenter.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0070
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0070', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0070';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0070';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
      let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await itemToClick.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(itemToSwipeCenter.x, itemToSwipeCenter.y, itemToSwipeCenter.x + 50, itemToSwipeCenter.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0080
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0080', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0080';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0080';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
      let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await itemToClick.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(itemToSwipeCenter.x, itemToSwipeCenter.y, itemToSwipeCenter.x + 50, itemToSwipeCenter.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0090
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0090', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0090';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0090';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
      let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await itemToClick.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(itemToSwipeCenter.x, itemToSwipeCenter.y, itemToSwipeCenter.x + 50, itemToSwipeCenter.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0100
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0100', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0100';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0100';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
      let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await itemToClick.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(itemToSwipeCenter.x, itemToSwipeCenter.y, itemToSwipeCenter.x + 50, itemToSwipeCenter.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0110
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0110', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0110';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0110';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_8'), 1000);
      let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_9'), 1000);
      let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await itemToClick.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(itemToSwipeCenter.x, itemToSwipeCenter.y, itemToSwipeCenter.x + 50, itemToSwipeCenter.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0120
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0120', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0120';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0120';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_38'), 1000);
      let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_39'), 1000);
      let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await itemToClick.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(itemToSwipeCenter.x, itemToSwipeCenter.y, itemToSwipeCenter.x + 50, itemToSwipeCenter.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0130
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0130', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0130';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0130';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);

      let screenClass: screen.Screen | null = null;
      screen.getAllScreens(async (err: BusinessError, data: screen.Screen[]) => {
        const errCode: number = err.code;
        if (errCode) {
          Logger.error(`[${TAG}]: Failed to get all screens. Code:${err.code},message is ${err.message}`);
          return;
        }
        Logger.info(`[${TAG}]: Succeeded in getting all screens. Data:` + JSON.stringify(data));
        screenClass = data[0];
        screenClass.setOrientation(screen.Orientation.HORIZONTAL, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            Logger.error(`[${TAG}]: Failed to set the vertical orientation. Code:${err.code},message is ${err.message}`);
            return;
          }
          Logger.info(`[${TAG}]: Succeeded in setting the vertical orientation.`);
        });
        await Utils.sleep(3000);
        let driver: Driver = Driver.create();
        let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
        let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
        let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
        let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
        let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
        let center = await targetComponent.getBoundsCenter();
        let bounds = await targetComponent.getBounds();
        await driver.waitForIdle(1000, 2000);
        await itemToClick.click();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot(TAG + '_01');
        await driver.waitForIdle(1000, 2000);
        await driver.swipe(itemToSwipeCenter.x, itemToSwipeCenter.y, itemToSwipeCenter.x + 50, itemToSwipeCenter.y, 1000);
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot(TAG + '_02');
        screenClass.setOrientation(screen.Orientation.VERTICAL, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            Logger.error(`[${TAG}]: Failed to set the vertical orientation. Code:${err.code},message is ${err.message}`);
            return;
          }
          Logger.info(`[${TAG}]: Succeeded in setting the vertical orientation.`);
        });
      })

      await Utils.sleep(8000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0160
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0160', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0160';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0160';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
      let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await itemToClick.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(itemToSwipeCenter.x, itemToSwipeCenter.y, itemToSwipeCenter.x + 50, itemToSwipeCenter.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0170
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0170', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0170';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0170';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
      let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await itemToClick.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(itemToSwipeCenter.x, itemToSwipeCenter.y, itemToSwipeCenter.x + 50, itemToSwipeCenter.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0180
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0180', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0180';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0180';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
      let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await itemToClick.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(itemToSwipeCenter.x, itemToSwipeCenter.y, itemToSwipeCenter.x + 50, itemToSwipeCenter.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0190
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0190', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0190';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0190';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
      let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await itemToClick.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(itemToSwipeCenter.x, itemToSwipeCenter.y, itemToSwipeCenter.x + 50, itemToSwipeCenter.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0200
     * @tc.name   : Listandgrid grid getitemindex
     * @tc.desc   : Verify listandgrid grid getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0200', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_GETITEMINDEX_0200';
      let pageName = 'UIComponentListAndGridGridGetItemIndex0200';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridGetItemIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let itemToClick: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let itemToSwipe: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
      let itemToSwipeCenter = await itemToSwipe.getBoundsCenter();
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await itemToClick.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(itemToSwipeCenter.x, itemToSwipeCenter.y, itemToSwipeCenter.x + 50, itemToSwipeCenter.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}