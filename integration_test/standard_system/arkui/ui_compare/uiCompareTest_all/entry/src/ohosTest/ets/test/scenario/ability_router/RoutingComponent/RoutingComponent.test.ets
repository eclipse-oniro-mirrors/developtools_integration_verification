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

export default function routingComponent() {
  describe('routingComponent', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_ROTING_0010
     * @tc.name   : Roting
     * @tc.desc   : Verify roting interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROTING_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING_0010 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingComponent/RoutingComponent10')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING_0010 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROTING__0020
     * @tc.name   : Roting
     * @tc.desc   : Verify roting interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROTING__0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0020 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingComponent/RoutingComponent20')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0020 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROTING__0030
     * @tc.name   : Roting
     * @tc.desc   : Verify roting interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROTING__0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0030 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingComponent/RoutingComponent30')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0030 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROTING__0040
     * @tc.name   : Roting
     * @tc.desc   : Verify roting interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROTING__0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0040 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingComponent/RoutingComponent40')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0040 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROTING__0050
     * @tc.name   : Roting
     * @tc.desc   : Verify roting interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROTING__0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0050 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingComponent/RoutingComponent50')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0050 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROTING__0060
     * @tc.name   : Roting
     * @tc.desc   : Verify roting interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROTING__0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0060 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingComponent/RoutingComponent60')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0060 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROTING__0070
     * @tc.name   : Roting
     * @tc.desc   : Verify roting interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROTING__0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0070 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingComponent/RoutingComponent70')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0070 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROTING__0080
     * @tc.name   : Roting
     * @tc.desc   : Verify roting interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROTING__0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0080 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingComponent/RoutingComponent80')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0080 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROTING__0090
     * @tc.name   : Roting
     * @tc.desc   : Verify roting interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROTING__0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0090 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingComponent/RoutingComponent90')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0090 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROTING__0100
     * @tc.name   : Roting
     * @tc.desc   : Verify roting interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROTING__0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0100 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingComponent/RoutingComponent100')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0100 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROTING__0110
     * @tc.name   : Roting
     * @tc.desc   : Verify roting interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROTING__0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0110 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingComponent/RoutingComponent110')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0110 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROTING__0120
     * @tc.name   : Roting
     * @tc.desc   : Verify roting interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROTING__0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0120 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingComponent/RoutingComponent120')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0120 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROTING__0130
     * @tc.name   : Roting
     * @tc.desc   : Verify roting interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROTING__0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0130 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingComponent/RoutingComponent130')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0130 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROTING__0140
     * @tc.name   : Roting
     * @tc.desc   : Verify roting interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROTING__0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0140 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingComponent/RoutingComponent140')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0140 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROTING__0150
     * @tc.name   : Roting
     * @tc.desc   : Verify roting interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROTING__0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0150 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingComponent/RoutingComponent150')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0150 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROTING__0160
     * @tc.name   : Roting
     * @tc.desc   : Verify roting interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROTING__0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0160 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingComponent/RoutingComponent160')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROTING__0160 finish.`);
      done();
    })
  })
}
