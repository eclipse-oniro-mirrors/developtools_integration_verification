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

export default function uiComponentTextReverseAnalysis() {

  describe('uiComponentTextReverseAnalysis', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0050
     * @tc.name   : When the attribute string contains two or more placeholder characters, replace the string within the specified range and retrieve the string.
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0050 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis01_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis01_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0060
     * @tc.name   : When the attribute string contains two or more placeholder characters, remove the string within the specified range
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0060 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis02_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis02_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0070
     * @tc.name   : When the attribute string contains two or more placeholder characters, insert string at specified index position
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0070 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis03_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis03_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0080
     * @tc.name   : Insert strings with different styles
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0080 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis04_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis04_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0150
     * @tc.name   : When placeholder characters are at the front of text, replace the string within the specified range
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0150 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis05')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis05_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis05_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0160
     * @tc.name   : When placeholder characters are at the front of text, remove the string within the specified range
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0160 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis06')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis06_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis06_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0170
     * @tc.name   : When placeholder characters are at the front of text, insert string at specified index position
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0170 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis07')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis07_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis07_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0180
     * @tc.name   : When placeholder characters are in the middle of text, replace the string within the specified range
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0180 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis08')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis08_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis08_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0190
     * @tc.name   : When placeholder characters are in the middle of text, remove the string within the specified range
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0190 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis09')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis09_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis09_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0210
     * @tc.name   : When placeholder characters are at the end of text, replace the string within the specified range
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0210 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis10')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis10_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis10_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0220
     * @tc.name   : When placeholder characters are at the end of text, remove the string within the specified range
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0220 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis11')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis11_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis11_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0230
     * @tc.name   : When placeholder characters are at the end of text, insert string at specified index position
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0230 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis12')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis12_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis12_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0280
     * @tc.name   : Text component modifier method calls clip property
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0280 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis13')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis13_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0290
     * @tc.name   : TextInput/TextArea component modifier method calls backgroundColor
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0290 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis14')
      let driver:Driver=Driver.create();
      await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis14_01'),1000);
      await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis14_02'),1000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0310
     * @tc.name   : TextInput/TextArea component modifier method calls width
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0310 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis15')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0320
     * @tc.name   : TextInput/TextArea component modifier method calls padding
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0320 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis16')
      let driver:Driver=Driver.create();
      await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis16_01'),1000);
      await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis16_02'),1000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0330
     * @tc.name   : TextInput/TextArea component modifier method calls margin
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0330 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis17')
      let driver:Driver=Driver.create();
      await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis17_01'),1000);
      await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis17_02'),1000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0340
     * @tc.name   : TextInput/TextArea component modifier method calls border
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0340 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis18')
      let driver:Driver=Driver.create();
      await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis18_01'),1000);
      await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis18_02'),1000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0360
     * @tc.name   : TextInput/TextArea component modifier method calls foregroundColor
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0360 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis19')
      let driver:Driver=Driver.create();
      await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis19_01'),1000);
      await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis19_02'),1000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0370
     * @tc.name   : TextInput/TextArea component modifier method calls onClick
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0370 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis20')
      let driver:Driver=Driver.create();
      let input01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis20_01'),1000);
      let input02: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis20_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await input02.click()
      await driver.waitForIdle(500,2000)
      await input01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0570
     * @tc.name   : TextInput component sets 120,000 characters text
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0570 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis21')
      let driver:Driver=Driver.create();
      let text01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis21_01'),1000);
      await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis21_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await text01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0580
     * @tc.name   : TextArea component sets 120,000 characters text
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0580 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis22')
      let driver:Driver=Driver.create();
      let text01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis22_01'),1000);
      await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis22_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await text01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0590
     * @tc.name   : Search component sets 120,000 characters text
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0590 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis23')
      let driver:Driver=Driver.create();
      let text01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis23_01'),1000);
      await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis23_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await text01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0600
     * @tc.name   : Text component sets 120,000 characters text
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0600 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis24')
      let driver:Driver=Driver.create();
      let text01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis24_01'),1000);
      await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis24_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await text01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0610
     * @tc.name   : Toast displays 15,000 characters text
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0610 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis25')
      let driver:Driver=Driver.create();
      let text01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis25_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await text01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0610 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0640
     * @tc.name   : StyledString with different styledKey modifier verification
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0640 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis26')
      let driver:Driver=Driver.create();
      await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis26_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0640 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0650
     * @tc.name   : StyledString with same content different styledKey modifier verification
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0650 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis27')
      let driver:Driver=Driver.create();
      await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis27_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0650 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0660
     * @tc.name   : StyledString with applyNormalAttribute and applyPressedAttribute
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0660 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis28')
      let driver:Driver=Driver.create();
      let text01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis28_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await text01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0040
     * @tc.name   : TextInput/Search/TextArea component size animation
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0040 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis29')
      let driver:Driver=Driver.create();
      let input01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis29_01'),1000);
      let search01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis29_02'),1000);
      let textarea01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis29_03'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await textarea01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await search01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await input01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0090
     * @tc.name   : Text component with garbled text format
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0090 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis30')
      let driver:Driver=Driver.create();
      await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis30_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0130
     * @tc.name   : TextInput component changes cancelButton type on focus
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0130 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis31')
      let driver:Driver=Driver.create();
      let input01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis31_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await input01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0140
     * @tc.name   : Search component changes cancelButton type on focus
     * @tc.desc   : Verify text reverseanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0140 start.`);
      Settings.createWindow('testability/pages/component/text/TextReverseAnalysis/UiComponentTextReverseAnalysis32')
      let driver:Driver=Driver.create();
      let search01: Component = await driver.waitForComponent(ON.id('UiComponentTextReverseAnalysis32_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await search01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0140 finish.`);
      done()
    })


  })
}