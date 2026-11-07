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
import { i18n } from '@kit.LocalizationKit'
import { BusinessError } from '@kit.BasicServicesKit'

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

export default function uiComponentRichEditorMenuReinforcing() {

  describe('uiComponentRichEditorMenuReinforcing', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0014
     * @tc.name   : Select the Chinese version, click outside the component, and check the custom menu callback
     * @tc.desc   : Verify text richeditor menu reinforcing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0014', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0014 start.`);
      Settings.createWindow('testability/pages/component/rich_editor/RichEditorMenuReinforcing/UiComponentRichEditorMenuReinforcing01')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentRichEditorMenuReinforcing01_01'),1000);
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentRichEditorMenuReinforcing01_02'),1000);
      await richeditor.longClick()
      await Utils.sleep(1000)
      await textarea.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0014 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0011
     * @tc.name   : Change the component position and check the custom menu callback
     * @tc.desc   : Verify text richeditor menu reinforcing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0011', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0011 start.`);
      Settings.createWindow('testability/pages/component/rich_editor/RichEditorMenuReinforcing/UiComponentRichEditorMenuReinforcing02')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentRichEditorMenuReinforcing02_01'),1000);
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentRichEditorMenuReinforcing02_02'),1000);
      await richeditor.longClick()
      await Utils.sleep(1000)
      await textarea.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0011 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0003
     * @tc.name   : Bind any one or more menu types and response types of custom menus, gesture and long press/mouse right click/mouse to select any content to verify the menu effect
     * @tc.desc   : Verify text richeditor menu reinforcing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0003', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0003 start.`);
      Settings.createWindow('testability/pages/component/rich_editor/RichEditorMenuReinforcing/UiComponentRichEditorMenuReinforcing03')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentRichEditorMenuReinforcing03_02'),1000);
      let point = await richeditor.getBoundsCenter();
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0003 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0010
     * @tc.name   : Change the component width/height, check the custom menu callback
     * @tc.desc   : Verify text richeditor menu reinforcing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0010 start.`);
      Settings.createWindow('testability/pages/component/rich_editor/RichEditorMenuReinforcing/UiComponentRichEditorMenuReinforcing04')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentRichEditorMenuReinforcing04_01'),1000);
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentRichEditorMenuReinforcing04_02'),1000);
      await richeditor.longClick();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await button.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0015
     * @tc.name   : Select the Chinese version and call closeSelectionMenu/stopEditing/setCaretOffset/setSelection to check the custom menu callback
     * @tc.desc   : Verify text richeditor menu reinforcing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0015', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0015 start.`);
      Settings.createWindow('testability/pages/component/rich_editor/RichEditorMenuReinforcing/UiComponentRichEditorMenuReinforcing05')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentRichEditorMenuReinforcing05_01'),1000);
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentRichEditorMenuReinforcing05_02'),1000);
      await richeditor.longClick();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await button.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0015 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0013
     * @tc.name   : Select the Chinese version and click on other areas in the component to check the custom menu callback
     * @tc.desc   : Verify text richeditor menu reinforcing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0013', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0013 start.`);
      Settings.createWindow('testability/pages/component/rich_editor/RichEditorMenuReinforcing/UiComponentRichEditorMenuReinforcing06')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentRichEditorMenuReinforcing06_02'),1000);
      let point = await richeditor.getBounds()
      await richeditor.longClick();
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.left+10,y:point.top+10},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0013 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0012
     * @tc.name   : Select the Chinese book, back button to close the handle and menu, check the custom menu callback
     * @tc.desc   : Verify text richeditor menu reinforcing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0012', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0012 start.`);
      Settings.createWindow('testability/pages/component/rich_editor/RichEditorMenuReinforcing/UiComponentRichEditorMenuReinforcing07')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentRichEditorMenuReinforcing07_02'),1000);
      await richeditor.longClick();
      await Utils.sleep(1000)
      await driver.triggerKey(2)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0012 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0018
     * @tc.name   : Mirror mode, check the customization menu
     * @tc.desc   : Verify text richeditor menu reinforcing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0018', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0012 start.`);
      try {
        i18n.System.setAppPreferredLanguage('ug');
        Logger.info(`call System.setSystemLanguage success.`);
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        Logger.error(`call System.setSystemLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      Settings.createWindow('testability/pages/component/rich_editor/RichEditorMenuReinforcing/UiComponentRichEditorMenuReinforcing08')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentRichEditorMenuReinforcing08_02'),1000);
      await richeditor.longClick();
      await Utils.sleep(1000)
      await driver.triggerKey(2)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0018 finish.`);
      done()
    })
  })
}