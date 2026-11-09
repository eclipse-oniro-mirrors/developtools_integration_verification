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

export default function focusMediaBadgeFont() {

  describe('focusMediaBadgeFont', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_WATCHES_0011
     * @tc.name   : Media Badge watches
     * @tc.desc   : Verify media Badge watches interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_WATCHES_0011', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_WATCHES_0011  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbWatches0011')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_WATCHES_0011 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0011
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0011', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0011  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0011')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0011 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0012
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0012', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0012  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0012')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0012 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0013
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0013', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0013  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0013')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0013 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0015
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0015', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0015  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0015')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0015 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0016
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0016', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0016  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0016')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0016 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0017
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0017', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0017  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0017')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0017 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0018
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0018', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0018  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0018')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0018 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0019
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0019', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0019  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0019')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0019 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0020
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0020  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0020')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0021
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0021', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0021  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0021')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0021 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0022
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0022', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0022  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0022')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0022 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0023
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0023', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0023  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0023')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0023 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0024
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0024', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0024  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0024')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0024 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0025
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0025', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0025  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0025')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0025 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0026
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0026', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0026  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0026')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0026 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0027
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0027', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0027  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0027')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0027 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0029
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0029', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0029  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0029')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0029 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0030
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0030  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0030')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0031
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0031', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0031  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0031')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0031 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0033
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0033', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0033  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0033')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0033 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0034
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0034', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0034  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0034')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0034 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0035
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0035', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0035  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0035')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0035 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0036
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0036', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0036  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0036')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0036 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0037
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0037', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0037  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0037')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0037 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0038
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0038', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0038  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0038')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0038 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0039
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0039', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0039  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0039')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0039 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0040
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0040  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0040')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0040 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0041
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0041', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0041  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0041')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0041 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0042
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0042', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0042  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0042')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0042 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0043
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0043', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0043  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0043')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0043 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0044
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0044', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0044  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0044')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0044 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0045
     * @tc.name   : Media Badge font
     * @tc.desc   : Verify media Badge font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0045', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0045  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeFont/MbFont0045')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_FONT_0045 finish.`);
      done()
    })

  })
}