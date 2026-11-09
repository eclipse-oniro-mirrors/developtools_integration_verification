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
import { KeyCode } from '@kit.InputKit';
import { BusinessError } from '@kit.BasicServicesKit'

export default function keyboardEventTest() {
  describe('keyboardEventTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err: BusinessError) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_KEYBOARD_Event_0014
     * @tc.name   : QRCode组件键盘Tab和上下键测试
     * @tc.desc   : Verify media keyboard event interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_KEYBOARD_Event_0014', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_KEYBOARD_Event_0014 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/keyboardEvent/qrcodeKeyboard01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 按Tab键切换到第一个QRCode
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      // 按上下键测试焦点切换
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_DOWN);
      await driver.waitForIdle(500, 2000);
      
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_UP);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_KEYBOARD_Event_0014')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_KEYBOARD_Event_0014 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_KEYBOARD_Event_0015
     * @tc.name   : PatternLock组件键盘Tab和方向键测试
     * @tc.desc   : Verify media keyboard event interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_KEYBOARD_Event_0015', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_KEYBOARD_Event_0015 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/keyboardEvent/patternLockKeyboard01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 按Tab键切换到PatternLock
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      // 按上下左右键测试焦点切换
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_DOWN);
      await driver.waitForIdle(500, 2000);
      
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_UP);
      await driver.waitForIdle(500, 2000);
      
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await driver.waitForIdle(500, 2000);
      
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_KEYBOARD_Event_0015')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_KEYBOARD_Event_0015 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0010
     * @tc.name   : Badge组件包含TextInput焦点测试-点击方式
     * @tc.desc   : Verify media node message interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0010 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/keyboardEvent/badgeTextInput01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击内部TextInput
      let innerInput: Component = await driver.waitForComponent(ON.id('inner_textInput'), 1000);
      await innerInput.click();
      await driver.waitForIdle(500, 2000);
      
      // 点击外部TextInput
      let outerInput: Component = await driver.waitForComponent(ON.id('outer_textInput'), 1000);
      await outerInput.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0010')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0011
     * @tc.name   : Badge组件包含TextInput焦点测试-Tab键方式
     * @tc.desc   : Verify media node message interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0011', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0011 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/keyboardEvent/badgeTextInput02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 按Tab键切换到外部TextInput
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      // 再按Tab键切换到内部TextInput
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0011')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0011 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0012
     * @tc.name   : Badge组件包含Image焦点测试-点击方式
     * @tc.desc   : Verify media node message interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0012', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0012 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/keyboardEvent/badgeImage01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击外部Image
      let outerImage: Component = await driver.waitForComponent(ON.id('outer_image'), 1000);
      await outerImage.click();
      await driver.waitForIdle(500, 2000);
      
      // 点击内部Image
      let innerImage: Component = await driver.waitForComponent(ON.id('inner_image'), 1000);
      await innerImage.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0012')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0012 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0013
     * @tc.name   : Badge组件包含Image焦点测试-Tab键方式
     * @tc.desc   : Verify media node message interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0013', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0013 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/keyboardEvent/badgeImage02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 按Tab键切换到外部Image
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      // 再按Tab键切换到内部Image
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0013')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0013 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0014
     * @tc.name   : Counter组件包含TextInput焦点测试-点击方式
     * @tc.desc   : Verify media node message interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0014', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0014 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/keyboardEvent/counterTextInput01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击外部TextInput
      let outerInput: Component = await driver.waitForComponent(ON.id('outer_textInput'), 1000);
      await outerInput.click();
      await driver.waitForIdle(500, 2000);
      
      // 点击内部TextInput
      let innerInput: Component = await driver.waitForComponent(ON.id('inner_textInput'), 1000);
      await innerInput.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0014')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0014 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0015
     * @tc.name   : Counter组件包含TextInput焦点测试-Tab键方式
     * @tc.desc   : Verify media node message interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0015', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0015 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/keyboardEvent/counterTextInput02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 按Tab键切换到外部TextInput
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      // 再按Tab键切换到内部TextInput
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0015')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0015 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0016
     * @tc.name   : Counter组件包含Image焦点测试-点击方式
     * @tc.desc   : Verify media node message interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0016', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0016 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/keyboardEvent/counterImage01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击外部Image
      let outerImage: Component = await driver.waitForComponent(ON.id('outer_image'), 1000);
      await outerImage.click();
      await driver.waitForIdle(500, 2000);
      
      // 点击内部Image
      let innerImage: Component = await driver.waitForComponent(ON.id('inner_image'), 1000);
      await innerImage.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0016')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0016 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0017
     * @tc.name   : Counter组件包含Image焦点测试-Tab键方式
     * @tc.desc   : Verify media node message interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0017', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0017 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/keyboardEvent/counterImage02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 按Tab键切换到外部Image
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      // 再按Tab键切换到内部Image
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0017')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0017 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0018
     * @tc.name   : Counter组件包含多个子组件焦点测试
     * @tc.desc   : Verify media node message interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0018', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0018 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/keyboardEvent/counterMultiple01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击外部TextInput
      let outerInput: Component = await driver.waitForComponent(ON.id('outer_textInput'), 1000);
      await outerInput.click();
      await driver.waitForIdle(500, 2000);
      
      // 点击外部Image
      let outerImage: Component = await driver.waitForComponent(ON.id('outer_image'), 1000);
      await outerImage.click();
      await driver.waitForIdle(500, 2000);
      
      // 点击内部TextInput
      let innerInput: Component = await driver.waitForComponent(ON.id('inner_textInput'), 1000);
      await innerInput.click();
      await driver.waitForIdle(500, 2000);
      
      // 点击内部Image
      let innerImage: Component = await driver.waitForComponent(ON.id('inner_image'), 1000);
      await innerImage.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0018')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0018 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0019
     * @tc.name   : Gauge组件包含TextInput焦点测试-点击方式
     * @tc.desc   : Verify media node message interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0019', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0019 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/keyboardEvent/gaugeTextInput01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击外部TextInput
      let outerInput: Component = await driver.waitForComponent(ON.id('outer_textInput'), 1000);
      await outerInput.click();
      await driver.waitForIdle(500, 2000);
      
      // 点击内部TextInput
      let innerInput: Component = await driver.waitForComponent(ON.id('inner_textInput'), 1000);
      await innerInput.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0019')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0019 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0020
     * @tc.name   : Gauge组件包含TextInput焦点测试-Tab键方式
     * @tc.desc   : Verify media node message interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0020 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/keyboardEvent/gaugeTextInput02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 按Tab键切换到外部TextInput
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      // 再按Tab键切换到内部TextInput
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0020')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0021
     * @tc.name   : Gauge组件包含Image焦点测试-点击方式
     * @tc.desc   : Verify media node message interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0021', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0021 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/keyboardEvent/gaugeImage01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击外部Image
      let outerImage: Component = await driver.waitForComponent(ON.id('outer_image'), 1000);
      await outerImage.click();
      await driver.waitForIdle(500, 2000);
      
      // 点击内部Image
      let innerImage: Component = await driver.waitForComponent(ON.id('inner_image'), 1000);
      await innerImage.click();
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0021')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0021 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0022
     * @tc.name   : Gauge组件包含Image焦点测试-Tab键方式
     * @tc.desc   : Verify media node message interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0022', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0022 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/keyboardEvent/gaugeImage02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 按Tab键切换到外部Image
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      // 再按Tab键切换到内部Image
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0022')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_NODE_MESSAGE_0022 finish.`);
      done()
    })
  })
}