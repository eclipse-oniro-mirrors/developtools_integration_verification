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

export default function uiComponentFrameNodeText() {

  describe('uiComponentFrameNodeText', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0230
     * @tc.name   : ComponentCotent's dispose method test
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0230 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText01')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText01'),1000);
      await textarea.inputText('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0540
     * @tc.name   : TextArea component, using the onDidInsert method
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0540', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0540 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText02')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText02'),1000);
      await textarea.inputText('a')
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0450
     * @tc.name   : TextArea component, using the onchange method
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0450', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0450 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText03')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText03'),1000);
      await textarea.inputText('a')
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0460
     * @tc.name   : TextArea component, using the onEditChange method
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0460', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0460 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText04')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText04'),1000);
      await textarea.inputText('a')
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0530
     * @tc.name   : TextArea component, using the onWillInsert method
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0530', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0530 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText05')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText05'),1000);
      await textarea.inputText('aaaa')
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0510
     * @tc.name   : TextArea component, using the onContentScroll method
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0510', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0510 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText06')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText06'),1000);
      let point = await textarea.getBoundsCenter();
      await driver.mouseDrag({x:point.x, y:point.y},{x:point.x-10, y:point.y-10},600);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0070
     * @tc.name   : TextArea component to set the prompt text color
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0070 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText07')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText07_02'),1000);
      for(let i = 0 ; i<4 ; ++i) {
        await button.click();
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0400
     * @tc.name   : TextArea component to set the line splitting rules
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0400', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0400 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText08')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText08_02'),1000);
      for(let i = 0 ; i<4 ; ++i) {
        await button.click();
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0380
     * @tc.name   : TextArea component to set how text is displayed when it is very long
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0380', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0380 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText09')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText09_02'),1000);
      for(let i = 0 ; i<4 ; ++i) {
        await button.click();
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0150
     * @tc.name   : TextArea component to set the polymorphic style of the text box
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0150 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText10')
      let driver:Driver=Driver.create();
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText10_01'),1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText10_02'),1000);
      let point = await textarea.getBoundsCenter()
      await textarea.click();
      windowSnap.snapShot();
      await Utils.sleep(1000)
      await button.click();
      await Utils.sleep(1000)
      await driver.click(point.x,point.y)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0090
     * @tc.name   : TextArea component to set the horizontal alignment of the text
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0090', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0090 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText11')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText11_02'),1000);
      for(let i = 0 ; i<4 ; ++i) {
        await button.click();
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0340
     * @tc.name   : TextArea component to set the text breakage rule
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0340', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0340 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText12')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText12_02'),1000);
      for(let i = 0 ; i<4 ; ++i) {
        await button.click();
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0350
     * @tc.name   : TextArea component to set the text breakage rule
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0350', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0350 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText13')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText13_01'),1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText13_02'),1000);
      let point = await textarea.getBoundsCenter()
      for(let i = 0 ; i<4 ; ++i) {
        await driver.click(point.x,point.y)
        await driver.waitForIdle(500,2000);
        await driver.mouseDrag({x:point.x, y:point.y},{x:point.x-100, y:point.y},600);
        await driver.waitForIdle(500,2000);
        await button.click();
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0310
     * @tc.name   : TextArea component, which sets the text decoration
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0310', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0310 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText14')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText14_02'),1000);
      for(let i = 0 ; i<5 ; ++i) {
        await button.click();
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0320
     * @tc.name   : TextArea component to set text character spacing
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0320', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0320 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText15')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText15_02'),1000);
      for(let i = 0 ; i<3 ; ++i) {
        await button.click();
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0290
     * @tc.name   : TextArea component, which sets the input method enter key type
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0290', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0290 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText16')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText16_01'),1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText16_02'),1000);
      let point = await textarea.getBoundsCenter()
      for(let i = 0 ; i<6 ; ++i) {
        await driver.click(point.x,point.y)
        await driver.waitForIdle(500,2000);
        await button.click();
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0370
     * @tc.name   : Turk Componin, Whitsett Furstreen Ben Texter Indent Tashen
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0370', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0370 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText17')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText17_02'),1000);
      for(let i = 0 ; i<3 ; ++i) {
        await button.click();
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0300
     * @tc.name   : TextArea component to set the line height
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0300', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0300 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText18')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText18_02'),1000);
      for(let i = 0 ; i<3 ; ++i) {
        await button.click();
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0220
     * @tc.name   : TextArea component, which sets the display mode of the scroll bar when the input box is edited
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0220', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0220 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText19')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText19_02'),1000);
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText19_01'),1000);
      let point = await textarea.getBoundsCenter()
      for(let i = 0 ; i<3 ; ++i) {
        await driver.click(point.x,point.y)
        windowSnap.snapShot()
        await Utils.sleep(2100)
        windowSnap.snapShot()
        await button.click();
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0240
     * @tc.name   : TextArea component, which sets the input box type
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0240', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0240 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText20')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText20_02'),1000);
      for(let i = 0 ; i<7 ; ++i) {
        await button.click();
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0390
     * @tc.name   : TextArea component to set the minimum display size, maximum display size, and text adaptive height
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0390', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0390 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText21')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText21_02'),1000);
      for(let i = 0 ; i<3 ; ++i) {
        await button.click();
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0140
     * @tc.name   : TextArea component, which sets the counter to be displayed when the number of characters entered via InputCounterOptions exceeds the threshold
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0140 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText22')
      let driver:Driver=Driver.create();
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText22_01'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      await textarea.inputText('aa')
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      await textarea.inputText('aaaaa')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0110
     * @tc.name   : TextArea component to set the minimum display size, maximum display size, and text adaptive height
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0110 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText23')
      let driver:Driver=Driver.create();
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText23_01'),1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText23_02'),1000);
      let point = await textarea.getBoundsCenter();
      await textarea.inputText('aa11')
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000);
      await button.click();
      await driver.inputText(point, 'a123');
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0200
     * @tc.name   : TextArea component, which is set to pop up the system text selection menu
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0200', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0200 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText24')
      let driver:Driver=Driver.create();
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText24_01'),1000);
      let point = await textarea.getBoundsCenter();
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0410
     * @tc.name   : TextArea component, which sets the custom menu extension
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0410', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0410 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText25')
      let driver:Driver=Driver.create();
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentFrameNodeText25_01'),1000);
      let point = await textarea.getBoundsCenter();
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0330
     * @tc.name   : TextArea component to set the effect of text characteristics
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0330', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0330 start.`);
      Settings.createWindow('testability/pages/component/frame_node/FrameNodeTextAlt/UiComponentFrameNodeText26')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0330 finish.`);
      done()
    })



  })
}