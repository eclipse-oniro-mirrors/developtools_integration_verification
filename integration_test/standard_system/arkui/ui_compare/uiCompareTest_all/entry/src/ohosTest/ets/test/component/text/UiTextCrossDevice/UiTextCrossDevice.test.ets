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

export default function uiTextCrossDevice() {

  describe('uiTextCrossDevice', () => {
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
     * @tc.number : SUB_ACE_UI_TEXT_CROSSDEVICE_0010
     * @tc.name   : Search adds maxLength, set maxLength, enter text
     * @tc.desc   : Verify text crossdevice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_TEXT_CROSSDEVICE_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0010 start.`);
      Settings.createWindow('testability/pages/component/text/UiTextCrossDevice/UiTextCrossDevice01')
      let driver:Driver=Driver.create();
      let search: Component = await driver.waitForComponent(ON.id('UiTextCrossDevice01'),1000);
      await search.inputText('aaaaaaa')
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TEXT_CROSSDEVICE_0020
     * @tc.name   : Search adds maxLength, dynamically increase maxLength
     * @tc.desc   : Verify text crossdevice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_TEXT_CROSSDEVICE_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0020 start.`);
      Settings.createWindow('testability/pages/component/text/UiTextCrossDevice/UiTextCrossDevice02')
      let driver:Driver=Driver.create();
      let search: Component = await driver.waitForComponent(ON.id('UiTextCrossDevice02'),1000);
      let button: Component = await driver.waitForComponent(ON.id('UiTextCrossDevice02_02'),1000);
      await search.inputText('aaaa')
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button.click()
      await search.inputText('aaaa')
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TEXT_CROSSDEVICE_0030
     * @tc.name   : Search adds maxLength, dynamically decrease maxLength with input text
     * @tc.desc   : Verify text crossdevice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_TEXT_CROSSDEVICE_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0030 start.`);
      Settings.createWindow('testability/pages/component/text/UiTextCrossDevice/UiTextCrossDevice03')
      let driver:Driver=Driver.create();
      let search: Component = await driver.waitForComponent(ON.id('UiTextCrossDevice03'),1000);
      await search.inputText('HelloWorld')
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TEXT_CROSSDEVICE_0040
     * @tc.name   : Search adds maxLength, decrease then increase maxLength with input text
     * @tc.desc   : Verify text crossdevice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_TEXT_CROSSDEVICE_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0040 start.`);
      Settings.createWindow('testability/pages/component/text/UiTextCrossDevice/UiTextCrossDevice04')
      let driver:Driver=Driver.create();
      let search: Component = await driver.waitForComponent(ON.id('UiTextCrossDevice04'),1000);
      // 输入多个字符，触发onChange
      // 前8次输入：maxLength从10减到2（10→9→8→7→6→5→4→3→2）
      // 后8次输入：maxLength从2增加到10（2→3→4→5→6→7→8→9→10）
      await search.inputText('HelloWorldTestABCD')
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TEXT_CROSSDEVICE_0270
     * @tc.name   : Set caret position
     * @tc.desc   : Verify text crossdevice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_TEXT_CROSSDEVICE_0270', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0270 start.`);
      Settings.createWindow('testability/pages/component/text/UiTextCrossDevice/UiTextCrossDevice05')
      let driver:Driver=Driver.create();
      let search: Component = await driver.waitForComponent(ON.id('UiTextCrossDevice05'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TEXT_CROSSDEVICE_0280
     * @tc.name   : Dynamically increase caret position, text length less than caret position
     * @tc.desc   : Verify text crossdevice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_TEXT_CROSSDEVICE_0280', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0280 start.`);
      Settings.createWindow('testability/pages/component/text/UiTextCrossDevice/UiTextCrossDevice06')
      let driver:Driver=Driver.create();
      let search: Component = await driver.waitForComponent(ON.id('UiTextCrossDevice06'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TEXT_CROSSDEVICE_0290
     * @tc.name   : Dynamically increase caret position, text length greater than caret position
     * @tc.desc   : Verify text crossdevice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_TEXT_CROSSDEVICE_0290', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0290 start.`);
      Settings.createWindow('testability/pages/component/text/UiTextCrossDevice/UiTextCrossDevice07')
      let driver:Driver=Driver.create();
      let search: Component = await driver.waitForComponent(ON.id('UiTextCrossDevice07'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TEXT_CROSSDEVICE_0300
     * @tc.name   : Dynamically decrease caret position, decrease to less than 0
     * @tc.desc   : Verify text crossdevice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_TEXT_CROSSDEVICE_0300', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0300 start.`);
      Settings.createWindow('testability/pages/component/text/UiTextCrossDevice/UiTextCrossDevice08')
      let driver:Driver=Driver.create();
      let search: Component = await driver.waitForComponent(ON.id('UiTextCrossDevice08'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TEXT_CROSSDEVICE_0310
     * @tc.name   : Dynamically decrease caret position, decrease to greater than or equal to 0
     * @tc.desc   : Verify text crossdevice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_TEXT_CROSSDEVICE_0310', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0310 start.`);
      Settings.createWindow('testability/pages/component/text/UiTextCrossDevice/UiTextCrossDevice09')
      let driver:Driver=Driver.create();
      let search: Component = await driver.waitForComponent(ON.id('UiTextCrossDevice09'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_TEXT_CROSSDEVICE_0320
     * @tc.name   : Mouse click a position to place caret
     * @tc.desc   : Verify text crossdevice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_TEXT_CROSSDEVICE_0320', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0320 start.`);
      Settings.createWindow('testability/pages/component/text/UiTextCrossDevice/UiTextCrossDevice10')
      let driver:Driver=Driver.create();
      let search: Component = await driver.waitForComponent(ON.id('UiTextCrossDevice10'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_TEXT_CROSSDEVICE_0320 finish.`);
      done()
    })

  })
}