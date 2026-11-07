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
import { image } from '@kit.ImageKit'

export default function UiComponentTextRichEditorOnDragStart() {
  describe('UiComponentTextRichEditorOnDragStart', () => {
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
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONDRAGSTART_005
        * @tc.name   : Drag out text content and set onDragStart
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONDRAGSTART_005", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorOnDragStart/UiComponentTextRichEditorOnDragStart005")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      // 1.查找预备拖出组件，添加预设图文并选择
      let richEditorDragOut005 = await driver.waitForComponent(ON.id("richEditorDragOut005"),500)
      let richEditorDropIn005 = await driver.waitForComponent(ON.id("richEditorDropIn005"),500)
      let addSpanBtn005 = await driver.waitForComponent(ON.id("addSpanBtn005"),500)
      await addSpanBtn005.click()
      await richEditorDragOut005.click()

      let selectImage005 = await driver.waitForComponent(ON.id("selectImage005"),500)
      await selectImage005.click()
      await Utils.sleep(1000)

      // 2.查找拖拽位置
      const richEditorDragOutPoint005 = await richEditorDragOut005.getBoundsCenter()
      const richEditorDropInPoint005 = await richEditorDropIn005.getBoundsCenter()
      let image005 = await driver.waitForComponent(ON.type('Image'),500)
      const imagePoint005 = await image005.getBoundsCenter()
      await driver.drag(imagePoint005.x,imagePoint005.y,richEditorDropInPoint005.x,richEditorDropInPoint005.y,2000)
      await Utils.sleep(2000)
      await windowSnap.snapShot("testability/pages/component/text/UiComponentTextRichEditorOnDragStart/UiComponentTextRichEditorOnDragStart005")
      await Utils.sleep(1000)
      done();
    })

    /*

    @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONDRAGSTART_006
    @tc.name : Drag images and text in RichEditor component into the edge hot zone with the mouse
    @tc.type : Function
    @tc.size : UiTest
    @tc.level : 3
    */
    it ("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONDRAGSTART_006", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow ("testability/pages/component/text/UiComponentTextRichEditorOnDragStart/UiComponentTextRichEditorOnDragStart006")
      await Utils.sleep (1000)
      let driver = await Driver.create ()
      // 1. 查找预备拖出组件，添加预设图文并选择
      let richEditorDragOut006 = await driver.waitForComponent (ON.id ("richEditorDragOut006"),500)
      let richEditorDropIn006 = await driver.waitForComponent (ON.id ("richEditorDropIn006"),500)
      let addSpanBtn006 = await driver.waitForComponent (ON.id ("addSpanBtn006"),500)
      await addSpanBtn006.click ()
      await richEditorDragOut006.click ()

      let selectImage006 = await driver.waitForComponent(ON.id("selectImage006"),500)
      await selectImage006.click()
      await Utils.sleep(1000)

      // 2. 查找拖拽位置
      const richEditorDragOutPoint006 = await richEditorDragOut006.getBoundsCenter ()
      const richEditorDropInPoint006 = await richEditorDropIn006.getBoundsCenter ()

      await driver.drag (richEditorDragOutPoint006.x-30,richEditorDragOutPoint006.y-30,richEditorDropInPoint006.x,richEditorDropInPoint006.y,2000)
      await Utils.sleep (2000)
      await windowSnap.snapShot ("testability/pages/component/text/UiComponentTextRichEditorOnDragStart/UiComponentTextRichEditorOnDragStart006")
      await Utils.sleep (1000)
      done ();
    })


  })
}
