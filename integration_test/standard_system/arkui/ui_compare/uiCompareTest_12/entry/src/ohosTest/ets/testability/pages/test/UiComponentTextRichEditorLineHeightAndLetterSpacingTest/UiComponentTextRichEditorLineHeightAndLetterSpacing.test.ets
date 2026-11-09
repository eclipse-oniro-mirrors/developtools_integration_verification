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

import { afterEach, describe, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'

export default function UiComponentTextRichEditorLineHeightAndLetterSpacing() {
  describe('UiComponentTextRichEditorLineHeightAndLetterSpacing', () => {
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
      await Utils.sleep(2000);
      done()
    })

    /*
      * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEHEIGHT_LETTERSPACING_0027
      * @tc.name   : Set lineHeight property when setting indentation for PixelMap image content
      * @tc.type   : Function
      * @tc.size   : UiTest
      * @tc.level  : 3
      */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEHEIGHT_LETTERSPACING_0027", Level.LEVEL3, async (done: Function) => {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorLineHeightAndLetterSpacing/UiComponentTextRichEditorLineHeightAndLetterSpacing0027")
        await Utils.sleep(2000) // 等待窗口创建完成
        let driver = await Driver.create()

        // 1、查找RichEditor组件
        let rich_editor_lineheight_letterspacing_0027 = await driver.findComponent(ON.id("rich_editor_lineheight_letterspacing_0027"))
        if (!rich_editor_lineheight_letterspacing_0027) {
          Logger.error('TEST', 'RichEditor component not found!');
          done();
          return;
        }
        // 2、等待组件加载完成
        await Utils.sleep(2000)
        // 3、截图查看缩进图片以及文本内容的显示效果
        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEHEIGHTANDLETTERSPACING_0001_01")
        await Utils.sleep(1000)

        done();
      })
  })
}
