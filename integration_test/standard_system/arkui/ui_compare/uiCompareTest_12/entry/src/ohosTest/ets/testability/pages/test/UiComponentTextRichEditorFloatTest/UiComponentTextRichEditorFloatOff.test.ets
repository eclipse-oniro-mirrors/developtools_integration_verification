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
import { Driver, MouseButton, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'

export default function UiComponentTextRichEditorFloatOff() {
  describe('UiComponentTextRichEditorFloatOff', () => {
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
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0006
        * @tc.name   : When the background color is gray, long press, release to cancel, then long press again
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0006", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorFloatOff/UiComponentTextRichEditorFloatOff0006")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      //  1.添加预置图文
      let addSpanBtn0006 = await driver.waitForComponent(ON.id("addSpanBtn0006"), 500)
      await addSpanBtn0006.click()
      let richEditor0006 = await driver.waitForComponent(ON.id("richEditor0006"), 500)

      // 2.选中
      await richEditor0006.longClick()
      let selectAll0006 = await driver.waitForComponent(ON.text("全选"), 500)
      await selectAll0006.click()

      // 3. 长按截图
      await richEditor0006.longClick()
      await Utils.sleep(2000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0006_01")
      await Utils.sleep(1000)
      await richEditor0006.longClick()
      await Utils.sleep(2000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0006_02")
      await Utils.sleep(1000)

      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0010
        * @tc.name   : The effect when the mouse is long pressed
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
    */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0010", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorFloatOff/UiComponentTextRichEditorFloatOff0010")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      //  1.添加预置图文
      let addSpanBtn0010 = await driver.waitForComponent(ON.id("addSpanBtn0010"), 500)
      await addSpanBtn0010.click()
      let richEditor0010 = await driver.waitForComponent(ON.id("richEditor0010"), 500)

      // 2.选中
      await richEditor0010.longClick()
      let selectAll0010 = await driver.waitForComponent(ON.text("全选"), 500)
      await selectAll0010.click()

      // 3. 长按截图
      let richEditorPoint0010 = await richEditor0010.getBoundsCenter()
      await driver.mouseLongClick({ x: richEditorPoint0010.x, y: richEditorPoint0010.y - 70 },
        MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(2000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0010_01")
      await Utils.sleep(1000)
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0011
        * @tc.name   : Floating effect of selecting all ultra-long text
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0011", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorFloatOff/UiComponentTextRichEditorFloatOff0011")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      //  1.添加预置图文
      let addSpanBtn0011 = await driver.waitForComponent(ON.id("addSpanBtn0011"), 500)
      await addSpanBtn0011.click()
      let richEditor0011 = await driver.waitForComponent(ON.id("richEditor0011"), 500)

      // 2.选中
      await richEditor0011.longClick()
      let selectAll0011 = await driver.waitForComponent(ON.text("全选"), 500)
      await selectAll0011.click()

      // 3. 长按截图
      await richEditor0011.longClick()
      await Utils.sleep(2000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0011_01")
      await Utils.sleep(1000)
      await richEditor0011.longClick()
      await Utils.sleep(2000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0011_02")
      await Utils.sleep(1000)

      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0001
        * @tc.name   : Long press and drag plain text
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0001", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorFloatOff/UiComponentTextRichEditorFloatOff0001")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      //  1.添加预置图文
      let addSpanBtn0001 = await driver.waitForComponent(ON.id("addSpanBtn0001"), 500)
      await addSpanBtn0001.click()
      let richEditor0001 = await driver.waitForComponent(ON.id("richEditor0001"), 500)

      // 2.选中
      await richEditor0001.longClick()
      await Utils.sleep(1000)
      let selectAll0001 = await driver.waitForComponent(ON.text("全选"), 500)
      await selectAll0001.click()

      // 3. 长按截图
      await richEditor0001.longClick()
      await Utils.sleep(2000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0001_01")
      await Utils.sleep(1000)
      done();
    })


    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0008
        * @tc.name   : Floating effect of long press when there are multiple lines of spaces
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0008", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorFloatOff/UiComponentTextRichEditorFloatOff0008")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      //  1.添加预置图文（包含多行空格）
      let addSpanBtn0008 = await driver.waitForComponent(ON.id("addSpanBtn0008"), 500)
      await addSpanBtn0008.click()
      let richEditor0008 = await driver.waitForComponent(ON.id("richEditor0008"), 500)

      // 2.选中
      await richEditor0008.longClick()
      let selectAll0008 = await driver.waitForComponent(ON.text("全选"), 500)
      await selectAll0008.click()

      // 3. 长按截图（验证空格区域的浮起效果）
      await richEditor0008.longClick()
      await Utils.sleep(2000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0008_01")
      await Utils.sleep(1000)
      await richEditor0008.longClick()
      await Utils.sleep(2000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0008_02")
      await Utils.sleep(1000)

      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0002
        * @tc.name   : Long press and drag the image
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
    */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0002", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorFloatOff/UiComponentTextRichEditorFloatOff0002")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      //  1.添加预置图文（包含图片）
      let addSpanBtn0002 = await driver.waitForComponent(ON.id("addSpanBtn0002"), 500)
      await addSpanBtn0002.click()
      let richEditor0002 = await driver.waitForComponent(ON.id("richEditor0002"), 500)

      // 2.选中
      let select0002 = await driver.waitForComponent(ON.id("select0002"),500)
      await select0002.click()

      // 3. 长按拖拽图片并截图
      await richEditor0002.longClick()
      await Utils.sleep(2000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0002_01")
      await Utils.sleep(1000)
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0007
        * @tc.name   : Long press on text/image/mixed text and image content when dragging is disabled
        * @type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
    */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0007", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorFloatOff/UiComponentTextRichEditorFloatOff0007")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      //  1.添加预置内容（文本/图片/图文混合）
      let addSpanBtn0007 = await driver.waitForComponent(ON.id("addSpanBtn0007"), 500)
      await addSpanBtn0007.click()
      let richEditor0007 = await driver.waitForComponent(ON.id("richEditor0007"), 500)

      // 2.选中内容
      let select0007 = await driver.waitForComponent(ON.id("select0007"),500)
      await select0007.click()

      // 3. 禁止拖拽状态下长按内容并截图
      await richEditor0007.longClick()
      await Utils.sleep(2000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_floatoff_0007_01")
      await Utils.sleep(1000)
      done();
    })

  })
}
