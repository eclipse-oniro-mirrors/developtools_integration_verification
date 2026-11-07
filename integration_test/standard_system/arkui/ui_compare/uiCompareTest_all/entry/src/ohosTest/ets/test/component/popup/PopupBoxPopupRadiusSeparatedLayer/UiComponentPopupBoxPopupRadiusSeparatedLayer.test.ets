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

export default function uiComponentPopupBoxPopupRadiusSeparatedLayer() {

  describe('uiComponentPopupBoxPopupRadiusSeparatedLayer', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0090
     * @tc.name   : The popup adds a radius attribute, and the radius parameter of CustomPopupOptions is set to '30fp'.
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0090', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0090 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer01'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0080
     * @tc.name   : The popup adds a radius attribute, and the radius parameter of CustomPopupOptions is set to '20vp'.
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0080 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer02')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer02'),1000);
      await button02.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0130
     * @tc.name   : The popup adds a radius attribute, and the radius parameter of CustomPopupOptions is set to '20lpx'.
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0130', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0130 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer03')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer03'),1000);
      await button03.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0150
     * @tc.name   : The popup adds a radius attribute, and the radius parameter of CustomPopupOptions is set to '10%'.
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0150 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer04')
      let driver:Driver=Driver.create();
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer04'),1000);
      await button04.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0220
     * @tc.name   : The popup adds a radius attribute, and the radius parameter of CustomPopupOptions is set to '10px'.
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0220', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0220 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer05')
      let driver:Driver=Driver.create();
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer05'),1000);
      await button05.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0290
     * @tc.name   : The popup adds a radius attribute, and the radius parameter of CustomPopupOptions is set to undefined.
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0290', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0290 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer06')
      let driver:Driver=Driver.create();
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer06'),1000);
      await button05.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0040
     * @tc.name   : The popup adds a radius attribute, and the radius parameter of CustomPopupOptions is set to 999.
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0040 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer07')
      let driver:Driver=Driver.create();
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer07'),1000);
      await button05.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0360
     * @tc.name   : The popup adds a radius attribute, and the radius parameter of CustomPopupOptions is set to -9.9.
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0360', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0360 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer08')
      let driver:Driver=Driver.create();
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer08'),1000);
      await button05.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0170
     * @tc.name   : The popup adds a radius attribute, and not set radius
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0170', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0170 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer09')
      let driver:Driver=Driver.create();
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer09'),1000);
      await button05.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0210
     * @tc.name   : The popup adds a radius attribute, and set radius to null
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0210', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0210 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer10')
      let driver:Driver=Driver.create();
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer10'),1000);
      await button05.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0020
     * @tc.name   : Popup displays the effect of the background radius when set with a button bubble and radius (20vp)
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0020 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer11')
      let driver:Driver=Driver.create();
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer11'),1000);
      await button05.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0060
     * @tc.name   : Popup setting with button bubble, and the radius parameter is set to 999.
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0060 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer12')
      let driver:Driver=Driver.create();
      let button12: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer12'),1000);
      await button12.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0160
     * @tc.name   : Popup setting with button bubble, and the radius parameter is set to -9.9.
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0160', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0160 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer13')
      let driver:Driver=Driver.create();
      let button13: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer13'),1000);
      await button13.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0110
     * @tc.name   : Popup setting with button bubble, and the radius parameter is set to '10px'.
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0110 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer14')
      let driver:Driver=Driver.create();
      let button14: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer14'),1000);
      await button14.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0240
     * @tc.name   : Popup setting with button bubble, and the radius parameter is set to '20lpx'.
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0240', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0240 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer15')
      let driver:Driver=Driver.create();
      let button15: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer15'),1000);
      await button15.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0310
     * @tc.name   : Popup setting with button bubble, and the radius parameter is set to undefined.
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0310', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0310 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer16')
      let driver:Driver=Driver.create();
      let button16: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer16'),1000);
      await button16.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0330
     * @tc.name   : Popup setting with button bubble, and the radius parameter is set to '30fp'.
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0330', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0330 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer17')
      let driver:Driver=Driver.create();
      let button17: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer17'),1000);
      await button17.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0350
     * @tc.name   : Popup setting with button bubble, and the radius parameter is set to '10%'.
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0350', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0350 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer18')
      let driver:Driver=Driver.create();
      let button18: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer18'),1000);
      await button18.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0280
     * @tc.name   : Popup setting with button bubble, and the radius parameter is set to null.
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0280', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0280 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer19')
      let driver:Driver=Driver.create();
      let button19: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer19'),1000);
      await button19.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0010
     * @tc.name   : Popup setting with button bubble, display effect of background corners when radius is not set
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0010 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer20')
      let driver:Driver=Driver.create();
      let button19: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer20'),1000);
      await button19.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0010
     * @tc.name   : Popup setting with button bubble, display effect of background corners when radius is not set
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0010 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer20')
      let driver:Driver=Driver.create();
      let button19: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer20'),1000);
      await button19.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0070
     * @tc.name   : Popup displays pure text bubble; when radius is set to 30fp, the background corner effect is shown
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0070 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer21')
      let driver:Driver=Driver.create();
      let button19: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer21'),1000);
      await button19.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0030
     * @tc.name   : Popup displays pure text bubble; when radius is set to null, the background corner effect is shown
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0030 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer22')
      let driver:Driver=Driver.create();
      let button22: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer22'),1000);
      await button22.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0050
     * @tc.name   : Popup displays pure text bubble; when radius is set to 999, the background corner effect is shown
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0050 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer23')
      let driver:Driver=Driver.create();
      let button23: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer23'),1000);
      await button23.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0100
     * @tc.name   : Popup displays pure text bubble; when radius is set to 10%, the background corner effect is shown
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0100', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0100 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer24')
      let driver:Driver=Driver.create();
      let button24: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer24'),1000);
      await button24.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0190
     * @tc.name   : Popup displays pure text bubble; when radius is set to undefined, the background corner effect is shown
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0190 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer25')
      let driver:Driver=Driver.create();
      let button25: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer25'),1000);
      await button25.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0260
     * @tc.name   : Popup displays pure text bubble; when radius is set to 20vp, the background corner effect is shown
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0260', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0260 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer26')
      let driver:Driver=Driver.create();
      let button26: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer26'),1000);
      await button26.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0320
     * @tc.name   : Popup displays pure text bubble; when radius is set to 10px, the background corner effect is shown
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0320', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0320 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer27')
      let driver:Driver=Driver.create();
      let button27: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer27'),1000);
      await button27.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0230
     * @tc.name   : Popup displays pure text bubble; when radius is set to 20lpx, the background corner effect is shown
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0230 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer28')
      let driver:Driver=Driver.create();
      let button28: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer28'),1000);
      await button28.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0340
     * @tc.name   : Popup displays pure text bubble; when radius is set to -9.9, the background corner effect is shown
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0340', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0340 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer29')
      let driver:Driver=Driver.create();
      let button29: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer29'),1000);
      await button29.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0200
     * @tc.name   : Popup displays pure text bubble; when radius is not set, the background corner effect is shown
     * @tc.desc   : Verify popupbox popup radiusseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0200', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0200 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupRadiusSeparatedLayer/UiComponentPopupBoxPopupRadiusSeparatedLayer30')
      let driver:Driver=Driver.create();
      let button30: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupRadiusSeparatedLayer30'),1000);
      await button30.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_RADIUSSEPARATEDLAYER_0200 finish.`);
      done()
    })
  })
}