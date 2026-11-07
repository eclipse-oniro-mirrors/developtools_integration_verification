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

export default function focusMediaBadgeLargeFont() {

  describe('focusMediaBadgeLargeFont', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0011
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0011', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0011  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0011')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0011A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0011B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0011C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0011D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0011 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0013
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0013', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0013  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0013')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0013A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0013B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0013C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0013 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0014
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0014', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0014  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0014')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0014A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0014B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0014C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0014D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0014 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0015
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0015', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0015  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0015')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0015A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0015 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0016
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0016', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0016  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0016')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0016A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0016B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0016C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0016 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0017
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0017', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0017  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0017')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0017A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0017B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0017C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0017D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0017 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0018
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0018', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0018  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0018')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0018A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0018 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0019
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0019', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0019  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0019')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0019A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0019B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0019C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0019 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0020
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0020  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0020')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0020A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0020B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0020C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0020D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0020 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0021
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0021', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0021  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0021')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0021A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0021 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0022
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0022', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0022  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0022')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0022A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0022B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0022C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0022 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0023
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0023', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0023  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0023')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0023A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0023B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0023C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0023D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0023 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0024
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0024', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0024  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0024')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0024A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0024 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0025
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0025', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0025  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0025')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0025A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0025B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0025C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0025 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0026
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0026', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0026  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0026')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0026A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0026B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0026C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0026D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0026 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0027
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0027', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0027  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0027')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0027A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0027 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0028
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0028', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0028  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0028')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0028A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0028B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0028C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0028 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0029
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0029', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0029  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0029')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0029A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0029B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0029C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0029D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0029 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0030
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0030  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0030')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0030A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0030 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0031
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0031', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0031  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0031')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0031A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0031B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0031C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0031 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0032
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0032', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0032  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0032')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0032A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0032B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0032C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0032D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0032 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0033
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0033', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0033  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0033')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0033A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0033 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0035
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0035', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0035  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0035')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0035A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0035B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0035C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0035D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0035 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0037
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0037', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0037  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0037')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0037A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0037B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0037C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0037 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0038
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0038', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0038  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0038')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0038A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0038B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0038C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0038D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0038 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0039
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0039', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0039  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0039')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0039A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0039 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0040
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0040  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0040')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0040A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0040B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0040C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0040 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0041
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0041', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0041  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0041')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0041A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0041B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0041C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0041D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0041 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0042
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0042', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0042  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0042')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0042A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0042 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0043
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0043', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0043  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0043')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0043A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0043B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0043C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0043 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0044
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0044', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0044  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0044')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0044A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0044B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0044C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0044D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0044 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0045
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0045', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0045  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0045')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0045A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0045 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0046
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0046', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0046  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0046')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0046A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0046B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0046C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0046 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0047
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0047', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0047  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0047')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0047A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0047B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0047C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0047D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0047 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0048
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0048', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0048  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0048')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0048A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0048 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0049
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0049', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0049  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0049')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0049A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0049B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0049C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0049 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0050
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0050  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0050')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0050A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0050B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0050C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0050D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0050 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0051
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0051', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0051  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0051')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0051A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0051 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0052
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0052', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0052  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0052')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0052A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0052B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0052C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0052 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0053
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0053', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0053  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0053')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0053A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0053B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0053C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0053D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0053 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0054
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0054', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0054  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0054')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0054A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0054 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0055
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0055', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0055  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0055')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0055A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0055B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0055C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0055 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0056
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0056', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0056  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0056')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0056A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0056B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0056C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0056D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0056 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0057
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0057', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0057  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0057')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0057A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0057 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0058
     * @tc.name   : Media Badge large font / aging font
     * @tc.desc   : Verify media Badge large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0058', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0058  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0058')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0058A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0058B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0058C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0058D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0058 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0059
     * @tc.name   : aging-friendly / large font-FrameNode
     * @tc.desc   : Verify the interface under test: aging-friendly / large font-FrameNode.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0059', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0059  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeLargeFont/MbLargeFont0059')
      let driver: Driver = Driver.create();
      let buttonA: Component = await driver.waitForComponent(ON.id('MbLF0059A'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000, 2000);
      let buttonB: Component = await driver.waitForComponent(ON.id('MbLF0059B'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000, 2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('MbLF0059C'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000, 2000);
      let buttonD: Component = await driver.waitForComponent(ON.id('MbLF0059D'), 1000);
      await buttonD.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0059 finish.`);
      done()
    })




  })
}