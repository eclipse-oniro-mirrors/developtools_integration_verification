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
import { Driver, ON, Component, MouseButton } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit'
import { i18n } from '@kit.LocalizationKit'

export default function textInputTest() {

  describe('textInputTest', () => {
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

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_SHOWUNDERLINE_0010
     * @tc.name   : TextInput component: Set underline for input box, enable showError, and activate character counter
     * @tc.desc   : Verify textinput showunderline interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_SHOWUNDERLINE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_SHOWUNDERLINE_0010 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textInput01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTINPUT_SHOWUNDERLINE_0010')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_SHOWUNDERLINE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INPUT_KEYBOARDAVOIDMODE_0180
     * @tc.name   : Test input method avoidance combined with safe area
     * @tc.desc   : Verify input keyboardavoidmode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_INPUT_KEYBOARDAVOIDMODE_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_KEYBOARDAVOIDMODE_0180 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textInput02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_KEYBOARDAVOIDMODE_0180')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_KEYBOARDAVOIDMODE_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TYPE_URL_0010
     * @tc.name   : TextInput/TextArea/Search: Set URL type for input fields
     * @tc.desc   : Verify type url interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TYPE_URL_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TYPE_URL_0010 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textInput03')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('inputUrl03'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TYPE_URL_0010')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TYPE_URL_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TYPE_URL_0130
     * @tc.name   : TextInput/TextArea/Search: Pop-up URL input method in windows
     * @tc.desc   : Verify type url interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TYPE_URL_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TYPE_URL_0130 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textInput03')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('textInput03TextInput'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TYPE_URL_0130')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TYPE_URL_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SELECTIONMENU_PC_0140
     * @tc.name   : Selection component: Small window display effect
     * @tc.desc   : Verify selectionmenu pc interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SELECTIONMENU_PC_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SELECTIONMENU_PC_0140 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/richEditor01')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('richEditor01'), 1000);
      await button.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SELECTIONMENU_PC_0140')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SELECTIONMENU_PC_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SELECTIONMENU_PC_0120
     * @tc.name   : Selection component: Display effects under different languages
     * @tc.desc   : Verify selectionmenu pc interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SELECTIONMENU_PC_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SELECTIONMENU_PC_0120 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/richEditor01')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('richEditor01'), 1000);
      await button.doubleClick();
      try {
        i18n.System.setSystemLanguage('ja-jpan'); // 设置系统当前语言为 "zh"
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setSystemLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SELECTIONMENU_PC_0120')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SELECTIONMENU_PC_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SELECTIONMENU_PC_0100
     * @tc.name   : Selection component: Adaptation for aging-friendly mode
     * @tc.desc   : Verify selectionmenu pc interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SELECTIONMENU_PC_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SELECTIONMENU_PC_0100 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/richEditor01')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('richEditor01'), 1000);
      await button.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SELECTIONMENU_PC_0100')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SELECTIONMENU_PC_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0100
     * @tc.name   : TextArea component: Modify line spacing of text
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0100 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textArea01')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('TextArea01_01'), 1000);
      let point = await button1.getBoundsCenter();
      await driver.doubleClick(point.x,point.y);

      let button2: Component = await driver.waitForComponent(ON.id('TextArea01_02'), 1000);
      await button2.click();

      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0100')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0060
     * @tc.name   : TextArea component: Set background color for selected text
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0060 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textArea02')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('TextArea02_01'), 1000);
      let point = await button1.getBoundsCenter();
      await driver.doubleClick(point.x,point.y);

      let button2: Component = await driver.waitForComponent(ON.id('TextArea02_02'), 1000);
      await button2.click();

      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0060')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0020
     * @tc.name   : TextArea/TextInput component: Inline mode input field, multi-line text and blank line selection
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0020 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textArea03')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('TextArea03_01'), 1000);
      let point1 = await button1.getBoundsCenter();
      await driver.doubleClick(point1.x,point1.y);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0020_01')
      await Utils.sleep(1000)

      let button2: Component = await driver.waitForComponent(ON.id('TextArea03_02'), 1000);
      await button2.click();
      let point2 = await button1.getBoundsCenter();
      await driver.doubleClick(point2.x,point2.y);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0020_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0040
     * @tc.name   : TextArea component: Set text alignment method
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0040 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textArea04')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('TextArea04_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id('TextArea04_02'), 1000);
      let button3: Component = await driver.waitForComponent(ON.id('TextArea04_03'), 1000);
      let button4: Component = await driver.waitForComponent(ON.id('TextArea04_04'), 1000);
      let textArea: Component = await driver.waitForComponent(ON.id('TextArea04'), 1000);
      let point = await textArea.getBoundsCenter();

      await button1.click()
      await driver.waitForIdle(500,2000);
      await driver.doubleClick(point.x,point.y);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0040_01')
      await Utils.sleep(1000)

      await button2.click()
      await driver.waitForIdle(500,2000);
      await driver.doubleClick(point.x,point.y);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0040_02')
      await Utils.sleep(1000)

      await button3.click()
      await driver.waitForIdle(500,2000);
      await driver.doubleClick(point.x,point.y);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0040_03')
      await Utils.sleep(1000)

      await button4.click()
      await driver.waitForIdle(500,2000);
      await driver.doubleClick(point.x,point.y);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0040_04')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0030
     * @tc.name   : TextArea component: Set indentation for blank lines
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0030 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textArea05')
      let driver:Driver = Driver.create();
      // set textIndent
      let button1: Component = await driver.waitForComponent(ON.id('TextArea05_01'), 1000);
      await button1.click()
      await driver.waitForIdle(500,2000);

      // 选中组件 右键点击
      let textArea: Component = await driver.waitForComponent(ON.id('TextArea05'), 1000);
      let point = await textArea.getBoundsCenter();
      await driver.click(point.x,point.y);
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);

      // 全选
      let button2: Component = await driver.waitForComponent(ON.text('全选'), 1000);
      await button2.click()
      await driver.waitForIdle(500,2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0030')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0090
     * @tc.name   : TextArea component: Modify text line height
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0090 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textArea06')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('TextArea06_01'), 1000);
      let point = await button1.getBoundsCenter();
      await driver.doubleClick(point.x,point.y);

      let button2: Component = await driver.waitForComponent(ON.id('TextArea06_02'), 1000);
      await button2.click();

      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0090')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0080
     * @tc.name   : TextArea component: Change font size
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0080 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textArea07')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('TextArea07_01'), 1000);
      let point = await button1.getBoundsCenter();
      await driver.doubleClick(point.x,point.y);

      let button2: Component = await driver.waitForComponent(ON.id('TextArea07_02'), 1000);
      await button2.click();

      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0080')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0010
     * @tc.name   : TextArea component: Normal mode input field, multi-line text and blank line selection
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0010 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textArea08')
      let driver:Driver = Driver.create();
      // 选中组件 右键点击
      let textArea: Component = await driver.waitForComponent(ON.id('TextArea08'), 1000);
      let point = await textArea.getBoundsCenter();
      await driver.click(point.x,point.y);
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);

      // 全选
      let button2: Component = await driver.waitForComponent(ON.text('全选'), 1000);
      await button2.click()
      await driver.waitForIdle(500,2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0010')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0050
     * @tc.name   : TextArea component: Set URL type for input field
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0050 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textArea09')
      let driver:Driver = Driver.create();

      try {
        // set textIndent
        let button1: Component = await driver.waitForComponent(ON.id('TextArea09_01'), 1000);
        await button1.click()
        await driver.waitForIdle(500,2000);
        Logger.info('TEST','set textIndent success');
      } catch (err) {
        Logger.info('TEST','set textIndent err,err is :', err);
      }

      // 选中组件 右键点击
      let textArea: Component = await driver.waitForComponent(ON.id('TextArea09'), 1000);
      let point = await textArea.getBoundsCenter();
      await driver.click(point.x,point.y);
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);

      // 全选
      let button2: Component = await driver.waitForComponent(ON.text('全选'), 1000);
      await button2.click()
      await driver.waitForIdle(500,2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0050')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0070
     * @tc.name   : TextArea component: Use setTextSelection to select text
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0070 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textArea10')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('TextArea10_01'), 1000);
      await button.click()
      await driver.waitForIdle(500,2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0070')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0110
     * @tc.name   : TextInput inline mode: Modify text line height
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0110 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textArea11')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('TextArea11_01'), 1000);
      let point = await button1.getBoundsCenter();
      await driver.doubleClick(point.x,point.y);

      let button2: Component = await driver.waitForComponent(ON.id('TextArea11_02'), 1000);
      await button2.click();

      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0110')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0120
     * @tc.name   : TextInput inline mode: Change font size
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0120 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textInput04')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('TextInput04_01'), 1000);
      let point = await button1.getBoundsCenter();
      await driver.doubleClick(point.x,point.y);

      let button2: Component = await driver.waitForComponent(ON.id('TextInput04_02'), 1000);
      await button2.click();

      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0120')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0140
     * @tc.name   : TextInput inline mode: Modify background color for selected text
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0140 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textInput05')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('TextInput05_01'), 1000);
      let point = await button1.getBoundsCenter();
      await driver.doubleClick(point.x,point.y);

      let button2: Component = await driver.waitForComponent(ON.id('TextInput05_02'), 1000);
      await button2.click();

      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0140')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0130
     * @tc.name   : TextInput inline mode: Change text alignment method
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0130 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textInput06')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('TextInput06_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id('TextInput06_02'), 1000);
      let button3: Component = await driver.waitForComponent(ON.id('TextInput06_03'), 1000);
      let button4: Component = await driver.waitForComponent(ON.id('TextInput06_04'), 1000);
      let textArea: Component = await driver.waitForComponent(ON.id('TextInput06'), 1000);
      let point = await textArea.getBoundsCenter();

      await button1.click()
      await driver.waitForIdle(500,2000);
      await driver.doubleClick(point.x,point.y);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0130_01')
      await Utils.sleep(1000)

      await button2.click()
      await driver.waitForIdle(500,2000);
      await driver.doubleClick(point.x,point.y);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0130_02')
      await Utils.sleep(1000)

      await button3.click()
      await driver.waitForIdle(500,2000);
      await driver.doubleClick(point.x,point.y);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0130_03')
      await Utils.sleep(1000)

      await button4.click()
      await driver.waitForIdle(500,2000);
      await driver.doubleClick(point.x,point.y);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0130_04')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0150
     * @tc.name   : TextInput inline mode: Use setTextSelection to select blank lines
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0150 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/textInput07')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('TextInput07_01'), 1000);
      await button.click()
      await driver.waitForIdle(500,2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0150')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0190
     * @tc.name   : Text component: Set text and change alignment.
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0190 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/text01')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('Text01_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id('Text01_02'), 1000);
      let button3: Component = await driver.waitForComponent(ON.id('Text01_03'), 1000);
      let button4: Component = await driver.waitForComponent(ON.id('Text01_04'), 1000);
      let text: Component = await driver.waitForComponent(ON.id('Text01'), 1000);
      let point = await text.getBoundsCenter();

      await button1.click()
      await driver.waitForIdle(500,2000);
      await driver.doubleClick(point.x,point.y);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0190_01')
      await Utils.sleep(1000)

      await button2.click()
      await driver.waitForIdle(500,2000);
      await driver.doubleClick(point.x,point.y);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0190_02')
      await Utils.sleep(1000)

      await button3.click()
      await driver.waitForIdle(500,2000);
      await driver.doubleClick(point.x,point.y);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0190_03')
      await Utils.sleep(1000)

      await button4.click()
      await driver.waitForIdle(500,2000);
      await driver.doubleClick(point.x,point.y);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0190_04')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0230
     * @tc.name   : Text component: Set child components
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0230 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/text02')
      let driver:Driver = Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('Text02SpanBlank'), 1000);
      let point = await text.getBoundsCenter();
      await driver.doubleClick(point.x,point.y);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0230')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0170
     * @tc.name   : Text component: Set the leadingMargin attribute for text strings
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0170 start.`);
      Settings.createWindow('testability/pages/component/text_input/textInput/text03')
      let driver:Driver = Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('Text03'), 1000);
      let point = await text.getBoundsCenter();
      await driver.doubleClick(point.x,point.y);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0170')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0170 finish.`);
      done()
    })
  })
}