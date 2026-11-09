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

export default function uiComponentTextRichEditorInterface() {

  describe('uiComponentTextRichEditorInterface', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0062
     * @tc.name   : setSelection is set to text selection, and the range boundary falls in the middle of elements with a length greater than 1
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0062', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0062 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface01_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface01_02'),1000);
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface01_03'),1000);
      await richeditor.click();
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0062 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0063
     * @tc.name   : For gesture/mouse selections containing elements with a length greater than 1, call getSelection to obtain the current selected area range of the current rich text
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0063', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0063 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface02')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface02_02'),1000);
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface02_03'),1000);
      let point = await richeditor.getBoundsCenter();
      await richeditor.click();
      await driver.mouseDrag({x:point.x, y:point.y-100},{x:10, y:point.y-100},600);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0063 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_9793
     * @tc.name   : Using getSelection in the onSelect callback can accurately return the span information of the selected content or cursor
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_9793', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_9793 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface03')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface03_03'),1000);
      let point = await richeditor.getBoundsCenter();
      await richeditor.click();
      await driver.waitForIdle(500,2000)
      await driver.mouseDrag({x:point.x, y:point.y-100},{x:10, y:point.y-100},600);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_9793 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0111
     * @tc.name   : Use setSelection in the onWillChange callback to accurately set the text selection (before the text change).
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0111', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0111 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface04')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface04_03'),1000);
      await richeditor.inputText('a')
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0111 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0112
     * @tc.name   : Use setSelection in the onDidchange callback to accurately set the text selection (after the text change).
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0112', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0112 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface05')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface05_03'),1000);
      await richeditor.inputText('a')
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0112 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0027
     * @tc.name   : Using getParagraphs in the onDidChange callback can accurately return paragraph style and range information after text changes
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0027', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0027 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface06')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface06_03'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await richeditor.inputText('aaa')
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0027 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0025
     * @tc.name   : Use getParagraphs in the onWillChange callback to accurately return the paragraph style and range information before the text change
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0025', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0025 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface07')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface07_03'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await richeditor.inputText('aaa')
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0025 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0026
     * @tc.name   : Using getspans in the onDidChange callback can accurately return all span information after the text change
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0026', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0026 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface08')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface08_03'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await richeditor.inputText('aaa')
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0026 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0024
     * @tc.name   : Using getspans in the onWillChange callback can accurately return all span information before the text change
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0024', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0024 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface09')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface09_03'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await richeditor.inputText('aaa')
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0024 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0106
     * @tc.name   : Use getSelection in the onSelectionChange callback to accurately return the span information of the selected content or cursor
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0106', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0106 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface10')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface10_03'),1000);
      let point = await richeditor.getBoundsCenter()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await richeditor.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.mouseDrag({x:point.x, y:point.y},{x:10, y:point.y},600);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:point.x, y:point.y},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0106 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0023
     * @tc.name   : Use getCaretOffset in the onSelectionChange callback to get the exact cursor position
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0023', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0023 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface11')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface11_03'),1000);
      let point = await richeditor.getBoundsCenter()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await richeditor.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.mouseDrag({x:point.x, y:point.y},{x:10, y:point.y},600);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:point.x, y:point.y},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0023 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0116
     * @tc.name   : Use setSelection in the onDeleteComplete callback to accurately set the text selection (after deletion)
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0116', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0116 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface12')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface12_03'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await richeditor.click()
      await driver.triggerKey(2055)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0116 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0115
     * @tc.name   : Use setSelection in the aboutToDelete callback to accurately set the text selection (before deletion)
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0115', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0115 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface13')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface13_03'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await richeditor.click()
      await driver.triggerKey(2055)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0115 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0114
     * @tc.name   : Use setSelection in the onIMEInputComplete callback to accurately set the text selection (after input)
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0114', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0114 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface14')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface14_03'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await richeditor.click()
      await driver.triggerKey(2000)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0114 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0113
     * @tc.name   : Use setSelection in the aboutToIMEInput callback to accurately set the text selection (before input)
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0113', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0113 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface15')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface15_03'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await richeditor.click()
      await driver.triggerKey(2000)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0113 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0103
     * @tc.name   : Use getSelection in the aboutToDelete callback to accurately return the span information where the selected content or cursor is located (before deletion)
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0103', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0103 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface16')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface16_03'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await richeditor.click()
      await driver.triggerKey(2055)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0103 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0101
     * @tc.name   : Use getSelection in the aboutToIMEInput callback to accurately return the span information where the selected content or cursor is located (before entering)
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0101', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0101 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface17')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface17_03'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await richeditor.click()
      await driver.triggerKey(2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0101 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0108
     * @tc.name   : Use getSelection in the onDidChange callback to accurately return the span information of the selected content or cursor (after the text changes).
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0108', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0108 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface18')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface18_03'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await richeditor.click()
      await driver.triggerKey(2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await driver.triggerKey(2055)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0108 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0107
     * @tc.name   : Use getSelection in the onWillChange callback to accurately return the span information of the selected content or cursor (before the text changes).
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0107', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0107 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface19')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface19_03'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await richeditor.click()
      await driver.triggerKey(2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await driver.triggerKey(2055)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0107 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0065
     * @tc.name   : updateParagraphStyle updates the style of the paragraph so that the range boundary falls in the middle of elements with a length greater than 1
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0065', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0065 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface20')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface20_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0065 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0056
     * @tc.name   : updateParagraphStyle updates the style of the paragraph so that the range boundary falls in the middle of elements with a length greater than 1
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0056', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0056 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface21')
      let driver:Driver=Driver.create();
      let richEditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface21_01'),1000);
      let setbutton1: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface21_02'),1000);
      let setbutton2: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface21_03'),1000);
      let getbutton: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface21_04'),1000);
      await richEditor.click()
      await driver.waitForIdle(500,2000)
      for(let i = 0;i<2;++i) {
        await setbutton1.click()
        await richEditor.inputText('a')
        await getbutton.click()
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000)
        await setbutton2.click();
        await richEditor.inputText('a')
        await getbutton.click()
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000)
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0065 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_9792
     * @tc.name   : Use setSelection in the onSelect callback to accurately set the text selection
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_9792', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_9792 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface22')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface22_01'),1000);
      let point = await richeditor.getBoundsCenter()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await richeditor.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.mouseDrag({x:point.x, y:point.y},{x:10, y:point.y},600);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_9792 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0052
     * @tc.name   : updateParagraphStyle updates the style of the paragraph so that the range boundary falls in the middle of elements with a length greater than 1
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0052', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0052 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface23')
      let driver:Driver=Driver.create();
      let setbutton1: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface23_02'),1000);
      let setbutton2: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface23_03'),1000);
      await driver.waitForIdle(500,2000)
      for(let i = 0;i<3;++i) {
        await setbutton1.click()
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000)
        await setbutton2.click();
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000)
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0052 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1480
     * @tc.name   : bindSelectionMenu parameter spantype:Text; content：Builder； responType:RightClick,options:onAppear,OnDisappear, and then click/left mouse button to click on the text
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1480', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1480 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface24')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface24'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:point.x,y:point.y},MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:point.x-30,y:point.y},MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:point.x-60,y:point.y},MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1470
     * @tc.name   : bindSelectionMenu parameter spantype:Text; content：Builder； responType:LongPress,options:onAppear,OnDisappear, and then click/left click on the text
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1470', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1470 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface25')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface25'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.waitForIdle(500,2000)
      await richeditor.longClick()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await driver.click(point.x-70,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1420
     * @tc.name   : bindSelectionMenu parameter spantype:Text; content：Builder； responType：RightClick，options：onAppear，OnDisappear
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1420', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1420 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface26')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface26'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:point.x,y:point.y-20},MouseButton.MOUSE_BUTTON_RIGHT);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:point.x-100,y:point.y+50},MouseButton.MOUSE_BUTTON_RIGHT);
      await Utils.sleep(1500)
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1390
     * @tc.name   : do not set bindSelectMenu, right-click the image content
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1390', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1390 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface27')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface27'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseClick({x:point.x-100,y:point.y+50},MouseButton.MOUSE_BUTTON_RIGHT);
      await Utils.sleep(1500)
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1410
     * @tc.name   : If you do not set bindSelectMenu, select the image and text with the mouse, and right-click the image content
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1410', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1410 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface28')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface28'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseDrag({x:point.x-200, y:point.y-50},{x:point.x+100, y:point.y+30},600);
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:point.x,y:point.y},MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1500
     * @tc.name   : bindSelectionMenu parameter spantype:Text; content：Builder； responType:RightClick,options:onAppear,OnDisappear, and long-press again to select text
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1500', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1500 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface29')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface29'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseDrag({x:point.x-200, y:point.y-50},{x:point.x+100, y:point.y+30},600);
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:point.x,y:point.y},MouseButton.MOUSE_BUTTON_RIGHT);
      await Utils.sleep(1000)
      await driver.longClick(point.x-100,point.y);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1430
     * @tc.name   : bindSelectionMenu parameter spantype:Text; content：Builder； responType:RightClick,options:onAppear,OnDisappear, and long-press again to select text
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1430', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1430 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface30')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface30'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseDrag({x:point.x, y:point.y},{x:point.x-250, y:point.y-100},1200);
      await driver.mouseClick({x:point.x-250, y:point.y-100},MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(500)
      await driver.mouseClick({x:point.x-250, y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT);
      await driver.mouseDrag({x:point.x, y:point.y},{x:point.x+250, y:point.y+100},1200);
      await driver.mouseClick({x:point.x+250, y:point.y+100},MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(500)
      await driver.mouseClick({x:point.x-250, y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT);
      await driver.mouseDrag({x:point.x-250, y:point.y-100},{x:point.x+250, y:point.y+100},1200);
      await driver.mouseClick({x:point.x+250, y:point.y+100},MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(500)
      await driver.mouseClick({x:point.x-250, y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT);
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1440
     * @tc.name   : bindSelectionMenu parameter spantype:MIXED; content：Builder； responType：RightClick，options：onAppear，OnDisappear
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1440', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1440 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface31')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface31'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseDrag({x:point.x, y:point.y},{x:point.x-250, y:point.y-100},1200);
      await driver.mouseClick({x:point.x-250, y:point.y-100},MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(500)
      await driver.mouseClick({x:point.x-250, y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT);
      await driver.mouseDrag({x:point.x, y:point.y},{x:point.x+250, y:point.y+100},1200);
      await driver.mouseClick({x:point.x+250, y:point.y+100},MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(500)
      await driver.mouseClick({x:point.x-250, y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT);
      await driver.mouseDrag({x:point.x-250, y:point.y-100},{x:point.x+250, y:point.y+100},1200);
      await driver.mouseClick({x:point.x+250, y:point.y+100},MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(500)
      await driver.mouseClick({x:point.x-250, y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT);
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1370
     * @tc.name   : not set bindSelectMenu, select the content in Chinese and right-click the text area
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1370', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1370 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface32')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface32'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseDrag({x:point.x, y:point.y},{x:point.x-250, y:point.y-100},1200);
      await driver.mouseClick({x:point.x-250, y:point.y-100},MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(500)
      await driver.mouseClick({x:point.x-250, y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT);
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1460
     * @tc.name   : bindSelectionMenu parameter spantype:Text; content：Builder； responType：LongPress，options：onAppear，OnDisappearSet the custom builder width and height to the percentage format
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1460', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1460 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface33')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface33'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseClick({x:point.x, y:point.y},MouseButton.MOUSE_BUTTON_RIGHT);
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0400
     * @tc.name   : Set up a long-press event for TextSpan
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0400', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0400 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface34')
      let driver: Driver = Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface34'), 2000);
      let point = await richeditor.getBoundsCenter()
      await driver.longClick( point.x,point.y)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0370
     * @tc.name   : Set click events for ImageSpan
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0370', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0370 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface35')
      let driver: Driver = Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface35'), 2000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseClick({x: point.x-200, y: point.y+100}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0380
     * @tc.name   : Set up a click event for TextSpan
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0380', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0380 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface36')
      let driver: Driver = Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface36'), 2000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseClick({x: point.x, y: point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0390
     * @tc.name   : Set up a long press event for ImageSpan
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0390', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0390 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface37')
      let driver: Driver = Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface37'), 2000);
      let point = await richeditor.getBoundsCenter()
      await driver.longClick(point.x-200,point.y+100);
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1490
     * @tc.name   : bindSelectionMenu with long press to select text
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1490', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1490 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface_02/UiComponentTextRichEditorInterface38')
      let driver: Driver = Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorInterface38'), 2000);
      let point = await richeditor.getBoundsCenter()
      await driver.longClick(point.x-100, point.y);
      await driver.waitForIdle(500, 2000)
      await driver.longClick(point.x-50, point.y);
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1490 finish.`);
      done()
    })

  })
}