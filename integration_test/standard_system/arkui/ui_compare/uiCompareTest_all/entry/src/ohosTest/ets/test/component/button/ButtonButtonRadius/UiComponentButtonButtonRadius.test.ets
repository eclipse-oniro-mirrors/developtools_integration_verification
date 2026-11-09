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

export default function uiComponentButtonButtonRadius() {

  describe('uiComponentButtonButtonRadius', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0410
     * @tc.name   : Verify that the general attribute Type is set to default,controlSize is set to normal,and the borderRadius is manually set to 30px
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0410', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0410 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius01_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius01_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0400
     * @tc.name   : Verify that the general attribute Type is set to default,controlSize is set to normal,and the borderRadius is manually set to 30%
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0400', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0400 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius02_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius02_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0360
     * @tc.name   : Verify that the general attribute Type is set to default,controlSize is set to normal,and the borderRadius is manually set to 10vp
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0360', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0360 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius03_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius03_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0010
     * @tc.name   : Verify that buttonStyle is set to a different value and it works properly
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0010 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius04_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius04_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0240
     * @tc.name   : Verify that the default style of the calendarPickerDialog button is capsule and displayed correctly in api18
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0240', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0240 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius05')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius05_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0270
     * @tc.name   : Verify that in the api18 environment, the default style of the buttons of timePickerDialog is ROUNDED_RECTANGLE and displayed normally
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0270', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0270 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius06')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius06_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius06_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:900},MouseButton.MOUSE_BUTTON_LEFT)
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0260
     * @tc.name   : Verify that in the api18 environment, the default style of the buttons of TextPickerDialog is ROUNDED_RECTANGLE and displayed normally
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0260', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0260 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius08')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius08_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0220
     * @tc.name   : Verify that in the API 18 environment, the default style of the button of bindpopup is ROUNDED_RECTANGLE and displayed normally
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0220', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0220 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius09')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius09_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0230
     * @tc.name   : Verify that in the API 18 environment, the default style of the button is ROUNDED_RECTANGLE and displayed normally
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0230 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius10')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0380
     * @tc.name   : Verify that the generic attribute 'Type' is set to default, 'controlSize' is set to normal, and it displays correctly when a11y mode is enabled.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0380', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0380 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius11')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius11_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius11_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius11_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius11_04'),1000);
      let button: Component = await driver.waitForComponent(ON.id('TestButton'),1000);
      await button04.click();
      await driver.waitForIdle(500,2000)
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button03.click();
      await driver.waitForIdle(500,2000)
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click();
      await driver.waitForIdle(500,2000)
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0430
     * @tc.name   : Verify that the generic attribute 'Type' is set to default, 'controlSize' is set to normal, and font style is manually set.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0430 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius12')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius12_01'),1000);
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0370
     * @tc.name   : Verify that the generic attribute 'Type' is set to default, 'controlSize' is set to normal, and borderRadius is manually set in Chinese environment.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0370 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius13')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius13_01'),1000);
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0420
     * @tc.name   : Verify that the generic attribute 'Type' is set to default, 'controlSize' is set to normal, and borderRadius is set to reference type.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0420 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius14')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius14_01'),1000);
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0480
     * @tc.name   : Verify that the generic attribute 'Type' is set to default, 'controlSize' is set to small, and button height is manually set.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0480 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius15')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius15_01'),1000);
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0500
     * @tc.name   : Verify that Type is manually set to ROUNDED_RECTANGLE.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0500 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius17')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius17_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius17_02'),1000);
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0280
     * @tc.name   : Verify that Type is set to Capsule without borderRadius.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0280 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius16')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius16_01'),1000);
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0460
     * @tc.name   : Verify that button displays correctly with extra long text.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0460 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius18')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius18_01'),1000);
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0290
     * @tc.name   : Verify that Type is set to Capsule with borderRadius.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0290 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius19')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius19_01'),1000);
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0510
     * @tc.name   : Verify that all properties are set to default values.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0510 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius20')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius20_01'),1000);
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0300
     * @tc.name   : Verify that Type is set to Capsule with font style.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0300 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius21')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius21_01'),1000);
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0310
     * @tc.name   : Verify that Type is set to Capsule with extra long text.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0310 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius22')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius22_01'),1000);
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0320
     * @tc.name   : Verify that Type is set to Circle without width/height and abnormal borderRadius.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0320 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius23')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0340
     * @tc.name   : Verify that Type is set to Circle with width/height and borderRadius.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0340 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius24')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius24_01'),1000);
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0330
     * @tc.name   : Verify that Type is set to Circle without width/height and with borderRadius.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0330 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius25')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius25_01'),1000);
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0350
     * @tc.name   : Verify that Type is set to Normal without borderRadius.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0350 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius26')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius26_01'),1000);
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0450
     * @tc.name   : Verify that button displays correctly with height 50vp.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0450 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius27')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius27_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius27_02'),1000);
      await button02.click();
      await driver.waitForIdle(500,2000)
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0440
     * @tc.name   : Verify that button displays correctly with height 30vp.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0440 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius28')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius28_01'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius28_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0030
     * @tc.name   : Verify that stateEffect set to false displays correctly.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0030 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius29')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius29_01'),1000);
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0490
     * @tc.name   : Verify that SMALL controlSize with height 30vp displays correctly.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0490 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius30')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius30_01'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius30_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0470
     * @tc.name   : Verify that button displays correctly in Uyghur environment with custom borderRadius.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0470 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius31')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius31_01'),1000);
      let button2: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius31_02'),1000);
      let button3: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius31_03'),1000);
      await button2.click()
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button3.click()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0390
     * @tc.name   : Verify that button displays correctly with manual borderRadius 20vp.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0390 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius32')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius32_01'),1000);
      let button2: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius32_02'),1000);
      await button2.click();
      await driver.waitForIdle(500,2000)
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0020
     * @tc.name   : Verify that role set to ERROR displays correctly.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0020 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius33')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius33_01'),1000);
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0520
     * @tc.name   : Verify that button created with modifier displays correctly.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0520 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius34')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius34_01'),1000);
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0530
     * @tc.name   : Verify Toggle button displays correctly with a11y mode.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0530 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius35')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius35_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius35_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius35_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius35_04'),1000);
      await button04.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0160
     * @tc.name   : Verify BindPopup buttons display correctly with a11y mode.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0160 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius36')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius36_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius36_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius36_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius36_04'),1000);
      await button04.click();
      await driver.waitForIdle(500,2000)
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius36_05'),1000);
      await button05.click();
      windowSnap.snapShot()
      await button03.click();
      await driver.waitForIdle(500,2000)
      await button05.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      await button05.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click();
      await driver.waitForIdle(500,2000)
      await button05.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0170
     * @tc.name   : Verify Button displays correctly with a11y mode.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0170 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius37')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius37_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius37_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius37_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius37_04'),1000);
      await button04.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0180
     * @tc.name   : Verify CalendarPickerDialog buttons display correctly with a11y mode.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0180 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius38')
      let driver:Driver=Driver.create();
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius38_05'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius38_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius38_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius38_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius38_04'),1000);
      await button04.click();
      await Utils.sleep(500)
      await button05.click();
      await Utils.sleep(500)
      await driver.mouseClick({x:300,y:300},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click();
      await Utils.sleep(500)
      await button05.click();
      await Utils.sleep(500)
      await driver.triggerKey(2)
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click();
      await Utils.sleep(500)
      await button05.click();
      await Utils.sleep(500)
      await driver.triggerKey(2)
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click();
      await Utils.sleep(500)
      await button05.click();
      await Utils.sleep(500)
      await driver.triggerKey(2)
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0210
     * @tc.name   : Verify TimePickerDialog buttons display correctly with a11y mode.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0210 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius39')
      let driver:Driver=Driver.create();
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius39_05'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius39_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius39_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius39_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius39_04'),1000);
      await button04.click();
      await Utils.sleep(500)
      await button05.click();
      await Utils.sleep(500)
      await driver.mouseClick({x:300,y:300},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click();
      await Utils.sleep(500)
      await button05.click();
      await Utils.sleep(500)
      await driver.triggerKey(2)
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click();
      await Utils.sleep(500)
      await button05.click();
      await Utils.sleep(500)
      await driver.triggerKey(2)
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click();
      await Utils.sleep(500)
      await button05.click();
      await Utils.sleep(500)
      await driver.triggerKey(2)
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0190
     * @tc.name   : Verify DatePickerDialog buttons display correctly with a11y mode.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0190 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius40')
      let driver:Driver=Driver.create();
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius40_05'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius40_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius40_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius40_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius40_04'),1000);
      await button04.click();
      await Utils.sleep(500)
      await button05.click();
      await Utils.sleep(500)
      await driver.mouseClick({x:300,y:300},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click();
      await Utils.sleep(500)
      await button05.click();
      await Utils.sleep(500)
      await driver.triggerKey(2)
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click();
      await Utils.sleep(500)
      await button05.click();
      await Utils.sleep(500)
      await driver.triggerKey(2)
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click();
      await Utils.sleep(500)
      await button05.click();
      await Utils.sleep(500)
      await driver.triggerKey(2)
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0200
     * @tc.name   : Verify TextPickerDialog buttons display correctly with a11y mode.
     * @tc.desc   : Verify button radius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0200 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonRadius/UiComponentButtonButtonRadius41')
      let driver:Driver=Driver.create();
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius41_05'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius41_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius41_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius41_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonRadius41_04'),1000);
      await button04.click();
      await Utils.sleep(500)
      await button05.click();
      await Utils.sleep(500)
      await driver.mouseClick({x:300,y:300},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button03.click();
      await Utils.sleep(500)
      await button05.click();
      await Utils.sleep(500)
      await driver.triggerKey(2)
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button02.click();
      await Utils.sleep(500)
      await button05.click();
      await Utils.sleep(500)
      await driver.triggerKey(2)
      await Utils.sleep(500)
      windowSnap.snapShot()
      await button01.click();
      await Utils.sleep(500)
      await button05.click();
      await Utils.sleep(500)
      await driver.triggerKey(2)
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0200 finish.`);
      done()
    })
  })
}