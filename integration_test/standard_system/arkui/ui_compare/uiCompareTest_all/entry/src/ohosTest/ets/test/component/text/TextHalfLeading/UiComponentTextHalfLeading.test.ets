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

export default function uiComponentTextHalfLeading() {

  describe('uiComponentTextHalfLeading', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0180
     * @tc.name   : Add span, imagespan, and symbolspan to the text component to dynamically change halfLeading
     * @tc.desc   : Verify text halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0180 start.`);
      Settings.createWindow('testability/pages/component/text/TextHalfLeading/UiComponentTextHalfLeading01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextHalfLeading01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0210
     * @tc.name   : The text component sets clip to false to dynamically change halfLeading
     * @tc.desc   : Verify text halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0210 start.`);
      Settings.createWindow('testability/pages/component/text/TextHalfLeading/UiComponentTextHalfLeading02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextHalfLeading02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0190
     * @tc.name   : Add a ContainerSpan to the text component to dynamically change halfLeading
     * @tc.desc   : Verify text halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0190 start.`);
      Settings.createWindow('testability/pages/component/text/TextHalfLeading/UiComponentTextHalfLeading03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextHalfLeading03'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0070
     * @tc.name   : The text component settings dynamically change lineSpacing and halfleading
     * @tc.desc   : Verify text halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0070 start.`);
      Settings.createWindow('testability/pages/component/text/TextHalfLeading/UiComponentTextHalfLeading04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextHalfLeading04_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextHalfLeading04_02'),1000);
      windowSnap.snapShot()
      await button02.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000);
      await button02.click();
      await button01.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0050
     * @tc.name   : The text component settings dynamically change the baselineoffset and halfleading
     * @tc.desc   : Verify text halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0050 start.`);
      Settings.createWindow('testability/pages/component/text/TextHalfLeading/UiComponentTextHalfLeading05')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextHalfLeading05_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextHalfLeading05_02'),1000);
      windowSnap.snapShot()
      await button02.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000);
      await button02.click();
      await button01.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0130
     * @tc.name   : The text component settings dynamically change the baselineoffset and halfleading
     * @tc.desc   : Verify text halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0130 start.`);
      Settings.createWindow('testability/pages/component/text/TextHalfLeading/UiComponentTextHalfLeading06')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0170
     * @tc.name   : modifier test
     * @tc.desc   : Verify text halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0170 start.`);
      Settings.createWindow('testability/pages/component/text/TextHalfLeading/UiComponentTextHalfLeading07')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0080
     * @tc.name   : The text component settings dynamically change textAlign and halfleading
     * @tc.desc   : Verify text halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0080 start.`);
      Settings.createWindow('testability/pages/component/text/TextHalfLeading/UiComponentTextHalfLeading08')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextHalfLeading08_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextHalfLeading08_02'),1000);
      windowSnap.snapShot()
      await button02.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000);
      await button02.click();
      await button01.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0110
     * @tc.name   : Halfleading is set to the text component, but halfleading is not set to package management
     * @tc.desc   : Verify text halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0110 start.`);
      Settings.createWindow('testability/pages/component/text/TextHalfLeading/UiComponentTextHalfLeading09')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0060
     * @tc.name   : The text component settings dynamically change textAlign and halfleading
     * @tc.desc   : Verify text halfleading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0060 start.`);
      Settings.createWindow('testability/pages/component/text/TextHalfLeading/UiComponentTextHalfLeading10')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentTextHalfLeading10_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentTextHalfLeading10_02'),1000);
      windowSnap.snapShot()
      await button02.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000);
      await button01.click()
      await button02.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_HALFLEADING_0060 finish.`);
      done()
    })

  })
}