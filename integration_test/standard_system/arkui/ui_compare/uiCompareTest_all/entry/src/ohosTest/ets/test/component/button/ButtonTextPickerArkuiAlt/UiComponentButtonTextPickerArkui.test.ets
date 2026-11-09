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

export default function uiComponentButtonTextPickerArkui() {

  describe('uiComponentButtonTextPickerArkui', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0760
     * @tc.name   : rating set stars to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0760', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0760 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui01')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0760 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0750
     * @tc.name   : rating set stars to 3
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0750', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0750 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui02')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0750 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0800
     * @tc.name   : set starStyle to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0800', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0800 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui03')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0800 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0790
     * @tc.name   : set starStyle to Custom images
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0790', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0790 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui04')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0790 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0770
     * @tc.name   : set stepSize to 0.5
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0770', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0770 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui05')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui05_02'),1000);
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0770 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0310
     * @tc.name   : checkboxGroup set selected to true
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0310', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0310 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui06')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0320
     * @tc.name   : checkboxGroup set selected to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0320', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0320 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui07')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0330
     * @tc.name   : checkboxGroup set selectedColor to #007DAA
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0330', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0330 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui08')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0340
     * @tc.name   : checkboxGroup set selectedColor to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0340', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0340 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui09')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0350
     * @tc.name   : checkboxGroup set unselectedColor to Color.Red
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0350', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0350 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui10')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0360
     * @tc.name   : checkboxGroup set unselectedColor to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0360', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0360 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui11')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0400
     * @tc.name   : checkboxGroup set checkboxShape to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0400', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0400 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui12')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0390
     * @tc.name   : checkboxGroup set checkboxShape to ROUNDED_SQUARE
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0390', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0390 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui13')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0370
     * @tc.name   : checkboxGroup set mark
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0370', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0370 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui14')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0380
     * @tc.name   : checkboxGroup set mark to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0380', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0380 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui15')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0190
     * @tc.name   : checkbox set selected to true
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0190 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui16')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0200
     * @tc.name   : checkbox set selected to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0200', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0200 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui17')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0210
     * @tc.name   : checkbox set selectColor to 0xed6f21
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0210', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0210 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui18')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0220
     * @tc.name   : checkbox set selectColor to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0220', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0220 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui19')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0260
     * @tc.name   : checkbox set unselectColor to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0260', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0260 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui20')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0250
     * @tc.name   : checkbox set unselectColor to 0xed6f21
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0250', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0250 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui21')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0270
     * @tc.name   : checkbox set mask
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0270', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0270 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui22')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0280
     * @tc.name   : checkbox set mask to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0280', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0280 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui23')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0300
     * @tc.name   : checkbox set contentModifier to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0300', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0300 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui24')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0240
     * @tc.name   : checkbox set checkbox shape to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0240', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0240 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui25')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0230
     * @tc.name   : checkbox set checkbox shape to ROUNDED_SQUARE
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0230 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui26')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0840
     * @tc.name   : select set value 'TTTTT'
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0840', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0840 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui27')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0840 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0850
     * @tc.name   : select set value to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0850', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0850 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui28')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0850 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0830
     * @tc.name   : select set selected to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0830', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0830 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui29')
      let driver:Driver=Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui29'),1000);
      await select.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0830 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0880
     * @tc.name   : select set fontcolor to '#188888'
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0880', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0880 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui30')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0880 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0890
     * @tc.name   : select set fontcolor to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0890', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0890 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui31')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0890 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0860
     * @tc.name   : select set font to { size: 20, weight: 500 }
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0860', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0860 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui32')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0860 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0870
     * @tc.name   : select set font to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0870', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0870 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui33')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0870 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0900
     * @tc.name   : select set selectedOptionBgColor to Color.Pink
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0900', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0900 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui34')
      let driver:Driver=Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui34'),1000);
      await select.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0900 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0910
     * @tc.name   : select set selectedOptionBgColor to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0910', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0910 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui35')
      let driver:Driver=Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui35'),1000);
      await select.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0910 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0940
     * @tc.name   : select set selectedOptionFontColor to Orange
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0940', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0940 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui36')
      let driver:Driver=Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui36'),1000);
      await select.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0940 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0950
     * @tc.name   : select set selectedOptionFontColor to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0950', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0950 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui37')
      let driver:Driver=Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui37'),1000);
      await select.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0950 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1000
     * @tc.name   : select set optionFontColor to black
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1000', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1000 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui38')
      let driver:Driver=Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui38'),1000);
      await select.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1000 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0920
     * @tc.name   : select set selectedOptionFont to { size: 26, weight: 400 }
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0920', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0920 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui39')
      let driver:Driver=Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui39'),1000);
      await select.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0920 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0930
     * @tc.name   : select set selectedOptionFont to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0930', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0930 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui40')
      let driver:Driver=Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui40'),1000);
      await select.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0930 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0960
     * @tc.name   : select set optionBgColor to #188800
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0960', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0960 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui41')
      let driver:Driver=Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui41'),1000);
      await select.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0960 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0970
     * @tc.name   : select set optionBgColor to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0970', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0970 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui42')
      let driver:Driver=Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui42'),1000);
      await select.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0970 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0980
     * @tc.name   : select set optionFont to { size: 26, weight: 400 }
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0980', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0980 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui43')
      let driver:Driver=Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui43'),1000);
      await select.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0980 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0990
     * @tc.name   : select set optionFont to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0990', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0990 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui44')
      let driver:Driver=Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui44'),1000);
      await select.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0990 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0820
     * @tc.name   : select set selected to 2
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0820', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0820 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui45')
      let driver:Driver=Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui45'),1000);
      await select.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0820 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1170
     * @tc.name   : select set ControlSize to normal
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1170', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1170 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui46')
      let driver:Driver=Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui46'),1000);
      await select.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1180
     * @tc.name   : select set ControlSize to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1180 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui47')
      let driver:Driver=Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui47'),1000);
      await select.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1190
     * @tc.name   : select set menuItemContentModifier to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1190 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui48')
      let driver:Driver=Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui48'),1000);
      await select.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0720
     * @tc.name   : radio set check to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0720', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0720 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui49')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0720 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0710
     * @tc.name   : radio set check to true
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0710', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0710 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui50')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0710 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0730
     * @tc.name   : radio set contentModifier to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0730', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0730 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui51')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0730 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0670
     * @tc.name   : timePicker set dateTimeOptions to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0670', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0670 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui52')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0670 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0490
     * @tc.name   : DatePicker set disappearTextStyle to blue
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0490', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0490 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui53')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0500
     * @tc.name   : DatePicker set disappearTextStyle to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0500', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0500 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui54')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0470
     * @tc.name   : DatePicker set lunar to true
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0470', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0470 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui55')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0480
     * @tc.name   : DatePicker set lunar to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0480', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0480 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui56')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0420
     * @tc.name   : CalendarPicker set CalendarAlign to START
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0420', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0420 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui57')
      let driver:Driver=Driver.create();
      let CalendarPicker: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui57'),1000);
      await driver.waitForIdle(500,2000)
      await CalendarPicker.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0430
     * @tc.name   : CalendarPicker set CalendarAlign to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0430', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0430 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui58')
      let driver:Driver=Driver.create();
      let CalendarPicker: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui58'),1000);
      await driver.waitForIdle(500,2000)
      await CalendarPicker.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0780
     * @tc.name   : rating set stepSize to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0780', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0780 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui59')
      let driver:Driver=Driver.create();
      let CalendarPicker: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui59'),1000);
      await driver.waitForIdle(500,2000)
      await CalendarPicker.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0780 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0450
     * @tc.name   : calendarPicker set textStyle font to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0450', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0450 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui60')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0440
     * @tc.name   : calendarPicker set textStyle font to 20
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0440', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0440 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui61')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0810
     * @tc.name   : rating set onChange to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0810', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0810 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui62')
      let driver:Driver=Driver.create();
      let Rating: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui62'),1000);
      await Rating.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0810 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0740
     * @tc.name   : radio set onChange to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0740', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0740 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui63')
      let driver:Driver=Driver.create();
      let Rating: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui63_02'),1000);
      await Rating.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0740 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0410
     * @tc.name   : checkboxGroup set onChange to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0410', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0410 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui64')
      let driver:Driver=Driver.create();
      let Rating: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui64'),1000);
      await Rating.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0290
     * @tc.name   : checkbox set onChange to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0290', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0290 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui65')
      let driver:Driver=Driver.create();
      let Rating: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui65'),1000);
      await Rating.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0700
     * @tc.name   : timePicker set onChange to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0700', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0700 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui66')
      let driver:Driver=Driver.create();
      let TimePicker: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui66'),1000);
      let point = await TimePicker.getBoundsCenter()
      await driver.mouseDrag({x:point.x, y:point.y},{x:point.x, y:point.y-100},600);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0700 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0460
     * @tc.name   : CalendarPicker set onChange to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0460', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0460 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui67')
      let driver:Driver=Driver.create();
      let CalendarPicker: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui67'),1000);
      let point = await CalendarPicker.getBoundsCenter();
      await CalendarPicker.click()
      await driver.mouseClick({x:point.x,y:point.y+400},MouseButton.MOUSE_BUTTON_LEFT)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0180
     * @tc.name   : CalendarPicker set onChange to undefined
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0180 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkui/UiComponentButtonTextPickerArkui68')
      let driver:Driver=Driver.create();
      let TextPicker: Component = await driver.waitForComponent(ON.id('UiComponentButtonTextPickerArkui68'),1000);
      let point = await TextPicker.getBoundsCenter();
      await driver.mouseDrag({x:point.x, y:point.y},{x:point.x, y:point.y-100},600);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0180 finish.`);
      done()
    })

  })
}