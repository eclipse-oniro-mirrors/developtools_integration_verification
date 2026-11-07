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

export default function focusMediaBadgeBorder() {

  describe('focusMediaBadgeBorder', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0011
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0011', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0011  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0011')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0011 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0012
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0012', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0012  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0012')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0012 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0014
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0014', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0014  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0014')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0014 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0015
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0015', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0015  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0015')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0015 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0016
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0016', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0016  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0016')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0016 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0018
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0018', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0018  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0018')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0018 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0019
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0019', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0019  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0019')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0019 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0021
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0021', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0021  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0021')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0021 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0022
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0022', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0021  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0022')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0022 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0024
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0024', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0024  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0024')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0024 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0029
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0029', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0029  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0029')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0029 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0030
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0030  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0030')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0031
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0031', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0031  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0031')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0031 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0032
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0032', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0032  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0032')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0032 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0033
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0033', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0033  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0033')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0033 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0034
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0034', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0034  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0034')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0034 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0036
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0036', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0036  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0036')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0036 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0037
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0037', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0037  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0037')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0037 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0038
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0038', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0038  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0038')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0038 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0039
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0039', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0039  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0039')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0039 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0041
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0041', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0041  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0041')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0041 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0042
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0042', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0042  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0042')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0042 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0043
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0043', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0043  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0043')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0043 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0044
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0044', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0044  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0044')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0044 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0046
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0046', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0046  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0046')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0046 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0047
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0047', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0047  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0047')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0047 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0048
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0048', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0048  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0048')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0048 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0049
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0049', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0049  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0049')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0049 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0050
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0050  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0050')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0051
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0051', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0051  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0051')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0051 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0053
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0053', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0053  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0053')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0053 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0055
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0055', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0055  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0055')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0055 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0057
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0057', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0057  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0057')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0057 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0058
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0058', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0058  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0058')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0058 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0060
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0060  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0060')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0063
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0063', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0063  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0063')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0063 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0064
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0064', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0064  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0064')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0064 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0065
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0065', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0065  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0065')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0065 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0066
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0066', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0066  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0066')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0066 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0068
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0068', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0068  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0068')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0068 finish.`);
      done()
    })
    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0072
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0072', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0072  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0072')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0072 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0073
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0073', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0073  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0073')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0073 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0074
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0074', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0074  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0074')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0074 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0075
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0075', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0075  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0075')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0075 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0076
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0076', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0076  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0076')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0076 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0079
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0079', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0079  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0079')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0079 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0080
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0080  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0080')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0080 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0081
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0081', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0081  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0081')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0081 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0086
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0086', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0086  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0086')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0086 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0089
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0089', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0089  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0089')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0089 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0090
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0090', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0090  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0090')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0090 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0091
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0091', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0091  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0091')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0091 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0092
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0092', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0092  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0092')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0092 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0093
     * @tc.name   : Media Badge border
     * @tc.desc   : Verify media Badge border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0093', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0093  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Media_BadgeBorder/MbBorder0093')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_BORDER_0093 finish.`);
      done()
    })

  })
}