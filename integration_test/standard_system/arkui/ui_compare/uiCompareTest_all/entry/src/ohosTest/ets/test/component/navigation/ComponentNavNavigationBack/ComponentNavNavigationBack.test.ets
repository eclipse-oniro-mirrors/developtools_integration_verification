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


export default function componentNavNavigationBack() {

  describe('componentNavNavigationBack', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0281
     * @tc.name   : Navigation设置为自动切换单双栏模式，设置backButtonIcon属性，传入PixelMap类型，动态切换为PixelMap-jpg
     * @tc.desc   : Verify nav navigation back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0281', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0281 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigationBack/ComponentNavNavigationBack0281_001')
      let driver:Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0281_002'),1000);
      await Button1.click();
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0281_003'),1000);
      await Button2.click();
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0281_001'),1000);
      await Button3.click();
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0281_A2'),1000);
      await Utils.sleep(2000)
      await Button4.click();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0281 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0282
     * @tc.name   : Navigation设置为自动切换单双栏模式，设置backButtonIcon属性，传入PixelMap类型，动态切换为PixelMap-gif
     * @tc.desc   : Verify nav navigation back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0282', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0282 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigationBack/ComponentNavNavigationBack0282_001')
      let driver:Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0282_002'),1000);
      await Button1.click();
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0282_003'),1000);
      await Button2.click();
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0282_001'),1000);
      await Button3.click();
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0282_A2'),1000);
      await Utils.sleep(2000)
      await Button4.click();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0282 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0283
     * @tc.name   : Navigation设置为自动切换单双栏模式，设置backButtonIcon属性，传入PixelMap类型，动态切换为PixelMap-svg
     * @tc.desc   : Verify nav navigation back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0283', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0283 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigationBack/ComponentNavNavigationBack0283_001')
      let driver:Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0283_002'),1000);
      await Button1.click();
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0283_003'),1000);
      await Button2.click();
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0283_001'),1000);
      await Button3.click();
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0283_A2'),1000);
      await Utils.sleep(2000)
      await Button4.click();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0283 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0284
     * @tc.name   : Navigation设置为自动切换单双栏模式，设置backButtonIcon属性，传入PixelMap类型，动态切换为PixelMap-bmp
     * @tc.desc   : Verify nav navigation back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0284', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0284 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigationBack/ComponentNavNavigationBack0284_001')
      let driver:Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0284_002'),1000);
      await Button1.click();
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0284_003'),1000);
      await Button2.click();
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0284_001'),1000);
      await Button3.click();
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0284_A2'),1000);
      await Utils.sleep(2000)
      await Button4.click();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0284 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0291
     * @tc.name   : Navigation设置为自动切换单双栏模式，设置backButtonIcon属性，传入Resource类型，动态切换为Resource-jpg
     * @tc.desc   : Verify nav navigation back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0291', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0291 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigationBack/ComponentNavNavigationBack0291_001')
      let driver:Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0291_002'),1000);
      await Button1.click();
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0291_003'),1000);
      await Button2.click();
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0291_001'),1000);
      await Button3.click();
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0291_A2'),1000);
      await Utils.sleep(2000)
      await Button4.click();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0291 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0292
     * @tc.name   : Navigation设置为自动切换单双栏模式，设置backButtonIcon属性，传入Resource类型，动态切换为Resource-gif
     * @tc.desc   : Verify nav navigation back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0292', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0292 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigationBack/ComponentNavNavigationBack0292_001')
      let driver:Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0292_002'),1000);
      await Button1.click();
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0292_003'),1000);
      await Button2.click();
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0292_001'),1000);
      await Button3.click();
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0292_A2'),1000);
      await Utils.sleep(2000)
      await Button4.click();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0292 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0293
     * @tc.name   : Navigation设置为自动切换单双栏模式，设置backButtonIcon属性，传入Resource类型，动态切换为Resource-svg
     * @tc.desc   : Verify nav navigation back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0293', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0293 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigationBack/ComponentNavNavigationBack0293_001')
      let driver:Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0293_002'),1000);
      await Button1.click();
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0293_003'),1000);
      await Button2.click();
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0293_001'),1000);
      await Button3.click();
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0293_A2'),1000);
      await Utils.sleep(2000)
      await Button4.click();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0293 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0294
     * @tc.name   : Navigation设置为自动切换单双栏模式，设置backButtonIcon属性，传入Resource类型，动态切换为Resource-bmp
     * @tc.desc   : Verify nav navigation back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0294', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0294 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigationBack/ComponentNavNavigationBack0294_001')
      let driver:Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0294_002'),1000);
      await Button1.click();
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0294_003'),1000);
      await Button2.click();
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0294_001'),1000);
      await Button3.click();
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0294_A2'),1000);
      await Utils.sleep(2000)
      await Button4.click();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0294 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0301
     * @tc.name   : Navigation设置为自动切换单双栏模式，设置backButtonIcon属性，传入String类型，动态切换属性为String-jpg
     * @tc.desc   : Verify nav navigation back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0301', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0301 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigationBack/ComponentNavNavigationBack0301_001')
      let driver:Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0301_002'),1000);
      await Button1.click();
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0301_003'),1000);
      await Button2.click();
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0301_001'),1000);
      await Button3.click();
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0301_A2'),1000);
      await Utils.sleep(2000)
      await Button4.click();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0301 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0302
     * @tc.name   : Navigation设置为自动切换单双栏模式，设置backButtonIcon属性，传入String类型，动态切换属性为String-gif
     * @tc.desc   : Verify nav navigation back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0302', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0302 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigationBack/ComponentNavNavigationBack0302_001')
      let driver:Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0302_002'),1000);
      await Button1.click();
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0302_003'),1000);
      await Button2.click();
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0302_001'),1000);
      await Button3.click();
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0302_A2'),1000);
      await Utils.sleep(2000)
      await Button4.click();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0302 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0303
     * @tc.name   : Navigation设置为自动切换单双栏模式，设置backButtonIcon属性，传入String类型，动态切换属性为String-svg
     * @tc.desc   : Verify nav navigation back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0303', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0303 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigationBack/ComponentNavNavigationBack0303_001')
      let driver:Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0303_002'),1000);
      await Button1.click();
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0303_003'),1000);
      await Button2.click();
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0303_001'),1000);
      await Button3.click();
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0303_A2'),1000);
      await Utils.sleep(2000)
      await Button4.click();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0303 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0304
     * @tc.name   : Navigation设置为自动切换单双栏模式，设置backButtonIcon属性，传入String类型，动态切换属性为String-bmp
     * @tc.desc   : Verify nav navigation back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0304', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0304 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigationBack/ComponentNavNavigationBack0304_001')
      let driver:Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0304_002'),1000);
      await Button1.click();
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0304_003'),1000);
      await Button2.click();
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0304_001'),1000);
      await Button3.click();
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0304_A2'),1000);
      await Utils.sleep(2000)
      await Button4.click();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0304 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0305
     * @tc.name   : Navigation设置为自动切换单双栏模式，设置backButtonIcon属性，传入String类型，动态切换属性为String-png，横屏场景
     * @tc.desc   : Verify nav navigation back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0305', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0305 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigationBack/ComponentNavNavigationBack0305_001')
      let driver:Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0305_002'),1000);
      await Button1.click();
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0305_003'),1000);
      await Button2.click();
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0305_001'),1000);
      await Button3.click();
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentNavNavigationBack0305_A2'),1000);
      await Utils.sleep(2000)
      await Button4.click();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0305 finish.`);
      done()
    })


  })
}