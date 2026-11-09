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
import { BusinessError } from '@kit.BasicServicesKit'

export default function routerPushTest() {

  describe('routerPushTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err:BusinessError) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      let driver: Driver = Driver.create();
      await Settings.changeWindowOrientation('end')
      await driver.waitForIdle(500,2000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0070
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0070 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button1'), 1000);
      await buttonA.click();
      windowSnap.snapShot('SUB_ACE_FOCUS_DYNAMIC_EFFECT_017_01')
      await Utils.sleep(1000)
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button1'), 1000);
      await buttonB.click();
      windowSnap.snapShot('SUB_ACE_FOCUS_DYNAMIC_EFFECT_017_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FOCUS_DYNAMIC_EFFECT_017 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0010
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0010 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button1'), 1000);
      await buttonA.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0010')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0270
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0270 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();

      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button1'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);

      let buttonB1: Component = await driver.waitForComponent(ON.id('PageB_Button1'), 1000);
      await buttonB1.click();
      await driver.waitForIdle(500,2000);

      let buttonC1: Component = await driver.waitForComponent(ON.id('PageC_Button1'), 1000);
      await buttonC1.click();

      let buttonB2: Component = await driver.waitForComponent(ON.id('PageB_Button2'), 1000);
      await buttonB2.click();

      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0270_01')
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0270_02')
      await Utils.sleep(800)
      await Settings.changeWindowOrientation('end')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0190
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0190 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button2'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0190')
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0560
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0560 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button1'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);

      let buttonB1: Component = await driver.waitForComponent(ON.id('PageB_Button1'), 1000);
      await buttonB1.click();
      await driver.waitForIdle(500,2000);

      let buttonC1: Component = await driver.waitForComponent(ON.id('PageC_Button1'), 1000);
      await buttonC1.click();
      let buttonB2: Component = await driver.waitForComponent(ON.id('PageB_Button2'), 1000);
      await buttonB2.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0560')
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0560 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0200
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0200 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button1'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);

      let buttonB1: Component = await driver.waitForComponent(ON.id('PageB_Button2'), 1000);
      await buttonB1.click();
      let buttonA1: Component = await driver.waitForComponent(ON.id('PageA_Button1'), 1000);
      await buttonA1.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0200')

      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0290
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0290 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button3'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0290')
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0570
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0570 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button4'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('PageC_Button2'), 1000);
      await buttonC.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0570')
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0170
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0170 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button5'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0170')
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0740
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0740', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0740 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button6'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button3'), 1000);
      await buttonB.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0740')
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0740 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0250
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0250 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button7'), 1000);
      await buttonA.click();
      Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0250')
      Settings.changeWindowOrientation('end')
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0340
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0340 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button9'), 1000);
      await buttonA.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0340')
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0650
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0650 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button8'), 1000);
      await buttonA.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0650')
      Settings.changeWindowOrientation('end')
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0650 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0550
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0550 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button1'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button1'), 1000);
      await buttonB.click();
      let buttonC: Component = await driver.waitForComponent(ON.id('PageC_Button3'), 1000);
      await buttonC.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0550')
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0080
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0080 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button9'), 1000);
      await buttonA.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0080')
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0230
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0230 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button1'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button4'), 1000);
      await buttonB.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0230')
      await Settings.changeWindowOrientation('end')
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0770
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0770', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0770 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button10'), 1000);
      await buttonA.click();
      await Utils.sleep(1500)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0770')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0770 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0380
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0380 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA2')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button2_1'), 1000);
      await buttonA.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0380')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0470
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0470 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA4')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button4_1'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button4_1'), 1000);
      await buttonB.click();
      await Utils.sleep(1500)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0470')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0660
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0660 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA4')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button4_1'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button4_2'), 1000);
      await buttonB.click();
      await Utils.sleep(600)
      Settings.changeWindowOrientation('landScape');
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0660')
      Settings.changeWindowOrientation('end')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0090
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0090 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA3')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button3_2'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button3_3'), 1000);
      await buttonB.click();
      await Utils.sleep(400)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0090')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0040
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0040 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA3')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button3_2'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button3_1'), 1000);
      await buttonB.click();
      await Utils.sleep(400)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0040')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0060
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0060 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button1'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button3'), 1000);
      await buttonB.click();
      let buttonA2: Component = await driver.waitForComponent(ON.id('PageA_Button1'), 1000);
      await buttonA2.click();
      await Utils.sleep(400)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0060')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0520
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0520 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA3')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button3_3'), 1000);
      await buttonA.click();
      await Utils.sleep(400)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0520')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0210
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0210 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button1'), 1000);
      await buttonA.click();
      await Utils.sleep(600)
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button5'), 1000);
      await buttonB.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0210')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0760
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0760', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0760 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button11'), 1000);
      await buttonA.click();
      await Utils.sleep(2500)
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button1'), 1000);
      await buttonB.click();
      await Utils.sleep(1000)
      let buttonC: Component = await driver.waitForComponent(ON.id('PageC_Button4'), 1000);
      await buttonC.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0760')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0760 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0680
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0680', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0680 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA4')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button4_1'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button4_1'), 1000);
      await buttonB.click();
      let buttonA2: Component = await driver.waitForComponent(ON.id('PageA_Button4_1'), 1000);
      await buttonA2.click();
      Settings.changeWindowOrientation('landScape');
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0680')
      Settings.changeWindowOrientation('end')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0680 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0390
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0390 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA2')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button2_3'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button2_3'), 1000);
      await buttonB.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0390')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0590
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0590 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA4')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button4_1'), 1000);
      await buttonA.click();
      await Utils.sleep(1000)
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button4_1'), 1000);
      await buttonB.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0590')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0730
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0730', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0730 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA4')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button4_1'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button4_2'), 1000);
      await buttonB.click();
      let buttonC: Component = await driver.waitForComponent(ON.id('PageC_Button4_2'), 1000);
      await buttonC.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0730')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0730 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0670
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0670', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0670 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA4')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button4_1'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button4_1'), 1000);
      await buttonB.click();
      Settings.changeWindowOrientation('landScape');
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0670')
      Settings.changeWindowOrientation('end')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0670 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0460
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0460 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA5')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button5_1'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button5_1'), 1000);
      await buttonB.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0460')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0430
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0430 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA4')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button4_1'), 1000);
      await buttonA.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0430')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0410
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0410 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA2')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button2_3'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button2_4'), 1000);
      await buttonB.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0410')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0420
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0420 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA2')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button2_3'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button2_1'), 1000);
      await buttonB.click();
      let buttonC: Component = await driver.waitForComponent(ON.id('PageC_Button2_3'), 1000);
      await buttonC.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0420')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0400
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0400 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA2')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button2_3'), 1000);
      await buttonA.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0400')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0490
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0490 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA4')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button4_2'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button4_2'), 1000);
      await buttonB.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0490')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0440
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0440 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA3')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button3_2'), 1000);
      await buttonA.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0440')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0580
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0580 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA4')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button4_1'), 1000);
      await buttonA.click();

      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button4_2'), 1000);
      await buttonB.click();

      let buttonC: Component = await driver.waitForComponent(ON.id('PageC_Button4_3'), 1000);
      await buttonC.click();

      await driver.waitForIdle(500,2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0580')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0630
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0630 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA4')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button4_1'), 1000);
      await buttonA.click();

      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button4_3'), 1000);
      await buttonB.click();

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0630')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0630 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0640
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0640 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA4')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button4_1'), 1000);
      await buttonA.click();
      Settings.changeWindowOrientation('landScape');
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0640')
      Settings.changeWindowOrientation('end')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0640 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0280
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0280 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA2')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button2_2'), 1000);
      await buttonA.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0280')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0610
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0610 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA4')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button4_3'), 1000);
      await buttonA.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0610')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0610 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0620
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0620 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA4')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button4_1'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button4_1'), 1000);
      await buttonB.click();
      let buttonA2: Component = await driver.waitForComponent(ON.id('PageA_Button4_1'), 1000);
      await buttonA2.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0620')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0620 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0500
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0500 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA4')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button4_4'), 1000);
      await buttonA.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0500')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0510
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0510 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA3')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button3_2'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button3_3'), 1000);
      await buttonB.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0510')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0260
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0260 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button1'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button3'), 1000);
      await buttonB.click();
      let buttonA2: Component = await driver.waitForComponent(ON.id('PageA_Button1'), 1000);
      await buttonA2.click();
      Settings.changeWindowOrientation('landScape');
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0260')
      Settings.changeWindowOrientation('end')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0370
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0370 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA2')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button2_3'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button2_1'), 1000);
      await buttonB.click();
      let buttonC: Component = await driver.waitForComponent(ON.id('PageC_Button2_4'), 1000);
      await buttonC.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0370')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0220
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0220 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button1'), 1000);
      await buttonA.click();
      Settings.changeWindowOrientation('landScape');
      await Utils.sleep(800)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0220')
      await Utils.sleep(800)
      Settings.changeWindowOrientation('end')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0350
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0350 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA6')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button6_1'), 1000);
      await buttonA.click();
      await Utils.sleep(1000)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0350')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0300
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0300 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA6')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button6_2'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button6_1'), 1000);
      await buttonB.click();
      await Utils.sleep(800)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0300')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0310
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0310 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA6')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button6_2'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button6_2'), 1000);
      await buttonB.click();
      await Utils.sleep(800)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0310')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0690
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0690', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0690 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA4')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button4_1'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button4_2'), 1000);
      await buttonB.click();
      await driver.waitForIdle(500,2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('PageC_Button4_1'), 1000);
      await buttonC.click();
      Settings.changeWindowOrientation('landScape');
      await Utils.sleep(800)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0690')
      await Utils.sleep(800)
      Settings.changeWindowOrientation('end')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0690 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0360
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0360 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA2')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button2_2'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      let buttonA1: Component = await driver.waitForComponent(ON.id('PageC_Button2_4'), 1000);
      await buttonA1.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0360')
      await Utils.sleep(800)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0030
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0030 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button12'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button3'), 1000);
      await buttonB.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0030')
      await Utils.sleep(800)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0050
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0050 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button1'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button3'), 1000);
      await buttonB.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0050')
      await Utils.sleep(800)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0150
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0150 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button4'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('PageC_Button2'), 1000);
      await buttonC.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0150')
      await Utils.sleep(800)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0330
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0330 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA2')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button2_3'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button2_4'), 1000);
      await buttonB.click();
      await driver.waitForIdle(500,2000);
      let buttonA2: Component = await driver.waitForComponent(ON.id('PageA_Button2_3'), 1000);
      await buttonA2.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0330')
      await Utils.sleep(800)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0100
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0100 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button13'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0100')
      await Utils.sleep(800)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0480
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0480 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA4')
      let driver: Driver = Driver.create();
      let buttonA1: Component = await driver.waitForComponent(ON.id('PageA_Button4_1'), 1000);
      await buttonA1.click();
      await driver.waitForIdle(500,2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button4_1'), 1000);
      await buttonB.click();
      await driver.waitForIdle(500,2000);
      let buttonA2: Component = await driver.waitForComponent(ON.id('PageA_Button4_1'), 1000);
      await buttonA2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0480')
      await Utils.sleep(800)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0780
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0780', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0780 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pages1_32/page01')
      let driver: Driver = Driver.create();
      let buttonInit: Component = await driver.waitForComponent(ON.id('Push_Pages'), 1000);
      await buttonInit.click();
      await driver.waitForIdle(500,2000);
      for (let i = 0; i < 31; i++) {
        let str:string = `${32-i}`
        if (32-i < 10) {
          str = '0' + str
        }
        let buttonId:string = 'Page' + str + '_Back';
        Logger.info('TEST', `buttonId is: ${buttonId}.`);
        let button: Component = await driver.waitForComponent(ON.id(buttonId), 1000);
        await button.click();
      }
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0780')
      await Utils.sleep(800)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0780 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0240
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0240 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button1'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button1'), 1000);
      await buttonB.click();
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0240')
      await Utils.sleep(800)
      await Settings.changeWindowOrientation('end')
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0320
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0320 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA2')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button2_3'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button2_5'), 1000);
      await buttonB.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0320')
      await Utils.sleep(800)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0130
     * @tc.name   : Router push back
     * @tc.desc   : Verify router push back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0130 start.`);
      Settings.createWindow('testability/pages/scenario/ability_router/router_push/pageA')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('PageA_Button1'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('PageB_Button1'), 1000);
      await buttonB.click();
      let buttonC: Component = await driver.waitForComponent(ON.id('PageC_Button6'), 1000);
      await buttonC.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0130')
      await Utils.sleep(800)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ROUTER_PUSH_BACK__0130 finish.`);
      done()
    })
  })
}