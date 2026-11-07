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


export default function routingSupportstageInterface() {

  describe('routingSupportstageInterface', () => {
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
     * @tc.number : SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0010
     * @tc.name   : Routing supportstage interface
     * @tc.desc   : Verify routing supportstage interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0010', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0010 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingSupportstageInterface/RoutingSupportstageInterface10')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('btn'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0010 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0030
     * @tc.name   : Routing supportstage interface
     * @tc.desc   : Verify routing supportstage interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0030', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0030 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingSupportstageInterface/RoutingSupportstageInterface30')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('btn'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0030 finish.`);
      done();
    })
    
    /*
     * @tc.number : SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0050
     * @tc.name   : Routing supportstage interface
     * @tc.desc   : Verify routing supportstage interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0050', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0050 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingSupportstageInterface/RoutingSupportstageInterface50')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('btn'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0050 finish.`);
      done();
    })
    
    /*
     * @tc.number : SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0060
     * @tc.name   : Routing supportstage interface
     * @tc.desc   : Verify routing supportstage interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0060', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0060 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingSupportstageInterface/RoutingSupportstageInterface60')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('btn'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0060 finish.`);
      done();
    })
    
    /*
     * @tc.number : SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0070
     * @tc.name   : Routing supportstage interface
     * @tc.desc   : Verify routing supportstage interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0070', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0070 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingSupportstageInterface/RoutingSupportstageInterface70')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('btn'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0070 finish.`);
      done();
    })


    /*
     * @tc.number : SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0080
     * @tc.name   : Routing supportstage interface
     * @tc.desc   : Verify routing supportstage interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0080', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0080 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingSupportstageInterface/RoutingSupportstageInterface80')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('btn'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0080 finish.`);
      done();
    })
    
    /*
     * @tc.number : SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0040
     * @tc.name   : Routing supportstage interface
     * @tc.desc   : Verify routing supportstage interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0040', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0040 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingSupportstageInterface/RoutingSupportstageInterface40')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('btn'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0040 finish.`);
      done();
    })
    
    /*
     * @tc.number : SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0100
     * @tc.name   : Routing supportstage interface
     * @tc.desc   : Verify routing supportstage interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0100', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0100 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingSupportstageInterface/RoutingSupportstageInterface100')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('btn'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0100 finish.`);
      done();
    })
    
    /*
     * @tc.number : SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0020
     * @tc.name   : Routing supportstage interface
     * @tc.desc   : Verify routing supportstage interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0020', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0020 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/RoutingSupportstageInterface/RoutingSupportstageInterface20')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('btn'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_Routing_SUPPORTSTAGE_INTERFACE_0020 finish.`);
      done();
    })
  })
}