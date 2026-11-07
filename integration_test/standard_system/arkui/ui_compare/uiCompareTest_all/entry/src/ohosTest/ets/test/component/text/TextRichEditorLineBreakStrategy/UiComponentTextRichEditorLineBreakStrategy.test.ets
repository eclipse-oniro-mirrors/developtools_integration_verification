/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default function uiComponentTextRichEditorLineBreakStrategy() {

  describe('uiComponentTextRichEditorLineBreakStrategy', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0010
     * @tc.name   : Changing the component size in the rich editor does not affect the word wrap effect
     * @tc.desc   : Verify text richeditor linebreakstrategy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0010 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorLineBreakStrategy_02/UiComponentTextRichEditorLineBreakStrategy01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorLineBreakStrategy01'),1000);
      windowSnap.snapShot()
      await Utils.sleep(500)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(500)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0011
     * @tc.name   : Changing the font size in the rich editor does not affect the word wrap effect
     * @tc.desc   : Verify text richeditor linebreakstrategy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0011', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0011 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorLineBreakStrategy_02/UiComponentTextRichEditorLineBreakStrategy02')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorLineBreakStrategy02'),1000);
      windowSnap.snapShot()
      await Utils.sleep(500)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(500)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0011 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0012
     * @tc.name   : Setting leadingMargin in the rich editor does not affect the word wrap effect
     * @tc.desc   : Verify text richeditor linebreakstrategy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0012', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0012 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorLineBreakStrategy_02/UiComponentTextRichEditorLineBreakStrategy03')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorLineBreakStrategy03'),1000);
      windowSnap.snapShot()
      await Utils.sleep(500)
      await button03.click()
      windowSnap.snapShot()
      await Utils.sleep(500)
      await button03.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0012 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0013
     * @tc.name   : Setting textAlign in the rich editor does not affect the word wrap effect
     * @tc.desc   : Verify text richeditor linebreakstrategy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0013', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0013 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorLineBreakStrategy_02/UiComponentTextRichEditorLineBreakStrategy04')
      let driver:Driver=Driver.create();
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorLineBreakStrategy04'),1000);
      windowSnap.snapShot()
      await Utils.sleep(500)
      await button04.click()
      windowSnap.snapShot()
      await Utils.sleep(500)
      await button04.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0013 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0015
     * @tc.name   : Setting both lineBreakStrategy and wordBreak in the rich editor
     * @tc.desc   : Verify text richeditor linebreakstrategy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0015', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0015 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorLineBreakStrategy_02/UiComponentTextRichEditorLineBreakStrategy05')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0015 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0014
     * @tc.name   : Input content follows paragraph line break in the rich editor
     * @tc.desc   : Verify text richeditor linebreakstrategy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0014', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0014 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorLineBreakStrategy_02/UiComponentTextRichEditorLineBreakStrategy06')
      let driver:Driver=Driver.create();
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorLineBreakStrategy06'),1000);
      windowSnap.snapShot()
      await Utils.sleep(500)
      await button06.click()
      windowSnap.snapShot()
      await Utils.sleep(500)
      await button06.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0014 finish.`);
      done()
    })

  })
}