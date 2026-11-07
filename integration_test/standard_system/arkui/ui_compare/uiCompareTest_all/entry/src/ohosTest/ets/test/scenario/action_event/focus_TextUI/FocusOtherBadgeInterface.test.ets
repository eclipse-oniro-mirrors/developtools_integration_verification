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

export default function focusOtherBadgeInterface() {

  describe('focusOtherBadgeInterface', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0010
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0010', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0010  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0010')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0020
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0020  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0020')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0030
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0030  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0030')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0040
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0040  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0040')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0050
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0050  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0050')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0060
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0060  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0060')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0070
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0070  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0070')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0070 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0080
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0080  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0080')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0090
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0090', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0090  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0090')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0100
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0100', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0100  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0100')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0110
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0110', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0110  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0110')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0120
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0120', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0120  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0120')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0130
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0130', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0130  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0130')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0130 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0140
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0140', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0140  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0140')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0150
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0150', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0150  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0150')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0150 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0160
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0160', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0160  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0160')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0160 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0170
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0170', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0170  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0170')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0170 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0180
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0180', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0180  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0180')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0180 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0240
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0240', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0240  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0240')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0240 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0250
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0250', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0250  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0250')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0250 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0350
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0350', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0350  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0350')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0350 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0370
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0370', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0370  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0370')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0370 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0380
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0380', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0380  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0380')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0380 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0390
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0390', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0390  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0390')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0390 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0400
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0400', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0400  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0400')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0400 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0410
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0410', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0410  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0410')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0410 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0470
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0470', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0470  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0470')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0470 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0700
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0700', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0700  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0700')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0700 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0710
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0710', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0710  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0710')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0710 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0780
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0780', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0780  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0780')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0780 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0790
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0790', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0790  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0790')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0790 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0800
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0800', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0800  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0800')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0800 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0810
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0810', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0810  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0810')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0810 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0820
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0820', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0820  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0820')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0820 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0830
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0830', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0830  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0830')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0830 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0840
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0840', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0840  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0840')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0840 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0850
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0850', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0850  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0850')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0850 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0860
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0860', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0860  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0860')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0860 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0870
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0870', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0870  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0870')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0870 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0880
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0880', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0880  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0880')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0880 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0890
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0890', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0790  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0890')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0890 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0900
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0900', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0900  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0900')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0900 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0920
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0920', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0920  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0920')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0920 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0930
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0930', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0930  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0930')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0930 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0940
     * @tc.name   : Other Badge interface
     * @tc.desc   : Verify other Badge interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0940', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0940  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_Other_BadgeInterface/ObInterface0940')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_BADGE_INTERFACE_0940 finish.`);
      done()
    })

  })
}