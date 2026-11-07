
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

export default function uIComponentGridJiaoDian() {
  describe('uIComponentGridJiaoDian', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0010
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0010', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0010';
      let pageName = 'UIComponentGridJiaoDian0010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);

      await grid.click();
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      await grid.scrollToBottom(3000);
      await driver.waitForIdle(1000, 2000);
      await grid.scrollToTop(3000);
      await driver.waitForIdle(1000, 2000);

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0020
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0020', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0020';
      let pageName = 'UIComponentGridJiaoDian0020';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);

      await grid.click();
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      await grid.scrollToBottom(3000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await grid.scrollToTop(3000);
      await driver.waitForIdle(1000, 2000);

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0050
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0050', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0050';
      let pageName = 'UIComponentGridJiaoDian0050';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);

      await grid.click();
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);

      await button.click();
      await driver.waitForIdle(2000, 3000);
      grid = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await grid.scrollToTop();
      await driver.waitForIdle(2000, 3000);

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0060
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0060', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0060';
      let pageName = 'UIComponentGridJiaoDian0060';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);

      await grid.click();
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      await grid.scrollToBottom(3000);
      await driver.waitForIdle(1000, 2000);
      await grid.scrollToTop(3000);
      await driver.waitForIdle(1000, 2000);

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0070
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0070', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0070';
      let pageName = 'UIComponentGridJiaoDian0070';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);

      await grid.click();
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      await grid.scrollToBottom(3000);
      await driver.waitForIdle(1000, 2000);
      await grid.scrollToTop(3000);
      await driver.waitForIdle(1000, 2000);

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0080
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0080', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0080';
      let pageName = 'UIComponentGridJiaoDian0080';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);

      await grid.click();
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);

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
            Logger.error(`[${TAG}]: Failed to set the horizontal orientation. Code:${err.code},message is ${err.message}`);
            return;
          }
          Logger.info(`[${TAG}]: Succeeded in setting the horizontal orientation.`);
        });
        await driver.waitForIdle(4000, 5000);
        await windowSnap.snapShot(TAG + '_01');
        await driver.triggerKey(2049);
        await driver.waitForIdle(1000, 2000);
        await driver.triggerKey(2049);
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot(TAG + '_02');
        await driver.waitForIdle(1000, 2000);
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
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0090
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0090', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0090';
      let pageName = 'UIComponentGridJiaoDian0090';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);

      await grid.click();
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      await grid.scrollToBottom(3000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await grid.scrollToTop(3000);
      await driver.waitForIdle(1000, 2000);

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0100
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0100', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0100';
      let pageName = 'UIComponentGridJiaoDian0100';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);

      await grid.click();
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await grid.scrollToBottom(3000);
      await driver.waitForIdle(1000, 2000);
      await grid.scrollToTop(3000);
      await driver.waitForIdle(1000, 2000);

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0110
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0110', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0110';
      let pageName = 'UIComponentGridJiaoDian0110';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);

      await grid.click();
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      await grid.scrollToBottom(3000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await grid.scrollToTop(3000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await grid.scrollToBottom(6000);

      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0120
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0120', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0120';
      let pageName = 'UIComponentGridJiaoDian0120';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let refresh: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);

      await grid.click();
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      let center = await refresh.getBoundsCenter();
      await driver.swipe(center.x, center.y, center.x, center.y + 300, 1000);
      await driver.waitForIdle(1000, 2000);

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0130
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0130', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0130';
      let pageName = 'UIComponentGridJiaoDian0130';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);

      await grid.click();
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      let bounds = await list.getBounds();
      await driver.swipe(bounds.right - 10, bounds.bottom - 10, bounds.right - 10, bounds.top + 10, 1000);
      await driver.waitForIdle(2000, 3000);
      await driver.swipe(bounds.right - 10, bounds.top + 10, bounds.right - 10, bounds.bottom - 10, 1000);
      await driver.waitForIdle(1000, 2000);

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0140
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0140', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0140';
      let pageName = 'UIComponentGridJiaoDian0140';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);

      await grid.click();
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      let center = await grid.getBoundsCenter();
      await driver.click(center.x, center.y);
      await driver.waitForIdle(2000, 3000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0150
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0150', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0150';
      let pageName = 'UIComponentGridJiaoDian0150';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);

      await grid.click();
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      await grid.scrollToBottom(3000);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await grid.scrollToTop(2000);
      await driver.waitForIdle(1000, 2000);

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0160
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0160', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0160';
      let pageName = 'UIComponentGridJiaoDian0160';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);

      await grid.click();
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      await grid.scrollToBottom(3000);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2015);
      await driver.waitForIdle(1000, 2000);
      await grid.scrollToTop(2000);
      await driver.waitForIdle(1000, 2000);

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0170
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0170', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0170';
      let pageName = 'UIComponentGridJiaoDian0170';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);

      await grid.click();
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      await grid.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      await grid.scrollToTop(3000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0180
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0180', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0180';
      let pageName = 'UIComponentGridJiaoDian0180';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let itemA: Component = await driver.waitForComponent(ON.id(pageName + '_05'), 1000);
      let itemB: Component = await driver.waitForComponent(ON.id(pageName + '_06'), 1000);
      await driver.waitForIdle(1000, 2000);

      await itemA.click();
      await driver.waitForIdle(2000, 3000);

      await grid.scrollToBottom(3000);
      await driver.waitForIdle(2000, 3000);
      await grid.scrollToTop(3000);
      await driver.waitForIdle(2000, 3000);

      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0190
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0190', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0190';
      let pageName = 'UIComponentGridJiaoDian0190';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let itemA: Component = await driver.waitForComponent(ON.id(pageName + '_05'), 1000);
      let itemB: Component = await driver.waitForComponent(ON.id(pageName + '_06'), 1000);
      await driver.waitForIdle(1000, 2000);

      await itemA.click();
      await driver.waitForIdle(1000, 2000);
      await grid.scrollToBottom(3000);
      await driver.waitForIdle(1000, 2000);

      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      await grid.scrollToTop(2000);
      await driver.waitForIdle(1000, 2000);

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0200
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0200', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0200';
      let pageName = 'UIComponentGridJiaoDian0200';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let itemA: Component = await driver.waitForComponent(ON.id(pageName + '_05'), 1000);
      let itemB: Component = await driver.waitForComponent(ON.id(pageName + '_06'), 1000);
      await driver.waitForIdle(1000, 2000);

      await itemA.click();
      await driver.waitForIdle(1000, 2000);
      await itemB.click();
      await driver.waitForIdle(1000, 2000);

      await grid.scrollToBottom(3000);
      await driver.waitForIdle(1000, 2000);
      await grid.scrollToTop(2000);
      await driver.waitForIdle(1000, 2000);

      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0210
     * @tc.name   : Grid jiaodian
     * @tc.desc   : Verify grid jiaodian interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0210', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_GRID_JIAODIAN_0210';
      let pageName = 'UIComponentGridJiaoDian0210';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/GridJiaoDian/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let itemA: Component = await driver.waitForComponent(ON.id(pageName + '_05'), 1000);
      let itemB: Component = await driver.waitForComponent(ON.id(pageName + '_06'), 1000);
      await driver.waitForIdle(1000, 2000);

      await itemA.click();
      await driver.waitForIdle(1000, 2000);

      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(1000, 2000);

      await grid.scrollToBottom(3000);
      await driver.waitForIdle(1000, 2000);
      await grid.scrollToTop(2000);
      await driver.waitForIdle(1000, 2000);

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })   

  })
}