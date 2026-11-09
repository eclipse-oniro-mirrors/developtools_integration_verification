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

export default function uiComponentTextRichEditorHandleAnimation() {

  describe('uiComponentTextRichEditorHandleAnimation', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle-animation_0002
     * @tc.name   : Perform a translation animation and observe the handles and menus
     * @tc.desc   : Verify text richeditor handle-animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle_animation_0002', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ handle-animation_0002 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorHandleAnimationAlt/UiComponentTextRichEditorHandleAnimation01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHandleAnimation01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHandleAnimation01_02'),1000);
      await button01.click()
      await Utils.sleep(500)
      await button01.longClick();
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click();
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle-animation_0002 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle-animation_0003
     * @tc.name   : Perform a rotation animation and observe the handles and menus
     * @tc.desc   : Verify text richeditor handle-animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle_animation_0003', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ handle-animation_0003 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorHandleAnimationAlt/UiComponentTextRichEditorHandleAnimation02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHandleAnimation02'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHandleAnimation02_02'),1000);
      await button01.click()
      await Utils.sleep(500)
      await button01.longClick();
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click();
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle-animation_0003 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle-animation_0006
     * @tc.name   : Perform a size change animation and observe the handles and menus
     * @tc.desc   : Verify text richeditor handle-animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle_animation_0006', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ handle-animation_0006 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorHandleAnimationAlt/UiComponentTextRichEditorHandleAnimation04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHandleAnimation04'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHandleAnimation04_02'),1000);
      await button01.click()
      await Utils.sleep(500)
      await button01.longClick();
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click();
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle-animation_0006 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle-animation_0008
     * @tc.name   : Select symbol/builder and observe the handles and menus
     * @tc.desc   : Verify text richeditor handle-animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle_animation_0008', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ handle-animation_0008 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorHandleAnimationAlt/UiComponentTextRichEditorHandleAnimation05')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHandleAnimation05'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHandleAnimation05_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHandleAnimation05_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHandleAnimation05_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHandleAnimation05_04'),1000);
      await richeditor.click()
      await Utils.sleep(500)
      await richeditor.longClick();
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click();
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click();
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click();
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button04.click();
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle-animation_0008 finish.`);
      done()
    })

  })
}