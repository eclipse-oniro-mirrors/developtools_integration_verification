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

export default function uiComponentTextRichEditorHalfLeading() {

  describe('uiComponentTextRichEditorHalfLeading', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0010
     * @tc.name   : Use addTextCpan to add text content for setting half leading
     * @tc.desc   : Verify text richeditor halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0010 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorHalfLeading/UiComponentTextRichEditorHalfLeading01')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHalfLeading01'),1000);
      let point = await richeditor.getBoundsCenter();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.mouseScroll({x:point.x, y:point.y}, true, 30)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0003
     * @tc.name   : Use addTextCpan to add text content for setting half leading
     * @tc.desc   : Verify text richeditor halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0003', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0003 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorHalfLeading/UiComponentTextRichEditorHalfLeading02')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHalfLeading02'),1000);
      let point = await richeditor.getBoundsCenter();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.mouseScroll({x:point.x, y:point.y}, true, 30)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0003 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0007
     * @tc.name   : Dynamically setting up halfleading
     * @tc.desc   : Verify text richeditor halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0007', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0007 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorHalfLeading/UiComponentTextRichEditorHalfLeading03')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHalfLeading03_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0007 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0008
     * @tc.name   : Dynamically setting up lineHeight
     * @tc.desc   : Verify text richeditor halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0008', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0008 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorHalfLeading/UiComponentTextRichEditorHalfLeading04')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHalfLeading04_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0008 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0004
     * @tc.name   : Set halfLeading to null/undefined
     * @tc.desc   : Verify text richeditor halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0004', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0004 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorHalfLeading/UiComponentTextRichEditorHalfLeading05')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHalfLeading05_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0004 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0005
     * @tc.name   : Image text mixing, halfleading only applies to text
     * @tc.desc   : Verify text richeditor halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0005', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0005 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorHalfLeading/UiComponentTextRichEditorHalfLeading06')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHalfLeading06_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0005 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0006
     * @tc.name   : Add decorative lines to the text and set halfLeading to true
     * @tc.desc   : Verify text richeditor halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0006', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0006 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorHalfLeading/UiComponentTextRichEditorHalfLeading07')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorHalfLeading07_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_HALFLEADING_0006 finish.`);
      done()
    })
  })
}