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

export default function uIComponentSnapshotComponentContent() {
  describe('uIComponentSnapshotComponentContent', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SNAPSHOT_COMPONENTCONTENT_0040
     * @tc.name   : Snapshot componentcontent
     * @tc.desc   : Verify snapshot componentcontent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SNAPSHOT_COMPONENTCONTENT_0040', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SNAPSHOT_COMPONENTCONTENT_0040';
      let pageName = 'UIComponentSnapshotComponentContent0040';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotComponentContent/' + pageName);
      let driver: Driver = Driver.create();
      let snapshotButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 2000);
      await snapshotButton.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SNAPSHOT_COMPONENTCONTENT_0430
     * @tc.name   : Snapshot componentcontent
     * @tc.desc   : Verify snapshot componentcontent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SNAPSHOT_COMPONENTCONTENT_0430', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SNAPSHOT_COMPONENTCONTENT_0430';
      let pageName = 'UIComponentSnapshotComponentContent0430';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotComponentContent/' + pageName);
      let driver: Driver = Driver.create();
      let snapshotButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let switchButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(500, 2000);
      await switchButton.click();
      await driver.waitForIdle(500, 2000);
      await snapshotButton.click();
      await Utils.sleep(1500);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SNAPSHOT_COMPONENTCONTENT_0490
     * @tc.name   : Snapshot componentcontent
     * @tc.desc   : Verify snapshot componentcontent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SNAPSHOT_COMPONENTCONTENT_0490', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SNAPSHOT_COMPONENTCONTENT_0490';
      let pageName = 'UIComponentSnapshotComponentContent0490';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotComponentContent/' + pageName);
      let driver: Driver = Driver.create();
      let snapshotButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let switchButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(500, 2000);
      await switchButton.click();
      await driver.waitForIdle(500, 2000);
      await snapshotButton.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SNAPSHOT_COMPONENTCONTENT_0540
     * @tc.name   : Snapshot componentcontent
     * @tc.desc   : Verify snapshot componentcontent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SNAPSHOT_COMPONENTCONTENT_0540', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SNAPSHOT_COMPONENTCONTENT_0540';
      let pageName = 'UIComponentSnapshotComponentContent0540';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotComponentContent/' + pageName);
      let driver: Driver = Driver.create();
      let snapshotButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let switchButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(500, 2000);
      await switchButton.click();
      await driver.waitForIdle(500, 2000);
      await snapshotButton.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SNAPSHOT_COMPONENTCONTENT_0640
     * @tc.name   : Snapshot componentcontent
     * @tc.desc   : Verify snapshot componentcontent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SNAPSHOT_COMPONENTCONTENT_0640', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SNAPSHOT_COMPONENTCONTENT_0640';
      let pageName = 'UIComponentSnapshotComponentContent0640';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotComponentContent/' + pageName);
      let driver: Driver = Driver.create();
      let snapshotButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let switchButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(500, 2000);
      await switchButton.click();
      await driver.waitForIdle(500, 2000);
      await snapshotButton.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}