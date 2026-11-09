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
import { BusinessError } from '@kit.BasicServicesKit'
import { KeyCode } from '@kit.InputKit'

export default function textPickerOnScrollStopTest() {
  describe('textPickerOnScrollStopTest', () => {
    beforeAll(() => {
      console.info('textPickerOnScrollStopTest beforeAll');
    });

    beforeEach(() => {
      console.info('textPickerOnScrollStopTest beforeEach');
    });

    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err:BusinessError) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done()
    })

    afterAll(() => {
      console.info('textPickerOnScrollStopTest afterAll');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1110
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode keyboard up
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1110', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop01');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘上键
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_01'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_UP);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1110');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1150
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode keyboard up
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1150', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop02');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘上键
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_02'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_UP);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1150');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1130
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode keyboard down
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1130', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop03');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘下键
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_03'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_DOWN);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1130');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1030
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode keyboard down
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1030', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop04');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘下键
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_04'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_DOWN);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1030');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1080
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode keyboard up
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1080', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop05');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘上键
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_05'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_UP);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1080');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0190
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode keyboard up
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0190', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop06');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘上键
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_06'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_UP);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0190');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1260
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode keyboard down
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1260', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop07');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘下键
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_07'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_DOWN);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1260');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0010
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode keyboard down
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0010', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop08');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘下键
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_08'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_DOWN);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0010');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1220
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode mouse click
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1220', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop09');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker鼠标点击
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_09'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1220');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1310
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode mouse click
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1310', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop10');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker鼠标点击
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_10'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1310');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1140
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode mouse click
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1140', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop11');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker鼠标点击
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_11'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1140');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0990
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode mouse click
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0990', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop12');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker鼠标点击
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_12'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0990');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0170
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode swipe up
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0170', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop13');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker向上滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_13'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.8;
      let endY = rect.top + height * 0.2;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0170');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0330
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode swipe up
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0330', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop14');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker向上滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_14'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.8;
      let endY = rect.top + height * 0.2;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0330');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1250
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode swipe down
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1250', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop15');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker向下滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_15'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1250');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1000
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode swipe down
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1000', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop16');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker向下滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_16'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1000');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1390
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode swipe up
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1390', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop17');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker向上滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_17'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.8;
      let endY = rect.top + height * 0.2;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1390');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1270
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode swipe up
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1270', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop18');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker向上滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_18'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.8;
      let endY = rect.top + height * 0.2;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1270');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1290
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode swipe down
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1290', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop19');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker向下滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_19'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1290');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1450
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode swipe down
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1450', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop20');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker向下滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_20'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1450');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1420
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode fling up
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1420', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop21');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 注释已修复（原编码损坏）
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_21'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.fling({x: centerX, y: centerY}, {x: centerX, y: centerY - 200}, 5, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1420');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1280
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode fling up
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1280', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop22');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 注释已修复（原编码损坏）
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_22'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.fling({x: centerX, y: centerY}, {x: centerX, y: centerY - 200}, 5, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1280');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1410
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode fling down
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1410', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop23');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 注释已修复（原编码损坏）
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_23'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.fling({x: centerX, y: centerY}, {x: centerX, y: centerY + 200}, 5, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1410');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1430
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode fling down
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1430', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop24');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 注释已修复（原编码损坏）
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_24'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.fling({x: centerX, y: centerY}, {x: centerX, y: centerY + 200}, 5, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1430');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0500
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode fling up
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0500', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop25');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 注释已修复（原编码损坏）
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_25'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.fling({x: centerX, y: centerY}, {x: centerX, y: centerY - 200}, 5, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0500');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0050
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode fling up
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0050', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop26');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 注释已修复（原编码损坏）
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_26'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.fling({x: centerX, y: centerY}, {x: centerX, y: centerY - 200}, 5, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0050');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0100
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode fling down
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0100', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop27');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 注释已修复（原编码损坏）
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_27'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.fling({x: centerX, y: centerY}, {x: centerX, y: centerY + 200}, 5, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0100');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0020
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode fling down
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0020', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop28');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 注释已修复（原编码损坏）
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_28'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.fling({x: centerX, y: centerY}, {x: centerX, y: centerY + 200}, 5, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0020');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0150
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode drag up
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0150', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop29');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker拖拽
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_29'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.8;
      let endY = rect.top + height * 0.6;
      await driver.swipe(centerX, startY, centerX, endY, 500);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0150');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0240
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode drag up
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0240', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop30');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker拖拽
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_30'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.8;
      let endY = rect.top + height * 0.6;
      await driver.swipe(centerX, startY, centerX, endY, 500);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0240');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0420
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode drag down
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0420', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop31');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker拖拽
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_31'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.6;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 500);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0420');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0030
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode drag down
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0030', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop32');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker拖拽
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_32'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.6;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 500);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0030');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0380
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode drag up
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0380', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop33');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker拖拽
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_33'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.8;
      let endY = rect.top + height * 0.6;
      await driver.swipe(centerX, startY, centerX, endY, 500);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0380');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0130
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode drag up
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0130', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop34');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker拖拽
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_34'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.8;
      let endY = rect.top + height * 0.6;
      await driver.swipe(centerX, startY, centerX, endY, 500);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0130');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0290
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode drag down
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0290', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop35');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker拖拽
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_35'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.6;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 500);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0290');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0160
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode drag down
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0160', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop36');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker拖拽
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_36'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.6;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 500);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0160');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0430
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode scroll rebound
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0430', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop37');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2銆佸崟列TextPicker滑动鍒拌竟鐣屽洖寮?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_37'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0430');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0140
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode scroll rebound
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0140', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop38');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2銆佸崟列TextPicker滑动鍒拌竟鐣屽洖寮?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_38'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0140');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0280
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode scroll rebound
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0280', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop39');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2銆佸列TextPicker滑动鍒拌竟鐣屽洖寮?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_39'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0280');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0410
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode scroll rebound
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0410', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop40');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2銆佸列TextPicker滑动鍒拌竟鐣屽洖寮?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_40'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0410');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0300
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode follow-hand swipe
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0300', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop41');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker跟手滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_41'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.5;
      let endY = rect.top + height * 0.3;
      await driver.swipe(centerX, startY, centerX, endY, 800);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0300');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0270
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode follow-hand swipe
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0270', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop42');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker跟手滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_42'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.5;
      let endY = rect.top + height * 0.3;
      await driver.swipe(centerX, startY, centerX, endY, 800);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0270');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0510
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode follow-hand swipe
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0510', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop43');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker跟手滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_43'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.5;
      let endY = rect.top + height * 0.3;
      await driver.swipe(centerX, startY, centerX, endY, 800);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0510');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0310
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode follow-hand swipe
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0310', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop44');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker跟手滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_44'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.5;
      let endY = rect.top + height * 0.3;
      await driver.swipe(centerX, startY, centerX, endY, 800);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0310');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0440
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode double finger swipe
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0440', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop45');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker双指滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_45'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0440');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0870
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode double finger swipe
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0870', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop46');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker双指滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_46'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0870');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0470
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode double finger swipe
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0470', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop47');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker双指滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_47'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0470');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0680
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode double finger swipe
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0680', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop48');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker双指滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_48'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0680');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0450
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode keyboard left
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0450', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop49');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘左键
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_49'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0450');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0590
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode keyboard left
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0590', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop50');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘左键
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_50'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0590');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0730
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode keyboard right
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0730', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop51');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘右键
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_51'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0730');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0650
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode keyboard right
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0650', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop52');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘右键
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_52'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0650');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0630
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode keyboard left
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0630', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop53');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘左键
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_53'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0630');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0900
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode keyboard left
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0900', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop54');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘左键
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_54'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0900');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0620
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode keyboard right
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0620', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop55');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘右键
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_55'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0620');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0520
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode keyboard right
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0520', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop56');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘右键
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_56'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0520');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0640
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode double finger swipe
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0640', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop57');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker双指滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_57'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0640');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0770
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode double finger swipe
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0770', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop58');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker双指滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_58'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0770');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0540
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode double finger swipe
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0540', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop59');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker双指滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_59'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0540');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0820
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode double finger swipe
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0820', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop60');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker双指滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_60'), 1000);
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0820');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0660
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode keyboard enter
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0660', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop61');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘回车键?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_61'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_ENTER);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0660');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0760
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode keyboard enter
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0760', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop62');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘回车键?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_62'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_ENTER);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0760');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0930
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode keyboard enter
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0930', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop63');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘回车键?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_63'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_ENTER);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0930');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0780
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode keyboard enter
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0780', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop64');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘回车键?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_64'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_ENTER);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0780');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0960
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode keyboard tab
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0960', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop65');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘Tab键?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_65'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0960');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0910
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode keyboard tab
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0910', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop66');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘Tab键?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_66'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0910');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0920
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode keyboard tab
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0920', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop67');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘Tab键?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_67'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0920');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0940
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode keyboard tab
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0940', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop68');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘Tab键?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_68'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0940');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0800
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode keyboard escape
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0800', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop69');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘Escape键?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_69'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_ESCAPE);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0800');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1170
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode keyboard escape
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1170', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop70');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘Escape键?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_70'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_ESCAPE);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1170');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1010
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode keyboard escape
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1010', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop71');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘Escape键?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_71'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_ESCAPE);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1010');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0790
     * @tc.name   : TextPicker onScrollStop event test - multi column loop mode keyboard escape
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0790', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop72');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘Escape键?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_72'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_ESCAPE);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0790');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1360
     * @tc.name   : TextPicker onScrollStop event test - single column non-loop mode keyboard space
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1360', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop73');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘空格键?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_73'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1360');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1400
     * @tc.name   : TextPicker onScrollStop event test - single column loop mode keyboard space
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1400', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop74');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘空格键?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_74'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1400');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1120
     * @tc.name   : TextPicker onScrollStop event test - multi column non-loop mode keyboard space
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1120', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_onscrollstop/textPickerOnScrollStop75');
      await driver.waitForIdle(500, 2000);
      
      // 1、设置循环滑动状态
      // 2、单列TextPicker键盘空格键?
      let textPicker: Component = await driver.waitForComponent(ON.id('onscrollstop_picker_75'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await driver.waitForIdle(500, 2000);
      
      // 3、观察onScrollStop事件触发（通过日志验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1120');
      await Utils.sleep(1000);
      
      done();
    });
  });
}
















