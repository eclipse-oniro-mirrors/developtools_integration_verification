/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
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
import { Driver, ON, Component, MouseButton } from '@kit.TestKit'
/*
 * SUB_ACE_UI_ATTRIBUTES_FONT_INTERFACE_0010:设置文本颜色
 *
 * Settings.createWindow(config.url)：
 *  创建窗口，更改窗口基本配置，更改方式详见model/Settings createWindow方法
 *
 * windowSnap.snapShot(globalThis.context)：
 *  窗口截屏&图片文件保存，存储在设备端
 *  存储文件固定，单挑用例执行后覆盖，用于自动化UI对比
 *  支持调试更改文件名为时间戳格式，更改model/snapShot createAndGetFile方法 注释L35，放开L32，L33
 *
 * Logger日志使用方法：
 *  import Logger form './model/Logger'
 *  Logger.info(TAG,`config = ${config}, err = ${JSON.stringify(exception)}`)
 * */

export default function actionEventCommonEventFocusAxisEvent() {

  describe('actionEventCommonEventFocusAxisEvent', () => {
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
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0140
     * @tc.name   : Use the gamepad to trigger KeyEvent-deviceId
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0140 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent01'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0100
     * @tc.name   : Use the gamepad to trigger KeyEvent-type
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0100 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent02')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent02'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0110
     * @tc.name   : Use the gamepad to trigger KeyEvent-keyCode
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0110 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent03')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent03'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0130
     * @tc.name   : Use the gamepad to trigger KeyEvent-keySource
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0130 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent04')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent04'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0150
     * @tc.name   : Use the gamepad to trigger KeyEvent-metaKey
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0150 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent05')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent05'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0160
     * @tc.name   : Use the gamepad to trigger KeyEvent-timestamp
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0160 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent06')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent06'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0120
     * @tc.name   : Use the gamepad to trigger KeyEvent-keyText
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0120 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent07')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent07'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0320
     * @tc.name   : Use the gamepad to trigger KeyEvent-type(Modifier)
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0320 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent08')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent08'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0330
     * @tc.name   : Use the gamepad to trigger KeyEvent-keyCode(Modifier)
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0330 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent09')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent09'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0340
     * @tc.name   : Use the gamepad to trigger KeyEvent-keyText(Modifier)
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0340 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent10')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent10'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0350
     * @tc.name   : Use the gamepad to trigger KeyEvent-keySource(Modifier)
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0350 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent11')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent11'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0360
     * @tc.name   : Use the gamepad to trigger KeyEvent-deviceId(Modifier)
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0360 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent13')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent13'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0370
     * @tc.name   : Use the gamepad to trigger KeyEvent-metaKey(Modifier)
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0370 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent12')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent12'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0380
     * @tc.name   : Use the gamepad to trigger KeyEvent-timestamp(Modifier)
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0380 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent14')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent14'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0170
     * @tc.name   : Use the controller to trigger KeyEvent - child component sets stopPropagation
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0170 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent15')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent15'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0180
     * @tc.name   : Use the gamepad to trigger KeyEvent-child component not set stopPropagation
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0180 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent16')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent16'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0390
     * @tc.name   : Use the gamepad to trigger KeyEvent-child component set stopPropagation(Modifier)
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0390 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent17')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent17'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0400
     * @tc.name   : Use the gamepad to trigger KeyEvent-child component not set stopPropagation(Modifier)
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0400 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFocusAxisEvent/ActionEventCommonEventFocusAxisEvent18')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFocusAxisEvent18'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2301)
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0400 finish.`);
      done()
    })    
  })
}