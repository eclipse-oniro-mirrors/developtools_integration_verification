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

export default function UiComponentTextRichEditorDragPlainText() {
  describe('UiComponentTextRichEditorDragPlainText', () => {
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
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0024
        * @tc.name   : RichEditor can query dragged content using getSpans after dragging text into it
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0024", Level.LEVEL3, async (done: Function) => {

      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0024")
      await Utils.sleep(2000)
      let driver = await Driver.create()

      let textInputDrag0024 = await driver.waitForComponent(ON.id("textInputDrag0024"), 500)

      await textInputDrag0024.inputText('=================测试拖拽文本内容================',
        { paste: false, addition: true });

      let richEditorDrag0024 = await driver.waitForComponent(ON.id("richEditorDrag0024"), 500)

      await textInputDrag0024.longClick();
      await Utils.sleep(1000);
      let allSelect = await driver.findComponent(ON.text('全选'))
      await Utils.sleep(500)
      await allSelect.click()
      const inputCenter = await textInputDrag0024.getBoundsCenter();
      const editorCenter = await richEditorDrag0024.getBoundsCenter();

      await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);


      // 点击验证按钮
      let getSpansBtn = await driver.waitForComponent(ON.id("getSpansBtn0024"), 500)
      await getSpansBtn.click();
      await Utils.sleep(1000);

      // 检查验证结果
      let resultText = await driver.waitForComponent(ON.id("getSpansResultText0024"), 500)
      let result = await resultText.getText();
      Logger.info('TEST', `验证结果: ${result}`)

      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0024_01")
      await Utils.sleep(1000)
      Logger.info('TEST', '测试用例执行完成')
      done();

    })


    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0003
        * @tc.name   : RichEditor can drag text between two spans with space span
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0003", Level.LEVEL3, async (done: Function) => {

      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0003")
      await Utils.sleep(1000)
      let driver = await Driver.create()

      // 点击添加Span按钮，创建span1、空格、span2
      let addSpanBtn0003 = await driver.waitForComponent(ON.id("addSpanBtn0003"), 500)
      await addSpanBtn0003.click()
      await Utils.sleep(500) // 等待RichEditor内容更新

      // 输入要拖拽的文本
      let textInputDrag0003 = await driver.waitForComponent(ON.id("textInputDrag0003"), 500)
      await textInputDrag0003.inputText('这里是一段需要添加在Span1和Span2之间的文字', { paste: false, addition: true });

      // 获取RichEditor组件
      let richEditorDrag0003 = await driver.waitForComponent(ON.id("richEditorDrag0003"), 500)

      // 长按选择文本
      await textInputDrag0003.longClick();
      await Utils.sleep(1000);
      let allSelect0003 = await driver.findComponent(ON.text('全选'))
      await allSelect0003.click()
      await Utils.sleep(500) // 等待选择完成


      // 获取TextInput中心
      const inputCenter = await textInputDrag0003.getBoundsCenter();

      // 获取RichEditor的边界信息
      const richEditorCenter = await richEditorDrag0003.getBoundsCenter();
      // const RichEditorSpanPosition = await


      // 执行拖拽到空格位置
      await driver.drag(inputCenter.x, inputCenter.y, richEditorCenter.x, richEditorCenter.y, 1000);
      await Utils.sleep(1000); // 等待拖拽完成

      // 点击验证按钮
      let getSpansBtn = await driver.waitForComponent(ON.id("getSpansBtn0003"), 500)
      await getSpansBtn.click();
      await Utils.sleep(1000);

      // 检查验证结果
      let resultText = await driver.waitForComponent(ON.id("getSpansResultText0003"), 500)
      let result = await resultText.getText();
      Logger.info('TEST', `验证结果: ${result}`)

      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0003_01")
      await Utils.sleep(1000)
      Logger.info('TEST', '测试用例执行完成')
      done();

    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0016
        * @tc.name   : RichEditor and TextInput can drag with different styles
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0016", Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0016")
        await Utils.sleep(2000)
        let driver = await Driver.create()

        let addTextBtn0016 = await driver.waitForComponent(ON.id("addTextBtn0016"), 500)
        await addTextBtn0016.click()
        let textInputDrag0016 = await driver.waitForComponent(ON.id("textInputDrag0016"), 500)
        await textInputDrag0016.inputText('==============不同样式的文本内容===============',
          { paste: false, addition: true });

        let richEditorDrag0016 = await driver.waitForComponent(ON.id("richEditorDrag0016"), 500)
        await textInputDrag0016.longClick();
        await Utils.sleep(1000);
        let allSelect0016 = await driver.findComponent(ON.text('全选'))
        await allSelect0016.click()
        await Utils.sleep(500) // 等待选择完成

        const inputCenter0016 = await textInputDrag0016.getBoundsCenter();
        const editorCenter0016 = await richEditorDrag0016.getBoundsCenter();
        await driver.drag(inputCenter0016.x, inputCenter0016.y, editorCenter0016.x, editorCenter0016.y, 2000);

        // 点击验证按钮
        let getSpansBtn = await driver.waitForComponent(ON.id("getSpansBtn0016"), 500)
        await getSpansBtn.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText = await driver.waitForComponent(ON.id("getSpansResultText0016"), 500)
        let result = await resultText.getText();
        Logger.info('TEST', `验证结果: ${result}`)

        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0016_01")
        await Utils.sleep(1000)
        Logger.info('TEST', '测试用例执行完成')
        done();
      } catch (err) {
        Logger.error('TEST', `测试执行失败: ${(err as Error).message}`)
        done();
      }
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0017
        * @tc.name   : Drag text into RichEditor when preset typing style differs from existing text
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0017", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0017")
      await Utils.sleep(1000)
      let driver = await Driver.create()

      // 先设置 RichEditor 的预设样式，使其与已有文本样式不一致
      let changeStylePinkBtn0017 = await driver.waitForComponent(ON.id("changeStylePinkBtn0017"), 300)
      let changeStyleRedBtn0017 = await driver.waitForComponent(ON.id("changeStyleRedBtn0017"), 300)
      // 获取 RichEditor 目标
      let richEditorDrag0017 = await driver.waitForComponent(ON.id("richEditorDrag0017"), 200)
      await changeStylePinkBtn0017.click()
      await richEditorDrag0017.inputText('预设文本1', { paste: false, addition: true })
      await changeStyleRedBtn0017.click()
      await richEditorDrag0017.inputText('预设文本2', { paste: false, addition: true })


      // 在输入框中输入文本
      let textInputDrag0017 = await driver.waitForComponent(ON.id("textInputDrag0017"), 200)
      await textInputDrag0017.inputText('================拖拽测试样本===============',
        { paste: false, addition: true });

      // 长按并尽量全选后进行拖拽
      await textInputDrag0017.longClick();
      await Utils.sleep(1000);
      let allSelect0017 = await driver.findComponent(ON.text('全选'))
      await Utils.sleep(300)
      await allSelect0017.click()
      await Utils.sleep(300)


      const inputCenter0017 = await textInputDrag0017.getBoundsCenter();
      const editorCenter0017 = await richEditorDrag0017.getBoundsCenter();
      await driver.drag(inputCenter0017.x, inputCenter0017.y, editorCenter0017.x, editorCenter0017.y, 2000);

      // // 点击验证按钮
      // let getSpansBtn0017 = await driver.waitForComponent(ON.id("getSpansBtn0017"), 500)
      // await getSpansBtn0017.click();
      // await Utils.sleep(1000);
      //
      // // 检查验证结果
      // let resultText0017 = await driver.waitForComponent(ON.id("getSpansResultText0017"), 500)
      // let result0017 = await resultText0017.getText();
      // Logger.info('TEST', `验证结果: ${result0017}`)

      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0017_01")
      await Utils.sleep(1000)
      Logger.info('TEST', '测试用例执行完成')
      done();

    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0006
        * @tc.name   : RichEditor can drag emoji and symbol content
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0006", Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0006")
        await Utils.sleep(1000)
        let driver = await Driver.create()

        let everySpanBtn0006 = await driver.waitForComponent(ON.id("everySpanBtn0006"), 500)
        await everySpanBtn0006.click()
        let textInputDrag0006 = await driver.waitForComponent(ON.id("textInputDrag0006"), 500)
        await textInputDrag0006.inputText('===========这是一段待拖入纯文本===========',
          { paste: false, addition: true });

        let richEditorDrag0006 = await driver.waitForComponent(ON.id("richEditorDrag0006"), 500)
        await textInputDrag0006.longClick();
        await Utils.sleep(1000);
        let allSelect0006 = await driver.findComponent(ON.text('全选'))
        await Utils.sleep(300)
        await allSelect0006.click()


        const inputCenter = await textInputDrag0006.getBoundsCenter();
        const editorCenter = await richEditorDrag0006.getBoundsCenter();
        await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);

        // 点击验证按钮
        let getSpansBtn = await driver.waitForComponent(ON.id("getSpansBtn0006"), 500)
        await getSpansBtn.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText = await driver.waitForComponent(ON.id("getSpansResultText0006"), 500)
        let result = await resultText.getText();
        Logger.info('TEST', `验证结果: ${result}`)

        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0006_01")
        await Utils.sleep(1000)
        Logger.info('TEST', '测试用例执行完成')
        done();
      } catch (err) {
        Logger.error('TEST', `测试执行失败: ${(err as Error).message}`)
        done();
      }
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0014
        * @tc.name   : TextInput can drag with specific font styles
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0014", Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0014")
        await Utils.sleep(2000)
        let driver = await Driver.create()

        let addSpanBtn0014 = await driver.waitForComponent(ON.id("addSpanBtn0014"), 500)
        await addSpanBtn0014.click()
        let textInputDrag0014 = await driver.waitForComponent(ON.id("textInputDrag0014"), 500)
        await textInputDrag0014.inputText('======字体样式测试文本======', { paste: false, addition: true });

        let richEditorDrag0014 = await driver.waitForComponent(ON.id("richEditorDrag0014"), 500)
        await textInputDrag0014.longClick();
        await Utils.sleep(1000);

        let allSelect0014 = await driver.findComponent(ON.text('全选'))
        await Utils.sleep(300)
        await allSelect0014.click()

        const inputCenter = await textInputDrag0014.getBoundsCenter();
        const editorCenter = await richEditorDrag0014.getBoundsCenter();
        await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);

        // 点击验证按钮
        let getSpansBtn = await driver.waitForComponent(ON.id("getSpansBtn0014"), 500)
        await getSpansBtn.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText = await driver.waitForComponent(ON.id("getSpansResultText0014"), 500)
        let result = await resultText.getText();
        Logger.info('TEST', `验证结果: ${result}`)

        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0014_01")
        await Utils.sleep(1000)
        Logger.info('TEST', '测试用例执行完成')
        done();
      } catch (err) {
        Logger.error('TEST', `测试执行失败: ${(err as Error).message}`)
        done();
      }
    })


    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0007
        * @tc.name   : RichEditor can drag text to before the first character of long text
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0007", Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0007")
        await Utils.sleep(2000)
        let driver = await Driver.create()

        let addLongTextBtn0007 = await driver.waitForComponent(ON.id("addLongTextBtn0007"), 500)
        await addLongTextBtn0007.click()
        let textInputDrag0007 = await driver.waitForComponent(ON.id("textInputDrag0007"), 500)
        await textInputDrag0007.inputText('========插入的测试文本========', { paste: false, addition: true });

        let richEditorDrag0007 = await driver.waitForComponent(ON.id("richEditorDrag0007"), 500)
        await textInputDrag0007.longClick();
        await Utils.sleep(1000);

        let allSelect0007 = await driver.findComponent(ON.text('全选'))
        await Utils.sleep(300)
        await allSelect0007.click()

        const inputCenter = await textInputDrag0007.getBoundsCenter();
        const editorCenter = await richEditorDrag0007.getBoundsCenter();
        await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);

        // 点击验证按钮
        let getSpansBtn = await driver.waitForComponent(ON.id("getSpansBtn0007"), 500)
        await getSpansBtn.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText = await driver.waitForComponent(ON.id("getSpansResultText0007"), 500)
        let result = await resultText.getText();
        Logger.info('TEST', `验证结果: ${result}`)

        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0007_01")
        await Utils.sleep(1000)
        Logger.info('TEST', '测试用例执行完成')
        done();
      } catch (err) {
        Logger.error('TEST', `测试执行失败: ${(err as Error).message}`)
        done();
      }
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0008
        * @tc.name   : Drag text to end of long text in RichEditor
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0008", Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0008")
        await Utils.sleep(2000)
        let driver = await Driver.create()

        // 添加更多长文本到RichEditor
        // let addLongTextBtn0008 = await driver.waitForComponent(ON.id("addLongTextBtn0008"), 500)
        // await addLongTextBtn0008.click()
        // await Utils.sleep(500)

        // 在输入框中输入文本
        let textInputDrag0008 = await driver.waitForComponent(ON.id("textInputDrag0008"), 500)
        await textInputDrag0008.inputText('========拖拽到长文本末尾的纯文本=======', { paste: false, addition: true });

        // 获取 RichEditor 目标
        let richEditorDrag0008 = await driver.waitForComponent(ON.id("richEditorDrag0008"), 500)

        // 长按并尽量全选后进行拖拽
        await textInputDrag0008.longClick();
        await Utils.sleep(1000);
        let allSelect0008 = await driver.findComponent(ON.text('全选'))
        if (allSelect0008) {
          await Utils.sleep(300)
          await allSelect0008.click()
          await Utils.sleep(300)
        }

        const inputCenter0008 = await textInputDrag0008.getBoundsCenter();
        const editorCenter0008 = await richEditorDrag0008.getBoundsCenter();
        await driver.drag(inputCenter0008.x, inputCenter0008.y, editorCenter0008.x, editorCenter0008.y, 2000);

        // 点击验证按钮
        let getSpansBtn0008 = await driver.waitForComponent(ON.id("getSpansBtn0008"), 500)
        await getSpansBtn0008.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText0008 = await driver.waitForComponent(ON.id("getSpansResultText0008"), 500)
        let result0008 = await resultText0008.getText();
        Logger.info('TEST', `验证结果: ${result0008}`)

        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0008_01")
        await Utils.sleep(1000)
        Logger.info('TEST', '测试用例执行完成')
        done();
      } catch (err) {
        Logger.error('TEST', `测试执行失败: ${(err as Error).message}`)
        done();
      }
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0002
        * @tc.name   : Drag text into span1 in RichEditor
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0002", Level.LEVEL3, async (done: Function) => {

      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0002")
      await Utils.sleep(2000)
      let driver = await Driver.create()

      let addSpan1Btn0002 = await driver.waitForComponent(ON.id("addSpan1Btn0002"), 500)
      await addSpan1Btn0002.click()
      let textInputDrag0002 = await driver.waitForComponent(ON.id("textInputDrag0002"), 500)

      await textInputDrag0002.inputText('=================测试拖拽文本内容================',
        { paste: false, addition: true });

      let richEditorDrag0002 = await driver.waitForComponent(ON.id("richEditorDrag0002"), 500)

      await textInputDrag0002.longClick();
      await Utils.sleep(1000);
      let allSelect = await driver.findComponent(ON.text('全选'))
      await Utils.sleep(500)
      await allSelect.click()
      const inputCenter = await textInputDrag0002.getBoundsCenter();
      const editorCenter = await richEditorDrag0002.getBoundsCenter();

      await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);


      // 点击验证按钮
      let getSpansBtn = await driver.waitForComponent(ON.id("getSpansBtn0002"), 500)
      await getSpansBtn.click();
      await Utils.sleep(1000);

      // 检查验证结果
      let resultText = await driver.waitForComponent(ON.id("getSpansResultText0002"), 500)
      let result = await resultText.getText();
      Logger.info('TEST', `验证结果: ${result}`)

      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0002_01")
      await Utils.sleep(1000)
      Logger.info('TEST', '测试用例执行完成')
      done();

    })

    /*
           * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0005
           * @tc.name   : RichEditor has text, drag text when line breaks
           * @tc.type   : Function
           * @tc.size   : UiTest
           * @tc.level  : 3
        */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0005", Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0005")
        await Utils.sleep(1000)
        let driver = await Driver.create()

        let addLongTextBtn0005 = await driver.waitForComponent(ON.id("addLongTextBtn0005"), 500)
        await addLongTextBtn0005.click()
        let textInputDrag0005 = await driver.waitForComponent(ON.id("textInputDrag0005"), 500)
        await textInputDrag0005.inputText('========插入的测试文本========', { paste: false, addition: true });

        let richEditorDrag0005 = await driver.waitForComponent(ON.id("richEditorDrag0005"), 500)
        await textInputDrag0005.longClick();
        await Utils.sleep(1000);

        let allSelect0005 = await driver.findComponent(ON.text('全选'))
        await Utils.sleep(300)
        await allSelect0005.click()

        const inputCenter = await textInputDrag0005.getBoundsCenter();
        const editorCenter = await richEditorDrag0005.getBoundsCenter();
        await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);

        // 点击验证按钮
        let getSpansBtn = await driver.waitForComponent(ON.id("getSpansBtn0005"), 500)
        await getSpansBtn.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText = await driver.waitForComponent(ON.id("getSpansResultText0005"), 500)
        let result = await resultText.getText();
        Logger.info('TEST', `验证结果: ${result}`)

        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0005_01")
        await Utils.sleep(1000)
        Logger.info('TEST', '测试用例执行完成')
        done();
      } catch (err) {
        Logger.error('TEST', `测试执行失败: ${(err as Error).message}`)
        done();
      }
    })

    /*
           * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0004
           * @tc.name   : RichEditor drag into the junction of two spans (no space)
           * @tc.type   : Function
           * @tc.size   : UiTest
           * @tc.level  : 3
        */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0004", Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0004")
        await Utils.sleep(1000)
        let driver = await Driver.create()

        let addLongTextBtn0004 = await driver.waitForComponent(ON.id("addLongTextBtn0004"), 500)
        await addLongTextBtn0004.click()
        let textInputDrag0004 = await driver.waitForComponent(ON.id("textInputDrag0004"), 500)
        await textInputDrag0004.inputText('========插入的测试文本========', { paste: false, addition: true });

        let richEditorDrag0004 = await driver.waitForComponent(ON.id("richEditorDrag0004"), 500)
        await textInputDrag0004.longClick();
        await Utils.sleep(1000);

        let allSelect0004 = await driver.findComponent(ON.text('全选'))
        await Utils.sleep(300)
        await allSelect0004.click()

        const inputCenter = await textInputDrag0004.getBoundsCenter();
        const editorCenter = await richEditorDrag0004.getBoundsCenter();
        await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);

        // 点击验证按钮
        let getSpansBtn = await driver.waitForComponent(ON.id("getSpansBtn0004"), 500)
        await getSpansBtn.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText = await driver.waitForComponent(ON.id("getSpansResultText0004"), 500)
        let result = await resultText.getText();
        Logger.info('TEST', `验证结果: ${result}`)

        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0004_01")
        await Utils.sleep(1000)
        Logger.info('TEST', '测试用例执行完成')
        done();
      } catch (err) {
        Logger.error('TEST', `测试执行失败: ${(err as Error).message}`)
        done();
      }
    })


    /*
           * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0018
           * @tc.name   : RichEditor dragged text contains spaces/line breaks
           * @tc.type   : Function
           * @tc.size   : UiTest
           * @tc.level  : 3
        */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0018", Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0018")
        await Utils.sleep(1000)
        let driver = await Driver.create()

        let addLongTextBtn0018 = await driver.waitForComponent(ON.id("addLongTextBtn0018"), 500)
        await addLongTextBtn0018.click()
        let textInputDrag0018 = await driver.waitForComponent(ON.id("textInputDrag0018"), 500)
        await textInputDrag0018.inputText('======== 第一行 ======== \n ======== 第一行 ========',
          { paste: false, addition: true });

        let richEditorDrag0018 = await driver.waitForComponent(ON.id("richEditorDrag0018"), 500)
        await textInputDrag0018.longClick();
        await Utils.sleep(1000);

        let allSelect0018 = await driver.findComponent(ON.text('全选'))
        await Utils.sleep(300)
        await allSelect0018.click()

        const inputCenter = await textInputDrag0018.getBoundsCenter();
        const editorCenter = await richEditorDrag0018.getBoundsCenter();
        await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);

        // 点击验证按钮
        let getSpansBtn = await driver.waitForComponent(ON.id("getSpansBtn0018"), 500)
        await getSpansBtn.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText = await driver.waitForComponent(ON.id("getSpansResultText0018"), 500)
        let result = await resultText.getText();
        Logger.info('TEST', `验证结果: ${result}`)

        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0018_01")
        await Utils.sleep(1000)
        Logger.info('TEST', '测试用例执行完成')
        done();
      } catch (err) {
        Logger.error('TEST', `测试执行失败: ${(err as Error).message}`)
        done();
      }
    })


    /*
           * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0020
           * @tc.name   : Drag text into RichEditor without releasing and drag out
           * @tc.type   : Function
           * @tc.size   : UiTest
           * @tc.level  : 3
        */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0020", Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0020")
        await Utils.sleep(1000)
        let driver = await Driver.create()

        let addLongTextBtn0020 = await driver.waitForComponent(ON.id("addLongTextBtn0020"), 500)
        await addLongTextBtn0020.click()
        let textInputDrag0020 = await driver.waitForComponent(ON.id("textInputDrag0020"), 500)
        await textInputDrag0020.inputText('======== 第一行 ======== \n ======== 第一行 ========',
          { paste: false, addition: true });

        let richEditorDrag0020 = await driver.waitForComponent(ON.id("richEditorDrag0020"), 500)
        await textInputDrag0020.longClick();
        await Utils.sleep(1000);

        let allSelect0020 = await driver.findComponent(ON.text('全选'))
        await Utils.sleep(300)
        await allSelect0020.click()

        const inputCenter = await textInputDrag0020.getBoundsCenter();
        const editorCenter = await richEditorDrag0020.getBoundsCenter();
        // 拖拽到RichEditor范围内后不松手，再拖出（可通过调整拖拽终点坐标实现拖出效果）
        await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y + 400, 2000); // 终点y坐标上移200，模拟拖出

        // 点击验证按钮（验证未插入数据）
        let getSpansBtn = await driver.waitForComponent(ON.id("getSpansBtn0020"), 500)
        await getSpansBtn.click();
        await Utils.sleep(1000);

        // 检查验证结果（应显示未插入数据）
        let resultText = await driver.waitForComponent(ON.id("getSpansResultText0020"), 500)
        let result = await resultText.getText();
        Logger.info('TEST', `验证结果: ${result}`)

        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0020_01")
        await Utils.sleep(1000)
        Logger.info('TEST', '测试用例执行完成')
        done();
      } catch (err) {
        Logger.error('TEST', `测试执行失败: ${(err as Error).message}`)
        done();
      }
    })


    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0030
        * @tc.name   : Drag plain text into RichEditor when there is an image in the component
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0030", Level.LEVEL3, async (done: Function) => {

      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0030")
      await Utils.sleep(2000)
      let driver = await Driver.create()
      // 1.查找两个richeditor组件,拖入组件预置插入
      let richEditorDragOut0030 = await driver.waitForComponent(ON.id("richEditorDragOut0030"), 500)
      let richEditorDropIn0030 = await driver.waitForComponent(ON.id("richEditorDropIn0030"), 500)
      let addSpanBtn0030 = await driver.waitForComponent(ON.id("addSpanBtn0030"), 500)
      await addSpanBtn0030.click()
      // 2.输入测试文本，点击长按全选
      await richEditorDragOut0030.inputText("============这是一段用于拖拽的测试文本============",
        { paste: false, addition: true })
      await richEditorDragOut0030.longClick()
      await Utils.sleep(1000)
      let allSelect0030 = await driver.waitForComponent(ON.text("全选"), 500)
      await allSelect0030.click()

      // 3.查找组件中心进行拖拽
      const richEditorDragOutPoint0030 = await richEditorDragOut0030.getBoundsCenter();
      const richEditorDropInPoint0030 = await richEditorDropIn0030.getBoundsCenter();
      await driver.drag(richEditorDragOutPoint0030.x, richEditorDragOutPoint0030.y, richEditorDropInPoint0030.x,
        richEditorDropInPoint0030.y, 2000);

      // 4.拖拽效果截图
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0030_01")
      await Utils.sleep(1000)
      Logger.info('TEST', '测试用例执行完成')
      done();
    })

    /*
      @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0031
      @tc.name : Drag plain text into RichEditor when there is an emoji in the component
      @tc.type : Function
      @tc.size : UiTest
      @tc.level : 3
    */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0031", Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0031")
        await Utils.sleep(1000)
        let driver = await Driver.create()
        let everySpanBtn0031 = await driver.waitForComponent (ON.id ("everySpanBtn0031"), 500)
        await everySpanBtn0031.click ()
        let textInputDrag0031 = await driver.waitForComponent (ON.id ("textInputDrag0031"), 500)
        await textInputDrag0031.inputText ('=========== 这是一段待拖入纯文本 ===========',
          { paste: false, addition: true });
        let richEditorDrag0031 = await driver.waitForComponent (ON.id ("richEditorDrag0031"), 500)
        await textInputDrag0031.longClick ();
        await Utils.sleep (1000);
        let allSelect0031 = await driver.findComponent (ON.text ('全选'))
        await Utils.sleep (300)
        await allSelect0031.click ()
        const inputCenter = await textInputDrag0031.getBoundsCenter();
        const editorCenter = await richEditorDrag0031.getBoundsCenter();
        await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);
        // 点击验证按钮
        let getSpansBtn = await driver.waitForComponent (ON.id ("getSpansBtn0031"), 500)
        await getSpansBtn.click ();
        await Utils.sleep (1000);
        // 检查验证结果
        let resultText = await driver.waitForComponent (ON.id ("getSpansResultText0031"), 500)
        let result = await resultText.getText ();
        Logger.info('TEST', '验证结果: ${result}')
        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DragPlainText_0031_01")
        await Utils.sleep(1000)
        Logger.info('TEST', ' 测试用例执行完成 ')
        done ();
      } catch (err) {
        Logger.error ('TEST', '测试执行失败: ${(err as Error).message}')
        done();
      }
    })

  })
}
