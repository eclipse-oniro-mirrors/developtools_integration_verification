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

import { describe, afterEach, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, Component, UiDirection } from '@kit.TestKit';
import { inputEventClient } from '@kit.InputKit';
import { FormComponentModifier } from '@ohos.arkui.modifier'


export default function focusTextPickerTest() {

  describe('focusTextPickerTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0040
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0040  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0040')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      await driver.fling(UiDirection.DOWN,10000)
      let button: Component = await driver.waitForComponent(ON.id('tp0040'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0040 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0060
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0060  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0060')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0060'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0060 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0070
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0070  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0070')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0070'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0080
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0080  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0080')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0080'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0110
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0110', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0110  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0110')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0110'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0180
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0180', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0180  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0180')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0180'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0180 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0200
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0200', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0200  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0200')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0200'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0200 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0210
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0210', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0210  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0210')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0210'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0210 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0220
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0220', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0220  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0220')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0220'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0220 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0250
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0250', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0250  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0250')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0250'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0250 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0320
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0320', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0320  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0320')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0320'), 1000);
      await button.click();
      try {
        let EnterKeyDown: inputEventClient.KeyEvent = {
          isPressed: true,
          keyCode: 2012,
          keyDownDuration: 0,
          isIntercepted: false
        }
        class EventDown {
          KeyEvent: inputEventClient.KeyEvent | null = null
        }
        let eventDown: EventDown = { KeyEvent: EnterKeyDown }
        inputEventClient.injectEvent(eventDown);
        console.log(`Success to inject KeyEvent`);
        await driver.waitForIdle(1000,2000);

        let EnterKeyUp: inputEventClient.KeyEvent = {
          isPressed: false,
          keyCode: 2012,
          keyDownDuration: 0,
          isIntercepted: false
        };
        class EventUp {
          KeyEvent: inputEventClient.KeyEvent | null = null
        }
        let eventUp: EventUp = { KeyEvent: EnterKeyUp }
        inputEventClient.injectEvent(eventUp);
        console.log(`Success to release KeyEvent`);
        await driver.waitForIdle(1000,2000);
      } catch (error) {
        console.log(`Failed to inject KeyEvent, error: ${JSON.stringify(error, [`code`, `message`])}`);
      }
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0320 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0340
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0340', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0340  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0340')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0340'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0350
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0350', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0350  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0350')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0350'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0350 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0360
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0360', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0360  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0360')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0360'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0360 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0390
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0390', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0390  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0390')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0390'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0390 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0460
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0460', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0460  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0460')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0460'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0460 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0480
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0480', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0480  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0480')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0480'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0480 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0490
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0490', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0490  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0490')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0490'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0490 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0530
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0530', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0530  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0530')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0530'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0530 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0550
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0550', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0550  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0550')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0550'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0550 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0560
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0560', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0560  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0560')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0560'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0560 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0570
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0570', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0570  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0570')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      await driver.fling(UiDirection.DOWN,10000)
      let button: Component = await driver.waitForComponent(ON.id('tp0570'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0570 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0600
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0600', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0600  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0600')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0600'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0600 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0670
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0670', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0670  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0670')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0670'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0670 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0690
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0690', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0690  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0690')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0690'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0690 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0700
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0700', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0700  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0700')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0700'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0700 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0710
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0710', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0710  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0710')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0710'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0710 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0740
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0740', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0740  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0740')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      await driver.fling(UiDirection.DOWN,10000)
      let button: Component = await driver.waitForComponent(ON.id('tp0740'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0740 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0810
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0810', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0810  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0810')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      await driver.fling(UiDirection.DOWN,10000)
      let button: Component = await driver.waitForComponent(ON.id('tp0810'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0810 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0830
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0830', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0830  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0830')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0830'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0830 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0840
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0840', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0840  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0840')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      await driver.fling(UiDirection.DOWN,10000)
      let button: Component = await driver.waitForComponent(ON.id('tp0840'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0840 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0850
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0850', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0850  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0850')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0850'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0850 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0880
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0880', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0880  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0880')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0880'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0880 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0950
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0950', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0950  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0950')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0950'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0950 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0970
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0970', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0970  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0970')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      await driver.fling(UiDirection.UP,10000)
      let button: Component = await driver.waitForComponent(ON.id('tp0970'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0970 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0980
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0980', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0980  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop0980')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp0980'), 1000);
      await button.click();try {
        let EnterKeyDown: inputEventClient.KeyEvent = {
          isPressed: true,
          keyCode: 2013,
          keyDownDuration: 0,
          isIntercepted: false
        }
        class EventDown {
          KeyEvent: inputEventClient.KeyEvent | null = null
        }
        let eventDown: EventDown = { KeyEvent: EnterKeyDown }
        inputEventClient.injectEvent(eventDown);
        console.log(`Success to inject KeyEvent`);
        await driver.waitForIdle(1000,2000);

        let EnterKeyUp: inputEventClient.KeyEvent = {
          isPressed: false,
          keyCode: 2013,
          keyDownDuration: 0,
          isIntercepted: false
        };
        class EventUp {
          KeyEvent: inputEventClient.KeyEvent | null = null
        }
        let eventUp: EventUp = { KeyEvent: EnterKeyUp }
        inputEventClient.injectEvent(eventUp);
        console.log(`Success to release KeyEvent`);
        await driver.waitForIdle(1000,2000);
      } catch (error) {
        console.log(`Failed to inject KeyEvent, error: ${JSON.stringify(error, [`code`, `message`])}`);
      }
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0980 finish.`);
      done()
    })





    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1020
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1020  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop1020')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp1020'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1020 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1040
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1040  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop1040')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp1040'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1040 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1050
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1050  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop1050')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp1050'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1050 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1060
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1060  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop1060')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      await driver.fling(UiDirection.UP,10000)
      let button: Component = await driver.waitForComponent(ON.id('tp1060'), 1000);
      await button.scrollToTop();
      await Utils.sleep(1000)
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1060 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1090
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1090', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1090  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop1090')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      await driver.fling(UiDirection.UP,10000)
      let button: Component = await driver.waitForComponent(ON.id('tp1090'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1090 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1160
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1160', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1160  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop1160')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      await driver.fling(UiDirection.UP,10000)
      let button: Component = await driver.waitForComponent(ON.id('tp1160'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1160 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1180
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1180', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1180  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop1180')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp1180'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1180 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1190
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1190', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1190  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop1190')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp1190'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1190 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1200
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1200', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1200  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop1200')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp1200'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1200 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1230
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1230', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1200  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop1230')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp1230'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1230 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1300
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1300', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1300  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop1300')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      await driver.fling(UiDirection.DOWN,10000)
      let button: Component = await driver.waitForComponent(ON.id('tp1300'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1300 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1320
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1320', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1320  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop1320')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp1320'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1320 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1330
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1330', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1330  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop1330')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      await driver.fling(UiDirection.DOWN,10000)
      let button: Component = await driver.waitForComponent(ON.id('tp1330'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1330 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1340
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1340', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1340  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop1340')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp1340'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1340 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1370
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1370', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1370  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop1370')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp1370'), 1000);
      await button.scrollToTop();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1370 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1440
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1440', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1440  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop1440')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp1440'), 1000);
      await button.scrollToTop();
      try {
        let EnterKeyDown: inputEventClient.KeyEvent = {
          isPressed: true,
          keyCode: 2013,
          keyDownDuration: 0,
          isIntercepted: false
        }
        class EventDown {
          KeyEvent: inputEventClient.KeyEvent | null = null
        }
        let eventDown: EventDown = { KeyEvent: EnterKeyDown }
        inputEventClient.injectEvent(eventDown);
        console.log(`Success to inject KeyEvent`);
        await driver.waitForIdle(1000,2000);

        let EnterKeyUp: inputEventClient.KeyEvent = {
          isPressed: false,
          keyCode: 2013,
          keyDownDuration: 0,
          isIntercepted: false
        };
        class EventUp {
          KeyEvent: inputEventClient.KeyEvent | null = null
        }
        let eventUp: EventUp = { KeyEvent: EnterKeyUp }
        inputEventClient.injectEvent(eventUp);
        console.log(`Success to release KeyEvent`);
        await driver.waitForIdle(1000,2000);
      } catch (error) {
        console.log(`Failed to inject KeyEvent, error: ${JSON.stringify(error, [`code`, `message`])}`);
      }
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1440 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1460
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1460', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1460  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_TextPicker/TextPickerOnscrollstop1460')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('tp1460'), 1000);
      await button.scrollToBottom();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1460 finish.`);
      done()
    })
  })
}