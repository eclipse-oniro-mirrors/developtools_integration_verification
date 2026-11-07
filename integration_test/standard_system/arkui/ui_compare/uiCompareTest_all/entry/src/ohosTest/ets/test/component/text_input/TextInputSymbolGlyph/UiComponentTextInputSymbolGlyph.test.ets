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

export default function uiComponentTextInputSymbolGlyph() {

  describe('uiComponentTextInputSymbolGlyph', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0050
     * @tc.name   : TextInput component, set cancelButton{CancelButtonStyle.CONSTANT,SymbolGlyphModifier}, and dynamically switch fontsize
     * @tc.desc   : Verify textinput symbolglyph interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0050 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputSymbolGlyph/UiComponentTextInputSymbolGlyph01')
      let driver:Driver=Driver.create();
      let textinput: Component = await driver.waitForComponent(ON.id('UiComponentTextInputSymbolGlyph01_01'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputSymbolGlyph01_02'),1000);
      let point = await textinput.getBounds()
      await driver.mouseClick({x:point.right-10,y:point.top-(point.top-point.bottom)/2},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await textinput.inputText('11')
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click();
      await textinput.inputText('11')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0040
     * @tc.name   : TextInput component, set cancelButton{CancelButtonStyle.CONSTANT,SymbolGlyphModifier}, and dynamically switch fontColor
     * @tc.desc   : Verify textinput symbolglyph interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0040 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputSymbolGlyph/UiComponentTextInputSymbolGlyph02')
      let driver:Driver=Driver.create();
      let textinput: Component = await driver.waitForComponent(ON.id('UiComponentTextInputSymbolGlyph02_01'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputSymbolGlyph02_02'),1000);
      let point = await textinput.getBounds()
      await driver.mouseClick({x:point.right-10,y:point.top-(point.top-point.bottom)/2},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await textinput.inputText('11')
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click();
      await textinput.inputText('11')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0060
     * @tc.name   : TextInput component, set cancelButton{CancelButtonStyle.CONSTANT,SymbolGlyphModifier}, and dynamically switch fontweight
     * @tc.desc   : Verify textinput symbolglyph interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0060 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputSymbolGlyph/UiComponentTextInputSymbolGlyph03')
      let driver:Driver=Driver.create();
      let textinput: Component = await driver.waitForComponent(ON.id('UiComponentTextInputSymbolGlyph03_01'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputSymbolGlyph03_02'),1000);
      let point = await textinput.getBounds()
      await driver.mouseClick({x:point.right-10,y:point.top-(point.top-point.bottom)/2},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await textinput.inputText('11')
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click();
      await textinput.inputText('11')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0150
     * @tc.name   : TextInput component, set cancelButton{CancelButtonStyle.CONSTANT,SymbolGlyphModifier}, and enter extra-long text
     * @tc.desc   : Verify textinput symbolglyph interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0150 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputSymbolGlyph/UiComponentTextInputSymbolGlyph04')
      let driver:Driver=Driver.create();
      let textinput: Component = await driver.waitForComponent(ON.id('UiComponentTextInputSymbolGlyph04_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await textinput.inputText('111111111111111111111111111111111')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0110
     * @tc.name   : TextInput component, set the input box type to password/NEW_PASSWORD/NUMBER_PASSWORD, and change the system font size
     * @tc.desc   : Verify textinput symbolglyph interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0110 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputSymbolGlyph/UiComponentTextInputSymbolGlyph05')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextInputSymbolGlyph05_02'),1000);
      for(let i=0;i<4;++i) {
        await button.click();
        windowSnap.snapShot();
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0120
     * @tc.name   : TextInput component, set the input box type to password/NEW_PASSWORD/NUMBER_PASSWORD, and change the system font size to fp
     * @tc.desc   : Verify textinput symbolglyph interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0120 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputSymbolGlyph/UiComponentTextInputSymbolGlyph06')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextInputSymbolGlyph06_02'),1000);
      for(let i=0;i<4;++i) {
        await button.click();
        windowSnap.snapShot();
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0220
     * @tc.name   : System dark and light color test
     * @tc.desc   : Verify textinput symbolglyph interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0220', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0220 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputSymbolGlyph/UiComponentTextInputSymbolGlyph07')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextInputSymbolGlyph07_02'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextInputSymbolGlyph07_03'),1000);
      await button.click();
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000)
      await button02.click();
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_SYMBOLGLYPH_0220 finish.`);
      done()
    })

  })
}