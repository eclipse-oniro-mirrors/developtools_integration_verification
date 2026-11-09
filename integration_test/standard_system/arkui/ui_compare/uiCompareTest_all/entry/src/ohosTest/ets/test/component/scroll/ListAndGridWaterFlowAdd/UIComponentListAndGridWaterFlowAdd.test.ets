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

export default function uIComponentListAndGridWaterFlowAdd() {
  describe('uIComponentListAndGridWaterFlowAdd', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0020_925
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0020_925', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0020_925';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0020_925';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await waterFlow.scrollToBottom(4000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0030_720
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0030_720', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0030_720';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0030_720';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 20, center.y, bounds.left + 20, center.y, 4000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0050_323
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0050_323', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0050_323';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0050_323';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01_1'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_01_2'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button1.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await button2.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0060_356
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0060_356', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0060_356';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0060_356';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await waterFlow.scrollToBottom(4000);
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(10000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0070_772
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0070_772', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0070_772';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0070_772';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await waterFlow.scrollToTop(2000);
      await driver.waitForIdle(1000, 2000);
      await scroll.scrollToBottom(10000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0180_810
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0180_810', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0180_810';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0180_810';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await waterFlow.scrollToBottom(4000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0190_003
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0190_003', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0190_003';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0190_003';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await waterFlow.scrollToBottom(4000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0200_983
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0200_983', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0200_983';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0200_983';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await waterFlow.scrollToBottom(4000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0210_008
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0210_008', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0210_008';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0210_008';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await waterFlow.scrollToBottom(4000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0220_706
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0220_706', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0220_706';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0220_706';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await waterFlow.scrollToBottom(4000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0230_749
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0230_749', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0230_749';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0230_749';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await waterFlow.scrollToBottom(4000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0240_208
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0240_208', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0240_208';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0240_208';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await waterFlow.scrollToBottom(4000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0250_204
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0250_204', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0250_204';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0250_204';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await waterFlow.scrollToBottom(4000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0260_699
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0260_699', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0260_699';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0260_699';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await waterFlow.scrollToBottom(4000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0330_371
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0330_371', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0330_371';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0330_371';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 20, center.y, bounds.left + 20, center.y, 8000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0340_608
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0340_608', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0340_608';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0340_608';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 20, center.y, bounds.left + 20, center.y, 8000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0350_527
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0350_527', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0350_527';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0350_527';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 20, center.y, bounds.left + 20, center.y, 8000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0360_760
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0360_760', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0360_760';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0360_760';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 20, center.y, bounds.left + 20, center.y, 8000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0370_350
     * @tc.name   : Listandgrid waterflow add
     * @tc.desc   : Verify listandgrid waterflow add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0370_350', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_ADD_0370_350';
      let pageName = 'UIComponentListAndGridWaterFlowAdd0370_350';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridWaterFlowAdd/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 20, center.y, bounds.left + 20, center.y, 8000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}