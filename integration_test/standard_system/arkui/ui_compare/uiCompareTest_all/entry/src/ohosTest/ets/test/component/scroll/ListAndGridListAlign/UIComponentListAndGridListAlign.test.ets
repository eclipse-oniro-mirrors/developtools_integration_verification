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

export default function uIComponentListAndGridListAlign() {
  describe('uIComponentListAndGridListAlign', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0180
     * @tc.name   : Listandgrid list align
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0180', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0180';
      let pageName = 'UIComponentListAndGridListAlign0180';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListAlign/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 5000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0190
     * @tc.name   : Listandgrid list align
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0190', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0190';
      let pageName = 'UIComponentListAndGridListAlign0190';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListAlign/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0220
     * @tc.name   : Listandgrid list align
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0220', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0220';
      let pageName = 'UIComponentListAndGridListAlign0220';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListAlign/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 5000);
      await driver.waitForIdle(2000, 3000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0260
     * @tc.name   : Listandgrid list align
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0260', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0260';
      let pageName = 'UIComponentListAndGridListAlign0260';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListAlign/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 5000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0270
     * @tc.name   : Listandgrid list align
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0270', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0270';
      let pageName = 'UIComponentListAndGridListAlign0270';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListAlign/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 5000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0300
     * @tc.name   : Listandgrid list align
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0300', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0300';
      let pageName = 'UIComponentListAndGridListAlign0300';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListAlign/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 5000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0380
     * @tc.name   : Listandgrid list align
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0380', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0380';
      let pageName = 'UIComponentListAndGridListAlign0380';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListAlign/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 5000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0390
     * @tc.name   : Listandgrid list align
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0390', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0390';
      let pageName = 'UIComponentListAndGridListAlign0390';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListAlign/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0430
     * @tc.name   : Listandgrid list align
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0430', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0430';
      let pageName = 'UIComponentListAndGridListAlign0430';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListAlign/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 5000);
      await driver.waitForIdle(2000, 3000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0470
     * @tc.name   : Listandgrid list align
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0470', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0470';
      let pageName = 'UIComponentListAndGridListAlign0470';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListAlign/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 5000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0480
     * @tc.name   : Listandgrid list align
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0480', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0480';
      let pageName = 'UIComponentListAndGridListAlign0480';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListAlign/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0520
     * @tc.name   : Listandgrid list align
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0520', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0520';
      let pageName = 'UIComponentListAndGridListAlign0520';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListAlign/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 5000);
      await driver.waitForIdle(2000, 3000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0560
     * @tc.name   : Listandgrid list align
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0560', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0560';
      let pageName = 'UIComponentListAndGridListAlign0560';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListAlign/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 5000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0570
     * @tc.name   : Listandgrid list align
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0570', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0570';
      let pageName = 'UIComponentListAndGridListAlign0570';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListAlign/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 5000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0610
     * @tc.name   : Listandgrid list align
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0610', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0610';
      let pageName = 'UIComponentListAndGridListAlign0610';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListAlign/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 5000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

  })
}