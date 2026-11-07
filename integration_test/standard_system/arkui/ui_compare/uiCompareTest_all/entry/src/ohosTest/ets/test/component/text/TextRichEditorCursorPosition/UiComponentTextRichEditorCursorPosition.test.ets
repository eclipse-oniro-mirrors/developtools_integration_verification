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
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'
import TestHelper from '../../../model/TestHelper'

export default function uiComponentTextRichEditorCursorPosition() {
  describe('uiComponentTextRichEditorCursorPosition', () => {

    afterEach(async (done: Function) => {

      await TestHelper.destroyWindow()

      done()

    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0001
     * @tc.name   : Get cursor relative position when cursor is blinking and changing text style
     * @tc.desc   : Verify text richeditor cursor position interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0001', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorPosition/UiComponentTextRichEditorCursorPosition0001')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、点击RichEditor产生光标（保持闪烁状态）
      let rich_editor_cursor_position_0001 =
        await driver.waitForComponent(ON.id('rich_editor_cursor_position_0001'), 500)
      await rich_editor_cursor_position_0001.click()
      await Utils.sleep(500)

      // 2、动态修改RichEditorTextStyle、RichEditorImageSpanStyle、RichEditorSymbolSpanStyle，修改后调用getCaretRect获取当前光标与RichEditor的相对位置
      let button_cursor_position_0001_change_style = await driver.waitForComponent(ON.id('button_cursor_position_0001' +
        '_change_style'), 500)
      await button_cursor_position_0001_change_style.click()
      await Utils.sleep(1000)

      // 3、随时改变光标位置（保持闪烁），同时调用getCaretRect获取当前光标与RichEditor的相对位置
      await rich_editor_cursor_position_0001.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0001_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0002
     * @tc.name   : Get cursor relative position when cursor is blinking and changing component layout
     * @tc.desc   : Verify text richeditor cursor position interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0002', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorPosition/UiComponentTextRichEditorCursorPosition0002')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、光标保持闪烁，动态改变组件布局（padding、margin、组件宽高），调用getCaretRect获取当前光标与RichEditor的相对位置
      let rich_editor_cursor_position_0002 =
        await driver.waitForComponent(ON.id('rich_editor_cursor_position_0002'), 500)
      await rich_editor_cursor_position_0002.click()
      await Utils.sleep(500)

      // 2、改变布局并获取光标位置
      let button_cursor_position_0002_change_layout =
        await driver.waitForComponent(ON.id('button_cursor_position_0002_change_layout'), 500)
      await button_cursor_position_0002_change_layout.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0002_01')
      await Utils.sleep(1000)

      // 3、再次改变布局
      await button_cursor_position_0002_change_layout.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0002_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0003
     * @tc.name   : Get cursor relative position when cursor is blinking and changing image text layout
     * @tc.desc   : Verify text richeditor cursor position interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0003', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorPosition/UiComponentTextRichEditorCursorPosition0003')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、光标保持闪烁，动态改变图文布局（textAlign、margin、组件宽高），调用getCaretRect获取当前光标与RichEditor的相对位置
      let rich_editor_cursor_position_0003 =
        await driver.waitForComponent(ON.id('rich_editor_cursor_position_0003'), 500)
      await rich_editor_cursor_position_0003.click()
      await Utils.sleep(500)

      // 2、改变图文布局并获取光标位置
      let button_cursor_position_0003_change_layout =
        await driver.waitForComponent(ON.id('button_cursor_position_0003_change_layout'), 500)
      await button_cursor_position_0003_change_layout.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0003_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0004
     * @tc.name   : Get cursor relative position when cursor is at empty line, line start or line end
     * @tc.desc   : Verify text richeditor cursor position interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0004', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorPosition/UiComponentTextRichEditorCursorPosition0004')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、改变光标位置到空行，调用getCaretRect获取当前光标与RichEditor的相对位置
      let rich_editor_cursor_position_0004 =
        await driver.waitForComponent(ON.id('rich_editor_cursor_position_0004'), 500)
      await rich_editor_cursor_position_0004.click()
      let button_cursor_position_0004_empty_line =
        await driver.waitForComponent(ON.id('button_cursor_position_0004_empty_line'), 500)
      await button_cursor_position_0004_empty_line.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0004_01')
      await Utils.sleep(1000)

      // 2、改变光标位置到行首，调用getCaretRect获取当前光标与RichEditor的相对位置
      let button_cursor_position_0004_line_start =
        await driver.waitForComponent(ON.id('button_cursor_position_0004_line_start'), 500)
      await button_cursor_position_0004_line_start.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0004_02')
      await Utils.sleep(1000)

      // 3、改变光标位置到行尾，调用getCaretRect获取当前光标与RichEditor的相对位置
      let button_cursor_position_0004_line_end =
        await driver.waitForComponent(ON.id('button_cursor_position_0004_line_end'), 500)
      await button_cursor_position_0004_line_end.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0004_03')
      await Utils.sleep(1000)

      done();
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0008
     * @tc.name   : Get cursor relative position after multiple touch changes
     * @tc.desc   : Verify text richeditor cursor position interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0008', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorPosition/UiComponentTextRichEditorCursorPosition0008')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、获取RichEditor组件的边界信息
      let rich_editor_cursor_position_0008 =
        await driver.waitForComponent(ON.id('rich_editor_cursor_position_0008'), 500)
      let rich_editor_cursor_position_0008_bounds = await rich_editor_cursor_position_0008.getBounds()
      let button_cursor_position_0008_get_caret =
        await driver.waitForComponent(ON.id('button_cursor_position_0008_get_caret'), 500)

      // 2、第1次点击：左上角位置
      await driver.click(rich_editor_cursor_position_0008_bounds.left + 20,
        rich_editor_cursor_position_0008_bounds.top + 20)
      await Utils.sleep(300)
      await button_cursor_position_0008_get_caret.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0008_01')
      await Utils.sleep(1000)

      // 3、第2次点击：中间位置
      let centerX = (rich_editor_cursor_position_0008_bounds.left +
      rich_editor_cursor_position_0008_bounds.right) / 2
      let centerY = (rich_editor_cursor_position_0008_bounds.top +
      rich_editor_cursor_position_0008_bounds.bottom) / 2
      await driver.click(centerX, centerY)
      await Utils.sleep(300)
      await button_cursor_position_0008_get_caret.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0008_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0009
     * @tc.name   : Get cursor relative position when text content is RTL display
     * @tc.desc   : Verify text richeditor cursor position interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0009', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorPosition/UiComponentTextRichEditorCursorPosition0009')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、获取RichEditor组件的边界信息
      let rich_editor_cursor_position_0009 =
        await driver.waitForComponent(ON.id('rich_editor_cursor_position_0009'), 500)
      let rich_editor_cursor_position_0009_bounds = await rich_editor_cursor_position_0009.getBounds()
      let button_cursor_position_0009_get_caret =
        await driver.waitForComponent(ON.id('button_cursor_position_0009_get_caret'), 500)

      // 2、第1次点击：右上角位置（RTL文本从右边开始）
      await driver.click(rich_editor_cursor_position_0009_bounds.right - 20,
        rich_editor_cursor_position_0009_bounds.top + 20)
      await Utils.sleep(300)
      await button_cursor_position_0009_get_caret.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0009_01')
      await Utils.sleep(1000)

      // 3、第2次点击：左侧中间位置
      await driver.click(rich_editor_cursor_position_0009_bounds.right - 40,
        rich_editor_cursor_position_0009_bounds.top + 40)
      await Utils.sleep(300)
      await button_cursor_position_0009_get_caret.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0009_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0010
     * @tc.name   : Get cursor relative position when device switches screen orientation
     * @tc.desc   : Verify text richeditor cursor position interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0010', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorPosition/UiComponentTextRichEditorCursorPosition0010')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、触机改变光标位置，调用getCaretRect获取当前光标与RichEditor的相对位置
      let rich_editor_cursor_position_0010 =
        await driver.waitForComponent(ON.id('rich_editor_cursor_position_0010'), 500)
      await rich_editor_cursor_position_0010.click()
      await Utils.sleep(500)

      // 2、切换横屏
      let button_cursor_position_0010_landscape =
        await driver.waitForComponent(ON.id('button_cursor_position_0010_landscape'), 500)
      await button_cursor_position_0010_landscape.click()
      await Utils.sleep(1000)

      // 3、获取光标位置
      let button_cursor_position_0010_get_caret =
        await driver.waitForComponent(ON.id('button_cursor_position_0010_get_caret'), 500)
      await button_cursor_position_0010_get_caret.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0010_01')
      await Utils.sleep(1000)

      // 4、切换竖屏
      let button_cursor_position_0010_portrait =
        await driver.waitForComponent(ON.id('button_cursor_position_0010_portrait'), 500)
      await button_cursor_position_0010_portrait.click()
      await Utils.sleep(1000)

      // 5、再次获取光标位置
      await button_cursor_position_0010_get_caret.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0010_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0011
     * @tc.name   : Get cursor relative position in StyledString component
     * @tc.desc   : Verify text richeditor cursor position interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0011', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorPosition/UiComponentTextRichEditorCursorPosition0011')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、获取RichEditor组件的边界信息
      let rich_editor_cursor_position_0011 =
        await driver.waitForComponent(ON.id('rich_editor_cursor_position_0011'), 500)
      let rich_editor_cursor_position_0011_bounds = await rich_editor_cursor_position_0011.getBounds()
      let button_cursor_position_0011_get_caret =
        await driver.waitForComponent(ON.id('button_cursor_position_0011_get_caret'), 500)

      // 2、第1次点击：左上角位置
      await driver.click(rich_editor_cursor_position_0011_bounds.left + 20,
        rich_editor_cursor_position_0011_bounds.top + 20)
      await Utils.sleep(300)
      await button_cursor_position_0011_get_caret.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0011_01')
      await Utils.sleep(1000)

      // 3、第2次点击：中间位置
      await driver.click(rich_editor_cursor_position_0011_bounds.left + 60,
        rich_editor_cursor_position_0011_bounds.top + 60)
      await Utils.sleep(300)
      await Utils.sleep(300)
      await button_cursor_position_0011_get_caret.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0011_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0014
     * @tc.name   : Multi-device verification
     * @tc.desc   : Verify text richeditor cursor position interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0014', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorCursorPosition/UiComponentTextRichEditorCursorPosition0014')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、获取按钮组件
      let button_cursor_position_0014_random_caret =
        await driver.waitForComponent(ON.id('button_cursor_position_0014_random_caret'), 500)

      // 2、第1次点击按钮：随机改变光标位置并获取位置信息
      await button_cursor_position_0014_random_caret.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0014_01')
      await Utils.sleep(1000)

      // 3、第2次点击按钮：再次随机改变光标位置并获取位置信息
      await button_cursor_position_0014_random_caret.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CURSOR_POSITION_0014_02')
      await Utils.sleep(1000)

      done();
    })

  })
}