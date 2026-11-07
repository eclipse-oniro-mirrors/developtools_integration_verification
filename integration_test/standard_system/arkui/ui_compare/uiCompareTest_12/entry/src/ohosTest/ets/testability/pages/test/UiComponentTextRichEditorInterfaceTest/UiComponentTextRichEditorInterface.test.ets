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
import { Component, Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'
import { KeyCode } from '@kit.InputKit'

export default function UiComponentTextRichEditorInterface() {
  describe('UiComponentTextRichEditorInterface', () => {
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
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0031
        * @tc.name   : Using getSpans within the aboutToIMEInput callback can accurately obtain span information.
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 2
        * @tc.steps  : (1)在 Richeditor 组件 aboutToIMEInput 内设置：console.log(JSON.stringify(this.controller.getSpans({ start: -1, end: -1 })))
        *              (2)在 Richeditor 组件内输入内容，触发 aboutToIMEInput 回调
        *              (3)检查 log 信息，能准确获取到 span 信息
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0031", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorInterface_12/UiComponentTextRichEditorInterface0031")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      
      // 先添加文本内容
      let addTextBtn0031 = await driver.waitForComponent(ON.id("addTextBtn0031"),500)
      await addTextBtn0031.click()
      await Utils.sleep(500)
      
      // 测试手动getSpans功能
      let testSpansBtn0031 = await driver.waitForComponent(ON.id("testSpansBtn0031"),500)
      await testSpansBtn0031.click()
      await Utils.sleep(500)
      // 截图：手动测试getSpans功能后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0031_01")
      await Utils.sleep(1000)
      
      // 尝试通过点击RichEditor并输入来触发aboutToIMEInput回调
      let richEditor0031 = await driver.waitForComponent(ON.id("richEditor0031"),500)
      await richEditor0031.click()
      await Utils.sleep(200)
      await richEditor0031.inputText("测试输入",{addition:true})
      await Utils.sleep(1000)
      // 截图：输入内容后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0031_02")
      await Utils.sleep(1000)
      
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0032
        * @tc.name   : Using getCaretOffset within the aboutToIMEInput callback can accurately obtain the cursor position before input.
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 2
        * @tc.steps  : (1)在 Richeditor 组件 aboutToIMEInput 内设置：console.log(JSON.stringify(this.controller.getCaretOffset()))
        *              (2)在 Richeditor 组件内输入内容，触发 aboutToIMEInput 回调
        *              (3)检查 log 信息，能准确获取到输入前光标位置
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0032", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorInterface_12/UiComponentTextRichEditorInterface0032")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      
      // 先添加文本内容
      let addTextBtn0032 = await driver.waitForComponent(ON.id("addTextBtn0032"),500)
      await addTextBtn0032.click()
      await Utils.sleep(500)
      
      // 测试手动getCaretOffset功能
      let testCaretBtn0032 = await driver.waitForComponent(ON.id("testCaretBtn0032"),500)
      await testCaretBtn0032.click()
      await Utils.sleep(500)
      // 截图：手动测试getCaretOffset功能后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0032_01")
      await Utils.sleep(1000)
      
      // 尝试通过点击RichEditor并输入来触发aboutToIMEInput回调
      let richEditor0032 = await driver.waitForComponent(ON.id("richEditor0032"),500)
      await richEditor0032.click()
      await Utils.sleep(200)
      await richEditor0032.inputText("测试输入",{addition:true})
      await Utils.sleep(1000)
      // 截图：输入内容后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0032_02")
      await Utils.sleep(1000)
      
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0033
        * @tc.name   : Using getParagraphs within the aboutToIMEInput callback can accurately obtain paragraph styles and range information before input.
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 2
        * @tc.steps  : (1)在 Richeditor 组件 aboutToIMEInput 内设置：console.log(JSON.stringify(this.controller.getParagraphs({ start: -1, end: -1 })))
        *              (2)在 Richeditor 组件内输入内容，触发 aboutToIMEInput 回调
        *              (3)检查 log 信息，能准确获取到输入前段落样式和范围信息
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0033", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorInterface_12/UiComponentTextRichEditorInterface0033")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      
      // 先添加文本内容
      let addTextBtn0033 = await driver.waitForComponent(ON.id("addTextBtn0033"),500)
      await addTextBtn0033.click()
      await Utils.sleep(500)
      
      // 测试手动getParagraphs功能
      let testParagraphsBtn0033 = await driver.waitForComponent(ON.id("testParagraphsBtn0033"),500)
      await testParagraphsBtn0033.click()
      await Utils.sleep(500)
      // 截图：手动测试getParagraphs功能后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0033_01")
      await Utils.sleep(1000)
      
      // 尝试通过点击RichEditor并输入来触发aboutToIMEInput回调
      let richEditor0033 = await driver.waitForComponent(ON.id("richEditor0033"),500)
      await richEditor0033.click()
      await Utils.sleep(200)
      await richEditor0033.inputText("测试输入",{addition:true})
      await Utils.sleep(1000)
      // 截图：输入内容后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0033_02")
      await Utils.sleep(1000)
      
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0037
        * @tc.name   : Using getSpans within the aboutToDelete callback can accurately obtain span information before deletion.
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 2
        * @tc.steps  : (1)在 Richeditor 组件 aboutToDelete 内设置：console.log(JSON.stringify(this.controller.getSpans({ start: -1, end: -1 })))
        *              (2)在 Richeditor 组件内删除内容，触发 aboutToDelete 回调
        *              (3)检查 log 信息，能准确获取到删除前 span 信息
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0037", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorInterface_12/UiComponentTextRichEditorInterface0037")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      
      // 先添加文本内容
      let addTextBtn0037 = await driver.waitForComponent(ON.id("addTextBtn0037"),500)
      await addTextBtn0037.click()
      await Utils.sleep(500)
      
      // 测试手动getSpans功能
      let testSpansBtn0037 = await driver.waitForComponent(ON.id("testSpansBtn0037"),500)
      await testSpansBtn0037.click()
      await Utils.sleep(500)
      // 截图：手动测试getSpans功能后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0037_01")
      await Utils.sleep(1000)
      
      // 然后删除内容，触发aboutToDelete回调
      let deleteTextBtn0037 = await driver.waitForComponent(ON.id("deleteTextBtn0037"),500)
      await deleteTextBtn0037.click()
      await Utils.sleep(1000)
      // 截图：删除内容后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0037_02")
      await Utils.sleep(1000)
      
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0038
        * @tc.name   : Using getCaretOffset within the aboutToDelete callback can accurately obtain the cursor position before deletion.
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 2
        * @tc.steps  : (1)在 Richeditor 组件 aboutToDelete 内设置：console.log(JSON.stringify(this.controller.getCaretOffset()))
        *              (2)在 Richeditor 组件内删除内容，触发 aboutToDelete 回调
        *              (3)检查 log 信息，能准确获取到删除前光标位置
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0038", Level.LEVEL2, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorInterface_12/UiComponentTextRichEditorInterface0038")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      
      // 先添加文本内容
      let addTextBtn0038 = await driver.waitForComponent(ON.id("addTextBtn0038"),500)
      await addTextBtn0038.click()
      await Utils.sleep(500)
      
      // 测试手动getCaretOffset功能
      let testCaretBtn0038 = await driver.waitForComponent(ON.id("testCaretBtn0038"),500)
      await testCaretBtn0038.click()
      await Utils.sleep(500)
      // 截图：手动测试getCaretOffset功能后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0038_01")
      await Utils.sleep(1000)
      
      // 然后删除内容，触发aboutToDelete回调
      let deleteTextBtn0038 = await driver.waitForComponent(ON.id("deleteTextBtn0038"),500)
      await deleteTextBtn0038.click()
      await Utils.sleep(1000)
      // 截图：删除内容后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0038_02")
      await Utils.sleep(1000)
      
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0039
        * @tc.name   : Using getParagraphs within the aboutToDelete callback can accurately obtain the paragraph styles and range information before deletion.
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0039", Level.LEVEL2, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorInterface_12/UiComponentTextRichEditorInterface0039")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      
      // 先添加文本内容
      let addTextBtn0039 = await driver.waitForComponent(ON.id("addTextBtn0039"),500)
      await addTextBtn0039.click()
      await Utils.sleep(500)
      
      // 然后删除内容，触发aboutToDelete回调
      let deleteTextBtn0039 = await driver.waitForComponent(ON.id("deleteTextBtn0039"),500)
      await deleteTextBtn0039.click()
      // 等待2000ms让用户看到控制台输出在界面上的显示
      await Utils.sleep(2000)
      
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0042
        * @tc.name   : Using getParagraphs within the onDeleteComplete callback can accurately obtain paragraph styles and range information.
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 2
        * @tc.steps  : (1)在 Richeditor 组件 onDeleteComplete 内设置：console.log(JSON.stringify(this.controller.getParagraphs({ start: -1, end: -1 })))
        *              (2)在 Richeditor 组件内删除内容，触发 onDeleteComplete 回调
        *              (3)检查 log 信息，能准确获取到段落样式和范围信息
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0042", Level.LEVEL2, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorInterface_12/UiComponentTextRichEditorInterface0042")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      
      // 先添加文本内容
      let addTextBtn0042 = await driver.waitForComponent(ON.id("addTextBtn0042"),500)
      await addTextBtn0042.click()
      await Utils.sleep(500)
      
      // 测试手动getParagraphs功能
      let testParagraphsBtn0042 = await driver.waitForComponent(ON.id("testParagraphsBtn0042"),500)
      await testParagraphsBtn0042.click()
      await Utils.sleep(500)
      // 截图：手动测试getParagraphs功能后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0042_01")
      await Utils.sleep(1000)
      
      // 然后删除内容，触发onDeleteComplete回调
      let deleteTextBtn0042 = await driver.waitForComponent(ON.id("deleteTextBtn0042"),500)
      await deleteTextBtn0042.click()
      await Utils.sleep(1000)
      // 截图：删除内容后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0042_02")
      await Utils.sleep(1000)
      
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0064
        * @tc.name   : updateSpanStyle updates text, image or SymbolSpan styles with range boundaries falling in the middle of elements with length greater than 1.
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 2
        * @tc.steps  : (1)richeidtor 添加一段包含 emoji 和 symbol 的图文混合内容
        *              (2)调用 updateSpanStyle 更新文本、图片或 SymbolSpan 样式，范围边界分别落在 emoji 和 symbol 中间
        *              (3)可以正确更新文本、图片或 SymbolSpan 样式，无 crash 现象
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0064", Level.LEVEL2, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorInterface_12/UiComponentTextRichEditorInterface0064")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      
      // 先添加包含emoji和symbol的图文混合内容
      let addContentBtn0064 = await driver.waitForComponent(ON.id("addContentBtn0064"),500)
      await addContentBtn0064.click()
      await Utils.sleep(500)
      // 截图：添加内容后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0064_01")
      await Utils.sleep(1000)
      
      // 然后测试边界更新
      let updateStyleBtn0064 = await driver.waitForComponent(ON.id("updateStyleBtn0064"),500)
      await updateStyleBtn0064.click()
      await Utils.sleep(1000)
      // 截图：边界更新测试后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0064_02")
      await Utils.sleep(1000)
      
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0077
        * @tc.name   : Using updateSpanStyle within the aboutToIMEInput callback to update text, image or SymbolSpan styles.
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 2
        * @tc.steps  : (1)在 aboutToIMEInput 回调内调用 updateSpanStyle，更新指定范围内的文本、图片或 SymbolSpan 样式
        *              (2)输入文本内容触发 aboutToIMEInput 回调
        *              (3)执行 updateSpanStyle，指定范围内（不包括此次输入）的文本、图片或 SymbolSpan 样式被更新，且更新后的样式符合预期
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0077", Level.LEVEL2, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorInterface_12/UiComponentTextRichEditorInterface0077")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      
      // 先添加图文混合内容
      let addContentBtn0077 = await driver.waitForComponent(ON.id("addContentBtn0077"),500)
      await addContentBtn0077.click()
      await Utils.sleep(500)
      
      // 测试手动updateSpanStyle功能
      let testUpdateStyleBtn0077 = await driver.waitForComponent(ON.id("testUpdateStyleBtn0077"),500)
      await testUpdateStyleBtn0077.click()
      await Utils.sleep(500)
      // 截图：手动测试updateSpanStyle功能后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0077_01")
      await Utils.sleep(1000)
      
      // 尝试通过点击RichEditor并输入来触发aboutToIMEInput回调
      let richEditor0077 = await driver.waitForComponent(ON.id("richEditor0077"),500)
      await richEditor0077.click()
      await Utils.sleep(200)
      await richEditor0077.inputText("测试输入",{addition:true})
      await Utils.sleep(1000)
      // 截图：输入内容后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0077_02")
      await Utils.sleep(1000)
      
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0078
        * @tc.name   : Using updateSpanStyle within the aboutToDelete callback to update text, image or SymbolSpan styles.
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 2
        * @tc.steps  : (1)在 aboutToDelete 回调内调用 updateSpanStyle，更新指定范围内的文本、图片或 SymbolSpan 样式
        *              (2)输入法删除文本内容触发 aboutToDelete 回调
        *              (3)执行 updateSpanStyle，指定范围内（不包括此次删除）的文本、图片或 SymbolSpan 样式被更新，且更新后的样式符合预期
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0078", Level.LEVEL2, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorInterface_12/UiComponentTextRichEditorInterface0078")
      await Utils.sleep(1000)
      let driver = await Driver.create()
      
      // 先添加图文混合内容
      let addContentBtn0078 = await driver.waitForComponent(ON.id("addContentBtn0078"),500)
      await addContentBtn0078.click()
      await Utils.sleep(500)
      
      // 测试手动updateSpanStyle功能
      let testUpdateStyleBtn0078 = await driver.waitForComponent(ON.id("testUpdateStyleBtn0078"),500)
      await testUpdateStyleBtn0078.click()
      await Utils.sleep(500)
      // 截图：手动测试updateSpanStyle功能后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0078_01")
      await Utils.sleep(1000)
      
      // 然后删除内容，触发aboutToDelete回调
      let deleteTextBtn0078 = await driver.waitForComponent(ON.id("deleteTextBtn0078"),500)
      await deleteTextBtn0078.click()
      await Utils.sleep(1000)
      // 截图：删除内容后
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0078_02")
      await Utils.sleep(1000)
      
      done();
    })

  })
}
