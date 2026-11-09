
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

export default function uIComponentGridEventModifier() {
  describe('uIComponentGridEventModifier', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0010
     * @tc.name   : Grid event modifier
     * @tc.desc   : Verify grid event modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0010', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0010';
      let pageName = 'UIComponentGridEventModifier0010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEventModifier/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let bounds = await grid.getBounds();
      let center = await grid.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top + 20, 2000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(6000);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0020
     * @tc.name   : Grid event modifier
     * @tc.desc   : Verify grid event modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0020', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0020';
      let pageName = 'UIComponentGridEventModifier0020';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEventModifier/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let bounds = await grid.getBounds();
      let center = await grid.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top + 20, 2000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(6000);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0030
     * @tc.name   : Grid event modifier
     * @tc.desc   : Verify grid event modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0030', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0030';
      let pageName = 'UIComponentGridEventModifier0030';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEventModifier/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let bounds = await grid.getBounds();
      let center = await grid.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top + 20, 2000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(6000);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0040
     * @tc.name   : Grid event modifier
     * @tc.desc   : Verify grid event modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0040', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0040';
      let pageName = 'UIComponentGridEventModifier0040';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEventModifier/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let bounds = await grid.getBounds();
      let center = await grid.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top + 20, 2000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(6000);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0050
     * @tc.name   : Grid event modifier
     * @tc.desc   : Verify grid event modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0050', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0050';
      let pageName = 'UIComponentGridEventModifier0050';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEventModifier/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let bounds = await grid.getBounds();
      let center = await grid.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top + 20, 2000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(6000);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0060
     * @tc.name   : Grid event modifier
     * @tc.desc   : Verify grid event modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0060', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0060';
      let pageName = 'UIComponentGridEventModifier0060';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEventModifier/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let bounds = await grid.getBounds();
      let center = await grid.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top + 20, 2000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(6000);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0070
     * @tc.name   : Grid event modifier
     * @tc.desc   : Verify grid event modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0070', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0070';
      let pageName = 'UIComponentGridEventModifier0070';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEventModifier/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let bounds = await grid.getBounds();
      let center = await grid.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top + 20, 2000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(6000);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0080
     * @tc.name   : Grid event modifier
     * @tc.desc   : Verify grid event modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0080', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0080';
      let pageName = 'UIComponentGridEventModifier0080';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEventModifier/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let bounds = await grid.getBounds();
      let center = await grid.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top + 20, 2000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(6000);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0090
     * @tc.name   : Grid event modifier
     * @tc.desc   : Verify grid event modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0090', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0090';
      let pageName = 'UIComponentGridEventModifier0090';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEventModifier/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let bounds = await grid.getBounds();
      let center = await grid.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top + 20, 2000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(6000);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0100
     * @tc.name   : Grid event modifier
     * @tc.desc   : Verify grid event modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0100', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0100';
      let pageName = 'UIComponentGridEventModifier0100';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEventModifier/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let bounds = await grid.getBounds();
      let center = await grid.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(center.x, center.y, bounds.right - 10, center.y);
      await driver.waitForIdle(3000, 4000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(6000);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0110
     * @tc.name   : Grid event modifier
     * @tc.desc   : Verify grid event modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0110', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0110';
      let pageName = 'UIComponentGridEventModifier0110';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEventModifier/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let bounds = await grid.getBounds();
      let center = await grid.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(center.x, center.y, bounds.right - 10, center.y);
      await driver.waitForIdle(3000, 4000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(6000);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0120
     * @tc.name   : Grid event modifier
     * @tc.desc   : Verify grid event modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0120', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0120';
      let pageName = 'UIComponentGridEventModifier0120';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEventModifier/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let bounds = await grid.getBounds();
      let center = await grid.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(center.x, center.y, bounds.right - 10, center.y);
      await driver.waitForIdle(3000, 4000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(6000);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0130
     * @tc.name   : Grid event modifier
     * @tc.desc   : Verify grid event modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0130', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0130';
      let pageName = 'UIComponentGridEventModifier0130';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEventModifier/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let bounds = await grid.getBounds();
      let center = await grid.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(center.x, center.y, bounds.right - 10, center.y);
      await driver.waitForIdle(3000, 4000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(6000);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0140
     * @tc.name   : Grid event modifier
     * @tc.desc   : Verify grid event modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0140', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_EVENT_MODIFIER_0140';
      let pageName = 'UIComponentGridEventModifier0140';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridEventModifier/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let bounds = await grid.getBounds();
      let center = await grid.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(center.x, center.y, bounds.right - 10, center.y);
      await driver.waitForIdle(3000, 4000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(6000);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}