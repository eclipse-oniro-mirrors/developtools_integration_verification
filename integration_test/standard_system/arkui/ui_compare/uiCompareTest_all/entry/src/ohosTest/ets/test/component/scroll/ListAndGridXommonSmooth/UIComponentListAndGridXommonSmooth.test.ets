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

export default function uIComponentListAndGridXommonSmooth() {
  describe('uIComponentListAndGridXommonSmooth', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0010
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0010', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0010';
      let pageName = 'UIComponentListAndGridXommonSmooth0010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0020
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0020', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0020';
      let pageName = 'UIComponentListAndGridXommonSmooth0020';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0030
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0030', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0030';
      let pageName = 'UIComponentListAndGridXommonSmooth0030';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0040
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0040', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0040';
      let pageName = 'UIComponentListAndGridXommonSmooth0040';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0090
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0090', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0090';
      let pageName = 'UIComponentListAndGridXommonSmooth0090';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0100
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0100', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0100';
      let pageName = 'UIComponentListAndGridXommonSmooth0100';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0120
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0120', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0120';
      let pageName = 'UIComponentListAndGridXommonSmooth0120';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0120_934
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0120_934', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0120_934';
      let pageName = 'UIComponentListAndGridXommonSmooth0120_934';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0130
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0130', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0130';
      let pageName = 'UIComponentListAndGridXommonSmooth0130';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0130_372
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0130_372', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0130_372';
      let pageName = 'UIComponentListAndGridXommonSmooth0130_372';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0140
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0140', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0140';
      let pageName = 'UIComponentListAndGridXommonSmooth0140';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0140_800
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0140_800', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0140_800';
      let pageName = 'UIComponentListAndGridXommonSmooth0140_800';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0150
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0150', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0150';
      let pageName = 'UIComponentListAndGridXommonSmooth0150';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0150_197
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0150_197', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0150_197';
      let pageName = 'UIComponentListAndGridXommonSmooth0150_197';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0160
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0160', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0160';
      let pageName = 'UIComponentListAndGridXommonSmooth0160';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(20000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0160_337
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0160_337', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0160_337';
      let pageName = 'UIComponentListAndGridXommonSmooth0160_337';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(20000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0170_760
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0170_760', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0170_760';
      let pageName = 'UIComponentListAndGridXommonSmooth0170_760';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(20000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0180_236
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0180_236', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0180_236';
      let pageName = 'UIComponentListAndGridXommonSmooth0180_236';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(20000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0190_168
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0190_168', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0190_168';
      let pageName = 'UIComponentListAndGridXommonSmooth0190_168';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(20000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0200_733
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0200_733', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0200_733';
      let pageName = 'UIComponentListAndGridXommonSmooth0200_733';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0210_310
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0210_310', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0210_310';
      let pageName = 'UIComponentListAndGridXommonSmooth0210_310';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(20000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0220_739
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0220_739', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0220_739';
      let pageName = 'UIComponentListAndGridXommonSmooth0220_739';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 50, center.y, bounds.left + 50, center.y, 20000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0230
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0230', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0230';
      let pageName = 'UIComponentListAndGridXommonSmooth0230';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0240
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0240', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0240';
      let pageName = 'UIComponentListAndGridXommonSmooth0240';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(20000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0250
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0250', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0250';
      let pageName = 'UIComponentListAndGridXommonSmooth0250';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(20000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0250_718
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0250_718', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0250_718';
      let pageName = 'UIComponentListAndGridXommonSmooth0250_718';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0260
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0260', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0260';
      let pageName = 'UIComponentListAndGridXommonSmooth0260';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0270
     * @tc.name   : Listandgrid xommon smooth
     * @tc.desc   : Verify listandgrid xommon smooth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0270', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_XOMMON_SMOOTH_0270';
      let pageName = 'UIComponentListAndGridXommonSmooth0270';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridXommonSmooth/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01_1'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_01_2'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button1.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await button2.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}