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
import { Driver, ON, MouseButton } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'
import { hilog } from '@kit.PerformanceAnalysisKit'
import TestHelper from '../../../model/TestHelper'

export default function uiComponentTextRichEditorSearch() {
  describe('uiComponentTextRichEditorSearch', () => {

    afterEach(async (done: Function) => {

      await TestHelper.destroyWindow()

      done()

    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0002
     * @tc.name   : Gesture select all content, verify search menu position
     * @tc.desc   : Verify text richeditor search interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0002', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorSearchAlt/UiComponentTextRichEditorSearch0002')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、获取RichEditor组件的边界信息
      let rich_editor_search_0002 = await driver.waitForComponent(ON.id('rich_editor_search_0002'), 500)
      let rich_editor_search_0002_bounds = await rich_editor_search_0002.getBounds()

      // 2、计算拖拽起点和终点（从左上角到右下角）
      let startX = Math.floor(rich_editor_search_0002_bounds.left + 15)
      let startY = Math.floor(rich_editor_search_0002_bounds.top + 15)
      let endX = Math.floor(rich_editor_search_0002_bounds.right - 15)
      let endY = Math.floor(rich_editor_search_0002_bounds.bottom - 15)

      // 3、使用 dragBetween 从左上角拖到右下角全选文本
      await driver.dragBetween({
        x: startX,
        y: startY,
        displayId: 0
      }, {
        x: endX,
        y: endY,
        displayId: 0
      }, 600)
      await Utils.sleep(1000)

      // 4、拖拽后菜单自动打开，截图验证搜索菜单位置
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0002_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0003
     * @tc.name   : Copy then select all, verify search menu position
     * @tc.desc   : Verify text richeditor search interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0003', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorSearchAlt/UiComponentTextRichEditorSearch0003')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、查找两个 RichEditor 组件
      let rich_editor_search_0003_01 = await driver.waitForComponent(ON.id('rich_editor_search_0003_01'), 500)
      let rich_editor_search_0003_02 = await driver.waitForComponent(ON.id('rich_editor_search_0003_02'), 500)

      // 2、长按第一个 RichEditor，选中内容
      await rich_editor_search_0003_01.longClick()
      await Utils.sleep(1000)

      // 3、点击"全选"
      let button_all_select_0003 = await driver.waitForComponent(ON.text('全选'), 2000)
      await button_all_select_0003.click()
      await Utils.sleep(1000)

      // 4、点击"复制"（使剪贴板有内容）
      let button_copy_0003 = await driver.waitForComponent(ON.text('复制'), 500)
      await button_copy_0003.click()


      // 5、长按第二个 RichEditor，弹出菜单
      await rich_editor_search_0003_02.longClick()

      // 6、点击"粘贴"按钮
      let button_paste_0003 = await driver.waitForComponent(ON.text('粘贴'), 500)
      await button_paste_0003.click()

      // 7、获取第二个 RichEditor 的边界信息
      let rich_editor_search_0003_02_bounds = await rich_editor_search_0003_02.getBounds()

      // 8、计算拖拽起点和终点（从左上角到右下角）
      let startX = Math.floor(rich_editor_search_0003_02_bounds.left + 15)
      let startY = Math.floor(rich_editor_search_0003_02_bounds.top + 15)
      let endX = Math.floor(rich_editor_search_0003_02_bounds.right - 15)
      let endY = Math.floor(rich_editor_search_0003_02_bounds.bottom - 15)

      // 9、使用 dragBetween 从左上角拖到右下角全选粘贴后的文本
      await driver.dragBetween({
        x: startX,
        y: startY,
        displayId: 0
      }, {
        x: endX,
        y: endY,
        displayId: 0
      }, 600)
      await Utils.sleep(1000)

      // 10、截图验证菜单顺序（应显示：剪切-复制-粘贴-搜索-拓展菜单）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0003_01')
      await Utils.sleep(1000)


      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0004
     * @tc.name   : Search menu display incomplete, shown in extend menu
     * @tc.desc   : Verify text richeditor search interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0004', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorSearchAlt/UiComponentTextRichEditorSearch0004')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、查找 RichEditor 组件
      let rich_editor_search_0004 = await driver.waitForComponent(ON.id('rich_editor_search_0004'), 500)

      // 2、长按 RichEditor，触发菜单
      await rich_editor_search_0004.longClick()
      await Utils.sleep(1000)

      // 3、点击"全选"按钮，选中所有内容
      let button_all_select_0004 = await driver.waitForComponent(ON.text('全选'), 2000)
      await button_all_select_0004.click()
      await Utils.sleep(1500)

      // 4、尝试查找"更多"按钮，如果存在则点击打开拓展菜单
      try {
        let button_more_0004 = await driver.findComponent(ON.text('更多'))
        if (button_more_0004) {
          await button_more_0004.click()
          await Utils.sleep(1000)
        }
      } catch (err) {
        // 如果没有"更多"按钮，说明菜单空间充足，直接继续
      }

      // 5、截图验证搜索菜单显示（可能在主菜单或拓展菜单内）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0004_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0005
     * @tc.name   : Mouse right click select text, verify search menu position
     * @tc.desc   : Verify text richeditor search interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0005', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorSearchAlt/UiComponentTextRichEditorSearch0005')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、查找 RichEditor 组件
      let rich_editor_search_0005 = await driver.waitForComponent(ON.id('rich_editor_search_0005'), 500)
      let rich_editor_search_0005_bounds = await rich_editor_search_0005.getBounds()

      // 2、计算 RichEditor 中心位置
      let centerX = Math.floor((rich_editor_search_0005_bounds.left + rich_editor_search_0005_bounds.right) / 2)
      let centerY = Math.floor((rich_editor_search_0005_bounds.top + rich_editor_search_0005_bounds.bottom) / 2)

      // 3、使用鼠标右键点击
      await driver.mouseClick({
        x: centerX,
        y: centerY,
        displayId: 0
      }, MouseButton.MOUSE_BUTTON_RIGHT)
      await Utils.sleep(1000)

      // 4、点击"全选"按钮，选中所有内容
      let button_all_select_0005 = await driver.waitForComponent(ON.text('全选'), 2000)
      await button_all_select_0005.click()
      await Utils.sleep(1000)

      // 5、截图验证搜索菜单位置
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0005_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0008
     * @tc.name   : Custom search button via editMenuOptions
     * @tc.desc   : Verify text richeditor search interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0008', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorSearchAlt/UiComponentTextRichEditorSearch0008')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、查找主编辑区 RichEditor 并获取边界
      let rich_editor_search_0008 = await driver.waitForComponent(ON.id('rich_editor_search_0008'), 500)
      let rich_editor_search_0008_bounds = await rich_editor_search_0008.getBounds()

      // 2、使用 dragBetween 手势全选内容（更可靠）
      let startX = Math.floor(rich_editor_search_0008_bounds.left + 15)
      let startY = Math.floor(rich_editor_search_0008_bounds.top + 15)
      let endX = Math.floor(rich_editor_search_0008_bounds.right - 15)
      let endY = Math.floor(rich_editor_search_0008_bounds.bottom - 15)

      hilog.info(0x0000, 'TEST', `开始手势全选: (${startX}, ${startY}) -> (${endX}, ${endY})`)
      await driver.dragBetween({
        x: startX,
        y: startY,
        displayId: 0
      }, {
        x: endX,
        y: endY,
        displayId: 0
      }, 600)
      await Utils.sleep(1500) // 等待菜单弹出

      // 3、直接查找并点击自定义的"搜索"按钮（已插入到主菜单前面位置）
      let button_search_0008 = await driver.waitForComponent(ON.text('搜索'), 2000)
      hilog.info(0x0000, 'TEST', '找到自定义搜索按钮，准备点击')
      await button_search_0008.click()
      await Utils.sleep(1000)

      // 4、截图验证日志区域显示"searched click"
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0008_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0010
     * @tc.name   : Select non-text content, no search menu displayed
     * @tc.desc   : Verify text richeditor search interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0010', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorSearchAlt/UiComponentTextRichEditorSearch0010')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、查找 RichEditor 组件（只包含图片，不包含文本）
      let rich_editor_search_0010 = await driver.waitForComponent(ON.id('rich_editor_search_0010'), 500)

      // 2、长按 RichEditor，触发菜单
      await rich_editor_search_0010.longClick()
      await Utils.sleep(1000)

      // 3、点击"全选"按钮，选中所有内容（仅图片）
      let button_all_select_0010 = await driver.waitForComponent(ON.text('全选'), 2000)
      await button_all_select_0010.click()
      await Utils.sleep(1000)

      // 4、截图验证菜单中不显示"搜索"选项（因为选中的内容不包含文本）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0010_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0011
     * @tc.name   : Only Huawei browser installed, no search menu displayed
     * @tc.desc   : Verify text richeditor search interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0011', Level.LEVEL2, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorSearchAlt/UiComponentTextRichEditorSearch0011')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 前置条件：设备不安装华为浏览器（需要在测试执行前手动配置或通过脚本卸载）

      // 1、查找 RichEditor 组件
      let rich_editor_search_0011 = await driver.waitForComponent(ON.id('rich_editor_search_0011'), 500)

      // 2、长按 RichEditor，触发菜单
      await rich_editor_search_0011.longClick()
      await Utils.sleep(1000)

      // 3、点击"全选"按钮，选中所有内容
      let button_all_select_0011 = await driver.waitForComponent(ON.text('全选'), 2000)
      await button_all_select_0011.click()
      await Utils.sleep(1000)

      // 4、截图验证菜单中不显示"搜索"选项（因为设备未安装华为浏览器）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SEARCH_0011_01')
      await Utils.sleep(1000)

      done();
    })

  })
}