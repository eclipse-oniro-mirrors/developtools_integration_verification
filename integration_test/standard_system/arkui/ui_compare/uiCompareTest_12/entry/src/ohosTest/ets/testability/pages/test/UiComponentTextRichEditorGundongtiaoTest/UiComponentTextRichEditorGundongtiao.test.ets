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
import { Driver, ON, Component, On, } from '@kit.TestKit'
import { uiAppearance } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit';
import windowSnap from '../../../model/snapShot'

export default function UiComponentTextRichEditorGundongtiao() {
  describe('UiComponentTextRichEditorGundongtiao', () => {
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
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0001
        * @tc.name   : 添加RichEditor组件
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0001", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorGundongtiao/UiComponentTextRichEditorGundongtiao0001")
      await Utils.sleep(1000) // 等待窗口创建完成
      let driver = await Driver.create()

      // 1、查找RichEditor组件
      let rich_editor_gundongtiao_0001 = await driver.waitForComponent(ON.id("rich_editor_gundongtiao_0001"), 1500)
      if (!rich_editor_gundongtiao_0001) {
        Logger.error('TEST', 'RichEditor component not found!');
        done();
        return;
      }
      await Utils.sleep(1000)

      // 2、输入测试文本内容
      await rich_editor_gundongtiao_0001.inputText('测试文本内容', { paste: false, addition: true });
      await Utils.sleep(1000)

      // 3、截图验证测试结果
      await Utils.sleep(1000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0001_01")
      await Utils.sleep(1000)
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0010
        * @tc.name   : 添加RichEditor组件
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0010", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorGundongtiao/UiComponentTextRichEditorGundongtiao0010")
      await Utils.sleep(1000) // 等待窗口创建完成
      let driver = await Driver.create()

      // 1、查找RichEditor组件和添加图片按钮
      let rich_editor_gundongtiao_0010 = await driver.waitForComponent(ON.id("rich_editor_gundongtiao_0010"), 1500)
      if (!rich_editor_gundongtiao_0010) {
        Logger.error('TEST', 'RichEditor component not found!');
        done();
        return;
      }
      let button_gundongtiao_0010_addImage = await driver.waitForComponent(ON.id('button_gundongtiao_0010_addImage'), 1500);
      await Utils.sleep(1000)

      // 2、输入测试文本内容并添加图片
      await rich_editor_gundongtiao_0010.inputText('测试文本内容', { paste: false, addition: true });
      await Utils.sleep(1000)
      
      if (button_gundongtiao_0010_addImage) {
        await button_gundongtiao_0010_addImage.click()
        await Utils.sleep(500)
      }

      // 3、截图验证测试结果
      await Utils.sleep(1000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0010_01")
      await Utils.sleep(1000)
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0002
        * @tc.name   : 添加RichEditor组件
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0002", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorGundongtiao/UiComponentTextRichEditorGundongtiao0002")
      await Utils.sleep(1000) // 等待窗口创建完成
      let driver = await Driver.create()

      // 1、查找RichEditor组件和添加图片按钮
      let rich_editor_gundongtiao_0002 = await driver.waitForComponent(ON.id("rich_editor_gundongtiao_0002"), 1500)
      if (!rich_editor_gundongtiao_0002) {
        Logger.error('TEST', 'RichEditor component not found!');
        done();
        return;
      }
      let button_gundongtiao_0002_addImage = await driver.waitForComponent(ON.id('button_gundongtiao_0002_addImage'), 1500);
      await Utils.sleep(1000)

      // 2、输入测试文本内容并添加图片
      await rich_editor_gundongtiao_0002.inputText('测试文本内容', { paste: false, addition: true });
      await Utils.sleep(1000)
      
      if (button_gundongtiao_0002_addImage) {
        await button_gundongtiao_0002_addImage.click()
        await Utils.sleep(500)
      }

      // 3、截图验证测试结果
      await Utils.sleep(1000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0002_01")
      await Utils.sleep(1000)
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0003
        * @tc.name   : 添加RichEditor组件
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0003", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorGundongtiao/UiComponentTextRichEditorGundongtiao0003")
      await Utils.sleep(1000) // 等待窗口创建完成
      let driver = await Driver.create()

      // 1、查找RichEditor组件和添加图片按钮
      let rich_editor_gundongtiao_0003 = await driver.waitForComponent(ON.id("rich_editor_gundongtiao_0003"), 1500)
      if (!rich_editor_gundongtiao_0003) {
        Logger.error('TEST', 'RichEditor component not found!');
        done();
        return;
      }
      let button_gundongtiao_0003_addImage = await driver.waitForComponent(ON.id('button_gundongtiao_0003_addImage'), 1500);
      await Utils.sleep(1000)

      // 2、输入测试文本内容并添加图片
      await rich_editor_gundongtiao_0003.inputText('测试文本内容', { paste: false, addition: true });
      await Utils.sleep(1000)
      
      if (button_gundongtiao_0003_addImage) {
        await button_gundongtiao_0003_addImage.click()
        await Utils.sleep(500)
      }

      // 3、截图验证测试结果
      await Utils.sleep(1000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0003_01")
      await Utils.sleep(1000)
      done();
    })

  })
}
