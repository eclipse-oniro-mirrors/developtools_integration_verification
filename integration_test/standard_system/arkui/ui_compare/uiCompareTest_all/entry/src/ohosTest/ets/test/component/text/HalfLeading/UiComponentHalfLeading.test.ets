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

export default function uiComponentHalfLeading() {

  describe('uiComponentHalfLeading', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_HALFLEADING_0100
     * @tc.name   : If halfleading is set to true, LinePacing is set to TextArea
     * @tc.desc   : Verify halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HALFLEADING_0100', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0100 start.`);
      Settings.createWindow('testability/pages/component/text/HalfLeading/UiComponentHalfLeading01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0100_01')
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading01'),1000);
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0100_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HALFLEADING_0010
     * @tc.name   : If halfleading is set to true, LinePacing is set to TextArea
     * @tc.desc   : Verify halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HALFLEADING_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0010 start.`);
      Settings.createWindow('testability/pages/component/text/HalfLeading/UiComponentHalfLeading02');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0010_01')
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading02_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading02_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading02_03'),1000);
      await button03.inputText('hell world');
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0010_02')
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0010_03')
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0010_04')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HALFLEADING_0010
     * @tc.name   : If halfleading is set to false, LinePacing is set to TextArea
     * @tc.desc   : Verify halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HALFLEADING_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0020 start.`);
      Settings.createWindow('testability/pages/component/text/HalfLeading/UiComponentHalfLeading03');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0020_01')
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading03_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading03_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading03_03'),1000);
      await button03.inputText('hell world');
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0020_02')
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0020_03')
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0020_04')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0020 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HALFLEADING_0040
     * @tc.name   : If halfleading is true, set the prompt text in the input box
     * @tc.desc   : Verify halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HALFLEADING_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0040 start.`);
      Settings.createWindow('testability/pages/component/text/HalfLeading/UiComponentHalfLeading04');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0040 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HALFLEADING_0030
     * @tc.name   : TextInput/TextArea/Search，halfleading is undefined、null
     * @tc.desc   : Verify halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HALFLEADING_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0030 start.`);
      Settings.createWindow('testability/pages/component/text/HalfLeading/UiComponentHalfLeading05');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0030 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HALFLEADING_0070
     * @tc.name   : Halfleading is true, and multiple lines of text are entered in the inline mode input box
     * @tc.desc   : Verify halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HALFLEADING_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0070 start.`);
      Settings.createWindow('testability/pages/component/text/HalfLeading/UiComponentHalfLeading06');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0070_01')
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading06_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading06_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading06_03'),1000);
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0070_02')
      await button01.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0070_03')
      await button03.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0070_04')
      await driver.waitForIdle(500,2000);
      await button02.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0070_05')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0070 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HALFLEADING_0110
     * @tc.name   : Halfleading is set to true, and the input box is set to padding
     * @tc.desc   : Verify halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HALFLEADING_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0110 start.`);
      Settings.createWindow('testability/pages/component/text/HalfLeading/UiComponentHalfLeading07');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading07_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading07_02'),1000);
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0110_01')
      await driver.waitForIdle(500,2000);
      await button02.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0110_02')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0110 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HALFLEADING_0080
     * @tc.name   : halfleading is true, and the input field is changed to lineHeight
     * @tc.desc   : Verify halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HALFLEADING_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0080 start.`);
      Settings.createWindow('testability/pages/component/text/HalfLeading/UiComponentHalfLeading08');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0080_01')
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading08_01'),1000);
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0080_02')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0080 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HALFLEADING_0090
     * @tc.name   : Halfleading is true, and the font size is changed in the input box
     * @tc.desc   : Verify halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HALFLEADING_0090', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0090 start.`);
      Settings.createWindow('testability/pages/component/text/HalfLeading/UiComponentHalfLeading09');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0090_01')
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading09_01'),1000);
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0090_02')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0090 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HALFLEADING_0150
     * @tc.name   : Mixed text testing
     * @tc.desc   : Verify halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HALFLEADING_0150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0150 start.`);
      Settings.createWindow('testability/pages/component/text/HalfLeading/UiComponentHalfLeading10');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0150_01')
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading10_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading10_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading10_03'),1000);
      await button03.inputText('你好hello こんにちは안녕하세요😊');
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0150_02')
      await driver.waitForIdle(500,2000);
      await button02.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0150_03')
      await driver.waitForIdle(500,2000);
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0150_04')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0150 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HALFLEADING_0060
     * @tc.name   : Halfleading is true, and multiple lines of text are entered in the inline mode input box
     * @tc.desc   : Verify halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HALFLEADING_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0060 start.`);
      Settings.createWindow('testability/pages/component/text/HalfLeading/UiComponentHalfLeading11');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0060_01')
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading11_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading11_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading11_03'),1000);
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0060_02')
      await button01.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0060_03')
      await button03.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0060_04')
      await driver.waitForIdle(500,2000);
      await button02.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0060_05')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0060 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HALFLEADING_0050
     * @tc.name   : Halfleading is true, and the input box type is changed
     * @tc.desc   : Verify halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HALFLEADING_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0050 start.`);
      Settings.createWindow('testability/pages/component/text/HalfLeading/UiComponentHalfLeading12');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0050_01')
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading12_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading12_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading12_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading12_04'),1000);
      await button04.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0050_02')
      await button03.inputText('123456');
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0050_03')
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0050_04')
      await driver.waitForIdle(500,2000);
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0050_05')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0050 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HALFLEADING_0160
     * @tc.name   : Multiple lines of scrollable text
     * @tc.desc   : Verify halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HALFLEADING_0160', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0160 start.`);
      Settings.createWindow('testability/pages/component/text/HalfLeading/UiComponentHalfLeading13');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0160_01')
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading13_01'),1000);
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_HALFLEADING_0160_02')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0160 finish.`);
      done();
    })

        /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HALFLEADING_0120
     * @tc.name   : If halfleading is true, set align in the input field
     * @tc.desc   : Verify halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HALFLEADING_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0120 start.`);
      Settings.createWindow('testability/pages/component/text/HalfLeading/UiComponentHalfLeading14');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading14_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentHalfLeading14_02'),1000);
      await button01.click();
      await button02.click();
      windowSnap.snapShot()
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0120 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HALFLEADING_0140
     * @tc.name   : Modifier test
     * @tc.desc   : Verify halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HALFLEADING_0140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0140 start.`);
      Settings.createWindow('testability/pages/component/text/HalfLeading/UiComponentHalfLeading15');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      windowSnap.snapShot()
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HALFLEADING_0140 finish.`);
      done();
    })

  })
}