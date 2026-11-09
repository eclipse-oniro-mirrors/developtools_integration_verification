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

export default function uiComponentTextWithTheme() {

  describe('uiComponentTextWithTheme', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0070
     * @tc.name   : Text component, set the selection to select a blank row
     * @tc.desc   : Verify text withtheme interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0070 start.`);
      Settings.createWindow('testability/pages/component/text/TextWithTheme/UiComponentTextWithTheme01');
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0070_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextWithTheme01'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0070_02');
      await driver.waitForIdle(500,2000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0070_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0070 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0080
     * @tc.name   : Text component, set the selection to select a blank row
     * @tc.desc   : Verify text withtheme interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0080 start.`);
      Settings.createWindow('testability/pages/component/text/TextWithTheme/UiComponentTextWithTheme02');
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0080_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextWithTheme02'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0080_02');
      await driver.waitForIdle(500,2000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0080_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0070 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0030
     * @tc.name   : Set the global theme theme and the local theme WithTheme
     * @tc.desc   : Verify text withtheme interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0030 start.`);
      Settings.createWindow('testability/pages/component/text/TextWithTheme/UiComponentTextWithTheme03');
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0030_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextWithTheme03'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0030_02');
      await driver.waitForIdle(500,2000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0030_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0030 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0010
     * @tc.name   : Set the global theme
     * @tc.desc   : Verify text withtheme interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0010 start.`);
      Settings.createWindow('testability/pages/component/text/TextWithTheme/UiComponentTextWithTheme04');
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0010 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0020
     * @tc.name   : Set the global theme to null
     * @tc.desc   : Verify text withtheme interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0020 start.`);
      Settings.createWindow('testability/pages/component/text/TextWithTheme/UiComponentTextWithTheme05');
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0020 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0040
     * @tc.name   : Set local light and dark modes, switch system light and dark modes
     * @tc.desc   : Verify text withtheme interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0040 start.`);
      Settings.createWindow('testability/pages/component/text/TextWithTheme/UiComponentTextWithTheme06');
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0040 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0060
     * @tc.name   : Without setting parameters for WithTheme
     * @tc.desc   : Verify text withtheme interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0060 start.`);
      Settings.createWindow('testability/pages/component/text/TextWithTheme/UiComponentTextWithTheme07');
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextWithTheme07_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextWithTheme07_02'),1000);
      await driver.waitForIdle(500,2000);
      await button01.click();
      await driver.waitForIdle(500,2000);
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0060 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0050
     * @tc.name   : WithTheme is set to null or undefined
     * @tc.desc   : Verify text withtheme interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0050 start.`);
      Settings.createWindow('testability/pages/component/text/TextWithTheme/UiComponentTextWithTheme08');
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextWithTheme08_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextWithTheme08_02'),1000);
      await driver.waitForIdle(500,2000);
      await button01.click();
      await driver.waitForIdle(500,2000);
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0050 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0050
     * @tc.name   : WithTheme is set to null or undefined
     * @tc.desc   : Verify text withtheme interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0050 start.`);
      Settings.createWindow('testability/pages/component/text/TextWithTheme/UiComponentTextWithTheme09');
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextWithTheme09_01'),1000);
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000);
      await button01.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(10000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_WITHTHEME_0050 finish.`);
      done();
    })


  })
}