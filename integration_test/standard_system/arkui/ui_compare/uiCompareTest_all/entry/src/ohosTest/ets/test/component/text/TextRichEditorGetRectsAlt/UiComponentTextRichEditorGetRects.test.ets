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

export default function uiComponentTextRichEditorGetRects() {

  describe('uiComponentTextRichEditorGetRects', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0003
     * @tc.name   : Set the text range of the area obtained by getRectsForRange to [1,2]
     * @tc.desc   : Verify text richeditor getrects interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0003', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0003 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorGetRects/UiComponentTextRichEditorGetRects01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorGetRects01'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0003 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0013
     * @tc.name   : Set the height of the rectangular area returned by getRectsForRange to INCLUDE_LINE_SPACE_TOP(3)
     * @tc.desc   : Verify text richeditor getrects interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0013', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0013 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorGetRects/UiComponentTextRichEditorGetRects02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorGetRects02'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0013 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0012
     * @tc.name   : Set the height of the rectangular area returned by getRectsForRange to INCLUDE_LINE_SPACE_MIDDLE(2)
     * @tc.desc   : Verify text richeditor getrects interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0012', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0012 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorGetRects/UiComponentTextRichEditorGetRects03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorGetRects03'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0012 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0020
     * @tc.name   : getRectsForRange gets empty text/shows the draw area information of the placeholder
     * @tc.desc   : Verify text richeditor getrects interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0020 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorGetRects/UiComponentTextRichEditorGetRects04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorGetRects04_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorGetRects04_02'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button02.click()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0015
     * @tc.name   : Set the height of the rectangular area returned by getRectsForRange to STRUT(5)
     * @tc.desc   : Verify text richeditor getrects interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0015', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0015 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorGetRects/UiComponentTextRichEditorGetRects05')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorGetRects05'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0015 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0008
     * @tc.name   : Set the width of the rectangular area returned by getRectsForRange to MAX(1)
     * @tc.desc   : Verify text richeditor getrects interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0008', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0008 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorGetRects/UiComponentTextRichEditorGetRects06')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorGetRects06'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0008 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0014
     * @tc.name   : Set the width of the rectangular area returned by getRectsForRange to INCLUDE_LINE_SPACE_BOTTOM(4)
     * @tc.desc   : Verify text richeditor getrects interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0014', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0014 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorGetRects/UiComponentTextRichEditorGetRects07')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorGetRects07'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0014 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0007
     * @tc.name   : Set the width of the rectangular area returned by getRectsForRange to TIGHT(0)
     * @tc.desc   : Verify text richeditor getrects interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0007', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0007 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorGetRects/UiComponentTextRichEditorGetRects08')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorGetRects08'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0007 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0017
     * @tc.name   : getRectsForRange obtains the drawing area information of plain text (CHINESE, ENGLI, N.Y., and Korea, spaces, special symbols, expressions) content
     * @tc.desc   : Verify text richeditor getrects interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0017', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0017 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorGetRects/UiComponentTextRichEditorGetRects09')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorGetRects09_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorGetRects09_02'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button02.click()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0017 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0019
     * @tc.name   : getRectsForRangeto get the draw area information for the property string content
     * @tc.desc   : Verify text richeditor getrects interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0019', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0019 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorGetRects/UiComponentTextRichEditorGetRects10')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorGetRects10'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0019 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0004
     * @tc.name   : Set the text range of the area obtained by getRectsForRange to [50,51]
     * @tc.desc   : Verify text richeditor getrects interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0004', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0004 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorGetRects/UiComponentTextRichEditorGetRects11')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorGetRects11'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0004 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0018
     * @tc.name   : getRectsForRange obtains the drawing area information of the mixed text (TextSpan, ImageSpan, BuilderSpan, SymbolSpan) content
     * @tc.desc   : Verify text richeditor getrects interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0018', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0018 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorGetRects/UiComponentTextRichEditorGetRects12')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorGetRects12_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorGetRects12_02'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button02.click()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GETRECTS_0018 finish.`);
      done()
    })

  })
}