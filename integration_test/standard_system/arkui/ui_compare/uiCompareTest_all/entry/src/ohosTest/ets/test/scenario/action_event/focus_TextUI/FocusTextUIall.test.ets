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

export default function focusTextUITest() {

  describe('focusTextUITest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0140
     * @tc.name   : Text#TextTest#TextTest_141
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0140', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0140  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI0140')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0400
     * @tc.name   : Text ui
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0400', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0400  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI0400')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('changeResBtn0400'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0400');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1220
     * @tc.name   : Text#TextTest#TextTest_122
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1220', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1220  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI1220')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('paramBtn1220'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1220');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1310
     * @tc.name   : Text#TextTest#TextTest_131
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1310', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1310  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI1310')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('testBtn1310'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1310mid')
      await Utils.sleep(1000)
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1440
     * @tc.name   : Text#TextTest#TextTest_144
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1440 ', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1440  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI1440')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('testBtn1440'), 1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1440mid')
      await Utils.sleep(1000)
      await buttonA.click();
      await driver.waitForIdle(500,2000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1440 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0160
     * @tc.name   : Text#TextTest#TextTest_016
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0160', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0160  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI0160')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0260
     * @tc.name   : Text#TextTest#TextTest_026
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0260', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0260  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI0260')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('textComponent0260'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0310
     * @tc.name   : Text#TextTest#TextTest_031
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0310', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0310  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI0310')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('changeColorBtn0310'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0330
     * @tc.name   : Text#TextTest#TextTest_033
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0330', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0330  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI0330')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('colorBtn0330'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0340
     * @tc.name   : Text#TextTest#TextTest_034
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0340', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0340  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI0340')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('colorBtn0340'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0340 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0410
     * @tc.name   : Text#TextTest#TextTest_041
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0410', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0410  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI0410')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('Bold0410'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('Medium0410'), 1000);
      await buttonB.click();
      let buttonC: Component = await driver.waitForComponent(ON.id('Normal0410'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0460
     * @tc.name   : Text#TextTest#TextTest_046
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0460', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0460  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI0460')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('zeroSize0460'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0540
     * @tc.name   : Text#TextTest#TextTest_054
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0540', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0540  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI0540')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('zeroSize0540'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0550
     * @tc.name   : Text#TextTest#TextTest_055
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0550', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0550  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI0550')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonC: Component = await driver.waitForComponent(ON.id('Size0550'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0770
     * @tc.name   : Text#TextTest#TextTest_077
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0770', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0770  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI0770')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('paramBtn0770'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0770 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0780
     * @tc.name   : Text#TextTest#TextTest_078
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0780', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0780  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI0780')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('paramBtn0780'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0780 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0860
     * @tc.name   : Text#TextTest#TextTest_086
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0860', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0860  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI0860')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('paramBtn0860'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0860 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0950
     * @tc.name   : Text#TextTest#TextTest_095
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0950', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0950  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI0950')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('changeColorBtn0950'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0950 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0980
     * @tc.name   : Text#TextTest#TextTest_098
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0980', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0980  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI0980')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('testText0980'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0980 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1110
     * @tc.name   : Text#TextTest#TextTest_111
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1110', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1110  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI1110')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('changeResBtn1110'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1120
     * @tc.name   : Text#TextTest#TextTest_112
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1120', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1120  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI1120')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('paramBtn1120'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1210
     * @tc.name   : Text#TextTest#TextTest_121
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1210', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1210  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI1210')
       let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('paramBtn1210'), 1000);
       await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1210 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0190
     * @tc.name   : Framenode text
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0190', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0190  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/TextFrameNode0190')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0190 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0010
     * @tc.name   : Text inherit
     * @tc.desc   : Verify text inherit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0010', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0010  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextInherit0010')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0150
     * @tc.name   : Text ui
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0150', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0150  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI0150')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_0150 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1230
     * @tc.name   : Text ui
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1230', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1230  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI1230')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('paramBtn1230'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1230 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1380
     * @tc.name   : Text#TextTest#TextTest_138
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1380', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1380  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI1380')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1410
     * @tc.name   : Text#TextTest#TextTest_141
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1410', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1410  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI1410')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('testBtn1410'), 1000);
      await buttonA.click();
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await buttonA.click();
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1410 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1430
     * @tc.name   : Text#TextTest#TextTest_143
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1430', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1430  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI1430')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('testBtn1430'), 1000);
      await buttonA.click();
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1430 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1460
     * @tc.name   : Text#TextTest#TextTest_146
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1460', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1460  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI1460')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('CaseBtn1460'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1640
     * @tc.name   : Text#TextTest#TextTest_164
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1640', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1640  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI1640')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('textShadow1640'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1640 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1660
     * @tc.name   : Text#TextTest#TextTest_166
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1660', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1660  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI1660')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('textShadow1660'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1750
     * @tc.name   : Text#TextTest#TextTest_175
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1750', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1750  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI1750')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('configBtn1750'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1750 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1780
     * @tc.name   : Text#TextTest#TextTest_178
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1780', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1780  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI1780')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('configBtn1780'), 1000);
      await buttonA.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1780 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1940
     * @tc.name   : Text#TextTest#TextTest_194
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1940', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1940  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI1940')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('Bold1940'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('Medium1940'), 1000);
      await buttonB.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_1940 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_2020
     * @tc.name   : Text#TextTest#TextTest_202
     * @tc.desc   : Verify text ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_2020', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_2020  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextUI/FocusTextUI2020')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let buttonA: Component = await driver.waitForComponent(ON.id('Normal2020'), 1000);
      await buttonA.click();
      let buttonB: Component = await driver.waitForComponent(ON.id('Bold2020'), 1000);
      await buttonB.click();
      let buttonC: Component = await driver.waitForComponent(ON.id('Medium2020'), 1000);
      await buttonC.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_UI_2020 finish.`);
      done()
    })
  })
}