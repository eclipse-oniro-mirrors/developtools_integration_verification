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

export default function uIComponentListAndGridXommonOnScroll() {
  describe('uIComponentListAndGridXommonOnScroll', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0050
     * @tc.name   : Listandgrid xommon onscroll
     * @tc.desc   : Verify listandgrid xommon onscroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0050', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0050';
      let pageName = 'UIComponentListAndGridXommonOnScroll0050';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonOnScroll/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let log: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await list.getBoundsCenter();
      let bounds = await list.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(bounds.right - 10, bounds.top + 20, bounds.right - 10, center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await log.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0340_685
     * @tc.name   : Listandgrid xommon onscroll
     * @tc.desc   : Verify listandgrid xommon onscroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0340_685', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0340_685';
      let pageName = 'UIComponentListAndGridXommonOnScroll0340_685';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonOnScroll/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let log: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await grid.getBoundsCenter();
      let bounds = await grid.getBounds();
      await driver.waitForIdle(1000, 2000);
      await grid.scrollToBottom(4000);
      await driver.waitForIdle(1000, 2000);
      await log.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0370
     * @tc.name   : Listandgrid xommon onscroll
     * @tc.desc   : Verify listandgrid xommon onscroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0370', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0370';
      let pageName = 'UIComponentListAndGridXommonOnScroll0370';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonOnScroll/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let log: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await scroll.getBoundsCenter();
      let bounds = await scroll.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(bounds.right - 10, bounds.top + 20, bounds.right - 10, center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await log.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0580_491
     * @tc.name   : Listandgrid xommon onscroll
     * @tc.desc   : Verify listandgrid xommon onscroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0580_491', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0580_491';
      let pageName = 'UIComponentListAndGridXommonOnScroll0580_491';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonOnScroll/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let log: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();

      await driver.waitForIdle(1000, 2000);
      await waterFlow.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await log.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);

      await button.click();
      await driver.waitForIdle(1000, 2000);
      waterFlow = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      log = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(1000, 2000);
      await waterFlow.scrollToTop(6000);
      await driver.waitForIdle(1000, 2000);
      await log.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');

      await driver.waitForIdle(1000, 2000);
      await button.click();

      await Utils.sleep(3000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0590_318
     * @tc.name   : Listandgrid xommon onscroll
     * @tc.desc   : Verify listandgrid xommon onscroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0590_318', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0590_318';
      let pageName = 'UIComponentListAndGridXommonOnScroll0590_318';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonOnScroll/' + pageName);
      let driver: Driver = Driver.create();
      let addButton: Component = await driver.waitForComponent(ON.id(pageName + '_01_1'), 1000);
      let removeButton: Component = await driver.waitForComponent(ON.id(pageName + '_01_2'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let log: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await addButton.click();
      await driver.waitForIdle(1000, 2000);
      await removeButton.click();
      await driver.waitForIdle(1000, 2000);
      await waterFlow.scrollToBottom(4000);
      await driver.waitForIdle(1000, 2000);
      await log.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0600_007
     * @tc.name   : Listandgrid xommon onscroll
     * @tc.desc   : Verify listandgrid xommon onscroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0600_007', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_ONSCROLL_0600_007';
      let pageName = 'UIComponentListAndGridXommonOnScroll0600_007';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonOnScroll/' + pageName);
      let driver: Driver = Driver.create();
      let addButton: Component = await driver.waitForComponent(ON.id(pageName + '_01_1'), 1000);
      let removeButton: Component = await driver.waitForComponent(ON.id(pageName + '_01_2'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let log: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await waterFlow.getBoundsCenter();
      let bounds = await waterFlow.getBounds();
      await driver.waitForIdle(1000, 2000);
      await waterFlow.scrollToBottom(4000);
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