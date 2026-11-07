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
import { Driver, ON, Component, MouseButton, PointerMatrix } from '@kit.TestKit'
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

export default function aceActionEventGestureComponentId() {

  describe('aceActionEventGestureComponentId', () => {
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
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0060
     * @tc.name   : Set the component ID to an excessively long string, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0060 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('超长ID测试_This_I23456789_特殊符号!@#$%^&*()_+-=[]{}|;字列_한글문자_символы_'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0020
     * @tc.name   : Set the component ID to contain newline character, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0020 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('换行符\nID测试'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0030
     * @tc.name   : Set the component ID to a decimal number, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0030 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('9.99'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0080
     * @tc.name   : Set the component ID to null, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0080 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.findComponent(ON.type('Button'));
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0040
     * @tc.name   : Set the component ID to a negative number, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0040 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId05')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('-4.22'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0050
     * @tc.name   : Set the component ID to special characters, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0050 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId06')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('！@#￥~'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0070
     * @tc.name   : Set the component ID to undefined, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0070 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId07')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.findComponent(ON.type('Button'));
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0100
     * @tc.name   : Do not set the component ID, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0100 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId08')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.findComponent(ON.type('Button'));
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0150
     * @tc.name   : Set the component key to special characters, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0150 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId09')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0120
     * @tc.name   : Set the component key to contain newline character, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0120 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId10')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0130
     * @tc.name   : Set the component key to a decimal number, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0130 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId11')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0140
     * @tc.name   : Set the component key to a negative number, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0140 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId12')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0160
     * @tc.name   : Set the component key to an excessively long string, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0160 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId13')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0170
     * @tc.name   : Set the component key to undefined, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0170 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId14')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0180
     * @tc.name   : Set the component key to null, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0180 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId15')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0200
     * @tc.name   : Do not set the component key, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0200 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId16')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0220
     * @tc.name   : Modifier-Set the component ID to contain newline character, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0220 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId18')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0230
     * @tc.name   : Modifier-Set the component ID to a decimal number, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0230 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId19')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0240
     * @tc.name   : Modifier-Set the component ID to a negative number, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0240 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId20')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0250
     * @tc.name   : Modifier-Set the component ID to special characters, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0250 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId21')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0260
     * @tc.name   : Modifier-Set the component ID to an excessively long string, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0260 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId22')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0270
     * @tc.name   : Modifier-Set the component ID to undefined, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0270 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId23')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0280
     * @tc.name   : Modifier-Set the component ID to null, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0280 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId24')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0300
     * @tc.name   : Modifier-Do not set the component ID, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0300 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId26')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0320
     * @tc.name   : Modifier-Set the component Key to contain newline character, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0320 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId27')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0330
     * @tc.name   : Modifier-Set the component Key to a decimal number, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0330 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId28')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0340
     * @tc.name   : Modifier-Set the component Key to a negative number, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0340 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId29')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0350
     * @tc.name   : Modifier-Set the component Key to special characters, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0350 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId30')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0360
     * @tc.name   : Modifier-Set the component Key to an excessively long string, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0360 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId31')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0370
     * @tc.name   : Modifier-Set the component Key to undefined, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0370 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId32')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0380
     * @tc.name   : Modifier-Set the component Key to null, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0380 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId33')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0400
     * @tc.name   : Modifier-Do not set the component Key, trigger the event, and retrieve the component information.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0400 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId34')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0650
     * @tc.name   : The component's custom gesture is set to CONTINUE, and the component information is retrieved correctly.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0650 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId35')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('longPressTextWithContinue'),1000);
      windowSnap.snapShot()
      await text.longClick()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0650 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0660
     * @tc.name   : The component's custom gesture is set to REJECT, and the component's related information is not printed.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0660 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId36')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('longPressTextWithReject'),1000);
      windowSnap.snapShot()
      await text.longClick()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0710
     * @tc.name   : modifier - parent and child components, child component responds to gestures
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0710 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId37')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await text.longClick()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0710 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0700
     * @tc.name   : modifier - parent-child components, parent component responds to gestures
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0700 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId38')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      let point = await button.getBounds()
      await driver.mouseLongClick({x:point.left,y:point.top-100},MouseButton.MOUSE_BUTTON_LEFT)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0700 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0670
     * @tc.name   : Parent and child components, the parent component responds to gestures
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0670', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0670 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId39')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      let point = await button.getBounds()
      await driver.mouseLongClick({x:point.left,y:point.top-100},MouseButton.MOUSE_BUTTON_LEFT)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0670 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0680
     * @tc.name   : Parent and child components, the child component responds to gestures
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0680', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0680 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId40')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.type('Button'),1000);
      windowSnap.snapShot()
      await button.longClick()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0680 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0530
     * @tc.name   : The component responds to the LongPressGesture gesture and the component information is obtained correctly.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0530 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId41')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('longPressButton41'),1000);
      windowSnap.snapShot()
      await button.longClick()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0590
     * @tc.name   : Modifier-The component responds to the LongPressGesture gesture and the component information is obtained correctly.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0590 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId42')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('longPressButton42'),1000);
      windowSnap.snapShot()
      await button.longClick()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0620
     * @tc.name   : Modifier-The component responds to the RotationGesture gesture and the component information is obtained correctly.
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0620 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventGestureComponentId/AceActionEventGestureComponentId43')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('rotationGestureColumn43'),1000);
      windowSnap.snapShot()
      let point = await column.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y+1});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y+1});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0620 finish.`);
      done()
    })
  })
}