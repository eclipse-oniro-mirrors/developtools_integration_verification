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
import { window } from '@kit.ArkUI'

export default function navigationInterfaceTest() {

  describe('navigationInterfaceTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err: BusinessError) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      let driver: Driver = Driver.create();
      await Settings.changeWindowOrientation('end')
      await driver.waitForIdle(500, 2000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0290_177
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0290_177', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0290_177 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0290_177')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0290_177 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0170_861
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0170_861', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0170_861 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0170_861')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0170_861 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_SYMBOL_0400_045
     * @tc.name   : Nav navigation symbol
     * @tc.desc   : Verify nav navigation symbol interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_SYMBOL_0400_045', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_SYMBOL_0400_045 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_SYMBOL_0400_045')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_SYMBOL_0400_045 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BASEPROPERTY_0370
     * @tc.name   : Nav navigation baseproperty
     * @tc.desc   : Verify nav navigation baseproperty interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BASEPROPERTY_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BASEPROPERTY_0370 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation03')
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('nav03ChangeMinContentWidth'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BASEPROPERTY_0370')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BASEPROPERTY_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0300_496
     * @tc.name   : Nav navigation back
     * @tc.desc   : Verify nav navigation back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0300_496', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0300_496 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation04')
      let driver: Driver = Driver.create();
      Logger.info('TEST', `button1.click begin.`);
      let button1: Component = await driver.waitForComponent(ON.id('nav04ChangeMode'), 1000);
      await button1.click();
      Logger.info('TEST', `button1.click success.`);
      let button2: Component = await driver.waitForComponent(ON.id('nav04ChangeTitleMode'), 1000);
      await button2.click();
      Logger.info('TEST', `button2.click success.`);
      let button3: Component = await driver.waitForComponent(ON.id('nav04PushPageOne'), 1000);
      await button3.click();
      Logger.info('TEST', `button3.click success.`);

      let button4: Component = await driver.waitForComponent(ON.id('nav04ChangeImgPng'), 1000);
      let button5: Component = await driver.waitForComponent(ON.id('nav04ChangeImgJpg'), 1000);
      let button6: Component = await driver.waitForComponent(ON.id('nav04ChangeImgGif'), 1000);
      let button7: Component = await driver.waitForComponent(ON.id('nav04ChangeImgSvg'), 1000);
      let button8: Component = await driver.waitForComponent(ON.id('nav04ChangeImgBmp'), 1000);
      await button4.click();
      Logger.info('TEST', `button4.click success.`);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0300_496_01')
      await Utils.sleep(1000)

      await button5.click();
      Logger.info('TEST', `button5.click success.`);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0300_496_02')
      await Utils.sleep(1000)

      await button6.click();
      Logger.info('TEST', `button6.click success.`);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0300_496_03')
      await Utils.sleep(1000)

      await button7.click();
      Logger.info('TEST', `button7.click success.`);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0300_496_04')
      await Utils.sleep(1000)

      await button8.click();
      Logger.info('TEST', `button8.click success.`);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0300_496_05')
      await Utils.sleep(1000)

      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', `changeWindowOrientation first success. orientation is: ${globalThis.orientation}`);
      if (globalThis.orientation === window.Orientation.LANDSCAPE) {
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0300_496_06')
        await Utils.sleep(1000)
        await Settings.changeWindowOrientation('portrait');
        await driver.waitForIdle(500, 2000);
        Logger.info('TEST', `changeWindowOrientation second success. orientation is: ${globalThis.orientation}`);
        if (globalThis.orientation === window.Orientation.PORTRAIT) {
          Logger.info('TEST', `button9.click begin.`);
          let button9: Component = await driver.waitForComponent(ON.id('nav04ChangeImgPng'), 1000);
          await button9.click();
          Logger.info('TEST', `button9.click success.`);
          windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0300_496_07')
          await Utils.sleep(1000)
          let button10: Component = await driver.waitForComponent(ON.id('nav04ChangeImgJpg'), 1000);
          await button10.click();
          windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0300_496_08')
          await Utils.sleep(1000)
          let button11: Component = await driver.waitForComponent(ON.id('nav04ChangeImgGif'), 1000);
          await button11.click();
          windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0300_496_09')
          await Utils.sleep(1000)
          let button12: Component = await driver.waitForComponent(ON.id('nav04ChangeImgSvg'), 1000);
          await button12.click();
          windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0300_496_10')
          await Utils.sleep(1000)
          let button13: Component = await driver.waitForComponent(ON.id('nav04ChangeImgBmp'), 1000);
          await button13.click();
          windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0300_496_11')
          await Utils.sleep(1000)
        }
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0300_496_12')
        await Utils.sleep(1000)
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0300_496 finish.`);
        done()
      }
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_SYSTEMBARSTYLE_0060_024
     * @tc.name   : Nav navigation systembarstyle
     * @tc.desc   : Verify nav navigation systembarstyle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_SYSTEMBARSTYLE_0060_024', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_SYSTEMBARSTYLE_0060_024 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation05')
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('nav05PushPageThree'), 1000);
      await button1.click();
      Logger.info('TEST', `push PageThree success.`);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_SYSTEMBARSTYLE_0060_024_01')
      await Utils.sleep(1000)

      let button2: Component = await driver.waitForComponent(ON.id('nav05ChangeSystemBarStyle'), 1000);
      await button2.click();
      Logger.info('TEST', `change barColor success.`);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_SYSTEMBARSTYLE_0060_024_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_SYSTEMBARSTYLE_0060_024 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0020_405
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0020_405', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0020_405 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0020_405')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0020_405 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0200_811
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0200_811', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0200_811 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0200_811')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0200_811 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTENTEXPANSION_0030_227
     * @tc.name   : Nav navigation contentexpansion
     * @tc.desc   : Verify nav navigation contentexpansion interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTENTEXPANSION_0030_227', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTENTEXPANSION_0030_227 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation08')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTENTEXPANSION_0030_227')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTENTEXPANSION_0030_227 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0230_354
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0230_354', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0230_354 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0230_354')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0230_354 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0730_530
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0730_530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0730_530 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation10')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0730_530')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0730_530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0050_299
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0050_299', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0050_299 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0050_299')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0050_299 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_SYMBOL_0140_226
     * @tc.name   : Nav navigation symbol
     * @tc.desc   : Verify nav navigation symbol interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_SYMBOL_0140_226', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_SYMBOL_0140_226 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation12')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_SYMBOL_0140_226')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_SYMBOL_0140_226 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0310_250
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0310_250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0310_250 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation13')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0310_250')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0310_250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0240_508
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0240_508', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0240_508 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation14')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0240_508')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0240_508 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0090_618
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0090_618', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0090_618 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation15')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0090_618')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0090_618 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0070_571
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0070_571', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0070_571 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation16')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0070_571')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0070_571 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0100_771
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0100_771', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0100_771 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation17')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0100_771')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0100_771 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0510_988
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0510_988', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0510_988 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation18')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0510_988')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0510_988 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0340_021
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0340_021', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0340_021 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation19')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0340_021')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0340_021 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0740_522
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0740_522', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0740_522 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation20')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0740_522')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0740_522 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0360_216
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0360_216', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0360_216 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation21')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0360_216')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0360_216 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0590_474
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0590_474', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0590_474 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation22')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('landScape');
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0590_474')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('end');
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0590_474 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BASEPROPERTY_0360
     * @tc.name   : Nav navigation baseproperty
     * @tc.desc   : Verify nav navigation baseproperty interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BASEPROPERTY_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BASEPROPERTY_0360 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation23')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      let button: Component = await driver.waitForComponent(ON.id('nav23ChangeNavBarPosition'), 1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BASEPROPERTY_0360')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BASEPROPERTY_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BASEPROPERTY_0260
     * @tc.name   : Nav navigation baseproperty
     * @tc.desc   : Verify nav navigation baseproperty interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BASEPROPERTY_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BASEPROPERTY_0260 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation24')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      let button: Component = await driver.waitForComponent(ON.id('nav24ChangeHideToolBar'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BASEPROPERTY_0260')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BASEPROPERTY_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0720_462
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0720_462', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0720_462 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation25')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      let button: Component = await driver.waitForComponent(ON.id('nav25ChangeTitle'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0720_462')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0720_462 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0380_470
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0380_470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0380_470 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation26')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0380_470')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0380_470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0030_369
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0030_369', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0030_369 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation27')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0030_369')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0030_369 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0040_448
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0040_448', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0040_448 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation28')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0040_448')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0040_448 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0370_053
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0370_053', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0370_053 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation29')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0370_053')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0370_053 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0140_557
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0140_557', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0140_557 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation30')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0140_557')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0140_557 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0570_324
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0570_324', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0570_324 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation31')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await Settings.changeWindowOrientation('landScape');
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0570_324')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('end');
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0570_324 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0330_250
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0330_250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0330_250 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation32')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0330_250')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('end');
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0330_250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0290_249
     * @tc.name   : Nav navigation back
     * @tc.desc   : Verify nav navigation back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0290_249', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0290_249 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation33')
      let driver: Driver = Driver.create();
      Logger.info('TEST', `button1.click begin.`);
      let button1: Component = await driver.waitForComponent(ON.id('nav33ChangeMode'), 1000);
      await button1.click();
      Logger.info('TEST', `button1.click success.`);
      let button2: Component = await driver.waitForComponent(ON.id('nav33ChangeTitleMode'), 1000);
      await button2.click();
      Logger.info('TEST', `button2.click success.`);
      let button3: Component = await driver.waitForComponent(ON.id('nav33PushPage12'), 1000);
      await button3.click();
      Logger.info('TEST', `button3.click success.`);

      let button4: Component = await driver.waitForComponent(ON.id('nav33ChangeImgPng'), 1000);
      let button5: Component = await driver.waitForComponent(ON.id('nav33ChangeImgJpg'), 1000);
      let button6: Component = await driver.waitForComponent(ON.id('nav33ChangeImgGif'), 1000);
      let button7: Component = await driver.waitForComponent(ON.id('nav33ChangeImgSvg'), 1000);
      let button8: Component = await driver.waitForComponent(ON.id('nav33ChangeImgBmp'), 1000);
      await button4.click();
      Logger.info('TEST', `button4.click success.`);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0290_249_01')
      await Utils.sleep(1000)

      await button5.click();
      Logger.info('TEST', `button5.click success.`);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0290_249_02')
      await Utils.sleep(1000)

      await button6.click();
      Logger.info('TEST', `button6.click success.`);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0290_249_03')
      await Utils.sleep(1000)

      await button7.click();
      Logger.info('TEST', `button7.click success.`);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0290_249_04')
      await Utils.sleep(1000)

      await button8.click();
      Logger.info('TEST', `button8.click success.`);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0290_249_05')
      await Utils.sleep(1000)

      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', `changeWindowOrientation first success. orientation is: ${globalThis.orientation}`);
      if (globalThis.orientation === window.Orientation.LANDSCAPE) {
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0290_249_06')
        await Utils.sleep(1000)
        await Settings.changeWindowOrientation('portrait');
        await driver.waitForIdle(500, 2000);
        Logger.info('TEST', `changeWindowOrientation second success. orientation is: ${globalThis.orientation}`);
        if (globalThis.orientation === window.Orientation.PORTRAIT) {
          Logger.info('TEST', `button9.click begin.`);
          let button9: Component = await driver.waitForComponent(ON.id('nav33ChangeImgPng'), 1000);
          await button9.click();
          Logger.info('TEST', `button9.click success.`);
          windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0290_249_07')
          await Utils.sleep(1000)
          let button10: Component = await driver.waitForComponent(ON.id('nav33ChangeImgJpg'), 1000);
          await button10.click();
          windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0290_249_08')
          await Utils.sleep(1000)
          let button11: Component = await driver.waitForComponent(ON.id('nav33ChangeImgGif'), 1000);
          await button11.click();
          windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0290_249_09')
          await Utils.sleep(1000)
          let button12: Component = await driver.waitForComponent(ON.id('nav33ChangeImgSvg'), 1000);
          await button12.click();
          windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0290_249_10')
          await Utils.sleep(1000)
          let button13: Component = await driver.waitForComponent(ON.id('nav33ChangeImgBmp'), 1000);
          await button13.click();
          windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0290_249_11')
          await Utils.sleep(1000)
        }
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0290_249_12')
        await Utils.sleep(1000)
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0290_249 finish.`);
        done()
      }
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0080_285
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0080_285', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0080_285 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation34')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0080_285')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0080_285 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0490_747
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0490_747', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0490_747 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation35')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0490_747')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0490_747 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0220_957
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0220_957', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0220_957 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation36')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0220_957')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0220_957 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0370_072
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0370_072', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0370_072 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation37')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      let scrollBar: Component = await driver.waitForComponent(ON.id('nav37ScrollList'), 1000);
      await scrollBar.scrollToTop();
      await scrollBar.scrollToBottom();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0370_072_01')
      await Utils.sleep(1000)
      await scrollBar.scrollToBottom();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0370_072_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0370_072 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0210_165
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0210_165', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0210_165 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation38')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0210_165')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0210_165 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0280_916
     * @tc.name   : Nav navigation back
     * @tc.desc   : Verify nav navigation back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0280_916', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0280_916 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation39')
      let driver: Driver = Driver.create();
      Logger.info('TEST', `button1.click begin.`);
      let button1: Component = await driver.waitForComponent(ON.id('nav39ChangeMode'), 1000);
      await button1.click();
      Logger.info('TEST', `button1.click success.`);
      let button2: Component = await driver.waitForComponent(ON.id('nav39ChangeTitleMode'), 1000);
      await button2.click();
      Logger.info('TEST', `button2.click success.`);
      let button3: Component = await driver.waitForComponent(ON.id('nav39PushPage15'), 1000);
      await button3.click();
      Logger.info('TEST', `button3.click success.`);

      let button4: Component = await driver.waitForComponent(ON.id('nav39ChangeImgPng'), 1000);
      let button5: Component = await driver.waitForComponent(ON.id('nav39ChangeImgJpg'), 1000);
      let button6: Component = await driver.waitForComponent(ON.id('nav39ChangeImgGif'), 1000);
      let button7: Component = await driver.waitForComponent(ON.id('nav39ChangeImgSvg'), 1000);
      let button8: Component = await driver.waitForComponent(ON.id('nav39ChangeImgBmp'), 1000);
      await button4.click();
      Logger.info('TEST', `button4.click success.`);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0280_916_01')
      await Utils.sleep(1000)

      await button5.click();
      Logger.info('TEST', `button5.click success.`);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0280_916_02')
      await Utils.sleep(1000)

      await button6.click();
      Logger.info('TEST', `button6.click success.`);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0280_916_03')
      await Utils.sleep(1000)

      await button7.click();
      Logger.info('TEST', `button7.click success.`);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0280_916_04')
      await Utils.sleep(1000)

      await button8.click();
      Logger.info('TEST', `button8.click success.`);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0280_916_05')
      await Utils.sleep(1000)

      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', `changeWindowOrientation first success. orientation is: ${globalThis.orientation}`);
      if (globalThis.orientation === window.Orientation.LANDSCAPE) {
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0280_916_06')
        await Utils.sleep(1000)
        await Settings.changeWindowOrientation('portrait');
        await driver.waitForIdle(500, 2000);
        Logger.info('TEST', `changeWindowOrientation second success. orientation is: ${globalThis.orientation}`);
        if (globalThis.orientation === window.Orientation.PORTRAIT) {
          Logger.info('TEST', `button9.click begin.`);
          let button9: Component = await driver.waitForComponent(ON.id('nav39ChangeImgPng'), 1000);
          await button9.click();
          Logger.info('TEST', `button9.click success.`);
          windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0280_916_07')
          await Utils.sleep(1000)
          let button10: Component = await driver.waitForComponent(ON.id('nav39ChangeImgJpg'), 1000);
          await button10.click();
          windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0280_916_08')
          await Utils.sleep(1000)
          let button11: Component = await driver.waitForComponent(ON.id('nav39ChangeImgGif'), 1000);
          await button11.click();
          windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0280_916_09')
          await Utils.sleep(1000)
          let button12: Component = await driver.waitForComponent(ON.id('nav39ChangeImgSvg'), 1000);
          await button12.click();
          windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0280_916_10')
          await Utils.sleep(1000)
          let button13: Component = await driver.waitForComponent(ON.id('nav39ChangeImgBmp'), 1000);
          await button13.click();
          windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0280_916_11')
          await Utils.sleep(1000)
        }
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0280_916_12')
        await Utils.sleep(1000)
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_BACK_0280_916 finish.`);
        done()
      }
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0010_249
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0010_249', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0010_249 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0010_249')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0010_249 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0360_448
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0360_448', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0360_448 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation40')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0360_448')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0360_448 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0580_781
     * @tc.name   : Nav navigation interface
     * @tc.desc   : Verify nav navigation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0580_781', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0580_781 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigation41')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0580_781_01')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0580_781_02')
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('end');
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACE_0580_781 finish.`);
      done()
    })
  })
}