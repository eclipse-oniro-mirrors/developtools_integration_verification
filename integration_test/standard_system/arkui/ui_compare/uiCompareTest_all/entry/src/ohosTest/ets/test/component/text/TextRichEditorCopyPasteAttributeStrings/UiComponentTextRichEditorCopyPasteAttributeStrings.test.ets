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
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'

export default function uiComponentTextRichEditorCopyPasteAttributeStrings() {
  describe('uiComponentTextRichEditorCopyPasteAttributeStrings', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0001
     * @tc.name   : Drag attribute strings from attribute string component to non-attribute string component
     * @tc.desc   : Verify text richeditor copy paste attribute strings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0001', Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow('testability/pages/component/text/TextRichEditorCopyPasteAttributeStrings/UiComponentTextRichEditorCopyPasteAttributeStrings0001')
        let driver = await Driver.create()
        await Utils.sleep(500)

        // 1、查找源组件和目标组件
        let sourceEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0001_source'), 500)
        let targetEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0001_target'), 500)

        // 2、长按源组件开始拖拽
        await sourceEditor.longClick()
        await Utils.sleep(1000)

        let allSelect = await driver.findComponent(ON.text('全选'))
        await allSelect.click()

        // 3、获取拖拽起点和终点
        let sourceCenter = await sourceEditor.getBoundsCenter()
        let targetCenter = await targetEditor.getBoundsCenter()

        // 4、执行拖拽操作：从源组件拖拽到目标组件
        await driver.drag(sourceCenter.x, sourceCenter.y, targetCenter.x, targetCenter.y, 2000)
        await Utils.sleep(1000)

        // 5、截图验证
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0001_01')
        await Utils.sleep(1000)
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0003
     * @tc.name   : Drag attribute strings within a single attribute string component
     * @tc.desc   : Verify text richeditor copy paste attribute strings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0003', Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow('testability/pages/component/text/TextRichEditorCopyPasteAttributeStrings/UiComponentTextRichEditorCopyPasteAttributeStrings0003')
        let driver = await Driver.create()
        await Utils.sleep(500)

        // 1、查找组件
        let rich_editor_copy_paste_attribute_strings_0003 =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0003'), 500)
        let btn_copy_paste_attribute_strings_0003_select_first_line =
          await driver.waitForComponent(ON.id('btn_copy_paste_attribute_strings_0003_select_first_line'), 500)
        // 2、点击按钮选择属性字符串
        await rich_editor_copy_paste_attribute_strings_0003.click()
        await btn_copy_paste_attribute_strings_0003_select_first_line.click()
        await Utils.sleep(500)

        // 3、获取拖拽起点和终点（在同一组件内拖拽）
        let editorBounds = await rich_editor_copy_paste_attribute_strings_0003.getBounds()
        let startX = editorBounds.left + 50
        let startY = editorBounds.top + 30
        let endX = editorBounds.left + 50
        let endY = editorBounds.bottom - 30

        // 5、执行拖拽
        await driver.drag(startX, startY, endX, endY, 2000)
        await Utils.sleep(1000)

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0003_01')
        await Utils.sleep(1000)
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0005
     * @tc.name   : Drag attribute strings between two attribute string components
     * @tc.desc   : Verify text richeditor copy paste attribute strings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0005', Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow('testability/pages/component/text/TextRichEditorCopyPasteAttributeStrings/UiComponentTextRichEditorCopyPasteAttributeStrings0005')
        let driver = await Driver.create()
        await Utils.sleep(500)

        // 1、查找源组件和目标组件
        let sourceEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0005_source'), 500)
        let targetEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0005_target'), 500)

        // 2、长按源组件开始拖拽
        await sourceEditor.longClick()
        await Utils.sleep(1000)
        let btn_selectAll_0005 = await driver.findComponent(ON.text('全选'))
        await btn_selectAll_0005.click()
        await Utils.sleep(500)

        // 3、获取拖拽起点和终点
        let sourceCenter = await sourceEditor.getBoundsCenter()
        let targetCenter = await targetEditor.getBoundsCenter()

        // 4、执行拖拽操作：从源组件拖拽到目标组件
        await driver.drag(sourceCenter.x, sourceCenter.y, targetCenter.x, targetCenter.y, 2000)
        await Utils.sleep(1000)

        // 5、截图验证
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0005_01')
        await Utils.sleep(1000)
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0007
     * @tc.name   : Drag content within a single non-attribute string component
     * @tc.desc   : Verify text richeditor copy paste attribute strings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0007', Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow('testability/pages/component/text/TextRichEditorCopyPasteAttributeStrings/UiComponentTextRichEditorCopyPasteAttributeStrings0007')
        let driver = await Driver.create()
        await Utils.sleep(500)

        // 1、查找组件
        let rich_editor_copy_paste_attribute_strings_0007 =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0007'), 500)
        let selectButton =
          await driver.waitForComponent(ON.id('btn_copy_paste_attribute_strings_0007_select_first'), 500)

        // 2、点击按钮选择第一段文本
        await rich_editor_copy_paste_attribute_strings_0007.click()
        await selectButton.click()
        await Utils.sleep(500)

        // 3、获取拖拽起点和终点（在同一组件内拖拽）
        let editorBounds = await rich_editor_copy_paste_attribute_strings_0007.getBounds()
        let startX = editorBounds.left + 50
        let startY = editorBounds.top + 30
        let endX = editorBounds.left + 50
        let endY = editorBounds.bottom - 30

        // 4、执行拖拽
        await driver.drag(startX, startY, endX, endY, 2000)
        await Utils.sleep(1000)

        // 5、截图验证
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0007_01')
        await Utils.sleep(1000)
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0009
     * @tc.name   : Drag attribute strings between two non-attribute string components
     * @tc.desc   : Verify text richeditor copy paste attribute strings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0009', Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow('testability/pages/component/text/TextRichEditorCopyPasteAttributeStrings/UiComponentTextRichEditorCopyPasteAttributeStrings0009')
        let driver = await Driver.create()
        await Utils.sleep(500)

        // 1、查找源组件和目标组件
        let sourceEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0009_source'), 500)
        let targetEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0009_target'), 500)

        // 2、第一次拖拽：从A组件拖拽到B组件
        await sourceEditor.longClick()

        // 3、点击"全选"
        let allSelect = await driver.findComponent(ON.text('全选'))
        await allSelect.click()
        await Utils.sleep(500)


        // 4、获取拖拽起点和终点
        let sourceCenter = await sourceEditor.getBoundsCenter()
        let targetCenter = await targetEditor.getBoundsCenter()

        // 5、执行第一次拖拽：从A组件拖拽到B组件
        await driver.drag(sourceCenter.x, sourceCenter.y, targetCenter.x, targetCenter.y + 90, 2000)

        // 6、第一次截图：A组件拖拽到B组件后，A组件拖拽过来的文本还保持原样
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0009_01')
        await Utils.sleep(1000)

        // 7、第二次拖拽：从B组件拖拽到A组件
        await targetEditor.longClick()


        // 8、点击"全选"选择B组件的全部内容
        let allSelect2 = await driver.findComponent(ON.text('全选'))
        await allSelect2.click()
        await Utils.sleep(500)


        // 9、执行第二次拖拽：从B组件拖拽到A组件
        await driver.drag(targetCenter.x, targetCenter.y, sourceCenter.x, sourceCenter.y + 90, 2000)


        // 10、第二次截图：B组件全部内容拖拽到A组件，样式保持
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0009_02')
        await Utils.sleep(1000)
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0011
     * @tc.name   : Drag/paste attribute strings with ParagraphStyle set
     * @tc.desc   : Verify text richeditor copy paste attribute strings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0011', Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow('testability/pages/component/text/TextRichEditorCopyPasteAttributeStrings/UiComponentTextRichEditorCopyPasteAttributeStrings0011')
        let driver = await Driver.create()
        await Utils.sleep(500)

        // 1、查找源组件和目标组件
        let sourceEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0011_source'), 500)
        let targetEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0011_target'), 500)

        // 2、从A组件拖拽到B组件
        await sourceEditor.longClick()

        // 3、点击"全选"
        let allSelect = await driver.findComponent(ON.text('全选'))
        await allSelect.click()
        await Utils.sleep(500)

        // 4、获取拖拽起点和终点
        let sourceCenter = await sourceEditor.getBoundsCenter()
        let targetCenter = await targetEditor.getBoundsCenter()

        // 5、执行拖拽：从A组件拖拽到B组件
        await driver.drag(sourceCenter.x, sourceCenter.y, targetCenter.x, targetCenter.y + 90, 2000)

        // 6、截图：验证段落样式保持不变
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0011_01')
        await Utils.sleep(1000)
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0012
     * @tc.name   : Drag/paste attribute strings with TextStyle set
     * @tc.desc   : Verify text richeditor copy paste attribute strings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0012', Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow('testability/pages/component/text/TextRichEditorCopyPasteAttributeStrings/UiComponentTextRichEditorCopyPasteAttributeStrings0012')
        let driver = await Driver.create()
        await Utils.sleep(500)

        // 1、查找源组件和目标组件
        let sourceEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0012_source'), 500)
        let targetEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0012_target'), 500)

        // 2、从A组件拖拽到B组件
        await sourceEditor.longClick()

        // 3、点击"全选"
        let allSelect = await driver.findComponent(ON.text('全选'))
        await allSelect.click()
        await Utils.sleep(500)

        // 4、获取拖拽起点和终点
        let sourceCenter = await sourceEditor.getBoundsCenter()
        let targetCenter = await targetEditor.getBoundsCenter()

        // 5、执行拖拽：从A组件拖拽到B组件
        await driver.drag(sourceCenter.x, sourceCenter.y, targetCenter.x, targetCenter.y + 90, 2000)

        // 6、截图：验证文本样式保持不变
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0012_01')
        await Utils.sleep(1000)
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0018
     * @tc.name   : Drag/paste attribute strings with IMAGE set
     * @tc.desc   : Verify text richeditor copy paste attribute strings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0018', Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow('testability/pages/component/text/TextRichEditorCopyPasteAttributeStrings/UiComponentTextRichEditorCopyPasteAttributeStrings0018')
        let driver = await Driver.create()
        await Utils.sleep(500)

        // 1、查找源组件和目标组件
        let sourceEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0018_source'), 500)
        let targetEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0018_target'), 500)

        // 2、从A组件拖拽到B组件
        await sourceEditor.longClick()

        // 3、点击"全选"
        let allSelect = await driver.findComponent(ON.text('全选'))
        await allSelect.click()
        await Utils.sleep(500)

        // 4、获取拖拽起点和终点
        let sourceCenter = await sourceEditor.getBoundsCenter()
        let targetCenter = await targetEditor.getBoundsCenter()

        // 5、执行拖拽：从A组件拖拽到B组件
        await driver.drag(sourceCenter.x - 300, sourceCenter.y, targetCenter.x, targetCenter.y + 90, 2000)

        // 6、截图：验证IMAGE大小样式保持不变
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0018_01')
        await Utils.sleep(1000)
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0019
     * @tc.name   : Drag/paste attribute strings with CUSTOM_SPAN set
     * @tc.desc   : Verify text richeditor copy paste attribute strings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0019', Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow('testability/pages/component/text/TextRichEditorCopyPasteAttributeStrings/UiComponentTextRichEditorCopyPasteAttributeStrings0019')
        let driver = await Driver.create()
        await Utils.sleep(500)

        // 1、查找源组件和目标组件
        let sourceEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0019_source'), 500)
        let targetEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0019_target'), 500)

        // 2、长按组件A尝试触发选择（CustomSpan不支持选择）
        await sourceEditor.longClick()
        await Utils.sleep(500)

        // 3、截图1：验证CustomSpan不支持文本选择（不会弹出选择菜单）
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0019_01')
        await Utils.sleep(1000)

        // 4、获取拖拽起点和终点
        let sourceCenter = await sourceEditor.getBoundsCenter()
        let targetCenter = await targetEditor.getBoundsCenter()

        // 5、尝试直接拖拽CustomSpan到目标组件（CustomSpan不支持拖拽）
        await driver.drag(sourceCenter.x, sourceCenter.y, targetCenter.x, targetCenter.y, 2000)
        await Utils.sleep(500)

        // 6、截图2：验证CUSTOM_SPAN不支持拖拽（目标组件B内容不变）
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0019_02')
        await Utils.sleep(1000)
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0020
     * @tc.name   : Drag/paste rich text symbol from old framework to attribute string rich text
     * @tc.desc   : Verify text richeditor copy paste attribute strings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0020', Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow('testability/pages/component/text/TextRichEditorCopyPasteAttributeStrings/UiComponentTextRichEditorCopyPasteAttributeStrings0020')
        let driver = await Driver.create()
        await Utils.sleep(500)

        // 1、查找源组件（老框架-组件B）和目标组件（新框架-组件A）
        let sourceEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0020_source'), 500)
        let targetEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0020_target'), 500)

        // 2、长按组件B选择symbol
        await sourceEditor.longClick()
        await Utils.sleep(500)

        // 3、点击"全选"（如果有）
        let allSelect = await driver.findComponent(ON.text('全选'))
        if (allSelect) {
          await allSelect.click()
          await Utils.sleep(500)
        }

        // 4、获取拖拽起点和终点
        let sourceCenter = await sourceEditor.getBoundsCenter()
        let targetCenter = await targetEditor.getBoundsCenter()

        // 5、执行拖拽：从B组件（老框架symbol）拖拽到A组件（新框架）
        await driver.drag(sourceCenter.x, sourceCenter.y, targetCenter.x, targetCenter.y, 2000)
        await Utils.sleep(500)

        // 6、截图：验证symbol不支持拖拽到新框架，组件A内容不变
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0020_01')
        await Utils.sleep(1000)
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0021
     * @tc.name   : Drag/paste attribute string text-image mix together
     * @tc.desc   : Verify text richeditor copy paste attribute strings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0021', Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow('testability/pages/component/text/TextRichEditorCopyPasteAttributeStrings/UiComponentTextRichEditorCopyPasteAttributeStrings0021')
        let driver = await Driver.create()
        await Utils.sleep(500)

        // 1、查找源组件和目标组件
        let sourceEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0021_source'), 500)
        let targetEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0021_target'), 500)

        // 2、从A组件拖拽混合图文到B组件
        await sourceEditor.longClick()

        // 3、点击"全选"
        let allSelect = await driver.findComponent(ON.text('全选'))
        if (allSelect) {
          await allSelect.click()
          await Utils.sleep(500)
        }

        // 4、获取拖拽起点和终点
        let sourceCenter = await sourceEditor.getBoundsCenter()
        let targetCenter = await targetEditor.getBoundsCenter()

        // 5、执行拖拽：从A组件拖拽到B组件（起点往上偏移）
        await driver.drag(sourceCenter.x, sourceCenter.y - 60, targetCenter.x, targetCenter.y, 2000)

        // 6、截图：验证拖拽前后内容显示一致
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0021_01')
        await Utils.sleep(1000)
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0023
     * @tc.name   : Drag/paste attribute strings containing paragraph marks
     * @tc.desc   : Verify text richeditor copy paste attribute strings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0023', Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow('testability/pages/component/text/TextRichEditorCopyPasteAttributeStrings/UiComponentTextRichEditorCopyPasteAttributeStrings0023')
        let driver = await Driver.create()
        await Utils.sleep(500)

        // 1、查找源组件和目标组件
        let sourceEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0023_source'), 500)
        let targetEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0023_target'), 500)

        // 2、全选组件A的内容（包含换行符）
        await sourceEditor.longClick()

        // 3、点击"全选"
        let allSelect = await driver.findComponent(ON.text('全选'))
        await allSelect.click()
        await Utils.sleep(500)

        // 4、获取拖拽起点和终点
        let sourceCenter = await sourceEditor.getBoundsCenter()
        let targetCenter = await targetEditor.getBoundsCenter()

        // 5、执行拖拽：从A组件拖拽到B组件
        await driver.drag(sourceCenter.x, sourceCenter.y, targetCenter.x, targetCenter.y + 90, 2000)

        // 6、截图：验证拖拽前后内容显示一致（包括换行符）
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0023_01')
        await Utils.sleep(1000)
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0025
     * @tc.name   : Drag attribute strings and paste at cursor position
     * @tc.desc   : Verify text richeditor copy paste attribute strings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0025', Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow('testability/pages/component/text/TextRichEditorCopyPasteAttributeStrings/UiComponentTextRichEditorCopyPasteAttributeStrings0025')
        let driver = await Driver.create()
        await Utils.sleep(500)

        // 1、查找源组件和目标组件
        let sourceEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0025_source'), 500)
        let targetEditor =
          await driver.waitForComponent(ON.id('rich_editor_copy_paste_attribute_strings_0025_target'), 500)

        // 2、点击组件B中心，产生光标
        await targetEditor.click()
        await Utils.sleep(500)

        // 3、全选组件A的属性字符串
        await sourceEditor.longClick()
        let allSelect = await driver.findComponent(ON.text('全选'))
        if (allSelect) {
          await allSelect.click()
          await Utils.sleep(500)
        }

        // 4、拖拽到组件B的光标位置
        let sourceCenter = await sourceEditor.getBoundsCenter()
        let targetCenter = await targetEditor.getBoundsCenter()
        await driver.drag(sourceCenter.x, sourceCenter.y - 50, targetCenter.x, targetCenter.y, 2000)

        // 5、截图：验证内容在光标位置成功添加
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0025_01')
        await Utils.sleep(1000)
        done();
      })

  })
}