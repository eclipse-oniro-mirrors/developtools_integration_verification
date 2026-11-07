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
import I18n from '@ohos.i18n';
import { BusinessError } from '@kit.BasicServicesKit';


export default function snapshotAttribute() {

  describe('snapshotAttribute', () => {
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
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0230
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0230 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel230')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0070 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0690
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0690', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0690 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel690')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0690 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0290
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0290 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel290')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0290 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0790
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0790', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0790 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel790')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0790 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0200
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0200 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel200')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0200 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0720
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0720', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0720 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel720')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0720 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0260
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0260 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel260')
      windowSnap.snapShot();
      await Utils.sleep(10000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0260 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0740
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0740', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0740 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel740')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0740 finish.`);
      done();
    })


    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0220
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0220 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel220')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0220 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0770
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0770', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0770 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel770')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0770 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0280
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0280 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel280')
      windowSnap.snapShot();
      await Utils.sleep(10000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0280 finish.`);
      done();
    })


    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0270
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0270 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel270')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0270 finish.`);
      done();
    })


    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0780
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0780', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0780 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel780')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0780 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0760
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0760', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0760 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel760')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0760 finish.`);
      done();
    })


    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0330
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0330 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel330')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0330 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0830
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0830', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0830 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel830')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0830 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0350
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0350 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel350')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0350 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0840
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0840', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0840 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel840')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0840 finish.`);
      done();
    })


    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0300
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0300 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel300')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0300 finish.`);
      done();
    })


    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0250
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0250 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel250')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0250 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0810
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0810', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0810 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel810')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0810 finish.`);
      done();
    })


    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0750
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0750', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0750 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel750')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0750 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0320
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0320 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel320')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0320 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0800
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0800', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0800 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel800')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0800 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0340
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0340 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel340')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0340 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0850
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0850', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0850 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel850')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0850 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0310
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0310 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel310')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0310 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0820
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0820', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0820 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel820')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0820 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0360
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0360 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel360')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0360 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0860
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0860', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0860 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel860')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0860 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0240
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0240 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel240')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0240 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0730
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0730', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0730 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel730')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0730 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0400
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0400 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel400')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0400 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0880
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0880', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0880 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel880')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0880 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0370
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0370 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel370')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0370 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0890
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0890', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0890 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel890')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0890 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0390
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0390 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel390')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0390 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0870
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0870', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0870 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel870')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0870 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0380
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0380 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel380')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0380 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0900
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0900', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0900 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel900')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0900 finish.`);
      done();
    })


    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0430
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0430 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel430')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0430 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0910
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0910', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0910 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel910')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0910 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0460
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0460 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel460')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0460 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0450
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0450 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel450')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0450 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0410
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0410 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel410')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0410 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0440
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0440 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel440')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0440 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0920
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0920', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0920 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel920')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0920 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0470
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0470 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel470')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0470 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0560
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0560 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel560')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0560 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0480
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0480 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel480')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0480 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0010
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0010 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel10')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0010 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0530
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0530 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel530')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0530 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0490
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0490 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel490')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0490 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0040
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0040 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel40')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0040 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0520
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0520 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel520')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0520 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0030
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0030 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel30')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0030 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0570
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0570 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel570')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0570 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0150
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0150 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel150')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0150 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0620
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0620 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel620')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0620 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0020
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0020 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel20')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0020 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0500
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0500 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel500')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0500 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0100
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0100 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel100')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0100 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0580
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0580 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel580')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0580 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0140
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0140 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel140')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0140 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0590
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0590 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel590')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0590 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0110
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0110 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel110')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0110 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0540
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0540 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel540')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0540 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0120
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0120 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel120')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0120 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0600
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0600 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel600')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0600 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0050
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0050 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel50')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0050 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0550
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0550 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel550')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0550 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0060
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0060 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel60')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0060 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0610
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0610 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel610')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0610 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0090
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0090 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel90')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0090 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0510
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0510 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel510')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0510 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0130
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0130 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel130')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0130 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0630
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0630 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel630')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0630 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0160
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0160 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel160')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0160 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0670
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0670', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0670 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel670')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0670 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0070
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0070 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel70')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0070 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0640
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0640 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel640')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0640 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0080
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0080 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel80')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0080 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0680
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0680', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0680 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel680')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0680 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0180
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0180 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel180')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0180 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0700
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0700 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel700')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0700 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0170
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0700 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel170')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0170 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0660
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0660 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel660')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0660 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0190
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0190 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel190')
      let driver:Driver = Driver.create();
      // 点击Snapshotlevel0_2按钮
      let btnLevel = await driver.waitForComponent(ON.id('btn_level'), 1000);
      await btnLevel.click();
      await driver.waitForIdle(500, 2000);
      // 点击linearGradient按钮，设置渐变属性
      let btnGradient = await driver.waitForComponent(ON.id('btn_gradient'), 1000);
      await btnGradient.click();
      await driver.waitForIdle(500, 2000);
      // 点击get promise按钮
      let btnPromise = await driver.waitForComponent(ON.id('btn_promise'), 1000);
      await btnPromise.click();
      await driver.waitForIdle(500, 2000);
      // 点击get callback按钮
      let btnCallback = await driver.waitForComponent(ON.id('btn_callback'), 1000);
      await btnCallback.click();
      await driver.waitForIdle(500, 2000);
      // 截图验证
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0190 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0650
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0650 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel650')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0650 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0210
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0210 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel210')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0210 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0710
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0710 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshotlevel710')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0710 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0710
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UNIQUEID_GET_SNAPSHOT_002', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UNIQUEID_GET_SNAPSHOT_002 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshot002')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      await component.click();
      await driver.waitForIdle(500,2000);
      await component.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UNIQUEID_GET_SNAPSHOT_002 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_SNAPSHOT_ATTRIBUTE_0710
     * @tc.name   : Snapshot attribute
     * @tc.desc   : Verify snapshot attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UNIQUEID_GET_SNAPSHOT_001', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UNIQUEID_GET_SNAPSHOT_001 start.`);
      Settings.createWindow('testability/pages/scenario/capture/SnapshotAttribute/Snapshot001')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      await component.click();
      await driver.waitForIdle(500,2000);
      await component.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UNIQUEID_GET_SNAPSHOT_001 finish.`);
      done();
    })
  })
}