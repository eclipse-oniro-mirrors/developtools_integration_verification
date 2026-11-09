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

export default function uiComponentTextTranslateMenu() {

  describe('uiComponentTextTranslateMenu', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0060
     * @tc.name   : TextInput component, password mode
     * @tc.desc   : Verify text translate menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0060 start.`);
      Settings.createWindow('testability/pages/component/text/TextTranslateMenu/UiComponentTextTranslateMenu01');
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      await driver.longClick(100,100);
      await driver.click(70,200);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0060 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0230
     * @tc.name   : Right-click the Text/TextInput/TextArea/Search component
     * @tc.desc   : Verify text translate menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0230 start.`);
      Settings.createWindow('testability/pages/component/text/TextTranslateMenu/UiComponentTextTranslateMenu02');
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      let text: Component = await driver.waitForComponent(ON.id('UiComponentTextTranslateMenu02_01'),1000);
      let textinput: Component = await driver.waitForComponent(ON.id('UiComponentTextTranslateMenu02_02'),1000);
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentTextTranslateMenu02_03'),1000);
      let search: Component = await driver.waitForComponent(ON.id('UiComponentTextTranslateMenu02_04'),1000);
      let point1 = await text.getBoundsCenter();
      let point2 = await textinput.getBoundsCenter();
      let point3 = await textarea.getBoundsCenter();
      let point4 = await search.getBoundsCenter();
      await driver.mouseLongClick({x:point1.x, y:point1.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0230_01');
      await driver.waitForIdle(500,2000);
      await driver.mouseLongClick({x:point2.x, y:point2.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0230_02');
      await driver.waitForIdle(500,2000);
      await driver.mouseLongClick({x:point3.x, y:point3.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0230_03');
      await driver.waitForIdle(500,2000);
      await driver.mouseLongClick({x:point4.x, y:point4.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0230_04');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0230 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0110
     * @tc.name   : The TextInput/TextArea/Search component sets selectionMenuHidden to true, and the Chinese version is selected
     * @tc.desc   : Verify text translate menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0110 start.`);
      Settings.createWindow('testability/pages/component/text/TextTranslateMenu/UiComponentTextTranslateMenu03');
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      let textinput: Component = await driver.waitForComponent(ON.id('UiComponentTextTranslateMenu03_01'),1000);
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentTextTranslateMenu03_02'),1000);
      let search: Component = await driver.waitForComponent(ON.id('UiComponentTextTranslateMenu03_03'),1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextTranslateMenu03_04'),1000);
      await textinput.click();
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0110_01');
      await driver.waitForIdle(500,2000);
      await textarea.click();
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0110_02');
      await driver.waitForIdle(500,2000);
      await search.click();
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0110_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TRANSLATE_MENU_0110 finish.`);
      done();
    })


  })
}