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
import { Driver, ON, Component } from '@kit.TestKit';
import { inputEventClient } from '@kit.InputKit';



export default function focusPopupBoxTest() {

  describe('focusPopupBoxTest', () => {
    afterEach(async (done: Function) => {
      Logger.info('TEST', 'focusPopupBoxTest afterEach called');
      // 销毁窗口，为下一个测试做准备
      try {
        await Settings.destroyCurrentWindow();
        Logger.info('TEST', 'Window destroyed successfully in afterEach');
      } catch (e) {
        Logger.error('TEST', `Failed to destroy window in afterEach: ${e}`);
      }
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0330
     * @tc.name   : Popupbox enter
     * @tc.desc   : Verify popupbox enter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0330', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0330  start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PopupBox/PopupBoxEnter0330');
      } catch (e) {
        Logger.error('TEST', `Failed to create window: ${e}`);
        done();
        return;
      }
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DPD0330'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      try {
        let EnterKeyDown: inputEventClient.KeyEvent = {
          isPressed: true,
          keyCode: 2054,
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
          keyCode: 2054,
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0330 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0490
     * @tc.name   : Popupbox enter
     * @tc.desc   : Verify popupbox enter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0490', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0490  start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PopupBox/PopupBoxEnter0490');
      } catch (e) {
        Logger.error('TEST', `Failed to create window: ${e}`);
        done();
        return;
      }
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('TPD0490'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      try {
        let EnterKeyDown: inputEventClient.KeyEvent = {
          isPressed: true,
          keyCode: 2054,
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
          keyCode: 2054,
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
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ENTER_0490 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0530
     * @tc.name   : Popupbox avoid safezone
     * @tc.desc   : Verify popupbox avoid safezone interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0530', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0530  start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PopupBox/PBAvoidSafeZone0530');
      } catch (e) {
        Logger.error('TEST', `Failed to create window: ${e}`);
        done();
        return;
      }
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('PBASZ0530'), 1000);
      await button.click();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0530 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0670
     * @tc.name   : Popupbox avoid safezone
     * @tc.desc   : Verify popupbox avoid safezone interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0670', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0670  start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PopupBox/PBAvoidSafeZone0670');
      } catch (e) {
        Logger.error('TEST', `Failed to create window: ${e}`);
        done();
        return;
      }
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('PBASZ0670'), 1000);
      await button.click();
      await driver.waitForIdle(2000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0670 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0010
     * @tc.name   : Popupbox lunarswitchstyle
     * @tc.desc   : Verify popupbox lunarswitchstyle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0010', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0010  start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PopupBox/PBLunarSwitchStyle0010');
      } catch (e) {
        Logger.error('TEST', `Failed to create window: ${e}`);
        done();
        return;
      }
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.id('DatePickerDialog0010'), 1000);
      await button.click();
      await driver.waitForIdle(3000,4000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0010 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0100
     * @tc.name   : Popupbox lunarswitchstyle
     * @tc.desc   : Verify popupbox lunarswitchstyle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0100', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0100  start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PopupBox/PBLunarSwitchStyle0100');
      } catch (e) {
        Logger.error('TEST', `Failed to create window: ${e}`);
        done();
        return;
      }
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('DatePickerDialog0100'), 1000);
      await button.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0100 finish.`);
      done()
    })


  })
}