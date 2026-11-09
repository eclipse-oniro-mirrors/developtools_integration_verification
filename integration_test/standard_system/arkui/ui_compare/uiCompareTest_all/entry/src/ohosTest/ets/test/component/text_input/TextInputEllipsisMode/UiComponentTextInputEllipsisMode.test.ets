/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default function uiComponentTextInputEllipsisMode() {

  describe('uiComponentTextInputEllipsisMode', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0230
     * @tc.name   : text component, set halfLeading to true
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0230 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode01_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode01_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode01_03'),1000);
      windowSnap.snapShot()
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        await button03.click();
        windowSnap.snapShot();
        await driver.waitForIdle(500,2000);
        await button02.click();
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0080
     * @tc.name   : The inline mode of the TextArea component is set to TextOverflow.Ellipsis, and the maxlines setting is greater than 1, and the edit mode is dynamically switched to ellipsisMode
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0080 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode02_02'),1000);
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode02_01'),1000);
      await textarea.click();
      windowSnap.snapShot()
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0100
     * @tc.name   : The inline mode of the TextInput component is set to TextOverflow.MARQUEE, and the maxlines setting is greater than 1, and the edit mode is dynamically switched to ellipsisMode
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0100 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode03_02'),1000);
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode03_01'),1000);
      await textarea.click();
      windowSnap.snapShot()
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0040
     * @tc.name   : The INLINE mode of the TextInput component is set to TextOverflow.Ellipsis, and the maxlines setting is greater than 1, and the editing mode is dynamically switched to ellipsisMode
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0040 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode04_02'),1000);
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode04_01'),1000);
      await textarea.click();
      windowSnap.snapShot()
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0030
     * @tc.name   : The INLINE mode of the TextInput component is set to TextOverflow.Ellipsis, and the maxlines setting is 1, and the editing mode is dynamically switched to ellipsisMode
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0030 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode05_02'),1000);
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode05_01'),1000);
      await textarea.click();
      windowSnap.snapShot()
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0010
     * @tc.name   : The TextInput component is set in Default mode to TextOverflow.Ellipsis
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0010 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode06_02'),1000);
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode06_01'),1000);
      await textarea.click();
      windowSnap.snapShot()
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0090
     * @tc.name   : The TextInput component is set to TextOverflow.MARQUEE in INLINE mode, maxlines is set to 1, and ellipsisMode is dynamically toggled in the non-editing state
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0090 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode07')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode07_02'),1000);
      windowSnap.snapShot()
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0110
     * @tc.name   : The TextInput component is set to TextOverflow.MARQUEE in default mode, maxlines is set to 1, and ellipsisMode is dynamically switched in the edit state
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0110 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode08')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode08_02'),1000);
      let textinput: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode08_01'),1000);
      await driver.waitForIdle(500,2000);
      await textinput.click();
      windowSnap.snapShot()
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0130
     * @tc.name   : The TextArea component is set to TextOverflow.Clip, maxlines is set to 1, and ellipsisMode is dynamically toggled
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0130 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode09')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode09_02'),1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0070
     * @tc.name   : The inline mode of the TextArea component is set to TextOverflow.Ellipsis, maxlines is set to 1, and the edit mode is dynamically toggled ellipsisMode
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0070 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode10')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode10_02'),1000);
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode10_01'),1000);
      await driver.waitForIdle(500,2000);
      await textarea.click();
      windowSnap.snapShot()
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0120
     * @tc.name   : The TextArea component is set to TextOverflow.MARQUEE, maxlines is set to 1, and ellipsisMode is dynamically toggledx
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0120 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode11')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode11_02'),1000);
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode11_01'),1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0140
     * @tc.name   : The TextInput component is set to TextOverflow.Clip, maxlines is set to 1, and ellipsisMode is dynamically toggled
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0140 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode12')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode12_02'),1000);
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode12_01'),1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0170
     * @tc.name   : The width of the input box is changed when a single line of the TextInput/TextArea component is omitted
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0170 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode13')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode13_01'),1000);
      await button01.click();
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0190
     * @tc.name   : If the TextInput/TextArea component mixes languages in a single line or special symbols are omitted, the omitted position is switched
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0190 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode14')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode14_01'),1000);
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0180
     * @tc.name   : If the TextInput/TextArea component omits a single-line emoji, the omit position is switched
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0180 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode15')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode15_01'),1000);
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0160
     * @tc.name   : The TextInput/TextArea component sets TextOverflow.Ellipsis to dynamically change maxLines
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0160 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode16')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode16_01'),1000);
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode16_02'),1000);
      await textarea.click();
      await driver.waitForIdle(500,2000);
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0020
     * @tc.name   : The INLINE mode of the TextInput component is set to TextOverflow.Ellipsis, and the ellipsisMode is dynamically switched to the non-editing state
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0020 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode17')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode17_02'),1000);
      await driver.waitForIdle(500,2000);
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0150
     * @tc.name   : The TextInput/TextArea component sets a single line of text for the over-long prompt
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0150 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode18')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode18_01'),1000);
      await driver.waitForIdle(500,2000);
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0060
     * @tc.name   : Set TextOverflow.Ellipsis to maxlines greater than 1 for different type types, and dynamically switch ellipsisMode in the edit mode
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0060 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode19')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode19_01'),1000);
      let textarea01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode19_02'),1000);
      let textarea02: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode19_03'),1000);
      await driver.waitForIdle(500,2000);
      await textarea01.click();
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await textarea02.click();
      await driver.waitForIdle(500,2000);
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0050
     * @tc.name   : The TextArea component is set to TextOverflow.Ellipsis for different type types, 1 for maxlines, and ellipsisMode for dynamic editing mode
     * @tc.desc   : Verify textinput ellipsismode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0050 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputEllipsisMode/UiComponentTextInputEllipsisMode20')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextInputEllipsisMode20_01'),1000);
      await driver.waitForIdle(500,2000);
      for(let i=0;i<3;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_ELLIPSISMODE_0050 finish.`);
      done()
    })


  })
}