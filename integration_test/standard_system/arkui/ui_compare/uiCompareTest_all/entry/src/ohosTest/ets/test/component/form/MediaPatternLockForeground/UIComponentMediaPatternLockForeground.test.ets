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
import { Driver, ON ,Component, UiWindow, PointerMatrix } from '@kit.TestKit';

import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';


let TAG = 'RunTimeTest';

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function uIComponentMediaPatternLockForeground() {
  describe('uIComponentMediaPatternLockForeground', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_FOREGROUND_0011
     * @tc.name   : Media PatternLock foreground
     * @tc.desc   : Verify media PatternLock foreground interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_FOREGROUND_0011', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_FOREGROUND_0011';
      let pageName = 'UIComponentMediaPatternLockForeground0011';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/form/MediaPatternLockForeground/' + pageName);
      let driver: Driver = Driver.create();
      let patternLock1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let patternLock2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center1 = await patternLock1.getBoundsCenter();
      await driver.mouseMoveTo({x: center1.x - 150, y: center1.y});
      await driver.drag(center1.x - 150, center1.y, center1.x + 150, center1.y);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      let center2 = await patternLock2.getBoundsCenter();
      await driver.drag(center2.x - 150, center2.y, center2.x + 150, center2.y);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_FOREGROUND_0014
     * @tc.name   : Media PatternLock foreground
     * @tc.desc   : Verify media PatternLock foreground interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_FOREGROUND_0014', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_FOREGROUND_0014';
      let pageName = 'UIComponentMediaPatternLockForeground0014';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/form/MediaPatternLockForeground/' + pageName);
      let driver: Driver = Driver.create();
      let patternLock1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let patternLock2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center1 = await patternLock1.getBoundsCenter();
      await driver.mouseMoveTo({x: center1.x - 150, y: center1.y});
      await driver.drag(center1.x - 150, center1.y, center1.x + 150, center1.y);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      let center2 = await patternLock2.getBoundsCenter();
      await driver.drag(center2.x - 150, center2.y, center2.x + 150, center2.y);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
  })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_FOREGROUND_0019
     * @tc.name   : Media PatternLock foreground
     * @tc.desc   : Verify media PatternLock foreground interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_FOREGROUND_0019', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_FOREGROUND_0019';
      let pageName = 'UIComponentMediaPatternLockForeground0019';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/form/MediaPatternLockForeground/' + pageName);
      let driver: Driver = Driver.create();
      let patternLock1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let patternLock2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center1 = await patternLock1.getBoundsCenter();
      let pointers1: PointerMatrix = PointerMatrix.create(1, 4);
      pointers1.setPoint(0, 0, {x: center1.x, y: center1.y - 150});
      pointers1.setPoint(0, 1, {x: center1.x + 75, y: center1.y});
      pointers1.setPoint(0, 2, {x: center1.x, y: center1.y + 150});
      pointers1.setPoint(0, 3, {x: center1.x - 150, y: center1.y});
      await driver.injectMultiPointerAction(pointers1);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      let center2 = await patternLock2.getBoundsCenter();
      let pointers2: PointerMatrix = PointerMatrix.create(1, 4);
      pointers2.setPoint(0, 0, {x: center2.x, y: center2.y - 150});
      pointers2.setPoint(0, 1, {x: center2.x + 75, y: center2.y});
      pointers2.setPoint(0, 2, {x: center2.x, y: center2.y + 150});
      pointers2.setPoint(0, 3, {x: center2.x - 150, y: center2.y});
      await driver.injectMultiPointerAction(pointers2);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_FOREGROUND_0021
     * @tc.name   : Media PatternLock foreground
     * @tc.desc   : Verify media PatternLock foreground interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_FOREGROUND_0021', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_FOREGROUND_0021';
      let pageName = 'UIComponentMediaPatternLockForeground0021';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/form/MediaPatternLockForeground/' + pageName);
      let driver: Driver = Driver.create();
      let patternLock1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let patternLock2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let center1 = await patternLock1.getBoundsCenter();
      let pointers1: PointerMatrix = PointerMatrix.create(1, 4);
      pointers1.setPoint(0, 0, {x: center1.x, y: center1.y - 150});
      pointers1.setPoint(0, 1, {x: center1.x + 75, y: center1.y});
      pointers1.setPoint(0, 2, {x: center1.x, y: center1.y + 150});
      pointers1.setPoint(0, 3, {x: center1.x - 150, y: center1.y});
      await driver.injectMultiPointerAction(pointers1);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      let center2 = await patternLock2.getBoundsCenter();
      let pointers2: PointerMatrix = PointerMatrix.create(1, 4);
      pointers2.setPoint(0, 0, {x: center2.x, y: center2.y - 150});
      pointers2.setPoint(0, 1, {x: center2.x + 75, y: center2.y});
      pointers2.setPoint(0, 2, {x: center2.x, y: center2.y + 150});
      pointers2.setPoint(0, 3, {x: center2.x - 150, y: center2.y});
      await driver.injectMultiPointerAction(pointers2);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}