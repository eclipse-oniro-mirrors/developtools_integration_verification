/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, Component, MouseButton } from '@kit.TestKit'
/*
 * SUB_ACE_UI_ATTRIBUTES_FONT_INTERFACE_0010:设置文本颜色
 *
 * Settings.createWindow(config.url)：
 *  创建窗口，更改窗口基本配置，更改方式详见model/Settings createWindow方法
 *
 * windowSnap.snapShot(globalThis.context)：
 *  窗口截屏&图片文件保存，存储在设备端
 *  存储文件固定，单挑用例执行后覆盖，用于自动化UI对比
 *  支持调试更改文件名为时间戳格式，更改model/snapShot createAndGetFile方法 注释L35，放开L32，L33
 *
 * Logger日志使用方法：
 *  import Logger form './model/Logger'
 *  Logger.info(TAG,`config = ${config}, err = ${JSON.stringify(exception)}`)
 * */

export default function uiRichEditorScroll() {

  describe('uiRichEditorScroll', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0120
     * @tc.name   : RichEditor, multi-line text is displayed in the content area, and the height is dynamically changed
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0120 start.`);
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_02/UiRichEditorScroll01')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot();
      let button01: Component = await driver.waitForComponent(ON.id('UiRichEditorScroll01'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0150
     * @tc.name   : RichEditor, multi-line text, delete content
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0150 start.`);
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_02/UiRichEditorScroll02')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot();
      let button01: Component = await driver.waitForComponent(ON.id('UiRichEditorScroll02'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0110
     * @tc.name   : RichEditor, multi-line text is displayed in the content area, and the width is dynamically changed
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0110 start.`);
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_02/UiRichEditorScroll03')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot();
      let button01: Component = await driver.waitForComponent(ON.id('UiRichEditorScroll03'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0210
     * @tc.name   : RichEditor, multi-line text, padding settings
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0210', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0210 start.`);
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_02/UiRichEditorScroll04')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot();
      let button01: Component = await driver.waitForComponent(ON.id('UiRichEditorScroll04'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0230
     * @tc.name   : RichEditor, multi-line text, set clip
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0230 start.`);
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_02/UiRichEditorScroll05')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiRichEditorScroll05'),1000);
      let point =await richeditor.getBoundsCenter();
      await driver.mouseScroll({x:point.x, y:point.y}, true, 30)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0130
     * @tc.name   : RichEditor, multi-line text, select all text Scroll up and down to select all without disappearing
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0130', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0130 start.`);
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_02/UiRichEditorScroll06')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiRichEditorScroll06_01'),1000);
      let richeditor: Component = await driver.waitForComponent(ON.id('UiRichEditorScroll06_02'),1000);
      let point =await richeditor.getBoundsCenter();
      await richeditor.click();
      await button.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.mouseScroll({x:point.x, y:point.y}, false, 30)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0250
     * @tc.name   : RichEditor, multi-line text, select all text Scroll up and down to select all without disappearing
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0250', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0250 start.`);
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_02/UiRichEditorScroll07')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiRichEditorScroll07_01'),1000);
      let richeditor: Component = await driver.waitForComponent(ON.id('UiRichEditorScroll07_02'),1000);
      let point =await richeditor.getBoundsCenter();
      await driver.mouseScroll({x:point.x, y:point.y}, true, 2)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await richeditor.click();
      await button.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0270
     * @tc.name   : RichEditor, multi-line text, click to truncate text
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0270', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0270 start.`);
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_02/UiRichEditorScroll08')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiRichEditorScroll08_02'),1000);
      let point =await richeditor.getBoundsCenter();
      await driver.mouseScroll({x:point.x, y:point.y}, true, 2)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await richeditor.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0220
     * @tc.name   : RichEditor, multi-line text, set text indentation
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0220', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0220 start.`);
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_02/UiRichEditorScroll09')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_RICHEDITOR_SCROLL_0140
     * @tc.name   : RichEditor, multi-line text, select part of the text
     * @tc.desc   : Verify richeditor scroll interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_RICHEDITOR_SCROLL_0140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0140 start.`);
      Settings.createWindow('testability/pages/component/rich_editor/UiRichEditorScroll_02/UiRichEditorScroll10')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiRichEditorScroll10'),1000);
      let point = await richeditor.getBoundsCenter();
      await richeditor.click();
      await driver.longClick(point.x,point.y)
      await Utils.sleep(1500)
      await driver.mouseDrag({x:point.x+10, y:point.y+20},{x:point.x, y:point.y+100},600);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_RICHEDITOR_SCROLL_0140 finish.`);
      done()
    })

  })
}