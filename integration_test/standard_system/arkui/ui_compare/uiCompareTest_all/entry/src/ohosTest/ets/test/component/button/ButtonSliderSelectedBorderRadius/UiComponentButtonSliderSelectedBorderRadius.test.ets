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

export default function uiComponentButtonSliderSelectedBorderRadius() {

  describe('uiComponentButtonSliderSelectedBorderRadius', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0110
     * @tc.name   : Set the Style property to NONE, and set the showSteps property to the default value, and the property takes effect
     * @tc.desc   : Verify button slider selectedborderradius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0110 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderSelectedBorderRadius/UiComponentButtonSliderSelectedBorderRadius01')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0080
     * @tc.name   : The Style attribute is set to NONE, but the blockColor attribute does not take effect
     * @tc.desc   : Verify button slider selectedborderradius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0080 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderSelectedBorderRadius/UiComponentButtonSliderSelectedBorderRadius02')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0100
     * @tc.name   : Set the Style property to NONE and set selectedColor to the default value, and the property takes effect
     * @tc.desc   : Verify button slider selectedborderradius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0100', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0100 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderSelectedBorderRadius/UiComponentButtonSliderSelectedBorderRadius03')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0060
     * @tc.name   : If the Style property is set to NONE, the blockBorderColor property does not take effect
     * @tc.desc   : Verify button slider selectedborderradius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0060 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderSelectedBorderRadius/UiComponentButtonSliderSelectedBorderRadius04')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0180
     * @tc.name   : Set the Style attribute to: NONE, and set the selected part of the slide fillet attribute value: 50%
     * @tc.desc   : Verify button slider selectedborderradius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0180 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderSelectedBorderRadius/UiComponentButtonSliderSelectedBorderRadius05')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0070
     * @tc.name   : If the Style property is set to NONE, the blockBorderWidth property does not take effect
     * @tc.desc   : Verify button slider selectedborderradius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0070 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderSelectedBorderRadius/UiComponentButtonSliderSelectedBorderRadius06')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0090
     * @tc.name   : If the Style attribute is set to NONE, the blockStyle attribute does not take effect
     * @tc.desc   : Verify button slider selectedborderradius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0090', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0090 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderSelectedBorderRadius/UiComponentButtonSliderSelectedBorderRadius07')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0160
     * @tc.name   : If the Style attribute is set to NONE, the selectedBorderRadius attribute does not take effect
     * @tc.desc   : Verify button slider selectedborderradius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0160', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0160 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderSelectedBorderRadius/UiComponentButtonSliderSelectedBorderRadius08')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0140
     * @tc.name   : Set the Style attribute to NONE, and set trackColor to the default value, and the attribute takes effect
     * @tc.desc   : Verify button slider selectedborderradius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0140 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderSelectedBorderRadius/UiComponentButtonSliderSelectedBorderRadius09')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0150
     * @tc.name   : Set the Style property to NONE, and set the selected partial rail fillet to the default value
     * @tc.desc   : Verify button slider selectedborderradius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0150 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderSelectedBorderRadius/UiComponentButtonSliderSelectedBorderRadius10')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0250
     * @tc.name   : Set the Style property to undefined and the slider is on the slider
     * @tc.desc   : Verify button slider selectedborderradius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0250', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0250 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderSelectedBorderRadius/UiComponentButtonSliderSelectedBorderRadius11')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0270
     * @tc.name   : The Style property is not set, and the slider is on the slide
     * @tc.desc   : Verify button slider selectedborderradius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0270', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0270 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderSelectedBorderRadius/UiComponentButtonSliderSelectedBorderRadius12')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0230
     * @tc.name   : Set the Style property to OutSet, and the slider is on the slider
     * @tc.desc   : Verify button slider selectedborderradius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0230 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderSelectedBorderRadius/UiComponentButtonSliderSelectedBorderRadius13')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0040
     * @tc.name   : Set the Style property to inset, and the slider is on the slider
     * @tc.desc   : Verify button slider selectedborderradius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0040 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderSelectedBorderRadius/UiComponentButtonSliderSelectedBorderRadius14')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0120
     * @tc.name   : Set the Style attribute to NONE, set the showTips attribute to true, and set the content to take effect
     * @tc.desc   : Verify button slider selectedborderradius interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0120 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonSliderSelectedBorderRadius/UiComponentButtonSliderSelectedBorderRadius15')
      let driver:Driver=Driver.create();
      let slider: Component = await driver.waitForComponent(ON.id('UiComponentButtonSliderSelectedBorderRadius15'),1000);
      await slider.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SELECTEDBORDERRADIUS_0120 finish.`);
      done()
    })

  })
}