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

export default function uiComponentButtonSliderInterFace() {

  describe('uiComponentButtonSliderInterFace', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_1060
     * @tc.name   : Set the slider vertical display and slide the scroller to adjust the slider position
     * @tc.desc   : Verify button slider interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_1060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_1060 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderInterFace/UiComponentButtonSliderInterFace01')
      let driver:Driver=Driver.create();
      let slider: Component = await driver.waitForComponent(ON.id('UiComponentButtonSliderInterFace01'),1000);
      windowSnap.snapShot()
      let point = await slider.getBoundsCenter();
      await driver.mouseMoveTo({x:point.x,y:point.y});
      await driver.waitForIdle(500,2000)
      await driver.mouseScroll({x:point.x, y:point.y}, true, 30)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_1060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_1040
     * @tc.name   : Mouse placement slider on click to move
     * @tc.desc   : Verify button slider interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_1040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_1040 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderInterFace/UiComponentButtonSliderInterFace02')
      let driver:Driver=Driver.create();
      let slider: Component = await driver.waitForComponent(ON.id('UiComponentButtonSliderInterFace02'),1000);
      windowSnap.snapShot()
      let point = await slider.getBoundsCenter();
      await driver.mouseMoveTo({x:point.x,y:point.y});
      await driver.waitForIdle(500,2000)
      await driver.mouseDrag({x:point.x, y:point.y}, {x:point.x, y:point.y+200}, 30)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_1040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0270
     * @tc.name   : selectedColor is set multiple times, the last time it takes effect
     * @tc.desc   : Verify button slider interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0270', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0270 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderInterFace/UiComponentButtonSliderInterFace03')
      let driver:Driver=Driver.create();
      let slider: Component = await driver.waitForComponent(ON.id('UiComponentButtonSliderInterFace03'),1000);
      await slider.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_1040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0510
     * @tc.name   : trackColor is set multiple times, the last time it takes effect
     * @tc.desc   : Verify button slider interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0510', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0510 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderInterFace/UiComponentButtonSliderInterFace04')
      let driver:Driver=Driver.create();
      let slider: Component = await driver.waitForComponent(ON.id('UiComponentButtonSliderInterFace04'),1000);
      await slider.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0350
     * @tc.name   : showSteps is set multiple times, and the last time it takes effect
     * @tc.desc   : Verify button slider interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0350', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0350 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderInterFace/UiComponentButtonSliderInterFace05')
      let driver:Driver=Driver.create();
      let slider: Component = await driver.waitForComponent(ON.id('UiComponentButtonSliderInterFace05'),1000);
      await slider.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0120
     * @tc.name   : direction is not set, the default is Axis.Horizontal, and the slide is displayed horizontally
     * @tc.desc   : Verify button slider interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0120 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderInterFace/UiComponentButtonSliderInterFace06')
      let driver:Driver=Driver.create();
      let slider: Component = await driver.waitForComponent(ON.id('UiComponentButtonSliderInterFace06'),1000);
      await slider.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0160
     * @tc.name   : direction is set to Axis.Horizontal, and the slide rail is displayed horizontally
     * @tc.desc   : Verify button slider interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0160', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0160 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderInterFace/UiComponentButtonSliderInterFace07')
      let driver:Driver=Driver.create();
      let slider: Component = await driver.waitForComponent(ON.id('UiComponentButtonSliderInterFace07'),1000);
      await slider.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0590
     * @tc.name   : trackThickness is set multiple times, the last time it takes effect
     * @tc.desc   : Verify button slider interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0590', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0590 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderInterFace/UiComponentButtonSliderInterFace08')
      let driver:Driver=Driver.create();
      let slider: Component = await driver.waitForComponent(ON.id('UiComponentButtonSliderInterFace08'),1000);
      await slider.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0540
     * @tc.name   : trackColor settings 0xADd7E6
     * @tc.desc   : Verify button slider interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0540', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0540 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderInterFace/UiComponentButtonSliderInterFace09')
      let driver:Driver=Driver.create();
      let slider: Component = await driver.waitForComponent(ON.id('UiComponentButtonSliderInterFace09'),1000);
      await slider.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0600
     * @tc.name   : trackThickness is set to a valid value of >0, and the rail thickness takes effect normally
     * @tc.desc   : Verify button slider interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0600', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0600 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderInterFace/UiComponentButtonSliderInterFace10')
      let driver:Driver=Driver.create();
      let slider: Component = await driver.waitForComponent(ON.id('UiComponentButtonSliderInterFace10'),1000);
      await slider.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0610
     * @tc.name   : trackThickness setting is less than or equal to 0, when SliderStyle.InSet is 20.0vp, the default slider size is blockSize = 12.0vp * 12.0vp
     * @tc.desc   : Verify button slider interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0610', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0610 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderInterFace/UiComponentButtonSliderInterFace11')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0610 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0580
     * @tc.name   : trackThickness is not set, when SliderStyle.OutSet is set, the default slider thickness is 4.0vp, and the default slider size: blockSize = 16.0vp * 16.0vp
     * @tc.desc   : Verify button slider interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0580', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0580 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderInterFace/UiComponentButtonSliderInterFace12')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0020
     * @tc.name   : blockColor is set multiple times, and the last time it takes effect
     * @tc.desc   : Verify button slider interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0020 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderInterFace/UiComponentButtonSliderInterFace13')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0110
     * @tc.name   : blockSize dynamically changes trackThickness according to trackThickness and scale-up
     * @tc.desc   : Verify button slider interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0110 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderInterFace/UiComponentButtonSliderInterFace14')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonSliderInterFace14_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0110 finish.`);
      done()
    })

  })
}