/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, Component } from '@kit.TestKit';

export default function snapshotGetsync() {

  describe('snapshotGetsync', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0080
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0080 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync80')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0080 finish.`);
      done();
    })


    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0210
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0210 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync210')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0210 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0100
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0100 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync100')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0100 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0110
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0110 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync110')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0110 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0120
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0120 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync120')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0120 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0190
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0190 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync190')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0190 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0250
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0250 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync250')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0250 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0180
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0180 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync180')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0180 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0200
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0200 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync200')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0200 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0170
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0170 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync170')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0170 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0220
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0220 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync220')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0220 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0260
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0260 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync260')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0260 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0060
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0060 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync60')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0060 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0270
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0270 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync270')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0270 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0240
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0240 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync240')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0240 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0280
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0280 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync280')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0280 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0320
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0320 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync320')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0320 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0300
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0300 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync300')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0300 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0350
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0350 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync350')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0350 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0290
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0290 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync290')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0290 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0310
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0310 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync310')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0310 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0340
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0340 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync340')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0340 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0390
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0390 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync390')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0390 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0360
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0360 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync360')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0360 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0420
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0420 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync420')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0420 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0370
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0370 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync370')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0370 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0410
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0410 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync410')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0410 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0380
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0380 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync380')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0380 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0430
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0430 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync430')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0430 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0440
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0440 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync440')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0440 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0550
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0550 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync550')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0550 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0450
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0450 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync450')
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0450 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0330
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0330 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync330')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0330 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0560
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0560 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync560')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0560 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0460
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0460 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync460')
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0460 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0090
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0090 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync90')
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0090 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0490
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0490 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync490')
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0490 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0050
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0050 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync50')
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0050 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0470
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0470 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync470')
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0470 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0010
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0010 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync10')
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0010 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0480
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0480 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync480')
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0480 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0160
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0160 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync160')
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0160 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0500
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0500 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync500')
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0500 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0070
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0070 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync70')
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0070 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0030
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0030 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync30')
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0030 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0140
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0140 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync140')
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0140 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0020
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0020 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync20')
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0020 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0150
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0150 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync150')
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0150 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0130
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0130 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync130')
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0130 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_GETSYNC_0040
     * @tc.name   : Snapshot getsync
     * @tc.desc   : Verify snapshot getsync interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_GETSYNC_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0040 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotGetsync/SnapshotGetsync40')
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_GETSYNC_0040 finish.`);
      done();
    })
  })
}