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

export default function focusTextTimerTest() {

  describe('focusTextTimerTest', () => {
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
     * @tc.number : SUB_ACE_UI_TEXT_TIMER_FONT_COLOR_0002
     * @tc.name   : Text timer font color
     * @tc.desc   : Verify text timer font color interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_TEXT_TIMER_FONT_COLOR_0002', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXT_TIMER_FONT_COLOR_0002  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/TtFontColor0002')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXT_TIMER_FONT_COLOR_0002 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TEXT_TIMER_FONT_COLOR_0003
     * @tc.name   : Text timer font color
     * @tc.desc   : Verify text timer font color interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_TEXT_TIMER_FONT_COLOR_0003', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXT_TIMER_FONT_COLOR_0003  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/TtFontColor0003')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXT_TIMER_FONT_COLOR_0003 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TEXT_TIMER_FONT_COLOR_0004
     * @tc.name   : Text timer font color
     * @tc.desc   : Verify text timer font color interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_TEXT_TIMER_FONT_COLOR_0004', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXT_TIMER_FONT_COLOR_0004  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/TtFontColor0004')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXT_TIMER_FONT_COLOR_0004 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_TEXT_TIMER_FONT_SIZE_0002
     * @tc.name   : Text timer font size
     * @tc.desc   : Verify text timer font size interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_TEXT_TIMER_FONT_SIZE_0002', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXT_TIMER_FONT_SIZE_0002  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/TtFontSize0002')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXT_TIMER_FONT_SIZE_0002 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TEXT_TIMER_FONT_SIZE_0003
     * @tc.name   : Text timer font size
     * @tc.desc   : Verify text timer font size interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_TEXT_TIMER_FONT_SIZE_0003', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXT_TIMER_FONT_SIZE_0003  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/TtFontSize0003')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXT_TIMER_FONT_SIZE_0003 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_TEXT_TIMER_FONT_SIZE_0004
     * @tc.name   : Text timer font size
     * @tc.desc   : Verify text timer font size interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_TEXT_TIMER_FONT_SIZE_0004', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXT_TIMER_FONT_SIZE_0004  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/TtFontSize0004')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXT_TIMER_FONT_SIZE_0004 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0010
     * @tc.name   : Texttimer common fontweight
     * @tc.desc   : Verify texttimer common fontweight interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0010', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0010  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/CommonFontWeight0010')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0012
     * @tc.name   : Texttimer common fontweight
     * @tc.desc   : Verify texttimer common fontweight interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0012', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0012  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/CommonFontWeight0012')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0012 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0014
     * @tc.name   : Texttimer common fontweight
     * @tc.desc   : Verify texttimer common fontweight interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0014', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0014  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/CommonFontWeight0014')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0014 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0015
     * @tc.name   : Texttimer common fontweight
     * @tc.desc   : Verify texttimer common fontweight interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0015', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0015  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/CommonFontWeight0015')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0015 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0016
     * @tc.name   : Texttimer common fontweight
     * @tc.desc   : Verify texttimer common fontweight interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0016', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0016  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/CommonFontWeight0016')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0016 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0023
     * @tc.name   : Texttimer common fontweight
     * @tc.desc   : Verify texttimer common fontweight interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0023', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0023  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/CommonFontWeight0023')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXTTIMER_COMMON_FONTWEIGHT_0023 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTTIMER_0040
     * @tc.name   : ArkUI texttimer
     * @tc.desc   : Verify ArkUI texttimer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTTIMER_0040', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTTIMER_0040  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/TextTimer0040')
      let driver:Driver = Driver.create();
      let buttons: Component = await driver.waitForComponent(ON.id('textTimer0040s'), 500);
      await buttons.click();
      await driver.waitForIdle(5000,10000);
      let buttonp: Component = await driver.waitForComponent(ON.id('textTimer0040p'), 1000);
      await buttonp.click();
      await driver.waitForIdle(1500,2000);
      let buttonr: Component = await driver.waitForComponent(ON.id('textTimer0040r'), 500);
      await buttonr.click();
      await driver.waitForIdle(1500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTTIMER_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTTIMER_0050
     * @tc.name   : ArkUI texttimer
     * @tc.desc   : Verify ArkUI texttimer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTTIMER_0050', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTTIMER_0050  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/TextTimer0050')
      let driver:Driver = Driver.create();
      let buttons: Component = await driver.waitForComponent(ON.id('textTimer0050s'), 500);
      await buttons.click();
      await driver.waitForIdle(1000,2000);
      let buttonp: Component = await driver.waitForComponent(ON.id('textTimer0050p'), 1000);
      await buttonp.click();
      await driver.waitForIdle(1000,2000);
      let buttonr: Component = await driver.waitForComponent(ON.id('textTimer0050r'), 500);
      await buttonr.click();
      await driver.waitForIdle(3000,4000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTTIMER_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTTIMER_0060
     * @tc.name   : ArkUI texttimer
     * @tc.desc   : Verify ArkUI texttimer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTTIMER_0060', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTTIMER_0060  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/TextTimer0060')
      let driver:Driver = Driver.create();
      let buttons: Component = await driver.waitForComponent(ON.id('textTimer0060s'), 500);
      await buttons.click();
      await driver.waitForIdle(1500,2000);
      let buttonp: Component = await driver.waitForComponent(ON.id('textTimer0060p'), 1000);
      await buttonp.click();
      await driver.waitForIdle(1500,2000);
      let buttonr: Component = await driver.waitForComponent(ON.id('textTimer0060r'), 500);
      await buttonr.click();
      await driver.waitForIdle(3000,4000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTTIMER_0060 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTTIMER_0070
     * @tc.name   : ArkUI texttimer
     * @tc.desc   : Verify ArkUI texttimer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTTIMER_0070', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTTIMER_0070  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/TextTimer0070')
      let driver:Driver = Driver.create();
      let buttons: Component = await driver.waitForComponent(ON.id('textTimer0070s'), 500);
      await buttons.click();
      await driver.waitForIdle(5000,10000);
      let buttonp: Component = await driver.waitForComponent(ON.id('textTimer0070p'), 1000);
      await buttonp.click();
      await driver.waitForIdle(1500,2000);
      let buttonr: Component = await driver.waitForComponent(ON.id('textTimer0070r'), 500);
      await buttonr.click();
      await driver.waitForIdle(1500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTTIMER_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTTIMER_0080
     * @tc.name   : ArkUI texttimer
     * @tc.desc   : Verify ArkUI texttimer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTTIMER_0080', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTTIMER_0080  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/TextTimer0080')
      let driver:Driver = Driver.create();
      let buttons: Component = await driver.waitForComponent(ON.id('textTimer0080s'), 500);
      await buttons.click();
      await driver.waitForIdle(1500,10000);
      let buttonp: Component = await driver.waitForComponent(ON.id('textTimer0080p'), 1000);
      await buttonp.click();
      await driver.waitForIdle(1500,2000);
      let buttonr: Component = await driver.waitForComponent(ON.id('textTimer0080r'), 500);
      await buttonr.click();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTTIMER_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTTIMER_0090
     * @tc.name   : ArkUI texttimer
     * @tc.desc   : Verify ArkUI texttimer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTTIMER_0090', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTTIMER_0090  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/TextTimer0090')
      let driver:Driver = Driver.create();
      let buttons: Component = await driver.waitForComponent(ON.id('textTimer0090s'), 500);
      await buttons.click();
      await driver.waitForIdle(5000,7000);
      let buttonp: Component = await driver.waitForComponent(ON.id('textTimer0090p'), 1000);
      await buttonp.click();
      await driver.waitForIdle(500,2000);
      let buttonr: Component = await driver.waitForComponent(ON.id('textTimer0090r'), 500);
      await buttonr.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTTIMER_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_TEXTTIMER_0100
     * @tc.name   : ArkUI texttimer
     * @tc.desc   : Verify ArkUI texttimer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_TEXTTIMER_0100', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTTIMER_0100  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/TextTimer0100')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_TEXTTIMER_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_TEXTTIMER_INTERFACE_0250
     * @tc.name   : Information texttimer interface
     * @tc.desc   : Verify information texttimer interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_TEXTTIMER_INTERFACE_0250', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_TEXTTIMER_INTERFACE_0250  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/TtInterface0250')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_TEXTTIMER_INTERFACE_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_TEXTTIMER_INTERFACE_0280
     * @tc.name   : Information texttimer interface
     * @tc.desc   : Verify information texttimer interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_TEXTTIMER_INTERFACE_0280', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_TEXTTIMER_INTERFACE_0280  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/TtInterface0280')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_TEXTTIMER_INTERFACE_0280 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_TEXTTIMER_INTERFACE_0290
     * @tc.name   : Information texttimer interface
     * @tc.desc   : Verify information texttimer interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_TEXTTIMER_INTERFACE_0290', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_TEXTTIMER_INTERFACE_0290  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextTimer/TtInterface0290')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_TEXTTIMER_INTERFACE_0290 finish.`);
      done()
    })
  })
}