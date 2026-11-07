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
import snapShot from '../../../model/snapShot'
import { KeyCode } from '@kit.InputKit'
import TestHelper from '../../../model/TestHelper'

export default function uiComponentTextRichEditorAction() {
  describe('uiComponentTextRichEditorAction', () => {

    afterEach(async (done: Function) => {

      await TestHelper.destroyWindow()

      done()

    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0040
     * @tc.name   : Double handle position swap
     * @tc.desc   : Verify text richeditor action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0040', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorAction_12/UiComponentTextRichEditorAction0040')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、查找 RichEditor 组件
      let rich_editor_action_0040 = await driver.waitForComponent(ON.id('rich_editor_action_0040'), 500)
      let rich_editor_action_0040_bounds_center = await rich_editor_action_0040.getBoundsCenter()
      // 2、长按选择文本
      await rich_editor_action_0040.longClick()
      await Utils.sleep(1000)

      // 3、拖动一侧手柄，与另一手柄位置互换
      await driver.drag(rich_editor_action_0040_bounds_center.x, rich_editor_action_0040_bounds_center.y,
        rich_editor_action_0040_bounds_center.x + 100, rich_editor_action_0040_bounds_center.y - 100, 200)

      // 4、截图验证文本可被拖拽
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0040_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0030
     * @tc.name   : Long press in empty text state
     * @tc.desc   : Verify text richeditor action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0030', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorAction_12/UiComponentTextRichEditorAction0030')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、查找删除按钮并点击
      let button_delete = await driver.waitForComponent(ON.id('button_action_0030_delete'), 500)
      await button_delete.click()
      await Utils.sleep(500)

      // 2、查找 RichEditor 组件并长按
      let rich_editor_action_0030 = await driver.waitForComponent(ON.id('rich_editor_action_0030'), 500)
      await rich_editor_action_0030.longClick()
      await Utils.sleep(1000)

      // 3、截图验证手柄、弹窗位置正常显示
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0030_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0140
     * @tc.name   : Move handle, verify selected position
     * @tc.desc   : Verify text richeditor action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0140', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorAction_12/UiComponentTextRichEditorAction0140')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、查找 RichEditor 组件
      let rich_editor_action_0140 = await driver.waitForComponent(ON.id('rich_editor_action_0140'), 500)

      // 2、长按第一行文本
      let bounds = await rich_editor_action_0140.getBounds()
      let firstLineX = Math.floor(bounds.left + 50)
      let firstLineY = Math.floor(bounds.top + 20)

      await driver.longClick(firstLineX, firstLineY)
      await Utils.sleep(1000)

      await driver.drag(firstLineX + 20, firstLineY, firstLineX + 100, firstLineY + 200, 200)

      // 3、拖动手柄至最后一行下空白处
      // 注：此步骤需要手动测试，自动化测试主要验证界面显示

      // 4、截图验证末端选中位置在最后一行
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0140_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0070_197
     * @tc.name   : addTextSpan set offset greater than total string length, observe cursor position
     * @tc.desc   : Verify text richeditor action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0070_197', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorAction_12/UiComponentTextRichEditorAction0070197')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、查找并点击按钮
      let button_add = await driver.waitForComponent(ON.id('button_action_0070197_add'), 500)
      await button_add.click()
      await Utils.sleep(1000)

      // 2、截图验证光标在添加内容后面
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0070_197_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0070_198
     * @tc.name   : Super long text triple click
     * @tc.desc   : Verify text richeditor action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0070_198', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorAction_12/UiComponentTextRichEditorAction0070198')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、查找 RichEditor 组件并选中图文混合内容
      let rich_editor_action_0070198 = await driver.waitForComponent(ON.id('rich_editor_action_0070198'), 500)
      let rich_editor_action_0070198_bounds_center = await rich_editor_action_0070198.getBoundsCenter()

      await driver.drag(rich_editor_action_0070198_bounds_center.x - 100,
        rich_editor_action_0070198_bounds_center.y - 100,
        rich_editor_action_0070198_bounds_center.x + 100, rich_editor_action_0070198_bounds_center.y + 100, 800)

      await Utils.sleep(1000)
      await driver.clickAt(rich_editor_action_0070198_bounds_center)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0070_198_01')
      await Utils.sleep(1000)

      await driver.clickAt(rich_editor_action_0070198_bounds_center)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0070_198_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0340
     * @tc.name   : When different content is placed at the beginning of the text, indentation and cursor position display normally
     * @tc.desc   : Verify text richeditor action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0340', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorAction_12/UiComponentTextRichEditorAction0340')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、清空 symbolSpan 前的文本内容
      let button_clear = await driver.waitForComponent(ON.id('button_action_0340_clear'), 500)
      await button_clear.click()
      await Utils.sleep(500)

      // 2、点击向右缩进
      let button_indent = await driver.waitForComponent(ON.id('button_action_0340_indent'), 500)
      await button_indent.click()
      await Utils.sleep(1000)

      // 截图1：光标保持在 symbolSpan 前的位置跟随文本内容一起缩进
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0340_01')
      await Utils.sleep(1000)

      // 3、设置 imageSpan 在文本前，点击缩进
      let button_image_indent = await driver.waitForComponent(ON.id('button_action_0340_image_indent'), 500)
      await button_image_indent.click()
      await Utils.sleep(1000)

      // 截图2：缩进失败，图片不支持设置缩进样式
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0340_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_251
     * @tc.name   : Continuous deletion without lag
     * @tc.desc   : Verify text richeditor action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_251', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorAction_12/UiComponentTextRichEditorAction0251')
      let driver = await Driver.create()
      await Utils.sleep(1000)

      // 1、查找 RichEditor 组件并点击文本末尾
      let rich_editor_action_0251 = await driver.waitForComponent(ON.id('rich_editor_action_0251'), 500)
      let bounds = await rich_editor_action_0251.getBounds()
      // 点击文本末尾位置
      await driver.click(bounds.right - 20, bounds.bottom - 20)

      // 2、长按软键盘删除键（通过循环连续触发删除键模拟长按）
      // 连续删除100次，每次间隔30ms，共约3秒，测试删除操作的流畅性
      for (let i = 0; i < 100; i++) {
        await driver.triggerKey(KeyCode.KEYCODE_DEL)
      }


      // 3、截图验证删除操作顺畅无卡顿，光标在文本末尾闪烁
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_251_01')
      await Utils.sleep(1000)

      done();
    })

  })
}