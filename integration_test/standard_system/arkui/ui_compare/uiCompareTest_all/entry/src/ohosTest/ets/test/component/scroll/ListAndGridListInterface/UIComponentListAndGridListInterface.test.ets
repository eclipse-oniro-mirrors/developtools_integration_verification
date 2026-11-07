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

export default function uIComponentListAndGridListInterface() {
  describe('uIComponentListAndGridListInterface', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0010
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0010', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0010';
      let pageName = 'UIComponentListAndGridListInterface0010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await Utils.sleep(3000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0050
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0050', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0050';
      let pageName = 'UIComponentListAndGridListInterface0050';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0160
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0160', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0160';
      let pageName = 'UIComponentListAndGridListInterface0160';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top - 100, 1000);
      await driver.waitForIdle(3000, 4000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0180
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0180', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0180';
      let pageName = 'UIComponentListAndGridListInterface0180';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let item0: Component = await driver.waitForComponent(ON.id(pageName + '_02_0'), 1000);
      let item2: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      let item0Bounds = await item0.getBounds();
      let item2Bounds = await item2.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseDrag({x: item0Bounds.right, y: item0Bounds.bottom}, {x: item2Bounds.right, y: item2Bounds.top}, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0210
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0210', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0210';
      let pageName = 'UIComponentListAndGridListInterface0210';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0220
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0220', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0220';
      let pageName = 'UIComponentListAndGridListInterface0220';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0240
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0240', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0240';
      let pageName = 'UIComponentListAndGridListInterface0240';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0260
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0260', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0260';
      let pageName = 'UIComponentListAndGridListInterface0260';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(3000, 4000);
      await scroll.scrollToBottom(10000);
      await driver.waitForIdle(3000, 4000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.swipe(center.x, center.y, center.x, bounds.top - 100, 1000);
      await driver.waitForIdle(3000, 4000);
      await scroll.scrollToBottom(10000);
      await driver.waitForIdle(3000, 4000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0600
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0600', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0600';
      let pageName = 'UIComponentListAndGridListInterface0600';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0740
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0740', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0740';
      let pageName = 'UIComponentListAndGridListInterface0740';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0750
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0750', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0750';
      let pageName = 'UIComponentListAndGridListInterface0750';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let item2: Component = await driver.waitForComponent(ON.id(pageName + '_02_2'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      let item2Bounds = await item2.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseDrag({x: item2Bounds.left - 50, y: item2Bounds.top - 10}, {x: item2Bounds.right + 50, y: item2Bounds.bottom + 50}, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0800
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0800', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0800';
      let pageName = 'UIComponentListAndGridListInterface0800';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0810
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0810', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0810';
      let pageName = 'UIComponentListAndGridListInterface0810';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0820
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0820', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0820';
      let pageName = 'UIComponentListAndGridListInterface0820';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0830
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0830', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0830';
      let pageName = 'UIComponentListAndGridListInterface0830';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0840
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0840', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0840';
      let pageName = 'UIComponentListAndGridListInterface0840';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0850
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0850', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0850';
      let pageName = 'UIComponentListAndGridListInterface0850';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0860
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0860', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0860';
      let pageName = 'UIComponentListAndGridListInterface0860';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0870
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0870', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0870';
      let pageName = 'UIComponentListAndGridListInterface0870';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0880
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0880', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0880';
      let pageName = 'UIComponentListAndGridListInterface0880';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0890
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0890', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0890';
      let pageName = 'UIComponentListAndGridListInterface0890';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0910
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0910', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0910';
      let pageName = 'UIComponentListAndGridListInterface0910';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0940
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0940', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0940';
      let pageName = 'UIComponentListAndGridListInterface0940';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0950
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0950', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0950';
      let pageName = 'UIComponentListAndGridListInterface0950';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0960
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0960', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0960';
      let pageName = 'UIComponentListAndGridListInterface0960';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1000
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1000', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1000';
      let pageName = 'UIComponentListAndGridListInterface1000';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1030
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1030', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1030';
      let pageName = 'UIComponentListAndGridListInterface1030';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1070
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1070', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1070';
      let pageName = 'UIComponentListAndGridListInterface1070';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1180
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1180', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1180';
      let pageName = 'UIComponentListAndGridListInterface1180';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(1000, 2000);
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
        await driver.waitForIdle(1000, 2000);
        let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
        let center = await list.getBoundsCenter();
        let bounds = await list.getBounds();
        await list.scrollToBottom(2000);
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        screenClass.setOrientation(screen.Orientation.VERTICAL, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            Logger.error(`[${TAG}]: Failed to set the vertical orientation. Code:${err.code},message is ${err.message}`);
            return;
          }
          Logger.info(`[${TAG}]: Succeeded in setting the vertical orientation.`);
        });
      });
      await Utils.sleep(10000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1260
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1260', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1260';
      let pageName = 'UIComponentListAndGridListInterface1260';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1470
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1470', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1470';
      let pageName = 'UIComponentListAndGridListInterface1470';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1490
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1490', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1490';
      let pageName = 'UIComponentListAndGridListInterface1490';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseDrag({x: bounds.right - 8, y: bounds.top + 20}, {x: bounds.right - 8, y: bounds.bottom - 10}, 2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1520
     * @tc.name   : Listandgrid list interface
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1520', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1520';
      let pageName = 'UIComponentListAndGridListInterface1520';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListInterface/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await list.scrollToTop(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}