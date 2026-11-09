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

export default function uiComponentTextRichEditorDragPlainText() {
  describe('uiComponentTextRichEditorDragPlainText', () => {
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
     * @tc.desc   : Verify text richeditor dragplaintext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0024', Level.LEVEL3, async (done: Function) => {

      Settings.createWindow('testability/pages/component/text/TextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0024')
      await Utils.sleep(2000)
      let driver = await Driver.create()

      let textInputDrag0024 = await driver.waitForComponent(ON.id('textInputDrag0024'), 500)

      await textInputDrag0024.inputText('=================测试拖拽文本内容================',
        { paste: false, addition: true });

      let richEditorDrag0024 = await driver.waitForComponent(ON.id('richEditorDrag0024'), 500)

      await textInputDrag0024.longClick();
      await Utils.sleep(1000);
      let allSelect = await driver.findComponent(ON.text('全选'))
      await Utils.sleep(500)
      await allSelect.click()
      const inputCenter = await textInputDrag0024.getBoundsCenter();
      const editorCenter = await richEditorDrag0024.getBoundsCenter();

      await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);


      // 点击验证按钮
      let getSpansBtn = await driver.waitForComponent(ON.id('getSpansBtn0024'), 500)
      await getSpansBtn.click();
      await Utils.sleep(1000);

      // 检查验证结果
      let resultText = await driver.waitForComponent(ON.id('getSpansResultText0024'), 500)
      let result = await resultText.getText();
      Logger.info('TEST', `验证结果: ${result}`)

      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0024_01')
      await Utils.sleep(1000)
      Logger.info('TEST', '测试用例执行完成')
      done();

    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0013
     * @tc.name   : RichEditor can drag text and images at the same time
     * @tc.desc   : Verify text richeditor dragplaintext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0013', Level.LEVEL3, async (done: Function) => {

      Settings.createWindow('testability/pages/component/text/TextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0013')
      await Utils.sleep(2000)
      let driver = await Driver.create()

      let textInputDrag0013 = await driver.waitForComponent(ON.id('textInputDrag0013'), 500)
      let addImage0013 = await driver.waitForComponent(ON.id('addImage0013'),500)

      await textInputDrag0013.inputText('=================测试拖拽文本内容================',
        { paste: false, addition: true });

      let richEditorDrag0013 = await driver.waitForComponent(ON.id('richEditorDrag0013'), 500)

      await textInputDrag0013.longClick();
      await Utils.sleep(1000);
      let allSelect = await driver.findComponent(ON.text('全选'))
      await Utils.sleep(500)
      await allSelect.click()
      const inputCenter = await textInputDrag0013.getBoundsCenter();
      const editorCenter = await richEditorDrag0013.getBoundsCenter();

      await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);


      // 点击验证按钮
      let getSpansBtn = await driver.waitForComponent(ON.id('getSpansBtn0013'), 500)
      await getSpansBtn.click();
      await Utils.sleep(1000);

      // 检查验证结果
      let resultText = await driver.waitForComponent(ON.id('getSpansResultText0013'), 500)
      let result = await resultText.getText();
      Logger.info('TEST', `验证结果: ${result}`)

      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0013_01')
      await Utils.sleep(1000)
      Logger.info('TEST', '测试用例执行完成')
      done();

    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0003
     * @tc.name   : RichEditor can drag text between two spans with space span
     * @tc.desc   : Verify text richeditor dragplaintext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0003', Level.LEVEL3, async (done: Function) => {

      Settings.createWindow('testability/pages/component/text/TextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0003')
      await Utils.sleep(1000)
      let driver = await Driver.create()

      // 点击添加Span按钮，创建span1、空格、span2
      let addSpanBtn0003 = await driver.waitForComponent(ON.id('addSpanBtn0003'), 500)
      await addSpanBtn0003.click()
      await Utils.sleep(500) // 等待RichEditor内容更新

      // 输入要拖拽的文本
      let textInputDrag0003 = await driver.waitForComponent(ON.id('textInputDrag0003'), 500)
      await textInputDrag0003.inputText('这里是一段需要添加在Span1和Span2之间的文字', { paste: false, addition: true });

      // 获取RichEditor组件
      let richEditorDrag0003 = await driver.waitForComponent(ON.id('richEditorDrag0003'), 500)

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
      let getSpansBtn = await driver.waitForComponent(ON.id('getSpansBtn0003'), 500)
      await getSpansBtn.click();
      await Utils.sleep(1000);

      // 检查验证结果
      let resultText = await driver.waitForComponent(ON.id('getSpansResultText0003'), 500)
      let result = await resultText.getText();
      Logger.info('TEST', `验证结果: ${result}`)

      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0003_01')
      await Utils.sleep(1000)
      Logger.info('TEST', '测试用例执行完成')
      done();

    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0016
     * @tc.name   : Set different colors, styles, and decorative line fonts for the RichEditor and text box, then drag the text into it.
     * @tc.desc   : Verify text richeditor dragplaintext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0016', Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow('testability/pages/component/text/TextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0016')
        await Utils.sleep(2000)
        let driver = await Driver.create()

        let addTextBtn0016 = await driver.waitForComponent(ON.id('addTextBtn0016'),500)
        await addTextBtn0016.click()
        let textInputDrag0016 = await driver.waitForComponent(ON.id('textInputDrag0016'), 500)
        await textInputDrag0016.inputText('==============不同样式的文本内容===============', { paste: false, addition: true });

        let richEditorDrag0016 = await driver.waitForComponent(ON.id('richEditorDrag0016'), 500)
        await textInputDrag0016.longClick();
        await Utils.sleep(1000);
        let allSelect0016 = await driver.findComponent(ON.text('全选'))
        await allSelect0016.click()
        await Utils.sleep(500) // 等待选择完成

        const inputCenter0016 = await textInputDrag0016.getBoundsCenter();
        const editorCenter0016 = await richEditorDrag0016.getBoundsCenter();
        await driver.drag(inputCenter0016.x, inputCenter0016.y, editorCenter0016.x, editorCenter0016.y, 2000);

        // 点击验证按钮
        let getSpansBtn = await driver.waitForComponent(ON.id('getSpansBtn0016'), 500)
        await getSpansBtn.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText = await driver.waitForComponent(ON.id('getSpansResultText0016'), 500)
        let result = await resultText.getText();
        Logger.info('TEST', `验证结果: ${result}`)

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0016_01')
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
     * @tc.name   : Set text with different font styles inside the text box and drag the text into it.
     * @tc.desc   : Verify text richeditor dragplaintext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0017', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0017')
      let driver = await Driver.create()

      // 先设置 RichEditor 的预设样式，使其与已有文本样式不一致
      let changeStylePinkBtn0017 = await driver.waitForComponent(ON.id('changeStylePinkBtn0017'), 300)
      let changeStyleRedBtn0017 = await driver.waitForComponent(ON.id('changeStyleRedBtn0017'), 300)
      // 获取 RichEditor 目标
      let richEditorDrag0017 = await driver.waitForComponent(ON.id('richEditorDrag0017'), 200)
      await changeStylePinkBtn0017.click()
      await richEditorDrag0017.inputText('预设文本1', { paste: false, addition: true })
      await changeStyleRedBtn0017.click()
      await richEditorDrag0017.inputText('预设文本2', { paste: false, addition: true })


      // 在输入框中输入文本
      let textInputDrag0017 = await driver.waitForComponent(ON.id('textInputDrag0017'), 200)
      await textInputDrag0017.inputText('================拖拽测试样本===============',
        { paste: false, addition: true });

      // 长按并尽量全选后进行拖拽
      await textInputDrag0017.longClick();
      await Utils.sleep(1000);
      let allSelect0017 = await driver.findComponent(ON.text('全选'))
      await allSelect0017.click()

      const inputCenter0017 = await textInputDrag0017.getBoundsCenter();
      const editorCenter0017 = await richEditorDrag0017.getBoundsCenter();
      await driver.drag(inputCenter0017.x, inputCenter0017.y, editorCenter0017.x, editorCenter0017.y, 2000);

      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0017_01')
      await Utils.sleep(1000)
      Logger.info('TEST', '测试用例执行完成')
      done();

    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0006
     * @tc.name   : When RichEditor contains non-text elements (images, emojis, symbols), drag text into it.
     * @tc.desc   : Verify text richeditor dragplaintext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0006', Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow('testability/pages/component/text/TextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0006')
        await Utils.sleep(1000)
        let driver = await Driver.create()

        let everySpanBtn0006 = await driver.waitForComponent(ON.id('everySpanBtn0006'),500)
        await everySpanBtn0006.click()
        let textInputDrag0006 = await driver.waitForComponent(ON.id('textInputDrag0006'), 500)
        await textInputDrag0006.inputText('===========这是一段待拖入纯文本===========', { paste: false, addition: true });

        let richEditorDrag0006 = await driver.waitForComponent(ON.id('richEditorDrag0006'), 500)
        await textInputDrag0006.longClick();
        await Utils.sleep(1000);
        let allSelect0006 = await driver.findComponent(ON.text('全选'))
        await Utils.sleep(300)
        await allSelect0006.click()


        const inputCenter = await textInputDrag0006.getBoundsCenter();
        const editorCenter = await richEditorDrag0006.getBoundsCenter();
        await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);

        // 点击验证按钮
        let getSpansBtn = await driver.waitForComponent(ON.id('getSpansBtn0006'), 500)
        await getSpansBtn.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText = await driver.waitForComponent(ON.id('getSpansResultText0006'), 500)
        let result = await resultText.getText();
        Logger.info('TEST', `验证结果: ${result}`)

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0006_01')
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
     * @tc.name   : Drag text with larger font size, spacing, line height, and font width into the RichEditor.
     * @tc.desc   : Verify text richeditor dragplaintext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0014', Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow('testability/pages/component/text/TextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0014')
        await Utils.sleep(2000)
        let driver = await Driver.create()

        let addSpanBtn0014 = await driver.waitForComponent(ON.id('addSpanBtn0014'),500)
        await addSpanBtn0014.click()
        let textInputDrag0014 = await driver.waitForComponent(ON.id('textInputDrag0014'), 500)
        await textInputDrag0014.inputText('======字体样式测试文本======', { paste: false, addition: true });

        let richEditorDrag0014 = await driver.waitForComponent(ON.id('richEditorDrag0014'), 500)
        await textInputDrag0014.longClick();
        await Utils.sleep(1000);

        let allSelect0014 = await driver.findComponent(ON.text('全选'))
        await Utils.sleep(300)
        await allSelect0014.click()

        const inputCenter = await textInputDrag0014.getBoundsCenter();
        const editorCenter = await richEditorDrag0014.getBoundsCenter();
        await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);

        // 点击验证按钮
        let getSpansBtn = await driver.waitForComponent(ON.id('getSpansBtn0014'), 500)
        await getSpansBtn.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText = await driver.waitForComponent(ON.id('getSpansResultText0014'), 500)
        let result = await resultText.getText();
        Logger.info('TEST', `验证结果: ${result}`)

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0014_01')
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
     * @tc.name   : When RichEditor contains long text, drag text to the position before the long text.
     * @tc.desc   : Verify text richeditor dragplaintext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0007', Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow('testability/pages/component/text/TextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0007')
        await Utils.sleep(2000)
        let driver = await Driver.create()

        let addLongTextBtn0007 = await driver.waitForComponent(ON.id('addLongTextBtn0007'),500)
        await addLongTextBtn0007.click()
        let textInputDrag0007 = await driver.waitForComponent(ON.id('textInputDrag0007'), 500)
        await textInputDrag0007.inputText('========插入的测试文本========', { paste: false, addition: true });

        let richEditorDrag0007 = await driver.waitForComponent(ON.id('richEditorDrag0007'), 500)
        await textInputDrag0007.longClick();
        await Utils.sleep(1000);

        let allSelect0007 = await driver.findComponent(ON.text('全选'))
        await Utils.sleep(300)
        await allSelect0007.click()

        const inputCenter = await textInputDrag0007.getBoundsCenter();
        const editorCenter = await richEditorDrag0007.getBoundsCenter();
        await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);

        // 点击验证按钮
        let getSpansBtn = await driver.waitForComponent(ON.id('getSpansBtn0007'), 500)
        await getSpansBtn.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText = await driver.waitForComponent(ON.id('getSpansResultText0007'), 500)
        let result = await resultText.getText();
        Logger.info('TEST', `验证结果: ${result}`)

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0007_01')
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
     * @tc.name   : When RichEditor contains long text, drag text to the position after the last character of the long text.
     * @tc.desc   : Verify text richeditor dragplaintext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0008', Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow('testability/pages/component/text/TextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0008')
        await Utils.sleep(2000)
        let driver = await Driver.create()

        // 添加更多长文本到RichEditor
        // let addLongTextBtn0008 = await driver.waitForComponent(ON.id("addLongTextBtn0008"), 500)
        // await addLongTextBtn0008.click()
        // await Utils.sleep(500)

        // 在输入框中输入文本
        let textInputDrag0008 = await driver.waitForComponent(ON.id('textInputDrag0008'), 500)
        await textInputDrag0008.inputText('========拖拽到长文本末尾的纯文本=======', { paste: false, addition: true });

        // 获取 RichEditor 目标
        let richEditorDrag0008 = await driver.waitForComponent(ON.id('richEditorDrag0008'), 500)

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
        let getSpansBtn0008 = await driver.waitForComponent(ON.id('getSpansBtn0008'), 500)
        await getSpansBtn0008.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText0008 = await driver.waitForComponent(ON.id('getSpansResultText0008'), 500)
        let result0008 = await resultText0008.getText();
        Logger.info('TEST', `验证结果: ${result0008}`)

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0008_01')
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
     * @tc.name   : Drag into the space between spans in RichEditor.
     * @tc.desc   : Verify text richeditor dragplaintext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0002', Level.LEVEL3, async (done: Function) => {

      Settings.createWindow('testability/pages/component/text/TextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0002')
      await Utils.sleep(2000)
      let driver = await Driver.create()

      let addSpan1Btn0002 = await driver.waitForComponent(ON.id('addSpan1Btn0002'), 500)
      await addSpan1Btn0002.click()
      let textInputDrag0002 = await driver.waitForComponent(ON.id('textInputDrag0002'), 500)

      await textInputDrag0002.inputText('=================测试拖拽文本内容================',
        { paste: false, addition: true });

      let richEditorDrag0002 = await driver.waitForComponent(ON.id('richEditorDrag0002'), 500)

      await textInputDrag0002.longClick();
      await Utils.sleep(1000);
      let allSelect = await driver.findComponent(ON.text('全选'))
      await Utils.sleep(500)
      await allSelect.click()
      const inputCenter = await textInputDrag0002.getBoundsCenter();
      const editorCenter = await richEditorDrag0002.getBoundsCenter();

      await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);


      // 点击验证按钮
      let getSpansBtn = await driver.waitForComponent(ON.id('getSpansBtn0002'), 500)
      await getSpansBtn.click();
      await Utils.sleep(1000);

      // 检查验证结果
      let resultText = await driver.waitForComponent(ON.id('getSpansResultText0002'), 500)
      let result = await resultText.getText();
      Logger.info('TEST', `验证结果: ${result}`)

      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0002_01')
      await Utils.sleep(1000)
      Logger.info('TEST', '测试用例执行完成')
      done();

    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0009
     * @tc.name   : When RichEditor contains long text, drag text into the middle of the long text segment.
     * @tc.desc   : Verify text richeditor dragplaintext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0009', Level.LEVEL3, async (done: Function) => {
        Settings.createWindow('testability/pages/component/text/TextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0009')
        await Utils.sleep(1000)
        let driver = await Driver.create()

        let addLongTextBtn0009 = await driver.waitForComponent(ON.id('addLongTextBtn0009'),500)
        await addLongTextBtn0009.click()
        let textInputDrag0009 = await driver.waitForComponent(ON.id('textInputDrag0009'), 500)
        await textInputDrag0009.inputText('========插入的测试文本========', { paste: false, addition: true });

        let richEditorDrag0009 = await driver.waitForComponent(ON.id('richEditorDrag0009'), 500)
        await textInputDrag0009.longClick();
        await Utils.sleep(1000);

        let allSelect0009 = await driver.findComponent(ON.text('全选'))
        await Utils.sleep(300)
        await allSelect0009.click()

        const inputCenter = await textInputDrag0009.getBoundsCenter();
        const editorCenter = await richEditorDrag0009.getBoundsCenter();
        await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);

        // 点击验证按钮
        let getSpansBtn = await driver.waitForComponent(ON.id('getSpansBtn0009'), 500)
        await getSpansBtn.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText = await driver.waitForComponent(ON.id('getSpansResultText0009'), 500)
        let result = await resultText.getText();
        Logger.info('TEST', `验证结果: ${result}`)

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0009_01')
        await Utils.sleep(1000)
        Logger.info('TEST', '测试用例执行完成')
        done();

    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0004
     * @tc.name   : Drag text between spans in RichEditor with space span
     * @tc.desc   : Verify text richeditor dragplaintext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0004', Level.LEVEL3, async (done: Function) => {
        Settings.createWindow('testability/pages/component/text/TextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0004')
        await Utils.sleep(2000)
        let driver = await Driver.create()

        let addSpan1Btn0004 = await driver.waitForComponent(ON.id('addSpan1Btn0004'), 500)
        await addSpan1Btn0004.click()
        let textInputDrag0004 = await driver.waitForComponent(ON.id('textInputDrag0004'), 500)
        await textInputDrag0004.inputText('=================测试拖拽文本内容0004================', { paste: false, addition: true });

        let richEditorDrag0004 = await driver.waitForComponent(ON.id('richEditorDrag0004'), 500)
        await textInputDrag0004.longClick();
        await Utils.sleep(1000);
        let allSelect = await driver.findComponent(ON.text('全选'))
        await Utils.sleep(500)
        await allSelect.click()
        const inputCenter = await textInputDrag0004.getBoundsCenter();
        const editorCenter = await richEditorDrag0004.getBoundsCenter();

        await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);

        // 点击验证按钮
        let getSpansBtn = await driver.waitForComponent(ON.id('getSpansBtn0004'), 500)
        await getSpansBtn.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText = await driver.waitForComponent(ON.id('getSpansResultText0004'), 500)
        let result = await resultText.getText();
        Logger.info('TEST', `验证结果: ${result}`)

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0004_01')
        await Utils.sleep(1000)
        Logger.info('TEST', '测试用例执行完成')
        done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0005
     * @tc.name   : Drag text to RichEditor with preset content
     * @tc.desc   : Verify text richeditor dragplaintext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0005', Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow('testability/pages/component/text/TextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0005')
        await Utils.sleep(2000)
        let driver = await Driver.create()

        let addContentBtn0005 = await driver.waitForComponent(ON.id('addContentBtn0005'), 500)
        await addContentBtn0005.click()
        let textInputDrag0005 = await driver.waitForComponent(ON.id('textInputDrag0005'), 500)
        await textInputDrag0005.inputText('=================测试拖拽文本内容0005================', { paste: false, addition: true });

        let richEditorDrag0005 = await driver.waitForComponent(ON.id('richEditorDrag0005'), 500)
        await textInputDrag0005.longClick();
        await Utils.sleep(1000);
        let allSelect = await driver.findComponent(ON.text('全选'))
        await Utils.sleep(500)
        await allSelect.click()
        const inputCenter = await textInputDrag0005.getBoundsCenter();
        const editorCenter = await richEditorDrag0005.getBoundsCenter();

        await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);

        // 点击验证按钮
        let getSpansBtn = await driver.waitForComponent(ON.id('getSpansBtn0005'), 500)
        await getSpansBtn.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText = await driver.waitForComponent(ON.id('getSpansResultText0005'), 500)
        let result = await resultText.getText();
        Logger.info('TEST', `验证结果: ${result}`)

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0005_01')
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
     * @tc.name   : Drag text to RichEditor with long text content
     * @tc.desc   : Verify text richeditor dragplaintext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0018', Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow('testability/pages/component/text/TextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0018')
        await Utils.sleep(2000)
        let driver = await Driver.create()

        let addLongTextBtn0018 = await driver.waitForComponent(ON.id('addLongTextBtn0018'), 500)
        await addLongTextBtn0018.click()
        let textInputDrag0018 = await driver.waitForComponent(ON.id('textInputDrag0018'), 500)
        await textInputDrag0018.inputText(
          '==============================\n' +
          '测试拖拽文本内容0018\n' +
          '==============================\n', { paste: false, addition: true });

        let richEditorDrag0018 = await driver.waitForComponent(ON.id('richEditorDrag0018'), 500)
        await textInputDrag0018.longClick();
        await Utils.sleep(1000);
        let allSelect = await driver.findComponent(ON.text('全选'))
        await Utils.sleep(500)
        await allSelect.click()
        const inputCenter = await textInputDrag0018.getBoundsCenter();
        const editorCenter = await richEditorDrag0018.getBoundsCenter();

        await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y, 2000);

        // 点击验证按钮
        let getSpansBtn = await driver.waitForComponent(ON.id('getSpansBtn0018'), 500)
        await getSpansBtn.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText = await driver.waitForComponent(ON.id('getSpansResultText0018'), 500)
        let result = await resultText.getText();
        Logger.info('TEST', `验证结果: ${result}`)

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0018_01')
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
     * @tc.name   : Drag text to RichEditor with mixed content (text and images)
     * @tc.desc   : Verify text richeditor dragplaintext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0020', Level.LEVEL3, async (done: Function) => {
      try {
        Settings.createWindow('testability/pages/component/text/TextRichEditorDragPlainText/UiComponentTextRichEditorDragPlainText0020')
        await Utils.sleep(2000)
        let driver = await Driver.create()

        let addMixedContentBtn0020 = await driver.waitForComponent(ON.id('addMixedContentBtn0020'), 500)
        await addMixedContentBtn0020.click()
        let textInputDrag0020 = await driver.waitForComponent(ON.id('textInputDrag0020'), 500)
        await textInputDrag0020.inputText('=================测试拖拽文本内容0020================', { paste: false, addition: true });

        let richEditorDrag0020 = await driver.waitForComponent(ON.id('richEditorDrag0020'), 500)
        await textInputDrag0020.longClick();
        await Utils.sleep(1000);
        let allSelect = await driver.findComponent(ON.text('全选'))
        await Utils.sleep(500)
        await allSelect.click()
        const inputCenter = await textInputDrag0020.getBoundsCenter();
        const editorCenter = await richEditorDrag0020.getBoundsCenter();

        await driver.drag(inputCenter.x, inputCenter.y, editorCenter.x, editorCenter.y+400, 2000);

        // 点击验证按钮
        let getSpansBtn = await driver.waitForComponent(ON.id('getSpansBtn0020'), 500)
        await getSpansBtn.click();
        await Utils.sleep(1000);

        // 检查验证结果
        let resultText = await driver.waitForComponent(ON.id('getSpansResultText0020'), 500)
        let result = await resultText.getText();
        Logger.info('TEST', `验证结果: ${result}`)

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0020_01')
        await Utils.sleep(1000)
        Logger.info('TEST', '测试用例执行完成')
        done();
      } catch (err) {
        Logger.error('TEST', `测试执行失败: ${(err as Error).message}`)
        done();
      }
    })

  })
}