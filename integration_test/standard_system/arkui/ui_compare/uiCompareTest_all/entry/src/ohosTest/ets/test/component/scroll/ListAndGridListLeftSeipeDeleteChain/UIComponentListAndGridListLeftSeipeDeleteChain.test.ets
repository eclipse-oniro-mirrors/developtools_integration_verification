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

export default function uIComponentListAndGridListLeftSeipeDeleteChain() {
  describe('uIComponentListAndGridListLeftSeipeDeleteChain', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0010
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0010', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0010';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list1: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let list2: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button1.click();
      await driver.waitForIdle(1000, 2000);
      await button1.click();
      await driver.waitForIdle(1000, 2000);
      await button2.click();
      await driver.waitForIdle(1000, 2000);
      await list1.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await list2.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0040
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0040', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0040';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0040';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0050
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0050', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0050';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0050';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 7000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0060
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0060', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0060';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0060';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0070
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0070', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0070';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0070';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0080
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0080', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0080';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0080';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await button1.click();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToTop(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0090
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0090', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0090';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0090';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0100
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0100', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0100';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0100';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0110
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0110', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0110';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0110';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      let item16: Component = await driver.waitForComponent(ON.id(pageName + '_03_16'), 1000);
      let item18: Component = await driver.waitForComponent(ON.id(pageName + '_03_18'), 1000);
      let item16Center = await item16.getBoundsCenter();
      let item18Center = await item18.getBoundsCenter();
      await driver.drag(item16Center.x, item16Center.y, item18Center.x, item18Center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0120
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0120', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0120';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0120';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      let item16: Component = await driver.waitForComponent(ON.id(pageName + '_03_16'), 1000);
      let item18: Component = await driver.waitForComponent(ON.id(pageName + '_03_18'), 1000);
      let item16Center = await item16.getBoundsCenter();
      let item18Center = await item18.getBoundsCenter();
      await driver.drag(item16Center.x, item16Center.y, item18Center.x, item18Center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0130
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0130', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0130';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0130';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      let item16: Component = await driver.waitForComponent(ON.id(pageName + '_03_16'), 1000);
      let item18: Component = await driver.waitForComponent(ON.id(pageName + '_03_18'), 1000);
      let item16Center = await item16.getBoundsCenter();
      let item18Center = await item18.getBoundsCenter();
      await driver.drag(item16Center.x, item16Center.y, bounds.left, bounds.bottom + 100, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0140
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0140', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0140';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0140';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0180
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0180', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0180';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0180';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0190
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0190', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0190';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0190';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0200
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0200', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0200';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0200';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0210
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0210', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0210';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0210';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0230
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0230', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0230';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0230';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0240
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0240', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0240';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0240';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0250
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0250', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0250';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0250';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0260
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0260', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0260';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0260';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0270
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0270', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0270';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0270';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0280
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0280', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0280';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0280';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0290
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0290', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0290';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0290';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0300
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0300', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0300';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0300';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0310
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0310', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0310';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0310';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0320
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0320', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0320';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0320';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0360
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0360', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0360';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0360';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0370
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0370', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0370';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0370';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0380
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0380', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0380';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0380';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0390
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0390', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0390';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0390';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0400
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0400', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0400';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0400';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 7000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0410
     * @tc.name   : Listandgrid list leftseipedelete chain
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0410', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0410';
      let pageName = 'UIComponentListAndGridListLeftSeipeDeleteChain0410';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSeipeDeleteChain/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseDrag({x: bounds.left + 50, y: bounds.bottom - 8}, {x: bounds.right - 10, y: bounds.bottom - 8}, 5000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}