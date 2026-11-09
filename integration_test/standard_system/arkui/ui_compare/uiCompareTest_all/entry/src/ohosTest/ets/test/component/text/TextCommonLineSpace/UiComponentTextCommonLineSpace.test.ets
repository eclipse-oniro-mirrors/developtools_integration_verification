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

export default function uiComponentTextCommonLineSpace() {

  describe('uiComponentTextCommonLineSpace', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0020
     * @tc.name   : textArea is switched to different type, and the line spacing is displayed normally
     * @tc.desc   : Verify text common linespace interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0020 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace14')
      let driver: Driver=Driver.create()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextCommonLineSpace14'),1000);
      for(let i=0; i<2; i++) {
        await button.click();
      }
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0030
     * @tc.name   : The textArea line spacing property does not take effect on placeHolder
     * @tc.desc   : Verify text common linespace interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0030 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace12')
      let driver: Driver=Driver.create()
      let text: Component = await driver.waitForComponent(ON.id('UiComponentTextCommonLineSpace12'),1000)
      await text.inputText('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_PHONENUMBER_0050
     * @tc.name   : Instead of calling onChange, enter a space
     * @tc.desc   : Verify textinput phonenumber interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_PHONENUMBER_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_PHONENUMBER_0050 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace13')
      let driver: Driver=Driver.create()
      let text: Component = await driver.waitForComponent(ON.id('UiComponentTextCommonLineSpace13'),1000)
      await text.inputText('                            ')
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_PHONENUMBER_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXTINPUT_SHOWPASSWORD_0390
     * @tc.name   : fontFeature is set to subs and the property value is set to 1
     * @tc.desc   : Verify text textinput showpassword interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXTINPUT_SHOWPASSWORD_0390', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXTINPUT_SHOWPASSWORD_0390 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace01')
      let driver: Driver=Driver.create()
      let text: Component = await driver.waitForComponent(ON.id('TextInput001'), 1000)
      await text.inputText('aaaaaaaaaaaaaaaaaaaaaaaaaa')
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXTINPUT_SHOWPASSWORD_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXTINPUT_SHOWPASSWORD_0360
     * @tc.name   : There is no heightAdaptivePolicy
     * @tc.desc   : Verify text textinput showpassword interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXTINPUT_SHOWPASSWORD_0360', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXTINPUT_SHOWPASSWORD_0360 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace02')
      let driver: Driver=Driver.create()
      let text: Component = await driver.waitForComponent(ON.id('TextInput002'),1000)
      await text.inputText('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXTINPUT_SHOWPASSWORD_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0010
     * @tc.name   : There is no heightAdaptivePolicy
     * @tc.desc   : Verify text common linespace interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0010 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace03')
      let driver: Driver=Driver.create()
      let text: Component = await driver.waitForComponent(ON.id('UITwice003'),1000)
      await text.inputText('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0070
     * @tc.name   : text, set the width and height, set the super text, and set the textOverFlow
     * @tc.desc   : Verify text common linespace interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0070 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace04')
      let driver:Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0080
     * @tc.name   : Create an ets page to display the text component without lineSpacing
     * @tc.desc   : Verify text common linespace interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0080 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace05')
      let driver:Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0030
     * @tc.name   : text: Set width and height, set ultra-large text, and set textOverFlow to Ellipsis
     * @tc.desc   : Verify text common linespace c interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0030 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace06')
      let driver:Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0040
     * @tc.name   : text: Set width and height, set ultra-large text, and set textOverFlow to MARQUEE
     * @tc.desc   : Verify text common linespace c interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0040 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace07')
      let driver:Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0020
     * @tc.name   : text: Set width and height, set ultra-large text, and set textOverFlow to Clip
     * @tc.desc   : Verify text common linespace c interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0020 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace08')
      let driver:Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0070
     * @tc.name   : Set the component to an illegal value of type number
     * @tc.desc   : Verify text common linespace c interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0070 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace09')
      let driver:Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0080
     * @tc.name   : Set the component to null
     * @tc.desc   : Verify text common linespace c interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0080 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace10')
      let driver:Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_C_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0090
     * @tc.name   : Set the normal value of type number for the component
     * @tc.desc   : Verify text common linespace interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0090', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0090 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace11')
      let driver:Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0040
     * @tc.name   : text contains a ContainerSpan
     * @tc.desc   : Verify text common linespace interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0040 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace15')
      let driver: Driver=Driver.create()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextCommonLineSpace15'),1000)
      await button.click()
      await driver.waitForIdle(500,2000)
      await driver.longClick(248,500)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0140
     * @tc.name   : Dynamically switch lineSpacing
     * @tc.desc   : Verify text common linespace interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0140 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace16')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0150
     * @tc.name   : Set lineHeight and line spacing at the same time
     * @tc.desc   : Verify text common linespace interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0150 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace17')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0050
     * @tc.name   : Set lineHeight and line spacing at the same time
     * @tc.desc   : Verify text common linespace interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0050 start.`);
      Settings.createWindow('testability/pages/component/text/TextCommonLineSpace/UiComponentTextCommonLineSpace18')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_LINESPACE_0050 finish.`);
      done()
    })
  })
}