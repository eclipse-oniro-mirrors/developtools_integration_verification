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

import { describe, it, afterEach, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, MouseButton } from '@kit.TestKit'
import { uiAppearance } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit';
import windowSnap from '../../../model/snapShot'

export default function UiComponentTextRichEditorDoubleClick() {
  describe('UiComponentTextRichEditorDoubleClick', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        done()
        return
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window.Cause :${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_003
        * @tc.name   : Double click to display numbers in one line
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_003", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDoubleClick/UiComponentTextRichEditorDoubleClick0003")
      await Utils.sleep(1000) // 等待窗口创建完成
      let driver = await Driver.create()

      // 1、查找RichEditor组件
      let rich_editor_doubleclick_0003 = await driver.waitForComponent(ON.id("rich_editor_doubleclick_0003"), 1500)
      if (!rich_editor_doubleclick_0003) {
        Logger.error('TEST', 'RichEditor component not found!');
        done();
        return;
      }

      await Utils.sleep(1000)
      // 2、输入测试文本内容
      await rich_editor_doubleclick_0003.inputText(
        '18258420079'
        , { paste: false, addition: true });
      await Utils.sleep(1000)

      let point_doubleclick_0003 = await rich_editor_doubleclick_0003.getBoundsCenter()
      // 3、执行双击操作
      await driver.mouseDoubleClick(point_doubleclick_0003, MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_003_01")
      await Utils.sleep(1000)
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_010
        * @tc.name   : Double click words distributed in two lines within visible range
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_010", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDoubleClick/UiComponentTextRichEditorDoubleClick0010")
      await Utils.sleep(1000) // 等待窗口创建完成
      let driver = await Driver.create()

      // 1、查找RichEditor组件
      let rich_editor_doubleclick_0010 = await driver.waitForComponent(ON.id("rich_editor_doubleclick_0010"), 1500)
      if (!rich_editor_doubleclick_0010) {
        Logger.error('TEST', 'RichEditor component not found!');
        done();
        return;
      }

      await Utils.sleep(1000)
      // 2、输入测试文本内容
      await rich_editor_doubleclick_0010.inputText(
        'harmony'
        , { paste: false, addition: true });
      await Utils.sleep(1000)

      let point_doubleclick_0010 = await rich_editor_doubleclick_0010.getBoundsCenter()
      // 3、执行双击操作
      await driver.mouseDoubleClick({x:point_doubleclick_0010.x, y:point_doubleclick_0010.y-10}, MouseButton.MOUSE_BUTTON_LEFT);
      await Utils.sleep(1000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_010_01")
      await Utils.sleep(1000)
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_001
        * @tc.name   : Double click textspan without spaces displayed in one line
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_001", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDoubleClick/UiComponentTextRichEditorDoubleClick0001")
      await Utils.sleep(1000) // 等待窗口创建完成
      let driver = await Driver.create()

      // 1、查找RichEditor组件
      let rich_editor_doubleclick_0001 = await driver.waitForComponent(ON.id("rich_editor_doubleclick_0001"), 1500)
      if (!rich_editor_doubleclick_0001) {
        Logger.error('TEST', 'RichEditor component not found!');
        done();
        return;
      }

      await Utils.sleep(1000)
      // 2、输入测试文本内容
      await rich_editor_doubleclick_0001.inputText(
        '这是一段用于鼠标双击选择的测试文本'
        , { paste: false, addition: true });
      let point_doubleclick_0001 = await rich_editor_doubleclick_0001.getBoundsCenter()
      // 3、执行双击操作
      await driver.mouseDoubleClick({x:point_doubleclick_0001.x, y:point_doubleclick_0001.y-15}, MouseButton.MOUSE_BUTTON_LEFT);
      await Utils.sleep(1000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_001_01")
      await Utils.sleep(1000)
      done();
    })

  })
}
