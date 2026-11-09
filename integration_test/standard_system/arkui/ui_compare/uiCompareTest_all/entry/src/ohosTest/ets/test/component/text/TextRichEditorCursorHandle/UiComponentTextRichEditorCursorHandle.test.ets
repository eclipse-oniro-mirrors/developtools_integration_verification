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
import { afterEach, describe, it, Level } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Utils from '../../../model/Utils';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import Logger from '../../../model/Logger';
import TestHelper from '../../../model/TestHelper'

export default function uiComponentTextRichEditorCursorHandle() {
  describe('uiComponentTextRichEditorCursorHandle', () => {

    afterEach(async (done: Function) => {

      await TestHelper.destroyWindow()

      done()

    })
    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0001
     * @tc.name   : Mouse text selection
     * @tc.desc   : Verify text richeditor cursor handle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0001', Level.LEVEL2, async (done: Function) => {
      // 打开页面等待0.5s
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorHandle/UiComponentTextRichEditorCursorHandle0001')
      let driver = await Driver.create()
      await Utils.sleep(1000)

      // 查找RichEditor组件
      let rich_editor_cursor_handle_0001 = await driver.waitForComponent(ON.id('rich_editor_cursor_handle_0001'), 500)
      let rich_editor_cursor_handle_0001_bounds_center = await rich_editor_cursor_handle_0001.getBoundsCenter()

      await driver.mouseDrag({
        x: rich_editor_cursor_handle_0001_bounds_center.x,
        y: rich_editor_cursor_handle_0001_bounds_center.y
      }, { x: rich_editor_cursor_handle_0001_bounds_center.x, y: rich_editor_cursor_handle_0001_bounds_center.y + 100 },
        1000)
      await Utils.sleep(500)

      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0001_01')
      await Utils.sleep(1000)
      await driver.mouseDrag({
        x: rich_editor_cursor_handle_0001_bounds_center.x,
        y: rich_editor_cursor_handle_0001_bounds_center.y
      }, { x: rich_editor_cursor_handle_0001_bounds_center.x, y: rich_editor_cursor_handle_0001_bounds_center.y - 100 },
        1000)
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0001_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0002
     * @tc.name   : Mouse shape changes when dragging scrollbar and returning to text editing area
     * @tc.desc   : Verify text richeditor cursor handle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0002', Level.LEVEL2, async (done: Function) => {
      // 打开页面等待0.5s
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorHandle/UiComponentTextRichEditorCursorHandle0002')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 鼠标上下拖动滚动条，再回到回到文本编辑区
      let rich_editor_cursor_handle_0002 = await driver.waitForComponent(ON.id('rich_editor_cursor_handle_0002'), 500)
      let rich_editor_cursor_handle_0002_bounds_center = await rich_editor_cursor_handle_0002.getBoundsCenter()
      await Utils.sleep(500)

      let rich_editor_cursor_handle_0002_bounds = await rich_editor_cursor_handle_0002.getBounds()
      // 1、先从上往下拖动滚动条
      await driver.mouseDrag({
        x: rich_editor_cursor_handle_0002_bounds.right - 12,
        y: rich_editor_cursor_handle_0002_bounds.top + 10
      }, { x: rich_editor_cursor_handle_0002_bounds.right - 8, y: rich_editor_cursor_handle_0002_bounds.bottom - 10 },
        800)
      await Utils.sleep(500)

      await driver.mouseMoveTo(rich_editor_cursor_handle_0002_bounds_center)
      await Utils.sleep(500)

      // 2、再从下往上拖动滚动条
      await driver.mouseDrag({
        x: rich_editor_cursor_handle_0002_bounds.right - 12,
        y: rich_editor_cursor_handle_0002_bounds.bottom - 10
      }, { x: rich_editor_cursor_handle_0002_bounds.right - 8, y: rich_editor_cursor_handle_0002_bounds.top + 10 }, 800)
      await Utils.sleep(500)

      // 预期：2、鼠标形状变化正常：在滚动条上为箭头形状，在文本编辑区域为光标形状
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0002_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0003
     * @tc.name   : Cursor height follows the text on the left side
     * @tc.desc   : Verify text richeditor cursor handle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0003', Level.LEVEL3, async (done: Function) => {
      // 打开页面等待1s
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorHandle/UiComponentTextRichEditorCursorHandle0003')
      let driver = await Driver.create()
      await Utils.sleep(1000)

      // 查找RichEditor组件并点击
      let rich_editor_cursor_handle_0003 = await driver.waitForComponent(ON.id('rich_editor_cursor_handle_0003'), 500)
      await rich_editor_cursor_handle_0003.click()
      await Utils.sleep(500)

      // 截图初始状态
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0003_01')
      await Utils.sleep(1000)

      // 1、改变光标左侧文本的样式（fontSize，lineHeight）
      let btn_increase_font_size_0003 = await driver.waitForComponent(ON.id('btn_increase_font_size_0003'), 500)
      await btn_increase_font_size_0003.click()
      await Utils.sleep(500)

      let btn_increase_line_height_0003 = await driver.waitForComponent(ON.id('btn_increase_line_height_0003'), 500)
      await btn_increase_line_height_0003.click()
      await Utils.sleep(500)

      // 再次点击编辑器，观察光标高度
      await rich_editor_cursor_handle_0003.click()
      await Utils.sleep(500)

      // 预期：1、光标高度跟随左侧文本
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0003_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0004
     * @tc.name   : The cursor follows the finger at the automatic line break position
     * @tc.desc   : Verify text richeditor cursor handle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0004', Level.LEVEL3, async (done: Function) => {
      // 打开页面等待1s
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorHandle/UiComponentTextRichEditorCursorHandle0004')
      let driver = await Driver.create()
      await Utils.sleep(1000)

      // 查找RichEditor组件并获取边界
      let rich_editor_cursor_handle_0004 = await driver.waitForComponent(ON.id('rich_editor_cursor_handle_0004'), 500)
      let rich_editor_cursor_handle_0004_bounds = await rich_editor_cursor_handle_0004.getBounds()
      await Utils.sleep(500)

      // 计算自动断行处的位置（第一行末尾接近右边界处）
      let editor_width = rich_editor_cursor_handle_0004_bounds.right - rich_editor_cursor_handle_0004_bounds.left
      let line_break_x = Math.floor(rich_editor_cursor_handle_0004_bounds.left + editor_width - 20)
      let line_break_y = Math.floor(rich_editor_cursor_handle_0004_bounds.top + 30)

      // 点击自动断行处，显示光标
      await driver.click(line_break_x, line_break_y)
      await Utils.sleep(500)

      // 1、手指在自动断行左右拖动光标（跨越换行边界）
      let drag_start_x = Math.floor(rich_editor_cursor_handle_0004_bounds.left + editor_width - 30)
      let drag_start_y = Math.floor(rich_editor_cursor_handle_0004_bounds.top + 30)
      let drag_end_x = Math.floor(rich_editor_cursor_handle_0004_bounds.left + 10)
      let drag_end_y = Math.floor(rich_editor_cursor_handle_0004_bounds.top + 60)

      await driver.dragBetween({
        x: drag_start_x,
        y: drag_start_y,
        displayId: 0
      }, {
        x: drag_end_x,
        y: drag_end_y,
        displayId: 0
      }, 800)


      await Utils.sleep(1000)

      // 预期：1、光标可以保持跟手
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0004_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0005
     * @tc.name   : The content area scrolls following the cursor movement, keeping the cursor bottom visible
     * @tc.desc   : Verify text richeditor cursor handle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0005', Level.LEVEL3, async (done: Function) => {
      // 打开页面等待1s
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorHandle/UiComponentTextRichEditorCursorHandle0005')
      let driver = await Driver.create()
      await Utils.sleep(1000)

      // 查找RichEditor组件并点击一下
      let rich_editor_cursor_handle_0005 = await driver.waitForComponent(ON.id('rich_editor_cursor_handle_0005'), 500)
      let rich_editor_cursor_handle_0005_bounds_center = await rich_editor_cursor_handle_0005.getBoundsCenter()
      await rich_editor_cursor_handle_0005.click()
      await Utils.sleep(500)

      // 1、动态改变组件布局（padding、align、margin）
      let btn_change_0005 = await driver.waitForComponent(ON.id('btn_change_0005'), 500)
      await btn_change_0005.click()
      await Utils.sleep(500)

      // 手指在内容区域内任意拖动光标（从上到下，超过1页）
      await driver.drag(rich_editor_cursor_handle_0005_bounds_center.x, rich_editor_cursor_handle_0005_bounds_center.y,
        rich_editor_cursor_handle_0005_bounds_center.x, rich_editor_cursor_handle_0005_bounds_center.y + 300, 1000)
      await Utils.sleep(1000)

      // 再次动态改变组件布局（padding、align、margin）
      await btn_change_0005.click()
      await Utils.sleep(500)

      // 预期：1、内容区跟随光标移动进行滚动，光标底部始终可见
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0005_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0006
     * @tc.name   : Click on the blank area below the end-of-line text and above a non-blank line
     * @tc.desc   : Verify text richeditor cursor handle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0006', Level.LEVEL3, async (done: Function) => {
      // 打开页面等待1s
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorHandle/UiComponentTextRichEditorCursorHandle0006')
      let driver = await Driver.create()
      await Utils.sleep(1000)

      // 查找RichEditor组件并获取中心位置
      let rich_editor_cursor_handle_0006 = await driver.waitForComponent(ON.id('rich_editor_cursor_handle_0006'), 500)
      let rich_editor_cursor_handle_0006_bounds_center = await rich_editor_cursor_handle_0006.getBoundsCenter()

      // 1、手指/鼠标单击行尾文本下方非空白行的空白区域（中心往下一些）
      await driver.click(rich_editor_cursor_handle_0006_bounds_center.x,
        rich_editor_cursor_handle_0006_bounds_center.y + 20)
      await Utils.sleep(1000)

      // 预期：1、光标出现在文本末尾
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0006_01')
      await Utils.sleep(1000)

      done();
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0008
     * @tc.name   : Calling updateSpanStyle keeps the context menu displayed
     * @tc.desc   : Verify text richeditor cursor handle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0008', Level.LEVEL3, async (done: Function) => {
      // 打开页面等待1s
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorHandle/UiComponentTextRichEditorCursorHandle0008')
      let driver = await Driver.create()
      await Utils.sleep(1000)

      // 查找RichEditor组件
      let rich_editor_cursor_handle_0008 = await driver.waitForComponent(ON.id('rich_editor_cursor_handle_0008'), 500)
      let rich_editor_cursor_handle_0008_bounds = await rich_editor_cursor_handle_0008.getBounds()

      // 1、选中任意文本
      await rich_editor_cursor_handle_0008.longClick()
      let selectAll = await driver.waitForComponent(ON.text('全选'), 500)
      await selectAll.click()


      // 截图选中状态（预期：1、出现菜单）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0008_01')
      await Utils.sleep(500)

      // 2、调用updateSpanStyle接口
      let btn_update_span_style_0008 = await driver.waitForComponent(ON.id('btn_update_span_style_0008'), 500)
      await btn_update_span_style_0008.click()
      await Utils.sleep(500)

      // 预期：2、菜单不关闭
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0008_02')
      await Utils.sleep(500)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0011
     * @tc.name   : Double-clicking on a blank line has no selection effect
     * @tc.desc   : Verify text richeditor cursor handle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0011', Level.LEVEL3, async (done: Function) => {
      // 打开页面等待1s
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorHandle/UiComponentTextRichEditorCursorHandle0011')
      let driver = await Driver.create()
      await Utils.sleep(1000)

      // 查找RichEditor组件
      let rich_editor_cursor_handle_0011 = await driver.waitForComponent(ON.id('rich_editor_cursor_handle_0011'), 500)
      let rich_editor_cursor_handle_0011_bounds = await rich_editor_cursor_handle_0011.getBoundsCenter()

      // 1、双击空白行（第二行，在第一行文本和最后一行文本之间）
      await driver.doubleClick(rich_editor_cursor_handle_0011_bounds.x, rich_editor_cursor_handle_0011_bounds.y)
      await Utils.sleep(500)

      // 预期：1、选中无效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0011_01')
      await Utils.sleep(500)

      done();
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0007
     * @tc.name   : Handle position remains accurate without misalignment
     * @tc.desc   : Verify text richeditor cursor handle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0007', Level.LEVEL3, async (done: Function) => {
      // 打开页面等待1s
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorHandle/UiComponentTextRichEditorCursorHandle0007')
      await Utils.sleep(1000)
      let driver = await Driver.create()

      // 查找RichEditor组件
      let rich_editor_cursor_handle_0007 = await driver.waitForComponent(ON.id('rich_editor_cursor_handle_0007'), 500)

      // 输入测试文本
      await rich_editor_cursor_handle_0007.inputText(
        '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
          '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本',
        { paste: false, addition: true });
      await Utils.sleep(300)

      // 点击RichEditor外部区域收起键盘
      let rich_editor_cursor_handle_0007_bounds = await rich_editor_cursor_handle_0007.getBounds()
      await driver.click(rich_editor_cursor_handle_0007_bounds.left + 150,
        rich_editor_cursor_handle_0007_bounds.top - 50)
      await Utils.sleep(300)

      // 1、手指任意选中文本，出现高亮和手柄
      await rich_editor_cursor_handle_0007.longClick()
      await Utils.sleep(500)
      let selectAll = await driver.waitForComponent(ON.text('全选'), 500)
      await selectAll.click()
      await Utils.sleep(300)

      // 截图选中状态
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0007_01')
      await Utils.sleep(500)

      // 2、适老化/更新文本样式，改变字体大小
      let btn_update_style_0007 = await driver.waitForComponent(ON.id('btn_update_style_0007'), 500)
      await btn_update_style_0007.click()
      await Utils.sleep(300)

      // 3、改变文本布局
      let btn_change_layout_0007 = await driver.waitForComponent(ON.id('btn_change_layout_0007'), 500)
      await btn_change_layout_0007.click()
      await Utils.sleep(300)

      // 截图验证样式改变后手柄位置不错位
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0007_02')
      await Utils.sleep(500)

      // 4、横竖屏旋转（切换横屏）
      let btn_landscape_0007 = await driver.waitForComponent(ON.id('btn_landscape_0007'), 500)
      await btn_landscape_0007.click()
      await Utils.sleep(1500) // 等待窗口切换操作完成

      // 预期：横屏后手柄和高亮始终不错位
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_HANDLE_0007_03')
      await Utils.sleep(500)

      done();
    })
  })
}