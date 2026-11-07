
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

export default function uIComponentListAndGridListItemGroupScrollToIndex() {
  describe('uIComponentListAndGridListItemGroupScrollToIndex', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0250
     * @tc.name   : Listandgrid listitemgroup scrolltoindex
     * @tc.desc   : Verify listandgrid listitemgroup scrolltoindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0250', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0250';
      let pageName = 'UIComponentListAndGridListItemGroupScrollToIndex0250';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListItemGroupScrollToIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0260
     * @tc.name   : Listandgrid listitemgroup scrolltoindex
     * @tc.desc   : Verify listandgrid listitemgroup scrolltoindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0260', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0260';
      let pageName = 'UIComponentListAndGridListItemGroupScrollToIndex0260';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListItemGroupScrollToIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0270
     * @tc.name   : Listandgrid listitemgroup scrolltoindex
     * @tc.desc   : Verify listandgrid listitemgroup scrolltoindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0270', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0270';
      let pageName = 'UIComponentListAndGridListItemGroupScrollToIndex0270';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListItemGroupScrollToIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0310
     * @tc.name   : Listandgrid listitemgroup scrolltoindex
     * @tc.desc   : Verify listandgrid listitemgroup scrolltoindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0310', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0310';
      let pageName = 'UIComponentListAndGridListItemGroupScrollToIndex0310';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListItemGroupScrollToIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0430
     * @tc.name   : Listandgrid listitemgroup scrolltoindex
     * @tc.desc   : Verify listandgrid listitemgroup scrolltoindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0430', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0430';
      let pageName = 'UIComponentListAndGridListItemGroupScrollToIndex0430';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListItemGroupScrollToIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0440
     * @tc.name   : Listandgrid listitemgroup scrolltoindex
     * @tc.desc   : Verify listandgrid listitemgroup scrolltoindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0440', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0440';
      let pageName = 'UIComponentListAndGridListItemGroupScrollToIndex0440';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListItemGroupScrollToIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0470
     * @tc.name   : Listandgrid listitemgroup scrolltoindex
     * @tc.desc   : Verify listandgrid listitemgroup scrolltoindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0470', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0470';
      let pageName = 'UIComponentListAndGridListItemGroupScrollToIndex0470';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListItemGroupScrollToIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0480
     * @tc.name   : Listandgrid listitemgroup scrolltoindex
     * @tc.desc   : Verify listandgrid listitemgroup scrolltoindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0480', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0480';
      let pageName = 'UIComponentListAndGridListItemGroupScrollToIndex0480';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListItemGroupScrollToIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0490
     * @tc.name   : Listandgrid listitemgroup scrolltoindex
     * @tc.desc   : Verify listandgrid listitemgroup scrolltoindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0490', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0490';
      let pageName = 'UIComponentListAndGridListItemGroupScrollToIndex0490';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListItemGroupScrollToIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0530
     * @tc.name   : Listandgrid listitemgroup scrolltoindex
     * @tc.desc   : Verify listandgrid listitemgroup scrolltoindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0530', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0530';
      let pageName = 'UIComponentListAndGridListItemGroupScrollToIndex0530';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListItemGroupScrollToIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0590
     * @tc.name   : Listandgrid listitemgroup scrolltoindex
     * @tc.desc   : Verify listandgrid listitemgroup scrolltoindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0590', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0590';
      let pageName = 'UIComponentListAndGridListItemGroupScrollToIndex0590';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListItemGroupScrollToIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0600
     * @tc.name   : Listandgrid listitemgroup scrolltoindex
     * @tc.desc   : Verify listandgrid listitemgroup scrolltoindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0600', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0600';
      let pageName = 'UIComponentListAndGridListItemGroupScrollToIndex0600';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListItemGroupScrollToIndex/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}