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

export default function uiComponentTextRichEditorSelectScroll() {
  describe('uiComponentTextRichEditorSelectScroll', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_009_234
     * @tc.name   : Preview mode, selecting content to the boundary downwards (upwards), can trigger page scrolling
     * @tc.desc   : Verify text richeditor selectscroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_009_234', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorSelectScroll/UiComponentTextRichEditorSelectScroll009234')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1.点击richeditor组件获取焦点
      let rich_editor_selectscroll_009234 = await driver.waitForComponent(ON.id('rich_editor_selectscroll_009234'), 500)
      let rich_editor_selectscroll_009234_center = await rich_editor_selectscroll_009234.getBoundsCenter()
      await rich_editor_selectscroll_009234.click()

      // 2.选择部分图文
      await driver.drag(rich_editor_selectscroll_009234_center.x, rich_editor_selectscroll_009234_center.y - 100,
        rich_editor_selectscroll_009234_center.x, rich_editor_selectscroll_009234_center.y + 300, 2000)

      // 3.滑动后截图测试
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_009_234_01')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_008
     * @tc.name   : Text/symbol/image/builderspan combination scrolling
     * @tc.desc   : Verify text richeditor selectscroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_008', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorSelectScroll/UiComponentTextRichEditorSelectScroll008')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1.点击richeditor组件获取焦点
      let rich_editor_selectscroll_008 = await driver.waitForComponent(ON.id('rich_editor_selectscroll_008'), 500)
      await rich_editor_selectscroll_008.click()

      // 2.选择部分图文
      let btn_selectscroll_008_selectAll = await driver.waitForComponent(ON.id('btn_selectscroll_008_selectAll'), 500)
      await btn_selectscroll_008_selectAll.click()

      // 3.滑动后截图测试
      let rich_editor_selectscroll_008_center = await rich_editor_selectscroll_008.getBoundsCenter()
      await driver.mouseScroll({
        x: rich_editor_selectscroll_008_center.x,
        y: rich_editor_selectscroll_008_center.y - 100
      }, true, 4);
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_008_01')
      await Utils.sleep(1000)

      // 4.滚动到底部并截图
      await rich_editor_selectscroll_008.scrollToBottom(2000)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_008_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_003
     * @tc.name   : Selected area scrolls to invisible area and then scrolls back to visible area
     * @tc.desc   : Verify text richeditor selectscroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_003', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorSelectScroll/UiComponentTextRichEditorSelectScroll003')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1.点击richeditor组件获取焦点
      let rich_editor_selectscroll_003 = await driver.waitForComponent(ON.id('rich_editor_selectscroll_003'), 500)
      await rich_editor_selectscroll_003.click()

      // 2.选择部分图文
      let btn_selectscroll_003_selectAll = await driver.waitForComponent(ON.id('btn_selectscroll_003_selectAll'), 500)
      await btn_selectscroll_003_selectAll.click()

      // 3.滚动到底部并截图
      await rich_editor_selectscroll_003.scrollToBottom(2000)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_003_01')
      await Utils.sleep(1000)

      // 4.滚动到顶部并截图
      await rich_editor_selectscroll_003.scrollToTop(2000)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_003_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_001
     * @tc.name   : Selected area scrolls within the visible area
     * @tc.desc   : Verify text richeditor selectscroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_001', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorSelectScroll/UiComponentTextRichEditorSelectScroll001')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1.点击richeditor组件获取焦点
      let rich_editor_selectscroll_001 = await driver.waitForComponent(ON.id('rich_editor_selectscroll_001'), 500)
      await rich_editor_selectscroll_001.click()

      // 2.全选图文
      let btn_selectscroll_001_selectAll = await driver.waitForComponent(ON.id('btn_selectscroll_001_selectAll'), 500)
      await btn_selectscroll_001_selectAll.click()

      // 3.滚动到顶部并截图
      await rich_editor_selectscroll_001.scrollToTop(2000)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_001_01')
      await Utils.sleep(1000)

      // 4.滚动到底部并截图
      await rich_editor_selectscroll_001.scrollToBottom(2000)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_001_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_009
     * @tc.name   : Selected content scrolls in memo
     * @tc.desc   : Verify text richeditor selectscroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_009', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorSelectScroll/UiComponentTextRichEditorSelectScroll009')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1.点击richeditor组件获取焦点
      let rich_editor_selectscroll_009 = await driver.waitForComponent(ON.id('rich_editor_selectscroll_009'), 500)
      await rich_editor_selectscroll_009.click()

      // 2.选择部分图文
      let btn_selectscroll_009_selectAll = await driver.waitForComponent(ON.id('btn_selectscroll_009_selectAll'), 500)
      await btn_selectscroll_009_selectAll.click()

      // 3.鼠标滚动并截图
      let rich_editor_selectscroll_009_center = await rich_editor_selectscroll_009.getBoundsCenter()
      await driver.mouseScroll({
        x: rich_editor_selectscroll_009_center.x,
        y: rich_editor_selectscroll_009_center.y - 100
      }, true, 4);
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_009_01')
      await Utils.sleep(1000)

      // 4.滚动到底部并截图
      await rich_editor_selectscroll_009.scrollToBottom(2000)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_009_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_002
     * @tc.name   : Selected area scrolls to invisible area
     * @tc.desc   : Verify text richeditor selectscroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_002', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorSelectScroll/UiComponentTextRichEditorSelectScroll002')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1.点击richeditor组件获取焦点
      let rich_editor_selectscroll_002 = await driver.waitForComponent(ON.id('rich_editor_selectscroll_002'), 500)
      await rich_editor_selectscroll_002.click()

      // 2.选择部分图文
      let btn_selectscroll_002_selectAll = await driver.waitForComponent(ON.id('btn_selectscroll_002_selectAll'), 500)
      await btn_selectscroll_002_selectAll.click()

      // 3.滚动到底部并截图
      await rich_editor_selectscroll_002.scrollToBottom(2000)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_002_01')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_010
     * @tc.name   : Selected content scrolls in attribute string
     * @tc.desc   : Verify text richeditor selectscroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_010', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorSelectScroll/UiComponentTextRichEditorSelectScroll010')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1.点击richeditor组件获取焦点
      let rich_editor_selectscroll_010 = await driver.waitForComponent(ON.id('rich_editor_selectscroll_010'), 500)
      await rich_editor_selectscroll_010.click()

      // 2.选择部分图文
      let btn_selectscroll_010_selectAll = await driver.waitForComponent(ON.id('btn_selectscroll_010_selectAll'), 500)
      await btn_selectscroll_010_selectAll.click()

      // 3.鼠标滚动并截图
      let rich_editor_selectscroll_010_center = await rich_editor_selectscroll_010.getBoundsCenter()
      await driver.mouseScroll({
        x: rich_editor_selectscroll_010_center.x,
        y: rich_editor_selectscroll_010_center.y - 100
      }, true, 4);
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_010_01')
      await Utils.sleep(1000)

      // 4.滚动到底部并截图
      await rich_editor_selectscroll_010.scrollToBottom(2000)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_selectscroll_010_02')
      await Utils.sleep(1000)

      done();
    })

  })
}