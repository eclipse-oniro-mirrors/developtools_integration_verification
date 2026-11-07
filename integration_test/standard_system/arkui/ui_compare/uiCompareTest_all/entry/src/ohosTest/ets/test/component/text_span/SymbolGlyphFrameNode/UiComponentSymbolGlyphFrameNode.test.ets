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

export default function uiComponentSymbolGlyphFrameNode() {

  describe('uiComponentSymbolGlyphFrameNode', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0080
     * @tc.name   : Create symbolglyph on the FrameNode and set fontSize to 30vp.
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0080 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode01')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0010
     * @tc.name   : Create symbolglyph on the FrameNode and set fontcolor to Color.Red
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0010 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode02')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0070
     * @tc.name   : Create symbolglyph on the FrameNode and set fontcolor to null
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0070 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode03')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0020
     * @tc.name   : Create symbolglyph on the FrameNode and set fontcolor to 0x808080
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0020 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode04')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0030
     * @tc.name   : Create symbolglyph on the FrameNode and set fontcolor to #ff000000
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0030 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode05')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0130
     * @tc.name   : Create symbolglyph on the FrameNode and set fontsize to -26
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0130', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0130 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode06')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0140
     * @tc.name   : Create symbolglyph on the FrameNode and set fontsize to undefined
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0140 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode07')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0150
     * @tc.name   : Create symbolglyph on the FrameNode and set fontsize to null
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0150 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode08')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0090
     * @tc.name   : Create symbolglyph on the FrameNode and set fontsize to 70px
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0090', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0090 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode09')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0100
     * @tc.name   : Create symbolglyph on the FrameNode and set fontsize to 36
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0100', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0100 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode10')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0160
     * @tc.name   : Create symbolglyph on the FrameNode and set fontWeight to FontWeight.Lighter
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0160', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0160 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode11')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0170
     * @tc.name   : Create symbolglyph on the FrameNode and set fontWeight to 800
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0170', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0170 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode12')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0180
     * @tc.name   : Create symbolglyph on the FrameNode and set fontWeight to 0
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0180 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode13')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0190
     * @tc.name   : Create symbolglyph on the FrameNode and set fontWeight to -200
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0190 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode14')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0200
     * @tc.name   : Create symbolglyph on the FrameNode and set fontWeight to 600
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0200', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0200 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode15')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0210
     * @tc.name   : Create symbolglyph on the FrameNode and set fontWeight to 1000
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0210', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0210 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode16')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0230
     * @tc.name   : Create symbolglyph on the FrameNode and set fontWeight to null
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0230 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode17')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0120
     * @tc.name   : Create symbolglyph on the FrameNode and set fontsize to 0
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0120 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode18')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0050
     * @tc.name   : Create symbolglyph on the FrameNode and set fontColor to [Color.Orange,Color.Black]
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0050 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode19')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0060
     * @tc.name   : Create symbolglyph on the FrameNode and set fontColor to undefined
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0060 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode20')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0220
     * @tc.name   : Create symbolglyph on the FrameNode and set fontWeight to undefined
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0220', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0220 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode21')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0240
     * @tc.name   : FrameNode creates symbolglyph, sets renderingStrategy to SINGLE, and fontcolor to [Color.Red]
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0240', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0240 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode22')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0250
     * @tc.name   : FrameNode creates symbolglyph, sets renderingStrategy to SINGLE, and fontcolor to [Color.Orange,Color.Black]
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0250', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0250 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode23')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0270
     * @tc.name   : FrameNode creates symbolglyph, sets renderingStrategy to MULTIPLE_COLOR, and fontcolor to Color.Red
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0270', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0270 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode24')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0300
     * @tc.name   : FrameNode creates symbolglyph, sets renderingStrategy to MULTIPLE_OPACITY, and fontcolor to Color.Red
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0300', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0300 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode25')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0310
     * @tc.name   : FrameNode creates symbolglyph, sets renderingStrategy to MULTIPLE_OPACITY, and fontcolor to Color.Orange,Color.Black
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0310', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0310 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode26')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0320
     * @tc.name   : FrameNode creates symbolglyph, sets renderingStrategy to MULTIPLE_OPACITY, and fontcolor to Color.Yellow, Color.Green, Color.White
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0320', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0320 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode27')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0280
     * @tc.name   : FrameNode creates symbolglyph, sets renderingStrategy to MULTIPLE_COLOR, and fontcolor to Color.Orange,Color.Black
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0280', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0280 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode28')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0290
     * @tc.name   : FrameNode creates symbolglyph, sets renderingStrategy to MULTIPLE_COLOR, and fontcolor to Color.Yellow, Color.Green, Color.White
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0290', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0290 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode29')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0260
     * @tc.name   : FrameNode creates symbolglyph, sets renderingStrategy to Single, and fontcolor to Color.Yellow, Color.Green, Color.White
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0260', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0260 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode30')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0370
     * @tc.name   : Create a symbolglyph on the FrameNode and set the onTouch event
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0370', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0370 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode31')
      let driver:Driver=Driver.create();
      let SymbolGlyph: Component = await driver.waitForComponent(ON.id('UiComponentSymbolGlyphFrameNode31'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000);
      await SymbolGlyph.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0390
     * @tc.name   : Create a symbolglyph on the FrameNode and set the onMouse event
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0390', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0390 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode32')
      let driver:Driver=Driver.create();
      let SymbolGlyph: Component = await driver.waitForComponent(ON.id('UiComponentSymbolGlyphFrameNode32'),1000);
      let point=await SymbolGlyph.getBoundsCenter();
      await driver.mouseMoveTo({x:point.x, y:point.y})
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0360
     * @tc.name   : Create a symbolglyph on the FrameNode and set the onClick event
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0360', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0360 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode33')
      let driver:Driver=Driver.create();
      let SymbolGlyph: Component = await driver.waitForComponent(ON.id('UiComponentSymbolGlyphFrameNode33'),1000);
      let point=await SymbolGlyph.getBoundsCenter();
      await driver.mouseClick({x:point.x, y:point.y},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0380
     * @tc.name   : Create symbolglyph on the FrameNode and set onAttach, onDetach, onAppear, and onDisAppear events
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0380', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0380 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode34')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentSymbolGlyphFrameNode34_02'),1000);
      await button.click();
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      await button.click();
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0040
     * @tc.name   : Create symbolglyph on the FrameNode and set fontcolor to rgb(255, 100, 255)
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0040 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode35')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0330
     * @tc.name   : Create symbolglyph on the FrameNode and set the effectStrategy to NONE
     * @tc.desc   : Verify symbolglyph framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0330', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0330 start.`);
      Settings.createWindow('testability/pages/component/text_span/SymbolGlyphFrameNode/UiComponentSymbolGlyphFrameNode36')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SYMBOLGLYPH_FRAMENODE_0330 finish.`);
      done()
    })
  })
}