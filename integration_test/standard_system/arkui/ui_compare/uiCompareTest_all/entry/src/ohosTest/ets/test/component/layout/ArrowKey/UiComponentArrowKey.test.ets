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

export default function uiComponentArrowKey() {

  describe('uiComponentArrowKey', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_ARROW_KEY_0030
     * @tc.name   : TextInput/TextArea/Search, enter a single line of text, and click the up arrow on the keyboard
     * @tc.desc   : Verify arrow key interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_ARROW_KEY_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARROW_KEY_0030 start.`);
      Settings.createWindow('testability/pages/component/layout/ArrowKey/UiComponentArrowKey01')
      let driver:Driver=Driver.create();
      let textinput: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey01_01'),1000)
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey01_02'),1000)
      let search: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey01_03'),1000)
      await textinput.inputText('hello')
      await driver.triggerKey(2012)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0030_01')
      await driver.waitForIdle(500,2000);
      await textarea.inputText('hello')
      await driver.triggerKey(2012)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0030_02')
      await driver.waitForIdle(500,2000);
      await search.inputText('hello')
      await driver.triggerKey(2012)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0030_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARROW_KEY_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARROW_KEY_0040
     * @tc.name   : TextInput/TextArea/Search, enter a single line of text, and click the down arrow on the keyboard
     * @tc.desc   : Verify arrow key interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_ARROW_KEY_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARROW_KEY_0040 start.`);
      Settings.createWindow('testability/pages/component/layout/ArrowKey/UiComponentArrowKey02')
      let driver:Driver=Driver.create();
      let textinput: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey02_01'),1000)
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey02_02'),1000)
      let search: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey02_03'),1000)
      await textinput.inputText('hello')
      await driver.triggerKey(2013)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0040_01')
      await driver.waitForIdle(500,2000);
      await textarea.inputText('hello')
      await driver.triggerKey(2013)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0040_02')
      await driver.waitForIdle(500,2000);
      await search.inputText('hello')
      await driver.triggerKey(2013)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0040_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARROW_KEY_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARROW_KEY_0010
     * @tc.name   : TextInput/TextArea/Search, enter a single line of text, and click the Home button on the keyboard
     * @tc.desc   : Verify arrow key interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_ARROW_KEY_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARROW_KEY_0010 start.`);
      Settings.createWindow('testability/pages/component/layout/ArrowKey/UiComponentArrowKey03')
      let driver:Driver=Driver.create();
      let textinput: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey03_01'),1000)
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey03_02'),1000)
      let search: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey03_03'),1000)
      await textinput.inputText('hello')
      await driver.triggerKey(2081)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0010_01')
      await driver.waitForIdle(500,2000);
      await textarea.inputText('hello')
      await driver.triggerKey(2081)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0010_02')
      await driver.waitForIdle(500,2000);
      await search.inputText('hello')
      await driver.triggerKey(2081)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0010_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARROW_KEY_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARROW_KEY_0020
     * @tc.name   : TextInput/TextArea/Search, enter a single line of text, and click the end button on the keyboard
     * @tc.desc   : Verify arrow key interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_ARROW_KEY_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARROW_KEY_0020 start.`);
      Settings.createWindow('testability/pages/component/layout/ArrowKey/UiComponentArrowKey04')
      let driver:Driver=Driver.create();
      let textinput: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey04_01'),1000)
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey04_02'),1000)
      let search: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey04_03'),1000)
      await textinput.inputText('hello')
      await driver.triggerKey(2082)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0020_01')
      await driver.waitForIdle(500,2000);
      await textarea.inputText('hello')
      await driver.triggerKey(2082)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0020_02')
      await driver.waitForIdle(500,2000);
      await search.inputText('hello')
      await driver.triggerKey(2082)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0020_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARROW_KEY_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARROW_KEY_0050
     * @tc.name   : TextInput/TextArea/Search, enter a single line of text, and click the end button on the keyboard
     * @tc.desc   : Verify arrow key interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_ARROW_KEY_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARROW_KEY_0050 start.`);
      Settings.createWindow('testability/pages/component/layout/ArrowKey/UiComponentArrowKey05')
      let driver:Driver=Driver.create();
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey05_01'),1000)
      await textarea.click()
      await driver.triggerKey(2081)
      await Utils.sleep(500)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0050_01')
      await driver.triggerKey(2082)
      await Utils.sleep(500)

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0050_02')
      await driver.triggerKey(2012)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0050_03')
      await driver.triggerKey(2013)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0050_04')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARROW_KEY_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARROW_KEY_0110
     * @tc.name   : TextInput/TextArea/Search component set onTextSelectionChange
     * @tc.desc   : Verify arrow key interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_ARROW_KEY_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARROW_KEY_0110 start.`);
      Settings.createWindow('testability/pages/component/layout/ArrowKey/UiComponentArrowKey06')
      let driver:Driver=Driver.create();
      let textinput: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey06_01'),1000)
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey06_02'),1000)
      let search: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey06_03'),1000)
      await textinput.inputText('hello')
      await driver.triggerKey(2012)
      await driver.triggerKey(2013)
      await driver.triggerKey(2081)
      await driver.triggerKey(2082)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0110_01')
      await driver.waitForIdle(500,2000);
      await textarea.inputText('hello')
      await driver.triggerKey(2012)
      await driver.triggerKey(2013)
      await driver.triggerKey(2082)
      await driver.triggerKey(2081)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0110_02')
      await driver.waitForIdle(500,2000);
      await search.inputText('hello')
      await driver.triggerKey(2013)
      await driver.triggerKey(2082)
      await driver.triggerKey(2081)
      await driver.triggerKey(2012)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0110_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARROW_KEY_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARROW_KEY_0080
     * @tc.name   : halfleading is true, switch the input box type.
     * @tc.desc   : Verify arrow key interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_ARROW_KEY_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARROW_KEY_0080 start.`);
      Settings.createWindow('testability/pages/component/layout/ArrowKey/UiComponentArrowKey07')
      let driver:Driver=Driver.create();
      let textinput: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey07_01'),500)
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey07_02'),500)
      let search: Component = await driver.waitForComponent(ON.id('UiComponentArrowKey07_03'),500)
      await textinput.inputText('12')
      await driver.triggerKey(2012)
      await driver.triggerKey(2013)
      await driver.triggerKey(2081)
      await driver.triggerKey(2082)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0080_01')
      await textarea.inputText('12')
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2082)
      await driver.triggerKey(2081)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0080_02')
      await search.inputText('12')
      await driver.triggerKey(2013)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARROW_KEY_0080_03')
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARROW_KEY_0080 finish.`);
      done()
    })
  })
}