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

export default function textPickerWearTest() {
  describe('textPickerWearTest', () => {
    beforeAll(() => {
      console.info('textPickerWearTest beforeAll');
    });

    beforeEach(() => {
      console.info('textPickerWearTest beforeEach');
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
      console.info('textPickerWearTest afterAll');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0450
     * @tc.name   : TextPicker wearable single column focus display test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0450', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear01');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker更改选中项观察焦点显示
      let textPicker: Component = await driver.waitForComponent(ON.id('text_picker_01'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项字体，颜色等
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0450');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0440
     * @tc.name   : TextPicker wearable single column scroll up test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0440', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear02');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker向上滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      // 使用swipe方法模拟向上滑动
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.8;
      let endY = rect.top + height * 0.2;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0440');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0400
     * @tc.name   : TextPicker wearable single column fling up test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0400', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear03');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker向上抛滑
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      // 使用正确的fling方法，从中心点向上抛滑
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.fling({x: centerX, y: centerY}, {x: centerX, y: centerY - 200}, 5, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0400');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0380
     * @tc.name   : TextPicker wearable multi column click upper option test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0380', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear04');
      await driver.waitForIdle(500, 2000);
      
      // 1、多列TextPicker点击上面备选项
      let textPicker: Component = await driver.waitForComponent(ON.id('multi_text_picker'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0380');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0430
     * @tc.name   : TextPicker wearable single column fling down test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0430', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear05');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker向下抛滑
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      // 使用正确的fling方法，从中心点向下抛滑
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.fling({x: centerX, y: centerY}, {x: centerX, y: centerY + 200}, 5, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0430');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0370
     * @tc.name   : TextPicker wearable multi column scroll up test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0370', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear06');
      await driver.waitForIdle(500, 2000);
      
      // 1、多列TextPicker向上滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('multi_text_picker'), 1000);
      // 使用swipe方法模拟向上滑动
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.8;
      let endY = rect.top + height * 0.2;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0370');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0460
     * @tc.name   : TextPicker wearable single column fling up test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0460', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear07');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker向上抛滑
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      // 使用正确的fling方法，从中心点向上抛滑
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.fling({x: centerX, y: centerY}, {x: centerX, y: centerY - 200}, 5, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0460');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0390
     * @tc.name   : TextPicker wearable multi column click lower option test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0390', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear08');
      await driver.waitForIdle(500, 2000);
      
      // 1、多列TextPicker点击下面备选项
      let textPicker: Component = await driver.waitForComponent(ON.id('multi_text_picker'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0390');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0510
     * @tc.name   : TextPicker wearable multi column click lower option test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0510', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear09');
      await driver.waitForIdle(500, 2000);
      
      // 1、多列TextPicker点击下面备选项
      let textPicker: Component = await driver.waitForComponent(ON.id('multi_text_picker'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0510');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0490
     * @tc.name   : TextPicker wearable single column click lower option test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0490', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear10');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker点击下面备选项
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0490');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0520
     * @tc.name   : TextPicker wearable multi column scroll down test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0520', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear11');
      await driver.waitForIdle(500, 2000);
      
      // 1、多列TextPicker向下滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('multi_text_picker'), 1000);
      // 使用swipe方法模拟向下滑动
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0520');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0470
     * @tc.name   : TextPicker wearable single column fling down test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0470', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear12');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker向下抛滑
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      // 使用正确的fling方法，从中心点向下抛滑
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.fling({x: centerX, y: centerY}, {x: centerX, y: centerY + 200}, 5, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0470');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0550
     * @tc.name   : TextPicker wearable multi column fling down test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0550', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear13');
      await driver.waitForIdle(500, 2000);
      
      // 1、多列TextPicker向下抛滑
      let textPicker: Component = await driver.waitForComponent(ON.id('multi_text_picker'), 1000);
      // 使用正确的fling方法，从中心点向下抛滑
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.fling({x: centerX, y: centerY}, {x: centerX, y: centerY + 200}, 5, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0550');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0530
     * @tc.name   : TextPicker wearable multi column click upper option test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0530', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear14');
      await driver.waitForIdle(500, 2000);
      
      // 1、多列TextPicker点击上面备选项
      let textPicker: Component = await driver.waitForComponent(ON.id('multi_text_picker'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0530');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0540
     * @tc.name   : TextPicker wearable single column focus display test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0540', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear15');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker更改选中项观察焦点显示
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项字体，颜色等
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0540');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0570
     * @tc.name   : TextPicker wearable single column click upper option test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0570', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear16');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker点击上面备选项
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0570');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0560
     * @tc.name   : TextPicker wearable single column fling up test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0560', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear17');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker向上抛滑
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      // 使用正确的fling方法，从中心点向上抛滑
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.fling({x: centerX, y: centerY}, {x: centerX, y: centerY - 200}, 5, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0560');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0630
     * @tc.name   : TextPicker wearable single column click upper option test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0630', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear18');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker点击上面备选项
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0630');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0640
     * @tc.name   : TextPicker wearable multi column scroll down test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0640', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear19');
      await driver.waitForIdle(500, 2000);
      
      // 1、多列TextPicker向下滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('multi_text_picker'), 1000);
      // 使用swipe方法模拟向下滑动
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0640');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0580
     * @tc.name   : TextPicker wearable multi column multi finger operation test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0580', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear20');
      await driver.waitForIdle(500, 2000);
      
      // 1、多列TextPicker多指操作同时滑动多列
      let textPicker: Component = await driver.waitForComponent(ON.id('multi_text_picker'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0580');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0620
     * @tc.name   : TextPicker wearable single column drag up down test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0620', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear21');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker向上/向下拖动
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      // 使用swipe方法模拟向上拖动
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.6;
      let endY = rect.top + height * 0.4;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      // 使用swipe方法模拟向下拖动
      await driver.swipe(centerX, endY, centerX, startY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0620');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0610
     * @tc.name   : TextPicker wearable single column scroll down test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0610', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear22');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker向下滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      // 使用swipe方法模拟向下滑动
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0610');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0600
     * @tc.name   : TextPicker wearable single column fling down test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0600', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear23');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker向下抛滑
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      // 使用正确的fling方法，从中心点向下抛滑
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.fling({x: centerX, y: centerY}, {x: centerX, y: centerY + 200}, 5, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0600');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0660
     * @tc.name   : TextPicker wearable single column drag up down test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0660', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear24');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker向上/向下拖动
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      // 使用swipe方法模拟向上拖动
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.6;
      let endY = rect.top + height * 0.4;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      // 使用swipe方法模拟向下拖动
      await driver.swipe(centerX, endY, centerX, startY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0660');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0650
     * @tc.name   : TextPicker wearable multi column fling up test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0650', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear25');
      await driver.waitForIdle(500, 2000);
      
      // 1、多列TextPicker向上抛滑
      let textPicker: Component = await driver.waitForComponent(ON.id('multi_text_picker'), 1000);
      // 使用正确的fling方法，从中心点向上抛滑
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.fling({x: centerX, y: centerY}, {x: centerX, y: centerY - 200}, 5, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0650');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0680
     * @tc.name   : TextPicker wearable multi column fling up test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0680', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear26');
      await driver.waitForIdle(500, 2000);
      
      // 1、多列TextPicker向上抛滑
      let textPicker: Component = await driver.waitForComponent(ON.id('multi_text_picker'), 1000);
      // 使用正确的fling方法，从中心点向上抛滑
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.fling({x: centerX, y: centerY}, {x: centerX, y: centerY - 200}, 5, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0680');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0670
     * @tc.name   : TextPicker wearable single column click lower option test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0670', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear27');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker点击下面备选项
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0670');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0720
     * @tc.name   : TextPicker wearable single column focus display test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0720', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear28');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker更改选中项观察焦点显示
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      await textPicker.click();
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项字体，颜色等
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0720');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0700
     * @tc.name   : TextPicker wearable single column scroll up test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0700', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear29');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker向上滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      // 使用swipe方法模拟向上滑动
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.8;
      let endY = rect.top + height * 0.2;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0700');
      await Utils.sleep(1000);
      
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0710
     * @tc.name   : TextPicker wearable single column scroll down test
     * @tc.desc   : Verify popupbox Picker wear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0710', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker_wear/textPickerWear30');
      await driver.waitForIdle(500, 2000);
      
      // 1、单列TextPicker向下滑动
      let textPicker: Component = await driver.waitForComponent(ON.id('single_text_picker'), 1000);
      // 使用swipe方法模拟向下滑动
      let rect = await textPicker.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.2;
      let endY = rect.top + height * 0.8;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(500, 2000);
      
      // 2、观察选中项变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_WEAR_0710');
      await Utils.sleep(1000);
      
      done();
    });
  });
}