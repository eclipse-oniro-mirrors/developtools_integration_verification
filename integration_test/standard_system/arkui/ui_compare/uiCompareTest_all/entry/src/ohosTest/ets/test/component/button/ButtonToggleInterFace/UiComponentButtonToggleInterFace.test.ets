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

export default function uiComponentButtonToggleInterFace() {

  describe('uiComponentButtonToggleInterFace', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0120
     * @tc.name   : Toggle sets both selectedColor and backgroundColor
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0120 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace01')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let toggle1: Component = await driver.waitForComponent(ON.id('UiComponentButtonToggleInterFace01_01'),1000);
      let toggle2: Component = await driver.waitForComponent(ON.id('UiComponentButtonToggleInterFace01_02'),1000);
      let toggle3: Component = await driver.waitForComponent(ON.id('UiComponentButtonToggleInterFace01_03'),1000);
      await driver.waitForIdle(500,200)
      await toggle1.click()
      await toggle2.click()
      await toggle3.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0150
     * @tc.name   : The Toggle property selectedColor is RGB color
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0150 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace02')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0160
     * @tc.name   : The Toggle property selectedColor is string type
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0160', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0160 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace03')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0140
     * @tc.name   : The Toggle property selectedColor is rgba
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0140 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace04')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0190
     * @tc.name   : The Toggle property selectedColor to  0xff0000
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0190 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace05')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0180
     * @tc.name   : The Toggle property selectedColor to  Color.Red
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0180 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace06')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0130
     * @tc.name   : The Toggle property selectedColor to  Resource
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0130', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0130 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace07')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0290
     * @tc.name   : The Toggle property switchPointColor to  Color.White
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0290', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0290 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace08')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0270
     * @tc.name   : The Toggle property switchPointColor to  rgb(255, 255, 255)
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0270', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0270 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace09')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0260
     * @tc.name   : The Toggle property switchPointColor to  rgba(255, 255, 255,1)
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0260', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0260 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace10')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0280
     * @tc.name   : The Toggle property switchPointColor to #ffffff
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0280', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0280 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace11')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0310
     * @tc.name   : The Toggle property switchPointColor to illegal string
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0310', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0310 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace12')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0300
     * @tc.name   : The Toggle property switchPointColor to resource
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0300', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0300 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace13')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0320
     * @tc.name   : The Toggle property switchPointColor to 0xffffff
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0320', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0320 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace14')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0080
     * @tc.name   : ToggleType.Switch type check
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0080 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace15')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0110
     * @tc.name   : Toggle parameter default validation
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0110 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace16')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0020
     * @tc.name   : Toggle.Button does not have built-in Text text validation
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0020 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace17')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0030
     * @tc.name   : ToggleType.Buttontype check
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0030 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace18')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0050
     * @tc.name   : ToggleType.Checkbox check
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0050 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace19')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0210
     * @tc.name   : Toggle component isOn state verification
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0210', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0210 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace20')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentButtonToggleInterFace20_01'),1000);
      await driver.waitForIdle(500,2000)
      await button.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0350
     * @tc.name   : Toggle component set type to undefined
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0350', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0350 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonToggleInterFace/UiComponentButtonToggleInterFace21')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0350 finish.`);
      done()
    })
  })
}