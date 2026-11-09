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

export default function UiComponentTextRichEditorBuilderSpanDrag() {
  describe('UiComponentTextRichEditorBuilderSpanDrag', () => {
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
      await Utils.sleep(3000);
      done()
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BUILDERSPANDRAG_0005
        * @tc.name   : Drag builderSpan bound to onDragStart
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BUILDERSPANDRAG_0005", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorBuilderSpanDrag/UiComponentTextRichEditorBuilderSpanDrag0005")
      let driver = await Driver.create()

      // 1、等待组件加载完成
      let rich_editor_builderspandrag_0005 = await driver.waitForComponent(ON.id("rich_editor_builderspandrag_0005"), 10000)
      let button_builderspandrag_0005_addBuilder = await driver.waitForComponent(ON.id('button_builderspandrag_0005_addBuilder'), 10000)
      let button_builderspandrag_0005_select = await driver.waitForComponent(ON.id('button_builderspandrag_0005_select'), 10000)

      // 2、执行测试操作
      await button_builderspandrag_0005_addBuilder.click()
      await Utils.sleep(1000)
      let point = await rich_editor_builderspandrag_0005.getBoundsCenter()
      await button_builderspandrag_0005_select.click()
      await Utils.sleep(1000)
      
      // 3、执行拖拽操作
      await driver.drag(point.x, point.y, point.x + 300, point.y - 100, 200);
      await Utils.sleep(1000)
      
      // 4、截图并等待
      windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BUILDERSPANDRAG_0005_01")
      await Utils.sleep(2000)
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BUILDERSPANDRAG_0001
        * @tc.name   : Drag builderSpan set by Image, Text, Row components
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BUILDERSPANDRAG_0001", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorBuilderSpanDrag/UiComponentTextRichEditorBuilderSpanDrag0001")
      let driver = await Driver.create()

      // 1、等待组件加载完成
      let rich_editor_builderspandrag_0001 = await driver.waitForComponent(ON.id("rich_editor_builderspandrag_0001"), 10000)
      let button_builderspandrag_0001_addBuilder = await driver.waitForComponent(ON.id('button_builderspandrag_0001_addBuilder'), 10000)
      let button_builderspandrag_0001_select = await driver.waitForComponent(ON.id('button_builderspandrag_0001_select'), 10000)

      // 2、执行测试操作
      await button_builderspandrag_0001_addBuilder.click()
      await Utils.sleep(1000)
      let point = await rich_editor_builderspandrag_0001.getBoundsCenter()
      await button_builderspandrag_0001_select.click()
      await Utils.sleep(1000)
      
      // 3、执行拖拽操作
      await driver.drag(point.x, point.y, point.x + 300, point.y - 100, 200);
      await Utils.sleep(1000)
      
      // 4、截图并等待
      windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BUILDERSPANDRAG_0001_01")
      await Utils.sleep(3000)
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BUILDERSPANDRAG_0006
        * @tc.name   : Long press and drag single/multiple builderspan in mixed text and image layout
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BUILDERSPANDRAG_0006", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorBuilderSpanDrag/UiComponentTextRichEditorBuilderSpanDrag0006")
      let driver = await Driver.create()

      // 1、等待组件加载完成
      let rich_editor_builderspandrag_0006 = await driver.waitForComponent(ON.id("rich_editor_builderspandrag_0006"), 10000)
      let button_builderspandrag_0006_addBuilder = await driver.waitForComponent(ON.id('button_builderspandrag_0006_addBuilder'), 10000)
      let button_builderspandrag_0006_select = await driver.waitForComponent(ON.id('button_builderspandrag_0006_select'), 10000)

      // 2、执行测试操作
      await button_builderspandrag_0006_addBuilder.click()
      await Utils.sleep(1000)
      let point = await rich_editor_builderspandrag_0006.getBoundsCenter()
      await button_builderspandrag_0006_select.click()
      await Utils.sleep(1000)
      
      // 3、执行拖拽操作
      await driver.drag(point.x, point.y, point.x + 300, point.y - 100, 200);
      await Utils.sleep(1000)
      
      // 4、截图并等待
      windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BUILDERSPANDRAG_0006_01")
      await Utils.sleep(3000)
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BUILDERSPANDRAG_0003
        * @tc.name   : Drag builderSpan within component
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BUILDERSPANDRAG_0003", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorBuilderSpanDrag/UiComponentTextRichEditorBuilderSpanDrag0003")
      let driver = await Driver.create()

      // 1、等待组件加载完成
      let rich_editor_builderspandrag_0003 = await driver.waitForComponent(ON.id("rich_editor_builderspandrag_0003"), 10000)
      let button_builderspandrag_0003_addBuilder = await driver.waitForComponent(ON.id('button_builderspandrag_0003_addBuilder'), 10000)
      let button_builderspandrag_0003_select = await driver.waitForComponent(ON.id('button_builderspandrag_0003_select'), 10000)

      // 2、执行测试操作
      await button_builderspandrag_0003_addBuilder.click()
      await Utils.sleep(1000)
      let point = await rich_editor_builderspandrag_0003.getBoundsCenter()
      await button_builderspandrag_0003_select.click()
      await Utils.sleep(1000)
      
      // 3、执行拖拽操作
      await driver.drag(point.x, point.y, point.x + 300, point.y - 100, 200);
      await Utils.sleep(1000)
      
      // 4、截图并等待
      windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BUILDERSPANDRAG_0003_01")
      await Utils.sleep(3000)
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BUILDERSPANDRAG_0004
        * @tc.name   : Drag builderSpan outside component and release
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BUILDERSPANDRAG_0004", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorBuilderSpanDrag/UiComponentTextRichEditorBuilderSpanDrag0004")
      let driver = await Driver.create()

      // 1、等待组件加载完成
      let rich_editor_builderspandrag_0004 = await driver.waitForComponent(ON.id("rich_editor_builderspandrag_0004"), 10000)
      let button_builderspandrag_0004_addBuilder = await driver.waitForComponent(ON.id('button_builderspandrag_0004_addBuilder'), 10000)
      let button_builderspandrag_0004_select = await driver.waitForComponent(ON.id('button_builderspandrag_0004_select'), 10000)

      // 2、执行测试操作
      await button_builderspandrag_0004_addBuilder.click()
      await Utils.sleep(1000)
      let point = await rich_editor_builderspandrag_0004.getBoundsCenter()
      await button_builderspandrag_0004_select.click()
      await Utils.sleep(1000)
      
      // 3、执行拖拽操作
      await driver.drag(point.x, point.y, point.x + 300, point.y - 100, 200);
      await Utils.sleep(1000)
      
      // 4、截图并等待
      windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BUILDERSPANDRAG_0004_01")
      await Utils.sleep(3000)
      done();
    })

  })
}
