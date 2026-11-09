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

import { window, uiAppearance } from '@kit.ArkUI';
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

export default function uIComponentArcListScrollBarColor() {
  describe('uIComponentArcListScrollBarColor', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARCOLOR_0010
     * @tc.name   : Arclist scrollbarcolor
     * @tc.desc   : Verify arclist scrollbarcolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARCOLOR_0010', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARCOLOR_0010';
      let pageName = 'UIComponentArcListScrollBarColor0010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/arc/ArcListScrollBarColor/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARCOLOR_0020
     * @tc.name   : Arclist scrollbarcolor
     * @tc.desc   : Verify arclist scrollbarcolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARCOLOR_0020', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARCOLOR_0020';
      let pageName = 'UIComponentArcListScrollBarColor0020';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/arc/ArcListScrollBarColor/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARCOLOR_0030
     * @tc.name   : Arclist scrollbarcolor
     * @tc.desc   : Verify arclist scrollbarcolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARCOLOR_0030', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARCOLOR_0030';
      let pageName = 'UIComponentArcListScrollBarColor0030';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/arc/ArcListScrollBarColor/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARCOLOR_0040
     * @tc.name   : Arclist scrollbarcolor
     * @tc.desc   : Verify arclist scrollbarcolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARCOLOR_0040', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARCOLOR_0040';
      let pageName = 'UIComponentArcListScrollBarColor0040';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/arc/ArcListScrollBarColor/' + pageName);
      let driver: Driver = Driver.create();
      let arkList: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let button3: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let button4: Component = await driver.waitForComponent(ON.id(pageName + '_05'), 1000);
      let button5: Component = await driver.waitForComponent(ON.id(pageName + '_06'), 1000);
      let button6: Component = await driver.waitForComponent(ON.id(pageName + '_07'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await button2.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await button3.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_03');
      await button4.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_04');
      await button5.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_05');
      await button6.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_06');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARCOLOR_0050
     * @tc.name   : Arclist scrollbarcolor
     * @tc.desc   : Verify arclist scrollbarcolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARCOLOR_0050', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARCOLOR_0050';
      let pageName = 'UIComponentArcListScrollBarColor0050';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/arc/ArcListScrollBarColor/' + pageName);
      let driver: Driver = Driver.create();
      let arkList: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await button2.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}