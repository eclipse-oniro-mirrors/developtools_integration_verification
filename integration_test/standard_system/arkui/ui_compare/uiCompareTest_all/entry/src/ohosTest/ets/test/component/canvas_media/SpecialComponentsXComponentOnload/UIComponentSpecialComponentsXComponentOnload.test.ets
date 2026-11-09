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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError, commonEventManager, screenLock } from '@kit.BasicServicesKit';
import { KeyCode } from '@kit.InputKit';

import { window, screen } from '@kit.ArkUI';
import { wifiManager } from '@kit.ConnectivityKit';
import { Driver, ON ,Component, UiWindow } from '@kit.TestKit';

import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';

let TAG = 'RunTimeTest';

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function uIComponentSpecialComponentsXComponentOnload() {
  describe('uIComponentSpecialComponentsXComponentOnload', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0010
     * @tc.name   : Special components xcomponent onload
     * @tc.desc   : Verify special components xcomponent onload interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0010', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0010';
      let pageName = 'UIComponentSpecialComponentsXComponentOnload0010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/SpecialComponentsXComponentOnload/' + pageName);
      let driver: Driver = Driver.create();
      let XComponent: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let getContextButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await getContextButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0020
     * @tc.name   : Special components xcomponent onload
     * @tc.desc   : Verify special components xcomponent onload interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0020', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0020';
      let pageName = 'UIComponentSpecialComponentsXComponentOnload0020';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/SpecialComponentsXComponentOnload/' + pageName);
      let driver: Driver = Driver.create();
      let XComponent: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let getContextButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await getContextButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0030
     * @tc.name   : Special components xcomponent onload
     * @tc.desc   : Verify special components xcomponent onload interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0030', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0030';
      let pageName = 'UIComponentSpecialComponentsXComponentOnload0030';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/SpecialComponentsXComponentOnload/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '01');
      let XComponent: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let setSurfaceSizeButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let getSurfaceIDButton: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await setSurfaceSizeButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '02');
      await getSurfaceIDButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '03');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0040
     * @tc.name   : Special components xcomponent onload
     * @tc.desc   : Verify special components xcomponent onload interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0040', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0040';
      let pageName = 'UIComponentSpecialComponentsXComponentOnload0040';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/SpecialComponentsXComponentOnload/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '01');
      let XComponent: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let setSurfaceSizeButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let getSurfaceIDButton: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await setSurfaceSizeButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '02');
      await getSurfaceIDButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '03');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0060
     * @tc.name   : Special components xcomponent onload
     * @tc.desc   : Verify special components xcomponent onload interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0060', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0060';
      let pageName = 'UIComponentSpecialComponentsXComponentOnload0060';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/SpecialComponentsXComponentOnload/' + pageName);
      let driver: Driver = Driver.create();
      let XComponent: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let setSurfaceRotationButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let getSurfaceRotationButton: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await setSurfaceRotationButton.click();
      await driver.waitForIdle(500, 500);
      await getSurfaceRotationButton.click();
      await driver.waitForIdle(500, 500);
      await windowSnap.snapShot(TAG + '01');
      await setSurfaceRotationButton.click();
      await driver.waitForIdle(500, 500);
      await getSurfaceRotationButton.click();
      await driver.waitForIdle(500, 500);
      await windowSnap.snapShot(TAG + '02');
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
        await driver.waitForIdle(500, 1000);
        screenClass.setOrientation(screen.Orientation.VERTICAL, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            Logger.error(`[${TAG}]: Failed to set the vertical orientation. Code:${err.code},message is ${err.message}`);
            return;
          }
          Logger.info(`[${TAG}]: Succeeded in setting the vertical orientation.`);
        });
      });
      await driver.waitForIdle(500, 3000);
      await windowSnap.snapShot(TAG + '03');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0070
     * @tc.name   : Special components xcomponent onload
     * @tc.desc   : Verify special components xcomponent onload interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0070', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0070';
      let pageName = 'UIComponentSpecialComponentsXComponentOnload0070';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/SpecialComponentsXComponentOnload/' + pageName);
      let driver: Driver = Driver.create();
      let XComponent: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let setSurfaceRectButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let getSurfaceRectButton: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await getSurfaceRectButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '01');
      await setSurfaceRectButton.click();
      await getSurfaceRectButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0080
     * @tc.name   : Special components xcomponent onload
     * @tc.desc   : Verify special components xcomponent onload interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0080', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_ONLOAD_0080';
      let pageName = 'UIComponentSpecialComponentsXComponentOnload0080';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/SpecialComponentsXComponentOnload/' + pageName);
      let driver: Driver = Driver.create();
      let XComponent: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let setSurfaceRectButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let getSurfaceRectButton: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await getSurfaceRectButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '01');
      await setSurfaceRectButton.click();
      await getSurfaceRectButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}