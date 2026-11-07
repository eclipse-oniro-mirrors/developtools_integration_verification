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

import { describe, it, afterEach } from '@ohos/hypium';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';
import { Driver, ON, Component } from '@kit.TestKit';

export default function routingNamedroutesDfxTest() {
  describe('routingNamedroutesDfxTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`);
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      });
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_DFX_0020
     * @tc.name   : Routing namedroutes DFX
     * @tc.desc   : Verify routing namedroutes DFX interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_DFX_0020', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_DFX_0020 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedroutesDfx/RoutingNamedroutesDfx0020');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_DFX_0020 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_DFX_0030
     * @tc.name   : Routing namedroutes DFX
     * @tc.desc   : Verify routing namedroutes DFX interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_DFX_0030', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_DFX_0030 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedroutesDfx/RoutingNamedroutesDfx0030');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_DFX_0030 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_DFX_0040
     * @tc.name   : Routing namedroutes DFX
     * @tc.desc   : Verify routing namedroutes DFX interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_DFX_0040', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_DFX_0040 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedroutesDfx/RoutingNamedroutesDfx0040');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_DFX_0040 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_DFX_0050
     * @tc.name   : Routing namedroutes DFX
     * @tc.desc   : Verify routing namedroutes DFX interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_DFX_0050', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_DFX_0050 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedroutesDfx/RoutingNamedroutesDfx0050');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_DFX_0050 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_DFX_0060
     * @tc.name   : Routing namedroutes DFX
     * @tc.desc   : Verify routing namedroutes DFX interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_DFX_0060', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_DFX_0060 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedroutesDfx/RoutingNamedroutesDfx0060');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_DFX_0060 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_DFX_0070
     * @tc.name   : Routing namedroutes DFX
     * @tc.desc   : Verify routing namedroutes DFX interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_DFX_0070', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_DFX_0070 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedroutesDfx/RoutingNamedroutesDfx0070');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_DFX_0070 finish.`);
      done();
    });

  });
}