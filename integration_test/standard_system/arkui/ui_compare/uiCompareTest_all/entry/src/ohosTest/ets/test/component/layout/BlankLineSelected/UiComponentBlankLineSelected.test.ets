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

export default function uiComponentBlankLineSelected() {

  describe('uiComponentBlankLineSelected', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0220
     * @tc.name   : Text component, set the selection to select a blank row
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0220', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0220 start.`);
      Settings.createWindow('testability/pages/component/layout/BlankLineSelected/UiComponentBlankLineSelected01');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0220 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0200
     * @tc.name   : Text component, set the text, and set the indent value for the blank line
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0200', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0200 start.`);
      Settings.createWindow('testability/pages/component/layout/BlankLineSelected/UiComponentBlankLineSelected02');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0200 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0210
     * @tc.name   : Text component, set the text, change the text baseline offset
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0210', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0210 start.`);
      Settings.createWindow('testability/pages/component/layout/BlankLineSelected/UiComponentBlankLineSelected03');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0210 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0270
     * @tc.name   : Text component to change the font size
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0270', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0270 start.`);
      Settings.createWindow('testability/pages/component/layout/BlankLineSelected/UiComponentBlankLineSelected04');
      let driver: Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0270_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentBlankLineSelected04'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0270_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0270 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0300
     * @tc.name   : Text/TextArea/TextInput inline mode, only blank lines are set
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0300', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0300 start.`);
      Settings.createWindow('testability/pages/component/layout/BlankLineSelected/UiComponentBlankLineSelected05');
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentBlankLineSelected05'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentBlankLineSelected05_area'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentBlankLineSelected05_input'),1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0300_01');
      await button01.click();
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0300_02');
      await driver.waitForIdle(500,2000);
      await button02.click();
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0300_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0300 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0240
     * @tc.name   : Text component, span to baselineOffset
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0240', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0240 start.`);
      Settings.createWindow('testability/pages/component/layout/BlankLineSelected/UiComponentBlankLineSelected06');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0240 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0260
     * @tc.name   : Text component, set the line spacing
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0260', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0260 start.`);
      Settings.createWindow('testability/pages/component/layout/BlankLineSelected/UiComponentBlankLineSelected07');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0260_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentBlankLineSelected07'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0260_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0260 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0370
     * @tc.name   : Text/TextArea/TextInput inline mode, set the space carriage return
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0370', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0370 start.`);
      Settings.createWindow('testability/pages/component/layout/BlankLineSelected/UiComponentBlankLineSelected09');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0370_01');
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentBlankLineSelected09_area'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentBlankLineSelected09_input'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentBlankLineSelected09_text'),1000);
      await button03.longClick();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0370_02');
      await driver.waitForIdle(500,2000);
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0370_03');
      await driver.waitForIdle(500,2000);
      await button02.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0370_04');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0370 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0400
     * @tc.name   : Text/TextArea/TextInput inline mode, set the space carriage return
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0400', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0400 start.`);
      Settings.createWindow('testability/pages/component/layout/BlankLineSelected/UiComponentBlankLineSelected10');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0400_01');
      await driver.waitForIdle(500,2000);
      await driver.mouseDrag({x:100, y:170},{x:300, y:250}, 600);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0400_02');
      await driver.waitForIdle(500,2000);
      await driver.mouseDrag({x:100, y:400},{x:300, y:500}, 600);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0400_03');
      await driver.waitForIdle(500,2000);
      await driver.mouseDrag({x:100, y:570},{x:300, y:650}, 600);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0400_04');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0400 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0180
     * @tc.name   : Text component, set the baselineoffset to the property string
     * @tc.desc   : Verify blankline selected interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0180 start.`);
      Settings.createWindow('testability/pages/component/layout/BlankLineSelected/UiComponentBlankLineSelected11');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BLANKLINE_SELECTED_0180 finish.`);
      done();
    })

  })
}