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

export default function uiRichEditorScroll() {
  describe('uiRichEditorScroll', () => {
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
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0100
     * @tc.name   : RichEditor, mixed text and images exceed the display area
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0100', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_12/UiRichEditorScroll0100')
      await Utils.sleep(1000)
      let driver = await Driver.create()
      let addSpanBtn0100 = await driver.waitForComponent(ON.id('addSpanBtn0100'), 500)
      await addSpanBtn0100.click()
      let scrollBar0100: Component = await driver.waitForComponent(ON.id('richEditor0100'), 500)
      await scrollBar0100.click()
      await scrollBar0100.scrollToTop(1600)
      await Utils.sleep(2000)
      await scrollBar0100.scrollToBottom(1600)
      await Utils.sleep(2000)
      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0100_01')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0070
     * @tc.name   : RichEditor, add a single character, font size exceeds the display area
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0070', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_12/UiRichEditorScroll0070')
      await Utils.sleep(1000)
      let driver = await Driver.create()
      // 1.查找富文本组件和添加文本按钮
      let addTextBtn0070 = await driver.waitForComponent(ON.id('addTextBtn0070'), 500)
      let richEditor0070 = await driver.waitForComponent(ON.id('richEditor0070'), 500)

      // 2.添加超尺寸文字并滑动
      await addTextBtn0070.click()
      await Utils.sleep(1000)
      await richEditor0070.scrollToBottom(1600)
      await Utils.sleep(1000)

      // 3.截图验证效果
      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0070_01')
      await Utils.sleep(1000)
      done();
    })


    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0190
     * @tc.name   : RichEditor, multi-line text, scrollbar behavior
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0190', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_12/UiRichEditorScroll0190')
      await Utils.sleep(1000)
      let driver = await Driver.create()

      // 1.添加多行文本
      let addTextBtn0100 = await driver.waitForComponent(ON.id('addTextBtn0190'), 500)
      await addTextBtn0100.click()

      // 2. 查找组件位置鼠标滚动到底部截图验证
      let richEditor0190 = await driver.waitForComponent(ON.id('richEditor0190'), 500)
      const richEditor0190CenterPoint = await richEditor0190.getBoundsCenter()
      await driver.mouseScroll({ x: richEditor0190CenterPoint.x, y: richEditor0190CenterPoint.y }, true, 30)
      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0190_01')
      await Utils.sleep(1000)

      // 3.查找手柄坐标并拖拽滚动到顶部截图验证
      const scroolBarPoint0019 = await richEditor0190.getBounds()
      await driver.drag(scroolBarPoint0019.right, scroolBarPoint0019.bottom, scroolBarPoint0019.right, scroolBarPoint0019.bottom + 200, 2000)
      await Utils.sleep(1000)
      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0190_02')
      await Utils.sleep(1000)

      // 4.手势滑动到底部截图验证
      await richEditor0190.scrollToBottom(3000)
      await Utils.sleep(2000)
      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0190_03')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0200
     * @tc.name   : RichEditor, continuously input multi-line text, scroll avoidance
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0200', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_12/UiRichEditorScroll0200')
      await Utils.sleep(1000)
      let driver = await Driver.create()

      // 1.查找richEditor0200组件位置
      let richEditor0200 = await driver.waitForComponent(ON.id('richEditor0200'),500)
      for (let i = 1; i < 6; i++) {
        await richEditor0200.inputText(
          '================start==============\n'+
          '================第'+i+'次添加==============\n'+
          '================第'+i+'次添加==============\n'+
          '================第'+i+'次添加==============\n'+
          '================第'+i+'次添加==============\n'+
          '================第'+i+'次添加==============\n'+
          '================第'+i+'次添加==============\n'+
          '================第'+i+'次添加==============\n'+
          '================第'+i+'次添加==============\n'+
          '================end==============\n'
          , {
          paste:false,
          addition:true
        })
      }


      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0200_01')
      await Utils.sleep(1000)
      done();
    })


    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0170
     * @tc.name   : RichEditor, multi-line text, keyboard arrow keys move the cursor up and down
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0170', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_12/UiRichEditorScroll0170')
      await Utils.sleep(1000)
      let driver = await Driver.create()

      // 1.查找richEditor0170组件位置,添加多行文本
      let richEditor0170 = await driver.waitForComponent(ON.id('richEditor0170'),500)
      let addSpanBtn0170 = await driver.waitForComponent(ON.id('addSpanBtn0170'),500)
      await addSpanBtn0170.click()

      // 2.方向键上向上移动，截图验证
      await richEditor0170.click()
      for (let i = 0; i < 12; i++) {
        await driver.triggerKey(KeyCode.KEYCODE_DPAD_UP,0)
      }

      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0170_01')
      await Utils.sleep(1000)

      // 3.方向键上向上移动，截图验证
      for (let i = 0; i < 12; i++) {
        await driver.triggerKey(KeyCode.KEYCODE_DPAD_DOWN,0)
      }
      await Utils.sleep(3000)
      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0170_02')
      await Utils.sleep(1000)
      done();
    })



    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0260
     * @tc.name   : RichEditor, multi-line text, mouse drag scrollbar to scroll text
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0260', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_12/UiRichEditorScroll0260')
      await Utils.sleep(1000)
      let driver = await Driver.create()

      // 1.添加多行文本
      let addTextBtn0260 = await driver.waitForComponent(ON.id('addTextBtn0260'), 500)
      await addTextBtn0260.click()

      // 2. 查找组件位置鼠标滚动到底部截图验证
      let richEditor0260 = await driver.waitForComponent(ON.id('richEditor0260'), 500)
      const richEditor0260CenterPoint = await richEditor0260.getBoundsCenter()
      await driver.mouseScroll({ x: richEditor0260CenterPoint.x, y: richEditor0260CenterPoint.y }, true, 30)
      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0260_01')
      await Utils.sleep(1000)

      // 3.查找手柄坐标并拖拽滚动到顶部截图验证
      const scrollBarPoint0260 = await richEditor0260.getBounds()
      await driver.mouseDrag({x:scrollBarPoint0260.right-8, y:scrollBarPoint0260.bottom-10}, {x:scrollBarPoint0260.right-8,y: scrollBarPoint0260.bottom - 200}, 800)
      await Utils.sleep(2000)
      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0260_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0080
     * @tc.name   : RichEditor, add imageSpan, image information exceeds the display area
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0080', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_12/UiRichEditorScroll0080')
      await Utils.sleep(1000)
      let driver = await Driver.create()
      // 1. 添加测试图片
      let addImageBtn0080 = await driver.waitForComponent(ON.id('addImageBtn0080'),500)
      await addImageBtn0080.click()
      await Utils.sleep(2000)
      // 2.组件上下滑动截图
      let richEditor0080 = await driver.waitForComponent(ON.id('richEditor0080'),500)
      await richEditor0080.scrollToTop(2000)
      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0080_01')
      await Utils.sleep(1000)
      await richEditor0080.scrollToBottom(2000)
      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0080_02')
      await Utils.sleep(1000)
      done();
    })



    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0090
     * @tc.name   : RichEditor, add a single image, image size exceeds the display area
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0090', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_12/UiRichEditorScroll0090')
      await Utils.sleep(1000)
      let driver = await Driver.create()
      // 1. 添加测试图片
      let addImageBtn0090 = await driver.waitForComponent(ON.id('addImageBtn0090'),500)
      await addImageBtn0090.click()
      await Utils.sleep(2000)
      // 2.组件上下滑动截图
      let richEditor0090 = await driver.waitForComponent(ON.id('richEditor0090'),500)
      await richEditor0090.scrollToTop(2000)
      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0090_01')
      await Utils.sleep(1000)
      await richEditor0090.scrollToBottom(2000)
      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0090_02')
      await Utils.sleep(1000)
      done();
    })


    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0060
     * @tc.name   : RichEditor, add span, text content exceeds the display area
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0060', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_12/UiRichEditorScroll0060')
      await Utils.sleep(1000)
      let driver = await Driver.create()

      // 1.添加span内容
      let addTextBtn0060 = await driver.waitForComponent(ON.id('addTextBtn0060'), 500)
      await addTextBtn0060.click()

      // 2. 查找组件位置鼠标滚动到底部截图验证
      let richEditor0060 = await driver.waitForComponent(ON.id('richEditor0060'), 500)
      const richEditor0060CenterPoint = await richEditor0060.getBoundsCenter()
      await driver.mouseScroll({ x: richEditor0060CenterPoint.x, y: richEditor0060CenterPoint.y }, true, 30)
      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0060_01')
      await Utils.sleep(1000)

      // 3.查找手柄坐标并拖拽滚动到顶部截图验证
      const scrollBarPoint0060 = await richEditor0060.getBounds()
      await driver.mouseDrag({x:scrollBarPoint0060.right-8, y:scrollBarPoint0060.bottom-10}, {x:scrollBarPoint0060.right-8,y: scrollBarPoint0060.bottom - 200}, 800)
      await Utils.sleep(2000)
      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0060_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0160
     * @tc.name   : RichEditor, continuous keyboard input and delete, auto-scroll with cursor
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0160', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_12/UiRichEditorScroll0160')
      await Utils.sleep(1000)
      let driver = await Driver.create()

      // 1.点击RichEditor获取焦点
      let richEditor0160 = await driver.waitForComponent(ON.id('richEditor0160'), 500)
      await richEditor0160.click()
      await Utils.sleep(500)

      // 2.模拟键盘连续输入字符，测试自动向下滚动
      // 输入足够多的字符让内容超出RichEditor边界
      for (let i = 0; i < 10; i++) {
        // 输入一行文本加换行
        await driver.triggerKey(KeyCode.KEYCODE_A, 0)
        await driver.triggerKey(KeyCode.KEYCODE_ENTER, 0)  // 换行
        await Utils.sleep(50)  // 短暂延迟观察滚动效果
      }

      // 3.截图验证输入后的自动滚动效果（光标应该在可见区域）
      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0160_01')
      await Utils.sleep(1000)

      // 4.模拟键盘连续删除字符，测试自动向上滚动
      // 删除大量字符，观察是否会自动向上滚动
      for (let i = 0; i < 15; i++) {
        await driver.triggerKey(KeyCode.KEYCODE_DEL, 0)  // 删除键
        await Utils.sleep(20)  // 短暂延迟观察滚动效果
      }

      // 5.截图验证删除后的自动滚动效果（光标应该向上移动并保持可见）
      await windowSnap.snapShot('SUB_ACE_UI_RICHEDITOR_SCROLL_0160_02')
      await Utils.sleep(1000)

      done();
    })


  })
}