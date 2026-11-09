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

export default function uiComponentButtonSegmentButtonAging() {

  describe('uiComponentButtonSegmentButtonAging', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0190
     * @tc.name   : ComponentCotent's dispose method test
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0190 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSegmentButtonAging/UiComponentButtonSegmentButtonAging01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging01_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging01_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging01_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging01_04'),1000);
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging01_05'),1000);
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging01_06'),1000);
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging01_07'),1000);
      await button07.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button06.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button05.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button04.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0300
     * @tc.name   : Tab SegmentButton maxFontScale 1.3 test
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0300', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0300 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSegmentButtonAging/UiComponentButtonSegmentButtonAging02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging02_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging02_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging02_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging02_04'),1000);
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging02_05'),1000);
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging02_06'),1000);
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging02_07'),1000);
      await button07.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button06.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button05.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button04.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0330
     * @tc.name   : Tab SegmentButton maxFontScale 1.15 test
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0330', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0330 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSegmentButtonAging/UiComponentButtonSegmentButtonAging03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging03_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging03_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging03_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging03_04'),1000);
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging03_05'),1000);
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging03_06'),1000);
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging03_07'),1000);
      await button07.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button06.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button05.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button04.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0250
     * @tc.name   : Tab SegmentButton maxFontScale -1 test
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0250', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0250 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSegmentButtonAging/UiComponentButtonSegmentButtonAging04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging04_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging04_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging04_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging04_04'),1000);
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging04_05'),1000);
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging04_06'),1000);
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging04_07'),1000);
      await button07.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button06.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button05.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button04.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0070
     * @tc.name   : Tab SegmentButton maxFontScale 2 test
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0070 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSegmentButtonAging/UiComponentButtonSegmentButtonAging05')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging05_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging05_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging05_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging05_04'),1000);
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging05_05'),1000);
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging05_06'),1000);
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging05_07'),1000);
      await button07.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button06.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button05.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button04.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0040
     * @tc.name   : Tab SegmentButton maxFontScale 9999 test
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0040 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSegmentButtonAging/UiComponentButtonSegmentButtonAging06')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging06_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging06_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging06_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging06_04'),1000);
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging06_05'),1000);
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging06_06'),1000);
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging06_07'),1000);
      await button07.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button06.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button05.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button04.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0180
     * @tc.name   : Tab SegmentButton maxFontScale undefined test
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0180', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0180 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSegmentButtonAging/UiComponentButtonSegmentButtonAging07')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging07_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging07_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging07_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging07_04'),1000);
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging07_05'),1000);
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging07_06'),1000);
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging07_07'),1000);
      await button07.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button06.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button05.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button04.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0230
     * @tc.name   : Capsule single SegmentButton maxFontScale 2.5 test
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0230', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0230 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSegmentButtonAging/UiComponentButtonSegmentButtonAging08')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging08_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging08_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging08_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging08_04'),1000);
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging08_05'),1000);
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging08_06'),1000);
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging08_07'),1000);
      await button07.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button06.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button05.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button04.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0260
     * @tc.name   : Capsule single SegmentButton maxFontScale 1.15 test
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0260', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0260 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSegmentButtonAging/UiComponentButtonSegmentButtonAging09')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging09_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging09_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging09_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging09_04'),1000);
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging09_05'),1000);
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging09_06'),1000);
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging09_07'),1000);
      await button07.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button06.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button05.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button04.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0310
     * @tc.name   : Capsule single SegmentButton maxFontScale 0.5 test
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0310 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSegmentButtonAging/UiComponentButtonSegmentButtonAging10')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging10_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging10_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging10_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging10_04'),1000);
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging10_05'),1000);
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging10_06'),1000);
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging10_07'),1000);
      await button07.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button06.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button05.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button04.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0160
     * @tc.name   : Capsule single SegmentButton maxFontScale 1 test
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0160', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0160 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSegmentButtonAging/UiComponentButtonSegmentButtonAging11')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging11_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging11_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging11_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging11_04'),1000);
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging11_05'),1000);
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging11_06'),1000);
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging11_07'),1000);
      await button07.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button06.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button05.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button04.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0080
     * @tc.name   : Capsule single SegmentButton maxFontScale 1.45 test
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0080 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSegmentButtonAging/UiComponentButtonSegmentButtonAging12')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging12_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging12_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging12_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging12_04'),1000);
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging12_05'),1000);
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging12_06'),1000);
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging12_07'),1000);
      await button07.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button06.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button05.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button04.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0110
     * @tc.name   : Capsule single SegmentButton maxFontScale undefined test
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0110', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0110 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSegmentButtonAging/UiComponentButtonSegmentButtonAging13')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging13_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging13_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging13_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging13_04'),1000);
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging13_05'),1000);
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging13_06'),1000);
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging13_07'),1000);
      await button07.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button06.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button05.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button04.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0060
     * @tc.name   : Capsule multiply SegmentButton maxFontScale 2.5 test
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0060 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSegmentButtonAging/UiComponentButtonSegmentButtonAging14')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging14_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging14_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging14_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging14_04'),1000);
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging14_05'),1000);
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging14_06'),1000);
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging14_07'),1000);
      await button07.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button06.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button05.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button04.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0320
     * @tc.name   : Capsule multiply SegmentButton maxFontScale -1 test
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0320', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0320 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSegmentButtonAging/UiComponentButtonSegmentButtonAging15')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging15_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging15_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging15_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging15_04'),1000);
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging15_05'),1000);
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging15_06'),1000);
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentButtonSegmentButtonAging15_07'),1000);
      await button07.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button06.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button05.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button04.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0320 finish.`);
      done()
    })



  })
}