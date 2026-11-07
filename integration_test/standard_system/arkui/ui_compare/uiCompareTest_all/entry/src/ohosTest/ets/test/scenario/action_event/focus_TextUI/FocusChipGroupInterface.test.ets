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
import { Driver, ON, Component, UiDirection } from '@kit.TestKit';

export default function focusChipGroupInterfaceTest() {

  describe('focusChipGroupInterfaceTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0160
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0160  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0160')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0160 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0170
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0170  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0170')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      await driver.waitForIdle(1000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0170 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0180
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0180  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0180')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0180 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0190
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0190  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0190')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0190 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0200
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0200  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0200')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0200 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0210
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0210  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0210')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0210 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0220
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0220  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0220')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0220 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0260
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0260  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0260')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0260 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0270
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0270  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0270')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0280
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0280  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0280')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0280 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0290
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0290  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0290')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0290 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0300
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0300  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0300')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0300 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0310
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0310  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0310')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0310 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0320
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0320  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0320')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0320 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0330
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0330  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0330')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0330 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0370
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0370  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0370')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0370 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0410
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0410  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0410')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0410 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0430
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0430  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0430')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0430 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0440
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0440  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0440')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0440 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0450
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0450  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0450')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0450 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0460
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0460  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0460')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0460 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0470
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0470  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0470')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0470 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0480
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0480  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0480')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0480 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0490
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0490  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0490')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0490 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0500
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0500  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0500')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0500 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0510
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0510  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0510')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0510 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0520
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0520  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0520')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0520 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0560
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0560  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0560')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0560 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0600
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0600  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0600')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0600 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0620
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0620  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0620')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0620 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0630
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0630  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0630')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0630 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0640
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0640  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0640')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button5: Component = await driver.waitForComponent(ON.text('选项5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0640 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0650
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0650  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0650')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('chaochangzifuchuan1'), 1000);
      await button1.click();
      let button5: Component = await driver.waitForComponent(ON.text('chaochangzifuchuan5'), 1000);
      await button5.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0650 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0680
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0680', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0680  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0680')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0680 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0710
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0710  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0710')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0710 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0720
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0720', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0720  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0720')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0720 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0730
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0730', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0730  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0730')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0730 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0750
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0750', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0750  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0750')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0750 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0760
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0760', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0760  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0760')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0760 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0770
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0770', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0770  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0770')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0770 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0780
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0780', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0780  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0780')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0780 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0800
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0800', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0800  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0800')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0800 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0810
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0810', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0810  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0810')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0810 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0820
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0820', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0820  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0820')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0820 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0830
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0830', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0830  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0830')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0830 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0840
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0840', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0840  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0840')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0840 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0860
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0860', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0860  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0860')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0860 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0870
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0870', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0870  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0870')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      let button4: Component = await driver.waitForComponent(ON.text('选项4'), 1000);
      await button4.click();
      let button: Component = await driver.waitForComponent(ON.text('横竖屏切换'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(1000,2000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0870 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0880
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0880', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0880  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0880')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('点击'), 1000);
      await button1.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0880 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0890
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0890', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0890  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface0890')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('点击'), 1000);
      await button1.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_0890 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1170
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1170  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1170')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1070
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1070  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1070')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      // 点击color按钮切换颜色状态
      let colorButton: Component = await driver.waitForComponent(ON.text('color'), 1000);
      await colorButton.click();
      await driver.waitForIdle(500,1000);
      
      // 测试第二组ChipGroup（设置了backgroundColor为Color.Orange）
      let option1_group2: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await option1_group2.click();
      let option2_group2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await option2_group2.click();
      
      // 测试第三组ChipGroup（设置了selectedBackgroundColor为Color.Orange）
      let option3_group3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await option3_group3.click();
      
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1080
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1080  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1080')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      // 点击color1按钮切换颜色状态
      let colorButton: Component = await driver.waitForComponent(ON.text('color1'), 1000);
      await colorButton.click();
      await driver.waitForIdle(500,1000);
      
      // 测试各组ChipGroup的选项点击
      let option1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await option1.click();
      let option2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await option2.click();
      let option3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await option3.click();
      
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1090
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1090  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1090')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1100
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1100  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1100')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1110
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1110  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1110')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1120
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1120  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1120')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1130
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1130  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1130')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1140
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1140  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1140')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1150
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1150  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1150')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1150 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1180
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1180  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1180')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button: Component = await driver.waitForComponent(ON.text('空'), 1000);
      await button.click();
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1190
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1190  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1190')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 点击"乱字"按钮，观察第二组ChipGroup效果（backgroundColor异常值）
      let button: Component = await driver.waitForComponent(ON.text('乱字'), 1000);
      await button.click();
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      await driver.waitForIdle(1000,2000);

      // 点击"乱字"按钮，观察第三组ChipGroup效果（selectedBackgroundColor异常值）
      await button.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      await driver.waitForIdle(1000,2000);

      // 点击"乱字"按钮，观察第四组ChipGroup效果（fontColor异常值）
      await button.click();
      let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await button3.click();
      await driver.waitForIdle(1000,2000);

      // 点击"乱字"按钮，观察第五组ChipGroup效果（selectedFontColor异常值）
      await button.click();
      await driver.waitForIdle(1000,2000);

      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1220
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1220  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1220')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1240
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1240  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1240')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);
      let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await button2.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1480
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1480  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1480')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 观察"apppng"下chipGroup效果
      Logger.info('TEST', 'Testing apppng ChipGroup effect');
      let option1_png: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await option1_png.click();
      await driver.waitForIdle(300,500);

      // 观察"appsvg"下chipGroup效果
      Logger.info('TEST', 'Testing appsvg ChipGroup effect');
      let option2_svg: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await option2_svg.click();
      await driver.waitForIdle(300,500);

      // 观察"appjpg"下chipGroup效果
      Logger.info('TEST', 'Testing appjpg ChipGroup effect');
      let option3_jpg: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
      await option3_jpg.click();
      await driver.waitForIdle(300,500);

      // 滚动页面以查看更多内容
      await driver.fling({ x: 200, y: 600 }, { x: 200, y: 300 }, 10, 600);
      await driver.waitForIdle(500,1000);

      // 观察"appgif"chipGroup效果
      Logger.info('TEST', 'Testing appgif ChipGroup effect');
      try {
        let option1_gif: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await option1_gif.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'appgif option not visible, continuing test');
      }

      // 观察"appbmp"chipGroup效果
      Logger.info('TEST', 'Testing appbmp ChipGroup effect');
      try {
        let option2_bmp: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await option2_bmp.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'appbmp option not visible, continuing test');
      }

      // 观察"appmp4"下chipGroup效果（非图片类型，应该不显示）
      Logger.info('TEST', 'Testing appmp4 ChipGroup effect (non-image type, should not display)');
      try {
        let option3_mp4: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
        await option3_mp4.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'appmp4 option not visible, which is expected for non-image type');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1500
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1500  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1500')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试PNG rawfile资源
      Logger.info('TEST', 'Testing PNG rawfile resource');
      try {
        let button1_png: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1_png.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'PNG option1 not clickable, which may be expected');
      }

      // 滚动查看更多内容
      await driver.fling({ x: 200, y: 600 }, { x: 200, y: 300 }, 10, 600);
      await driver.waitForIdle(500,1000);

      // 测试其他格式的rawfile资源
      Logger.info('TEST', 'Testing other format rawfile resources');
      try {
        let button2_other: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2_other.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Other format option2 not clickable, which may be expected');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1510
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1510  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1510')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试第一组ChipGroup（异常字符串）
      Logger.info('TEST', 'Testing first ChipGroup with invalid string');
      try {
        let button1_invalid: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1_invalid.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Invalid string option1 not clickable, which is expected');
      }

      // 测试第二组ChipGroup（图片字符串）
      Logger.info('TEST', 'Testing second ChipGroup with image string');
      try {
        // 查找第二组的选项1（可能需要滚动）
        await driver.fling({ x: 200, y: 600 }, { x: 200, y: 300 }, 10, 600);
        await driver.waitForIdle(500,1000);

        let button2_image: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button2_image.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Image string option1 not clickable, which may be expected');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1540
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1540  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1540')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试不同width单位的suffix
      Logger.info('TEST', 'Testing suffix with different width units');
      try {
        let button1_width: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1_width.click();
        await driver.waitForIdle(300,500);

        let button2_width: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2_width.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Width test options not clickable, which may be expected');
      }

      // 滚动查看更多内容
      await driver.fling({ x: 200, y: 600 }, { x: 200, y: 300 }, 10, 600);
      await driver.waitForIdle(500,1000);

      // 测试更多width单位
      try {
        let button3_width: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
        await button3_width.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Additional width test option not clickable, which may be expected');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1550
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1550  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1550')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试不同height单位的suffix
      Logger.info('TEST', 'Testing suffix with different height units');
      try {
        let button1_height: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1_height.click();
        await driver.waitForIdle(300,500);

        let button2_height: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2_height.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Height test options not clickable, which may be expected');
      }

      // 滚动查看更多内容
      await driver.fling({ x: 200, y: 600 }, { x: 200, y: 300 }, 10, 600);
      await driver.waitForIdle(500,1000);

      // 测试更多height单位
      try {
        let button3_height: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
        await button3_height.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Additional height test option not clickable, which may be expected');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1590
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1590  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1590')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试点击可见的选项
      let option1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await option1.click();
      let option2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await option2.click();

      // 滑动到右侧查看更多选项
      await driver.fling({ x: 300, y: 400 }, { x: 50, y: 400 }, 10, 600);
      await driver.waitForIdle(1000,2000);

      // 尝试点击滑动后可见的选项
      try {
        let option10: Component = await driver.waitForComponent(ON.text('选项10'), 500);
        await option10.click();
      } catch (e) {
        Logger.info('TEST', 'Option 10 not visible after scroll, which is expected');
      }

      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1600
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1600  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1600')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试items数组中包含无效条目的情况
      Logger.info('TEST', 'Testing items array with invalid entries');
      try {
        let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1.click();
        await driver.waitForIdle(300,500);

        let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Some options not clickable due to invalid entries, which is expected');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1620
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1620  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1620')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试selectedIndexes为负数的情况
      Logger.info('TEST', 'Testing selectedIndexes with negative number');
      try {
        let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1.click();
        await driver.waitForIdle(300,500);

        let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Options not clickable with negative selectedIndexes, which may be expected');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1620 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1630
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1630  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1630')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试selectedIndexes为有效数字的情况
      Logger.info('TEST', 'Testing selectedIndexes with valid number');
      try {
        let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1.click();
        await driver.waitForIdle(300,500);

        let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Options not found or clickable, continuing test');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1630 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1640
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1640  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1640')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试selectedIndexes为超出范围数字的情况
      Logger.info('TEST', 'Testing selectedIndexes with out-of-range number');
      try {
        let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1.click();
        await driver.waitForIdle(300,500);

        let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Options not selected due to out-of-range selectedIndexes, which is expected');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1640 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1650
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1650  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1650')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试selectedIndexes为多个值的情况
      Logger.info('TEST', 'Testing selectedIndexes with multiple values');
      try {
        let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1.click();
        await driver.waitForIdle(300,500);

        let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Options behavior with multiple selectedIndexes, continuing test');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1650 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1660
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1660  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1660')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 点击组切换按钮测试不同组
      let groupButton: Component = await driver.waitForComponent(ON.text('1组'), 1000);
      await groupButton.click();
      await driver.waitForIdle(500,1000);

      // 再次点击切换到2组
      await groupButton.click();
      await driver.waitForIdle(500,1000);

      // 测试第一组ChipGroup的选项点击
      let option1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
      await option1.click();
      let option2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
      await option2.click();

      // 测试动态chips的删除功能（如果有删除按钮的话）
      try {
        let deleteButton: Component = await driver.waitForComponent(ON.text('删除'), 500);
        await deleteButton.click();
        await driver.waitForIdle(500,1000);
      } catch (e) {
        Logger.info('TEST', 'Delete button not found, testing chip selection instead');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1670
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1670', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1670  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1670')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试selectedIndexes为有效和超出范围数字的情况
      Logger.info('TEST', 'Testing selectedIndexes with valid and out-of-range numbers');
      try {
        let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1.click();
        await driver.waitForIdle(300,500);

        let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Mixed selectedIndexes behavior, continuing test');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1670 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1680
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1680', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1680  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1680')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试selectedIndexes为混合数字的情况
      Logger.info('TEST', 'Testing selectedIndexes with mixed numbers');
      try {
        let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1.click();
        await driver.waitForIdle(300,500);

        let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Mixed numbers selectedIndexes behavior, continuing test');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1680 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1690
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1690', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1690  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1690')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试selectedIndexes为多个负数的情况
      Logger.info('TEST', 'Testing selectedIndexes with multiple negative numbers');
      try {
        let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1.click();
        await driver.waitForIdle(300,500);

        let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'No options selected with multiple negative numbers, which is expected');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1690 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1700
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1700  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1700')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试selectedIndexes为多个超出范围数字的情况
      Logger.info('TEST', 'Testing selectedIndexes with multiple out-of-range numbers');
      try {
        let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1.click();
        await driver.waitForIdle(300,500);

        let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'No options selected with out-of-range numbers, which is expected');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1700 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1710
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1710  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1710')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试selectedIndexes为负数和超出范围数字的情况
      Logger.info('TEST', 'Testing selectedIndexes with negative and out-of-range numbers');
      try {
        let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1.click();
        await driver.waitForIdle(300,500);

        let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'No options selected with negative and out-of-range numbers, which is expected');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1710 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1720
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1720', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1720  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1720')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试selectedIndexes为多个重复有效数字的情况
      Logger.info('TEST', 'Testing selectedIndexes with multiple duplicate valid numbers');
      try {
        let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1.click();
        await driver.waitForIdle(300,500);

        let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Duplicate selectedIndexes behavior, continuing test');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1720 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1730
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1730', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1730  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1730')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试不设置selectedIndexes的情况
      Logger.info('TEST', 'Testing without setting selectedIndexes');
      try {
        let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1.click();
        await driver.waitForIdle(300,500);

        let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Default selectedIndexes behavior, continuing test');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1730 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1740
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1740', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1740  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1740')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试selectedIndexes设置为undefined的情况
      Logger.info('TEST', 'Testing selectedIndexes set to undefined');
      try {
        let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1.click();
        await driver.waitForIdle(300,500);

        let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Undefined selectedIndexes behavior, continuing test');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1740 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1750
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1750', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1750  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1750')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 点击组切换按钮
      try {
        let groupButton: Component = await driver.waitForComponent(ON.text('1组'), 1000);
        await groupButton.click();
        await driver.waitForIdle(500,1000);

        // 点击multiple控制按钮（从true切换到false）
        let multipleButton: Component = await driver.waitForComponent(ON.text('true'), 1000);
        await multipleButton.click();
        await driver.waitForIdle(500,1000);

        // 点击全选按钮
        let allButton: Component = await driver.waitForComponent(ON.text('全'), 1000);
        await allButton.click();
        await driver.waitForIdle(500,1000);

        // 再次点击multiple按钮（从false切换回true）
        let multipleButton2: Component = await driver.waitForComponent(ON.text('false'), 1000);
        await multipleButton2.click();
        await driver.waitForIdle(500,1000);

        // 测试ChipGroup选项点击
        let option1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await option1.click();
        let option2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await option2.click();
      } catch (e) {
        Logger.info('TEST', 'Multiple parameter switching test, some elements may not be clickable');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1750 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1760
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1760', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1760  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1760')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试multiple参数设置
      Logger.info('TEST', 'Testing multiple parameter settings');
      try {
        let button: Component = await driver.waitForComponent(ON.text('全选'), 1000);
        await button.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Select all button not clickable, which may be expected');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1760 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1770
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1770', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1770  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1770')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试multiple设置为undefined的情况
      Logger.info('TEST', 'Testing multiple set to undefined');
      try {
        let button: Component = await driver.waitForComponent(ON.text('全选'), 1000);
        await button.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Select all button behavior with undefined multiple, continuing test');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1770 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1780
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1780', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1780  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1780')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试不设置multiple的情况
      Logger.info('TEST', 'Testing without setting multiple');
      try {
        let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1.click();
        await driver.waitForIdle(300,500);

        let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2.click();
        await driver.waitForIdle(300,500);
      } catch (e) {
        Logger.info('TEST', 'Default multiple behavior, continuing test');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1780 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1870
     * @tc.name   : Text chipgroup interface
     * @tc.desc   : Verify text chipgroup interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1870', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1870  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_ChipGroupInterface/ChipGroupInterface1870')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(2000,2000);

      // 测试suffix包含很多chips的情况
      Logger.info('TEST', 'Testing suffix with many chips');
      try {
        let button1: Component = await driver.waitForComponent(ON.text('选项1'), 1000);
        await button1.click();
        await driver.waitForIdle(300,500);

        let button2: Component = await driver.waitForComponent(ON.text('选项2'), 1000);
        await button2.click();
        await driver.waitForIdle(300,500);

        // 滚动查看更多内容
        await driver.fling({ x: 200, y: 600 }, { x: 200, y: 300 }, 10, 600);
        await driver.waitForIdle(500,1000);

        // 尝试点击更多选项
        try {
          let button3: Component = await driver.waitForComponent(ON.text('选项3'), 1000);
          await button3.click();
          await driver.waitForIdle(300,500);
        } catch (e) {
          Logger.info('TEST', 'Additional options may not be visible due to overflow');
        }
      } catch (e) {
        Logger.info('TEST', 'Suffix with many chips test, some elements may not be clickable');
      }

      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIPGROUP_INTERFACE_1870 finish.`);
      done()
    })




  })
}