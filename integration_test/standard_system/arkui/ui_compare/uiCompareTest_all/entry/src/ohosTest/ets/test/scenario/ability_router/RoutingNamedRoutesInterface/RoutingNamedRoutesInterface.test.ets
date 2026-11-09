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
import { Driver, ON, Component,} from '@kit.TestKit';


export default function routingNamedRoutesInterface() {

  describe('routingNamedRoutesInterface', () => {
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
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0010
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0010 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface10')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0010 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0020
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0020 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface20')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0020 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0030
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0030 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface30')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0030 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0040
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0040 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface40')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0040 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0050
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0050 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface50')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0050 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0060
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0060 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface60')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0060 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0070
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0070 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface70')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0070 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0080
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0080 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface80')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0080 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0090
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0090 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface90')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0090 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0100
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0100 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface100')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0100 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0110
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0110 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface110')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0110 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0120
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0120 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface120')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0120 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0130
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0130 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface130')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0130 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0140
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0140 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface140')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0140 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0150
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0150 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface150')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0150 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0160
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0160 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface160')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0160 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0170
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0170 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface170')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0170 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0180
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0180 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface180')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0180 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0190
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0190 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface190')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0190 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0200
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0200 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface200')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0200 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0210
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0210 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface210')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0210 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0220
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0220 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface220')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0220 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0230
     * @tc.name   : Routing namedroutes interface
     * @tc.desc   : Verify routing namedroutes interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0230 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingNamedRoutesInterface/RoutingNamedRoutesInterface230')
      let driver:Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0230 finish.`);
      done();
    })
  })
}
