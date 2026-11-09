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

export default function uiComponentTextRichEditorOnHover() {
  describe('uiComponentTextRichEditorOnHover', () => {

    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        done()
        return
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          return;
        }
      })
      await Utils.sleep(500);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00004
     * @tc.name   : Select image by button and long press to bring up menu to test onHover callback
     * @tc.desc   : Verify text richeditor onhover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00004', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面，创建RichEditor组件
      Settings.createWindow('testability/pages/component/text/TextRichEditorOnHover/UiComponentTextRichEditorOnHover00004')
      let driver = await Driver.create()
      await Utils.sleep(1000)

      let rich_editor_onhover_00004 = await driver.waitForComponent(ON.id('rich_editor_onhover_00004'), 1000)
      await Utils.sleep(500)

      // 步骤2：点击"添加图文混排内容"按钮，添加图片和文本
      let button_add_content = await driver.waitForComponent(ON.id('button_onhover_00004_add_content'), 1000)
      await button_add_content.click()
      await Utils.sleep(1000)

      // 步骤3：截图验证，显示初始添加的图文混排内容
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00004_01")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      // 步骤4：点击RichEditor组件，然后点击"选择图片"按钮选中图片
      await rich_editor_onhover_00004.click()
      let button_select = await driver.waitForComponent(ON.id('button_onhover_00004_select'), 1000)
      await button_select.click()
      await Utils.sleep(500)
      
      // 步骤5：获取RichEditor组件边界，计算图片位置
      let bounds_00004 = await rich_editor_onhover_00004.getBounds()
      let imageX = Math.max(0, Math.floor(bounds_00004.left + 50))
      let imageY = Math.max(0, Math.floor(bounds_00004.top + 50))
      
      // 步骤6：移动鼠标到图片上，触发onHover回调
      await driver.mouseMoveTo({ x: imageX, y: imageY })
      await Utils.sleep(800)
      
      // 步骤7：截图验证，选中图片后鼠标移到图片上触发onHover回调事件
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00004_02")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      // 步骤8：点击其他位置取消选中
      let outsideX = Math.max(0, Math.floor(bounds_00004.right - 50))
      let outsideY = Math.max(0, Math.floor(bounds_00004.top + 50))
      await driver.mouseClick({ x: outsideX, y: outsideY, displayId: 0 }, MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(500)
      
      // 步骤9：长按图片弹出菜单栏
      await driver.longClick(imageX, imageY)
      await Utils.sleep(500)
      
      // 步骤10：移动鼠标到图片上，再次触发onHover回调
      await driver.mouseMoveTo({ x: imageX, y: imageY })
      await Utils.sleep(800)
      
      // 步骤11：截图验证，长按图片拉起菜单后鼠标移到图片上触发onHover回调事件
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00004_03")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00002
     * @tc.name   : onHover event trigger area test
     * @tc.desc   : Verify text richeditor onhover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00002', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面，创建RichEditor组件
      Settings.createWindow('testability/pages/component/text/TextRichEditorOnHover/UiComponentTextRichEditorOnHover00002')
      let driver = await Driver.create()
      await Utils.sleep(1000)

      let rich_editor_onhover_00002 = await driver.waitForComponent(ON.id('rich_editor_onhover_00002'), 1000)
      await Utils.sleep(500)

      // 步骤2：点击"添加图文混排内容"按钮，添加120x120的图片和文本
      let button_add_content = await driver.waitForComponent(ON.id('button_onhover_00002_add_content'), 1000)
      await button_add_content.click()
      await Utils.sleep(1000)

      // 步骤3：截图验证，显示初始添加的图文混排内容
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00002_01")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      // 步骤4：获取RichEditor组件边界，计算图片中心位置
      let bounds_00002 = await rich_editor_onhover_00002.getBounds()
      let centerX = Math.max(0, Math.floor(bounds_00002.left + 100))
      let centerY = Math.max(0, Math.floor(bounds_00002.top + 100))
      
      // 步骤5：移动鼠标到图片中心区域，触发onHover回调
      await driver.mouseMoveTo({ x: centerX, y: centerY })
      await Utils.sleep(1000)
      
      // 步骤6：截图验证，鼠标放至图片中心区域触发onHover回调事件
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00002_02")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      // 步骤7：移动鼠标到其他位置，触发onHover(false)
      await driver.mouseMoveTo({ x: 300, y: 300})
      await Utils.sleep(1000)

      // 步骤8：计算图片边缘位置
      let edgeX = Math.max(0, Math.floor(bounds_00002.left + 50))
      let edgeY = Math.max(0, Math.floor(bounds_00002.top + 50))
      
      // 步骤9：移动鼠标到图片边缘区域，再次触发onHover回调
      await driver.mouseMoveTo({ x: edgeX, y: edgeY })
      await Utils.sleep(1000)
      
      // 步骤10：截图验证，鼠标放至图片边缘区域触发onHover回调事件
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00002_03")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00003
     * @tc.name   : onHover (true/false) event trigger test
     * @tc.desc   : Verify text richeditor onhover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00003', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面，创建RichEditor组件
      Settings.createWindow('testability/pages/component/text/TextRichEditorOnHover/UiComponentTextRichEditorOnHover00003')
      let driver = await Driver.create()
      await Utils.sleep(1000)

      let rich_editor_onhover_00003 = await driver.waitForComponent(ON.id('rich_editor_onhover_00003'), 1000)
      await Utils.sleep(500)

      // 步骤2：点击"添加图文混排内容"按钮，添加100x100的图片和文本
      let button_add_content = await driver.waitForComponent(ON.id('button_onhover_00003_add_content'), 1000)
      await button_add_content.click()
      await Utils.sleep(1000)

      // 步骤3：截图验证，显示初始添加的图文混排内容
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00003_01")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      // 步骤4：获取RichEditor组件边界，计算图片中心位置
      let bounds_00003 = await rich_editor_onhover_00003.getBounds()
      let centerX = Math.max(0, Math.floor(bounds_00003.left + 50))
      let centerY = Math.max(0, Math.floor(bounds_00003.top + 50))
      
      // 步骤5：移动鼠标到图片中心区域，触发onHover(true)回调
      await driver.mouseMoveTo({ x: centerX, y: centerY })
      await Utils.sleep(1000)
      
      // 步骤6：截图验证，鼠标移入图片区域成功触发onHover(true)回调事件
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00003_02")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00008
     * @tc.name   : Cursor moving between images onHover event test
     * @tc.desc   : Verify text richeditor onhover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00008', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面，创建RichEditor组件
      Settings.createWindow('testability/pages/component/text/TextRichEditorOnHover/UiComponentTextRichEditorOnHover00008')
      let driver = await Driver.create()
      await Utils.sleep(1000)

      let rich_editor_onhover_00008 = await driver.waitForComponent(ON.id('rich_editor_onhover_00008'), 1000)
      await Utils.sleep(500)

      // 步骤2：点击"添加两张图片"按钮，添加两张80x80的图片和间隔文本
      let button_add_content = await driver.waitForComponent(ON.id('button_onhover_00008_add_content'), 1000)
      await button_add_content.click()
      await Utils.sleep(1000)

      // 步骤3：截图验证，显示初始添加的两张图片和文本
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00008_01")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      // 步骤4：获取RichEditor组件边界
      let bounds_00008 = await rich_editor_onhover_00008.getBounds()

      // 步骤5：移动鼠标到第一张图片位置，触发onHover(true)
      await driver.mouseMoveTo({ x: bounds_00008.left+100, y: bounds_00008.top+80 })
      await Utils.sleep(1000)
      
      // 步骤6：截图验证，鼠标移到第一张图片触发onHover(true)
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00008_02")
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 步骤7：移动鼠标到两张图片之间的文本区域，触发onHover(false)
      await driver.mouseMoveTo({ x: bounds_00008.left+200, y: bounds_00008.top+80 })
      await Utils.sleep(1000)
      
      // 步骤8：移动鼠标到第二张图片位置，再次触发onHover(true)
      await driver.mouseMoveTo({ x: bounds_00008.left+300, y: bounds_00008.top+80 })
      await Utils.sleep(1000)
      
      // 步骤9：截图验证，光标在两个图片间移动触发onHover(true)两次和onHover(false)一次
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_onHover_00008_03")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      done();
    })

  })
}