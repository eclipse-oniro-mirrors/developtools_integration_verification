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

export default function uiComponentPopupBoxPopupGlobal() {

  describe('uiComponentPopupBoxPopupGlobal', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1180
     * @tc.name   : 024: Verify the openPopup interface when the options parameter placement is set to LeftTop
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1180 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal01'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1170
     * @tc.name   : 023: Verify the openPopup interface when the options parameter placement is set to BottomRight
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1170', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1170 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal02'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1200
     * @tc.name   : 026: Verify the openPopup interface when the options parameter placement is set to RightTop
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1200', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1200 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal03'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1230
     * @tc.name   : 029: Verify the openPopup interface when the options parameter placement is set to undefined
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1230 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal04'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1210
     * @tc.name   : 027: Verify the openPopup interface when the options parameter placement is set to RightBottom
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1210', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1210 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal05')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal05'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1190
     * @tc.name   : 025: Verify the openPopup interface when the options parameter placement is set to LeftBottom
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1190 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal06')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal06'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1090
     * @tc.name   : 019: Verify the openPopup interface when the options parameter placement is set to Bottom
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1090', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1090 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal07')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal07'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1140
     * @tc.name   : 020: Verify the openPopup interface when the options parameter placement is set to TopLeft
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1140 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal08')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal08'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1160
     * @tc.name   : 022: Verify the openPopup interface when the options parameter placement is set to BottomLeft
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1160', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1160 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal09')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal09'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1150
     * @tc.name   : 021: Verify the openPopup interface when the options parameter placement is set to TopRight
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1150 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal10')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal10'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0750
     * @tc.name   : 016: Verify the openPopup interface when the options parameter placement is set to Left
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0750', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0750 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal11')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal11'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0750 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0860
     * @tc.name   : 017: Verify the openPopup interface when the options parameter placement is set to Right
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0860', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0860 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal12')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal12'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0860 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0980
     * @tc.name   : 017: Verify the openPopup interface when the options parameter placement is set to Top
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0980', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0980 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal13')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal13'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0980 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1310
     * @tc.name   : 037: Verify the openPopup interface when the options parameter enableArrow is set to false
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1310', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1310 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal14')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal14'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1300
     * @tc.name   : 036: Verify the openPopup interface when the options parameter enableArrow is set to true
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1300', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1300 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal15')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal15'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1340
     * @tc.name   : 040: Verify the openPopup interface when the options parameter autoCancel is set to true
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1340', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1340 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal16')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal16'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1350
     * @tc.name   : 041: Verify the openPopup interface when the options parameter autoCancel is set to false
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1350', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1350 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal17')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal17'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1370
     * @tc.name   : 043: Verify the openPopup interface when the options parameter autoCancel is set to undefined
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1370', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1370 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal18')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal18'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1840
     * @tc.name   : 089: Verify the openPopup interface when the arrowHeight parameter in the options is set to 40lpx
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1840', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1840 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal19')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal19'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1840 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1830
     * @tc.name   : 088: Verify the openPopup interface when the arrowHeight parameter in the options is set to 30fp
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1830', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1830 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal20')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal20'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1830 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1850
     * @tc.name   : 090: Verify the openPopup interface when the arrowHeight parameter in the options is set to 30%
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1850', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1850 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal21')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal21'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1850 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1880
     * @tc.name   : 093: Verify the openPopup interface when the arrowHeight parameter in the options is set to undefined
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1880', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1880 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal22')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal22'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1880 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1860
     * @tc.name   : 092: Verify the openPopup interface when the arrowHeight parameter in the options is set to $r("app.string.string45")
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1860', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1860 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal23')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal23'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1860 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1820
     * @tc.name   : 087: Verify the openPopup interface when the arrowHeight parameter in the options is set to 20vp
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1820', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1820 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal24')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal24'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1820 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1810
     * @tc.name   : 086: Verify the openPopup interface when the arrowHeight parameter in the options is set to 10px
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1810', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1810 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal25')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal25'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1810 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1740
     * @tc.name   : 078: Verify the openPopup interface when the arrowWidth parameter in the options is set to 20vp
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1740', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1740 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal26')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal26'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1740 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1730
     * @tc.name   : 079: Verify the openPopup interface when the arrowWidth parameter in the options is set to 10px
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1730', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1730 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal27')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal27'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1730 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1800
     * @tc.name   : 085: Verify the openPopup interface when the arrowWidth parameter in the options is set to undefined
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1800', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1800 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal28')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal28'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1800 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1770
     * @tc.name   : 082: Verify the openPopup interface when the arrowWidth parameter in the options is set to 30%
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1770', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1770 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal29')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal29'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1770 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1750
     * @tc.name   : 080: Verify the openPopup interface when the arrowWidth parameter in the options is set to 30fp
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1750', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1750 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal30')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal30'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1750 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1760
     * @tc.name   : 081: Verify the openPopup interface when the arrowWidth parameter in the options is set to 40lpx
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1760', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1760 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal31')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal31'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1760 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1780
     * @tc.name   : 83: Verify the openPopup interface when the arrowWidth parameter in the options is set to app.string.string45
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1780', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1780 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal32')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal32'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1780 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1680
     * @tc.name   : 073: Verify the openPopup interface when the arrowPointPosition parameter in the options is set to START
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1680', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1680 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal33')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal33'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1680 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1700
     * @tc.name   : 075: Verify the openPopup interface when the arrowPointPosition parameter in the options is set to END
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1700', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1700 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal34')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal34'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1700 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1720
     * @tc.name   : 077: Verify the openPopup interface when the arrowPointPosition parameter in the options is set to undefined
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1720', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1720 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal35')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal35'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1720 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1690
     * @tc.name   : 074: Verify the openPopup interface when the arrowPointPosition parameter in the options is set to CENTER
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1690', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1690 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal36')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal36'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1690 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0110
     * @tc.name   : 0101: Verify the openPopup interface when the shadow parameter in options is set to OUTER_DEFAULT_XS
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0110 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal37')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal37'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0120
     * @tc.name   : 0102: Verify the openPopup interface when the shadow parameter in options is set to OUTER_DEFAULT_SM
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0120 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal38')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal38'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0140
     * @tc.name   : 0104: Verify the openPopup interface when the shadow parameter in options is set to OUTER_DEFAULT_LG
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0140 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal39')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal39'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0150
     * @tc.name   : 0104: Verify the openPopup interface when the shadow parameter in options is set to OUTER_FLOATING_SM
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0150 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal40')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal40'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0130
     * @tc.name   : 0103: Verify the openPopup interface when the shadow parameter in options is set to OUTER_DEFAULT_MD
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0130', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0130 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal41')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal41'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0160
     * @tc.name   : 0106: Verify the openPopup interface when the shadow parameter in options is set to OUTER_FLOATING_MD
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0160', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0160 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal42')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal42'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1500
     * @tc.name   : 055: Verify the openPopup interface when the options parameter mask is set to Color.Green
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1500', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1500 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal43')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal43'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1520
     * @tc.name   : 057: Verify the openPopup interface when the options parameter mask is set to 0xffff00
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1520', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1520 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal44')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal44'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1510
     * @tc.name   : 056: Verify the openPopup interface when the options parameter mask is set to #FF00FF
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1510', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1510 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal45')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal45'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1490
     * @tc.name   : 054: Verify the openPopup interface when the options parameter mask is set to false
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1490', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1490 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal46')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal46'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1470
     * @tc.name   : 053: Verify the openPopup interface when the options parameter mask is set to true
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1470', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1470 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal47')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal47'),1000);
      let point = await button01.getBoundsCenter()
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x,y:point.y-100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0330
     * @tc.name   : 0121: Verify the openPopup interface when the backgroundBlurStyle parameter in the options is set to COMPONENT_THIN
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0330', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0330 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal48')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal48'),1000);
      await Utils.sleep(1000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0350
     * @tc.name   : 0123: Verify the openPopup interface when the backgroundBlurStyle parameter in the options is set to COMPONENT_THICK
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0350', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0350 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal49')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal49'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0340
     * @tc.name   : 0122: Verify the openPopup interface when the backgroundBlurStyle parameter in the options is set to COMPONENT_REGULAR
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0340', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0340 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal50')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal50'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0260
     * @tc.name   : 0115: Verify the openPopup interface when the backgroundBlurStyle parameter in the options is set to BACKGROUND_THIN
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0260', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0260 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal51')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal51'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0270
     * @tc.name   : 0116: Verify the openPopup interface when the backgroundBlurStyle parameter in the options is set to BACKGROUND_REGULAR
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0270', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0270 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal52')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal52'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0230
     * @tc.name   : 0112: Verify the openPopup interface when the backgroundBlurStyle parameter in the options is set to Thin
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0230 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal53')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal53'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0240
     * @tc.name   : 0113: Verify the openPopup interface when the backgroundBlurStyle parameter in the options is set to Regular
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0240', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0240 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal54')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal54'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0250
     * @tc.name   : 0114: Verify the openPopup interface when the backgroundBlurStyle parameter in the options is set to Thick
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0250', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0250 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal55')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal55'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0300
     * @tc.name   : 0119: Verify the openPopup interface when the backgroundBlurStyle parameter in the options is set to None
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0300', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0300 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal56')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal56'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0360
     * @tc.name   : 0124: Verify the openPopup interface when the backgroundBlurStyle parameter in the options is set to COMPONENT_ULTRA_THICK
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0360', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0360 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal57')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal57'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0380
     * @tc.name   : 0126: Verify the openPopup interface when the backgroundBlurStyle parameter in the options is set to undefined
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0380', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0380 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal58')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal58'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1400
     * @tc.name   : 046: Verify the openPopup interface when the arrowOffset parameter in the options is set to "30"
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1400', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1400 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal59')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal59'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1430
     * @tc.name   : 049: Verify the openPopup interface when the arrowOffset parameter in the options is set to undefined
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1430', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1430 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal60')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal60'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1390
     * @tc.name   : 045: Verify the openPopup interface when the arrowOffset parameter in the options is set to 15
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1390', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1390 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal61')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal61'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1640
     * @tc.name   : 069: Verify the openPopup interface when the options set the width parameter to 50fp
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1640', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1640 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal62')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal62'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1640 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1620
     * @tc.name   : 067: Verify the openPopup interface when the options set the width parameter to 50px
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1620', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1620 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal63')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal63'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1620 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1630
     * @tc.name   : 068: Verify the openPopup interface when the options set the width parameter to 50vp
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1630', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1630 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal64')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal64'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1630 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1660
     * @tc.name   : 071: Verify the openPopup interface when the options set the width parameter to 50%
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1660', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1660 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal65')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal65'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1650
     * @tc.name   : 070: Verify the openPopup interface when the options set the width parameter to 50lpx
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1650', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1650 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal66')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal66'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1650 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0170
     * @tc.name   : 0107: Verify the openPopup interface options by setting the shadow parameter to the ShadowOptions property (radius: 50, type: ShadowType.COLOR, color: Color.Black, offsetX: 50, offsetY: 50, fill: true)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0170', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0170 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal67')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal67'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0180
     * @tc.name   : 0108: Verify the openPopup interface options by setting the shadow parameter to the ShadowOptions property(radius:50, type:ShadowType.BLUR,color:“#FF00FF“,offsetX:50,offsetY:50,fill:false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0180 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal68')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal68'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1600
     * @tc.name   : 065: Verify the openPopup interface when the options set the offset parameters x and y to 100
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1600', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1600 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal69')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal69'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1590
     * @tc.name   : 064: Verify the openPopup interface when the options set the offset parameters x and y to '30'
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1590', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1590 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal70')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal70'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1580
     * @tc.name   : 063: Verify the openPopup interface when the options parameter targetSpace is set to undefined
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1580', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1580 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal71')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal71'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1550
     * @tc.name   : 060: Verify the openPopup interface when the options parameter targetSpace is set to 20
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1550', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1550 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal72')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal72'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1540
     * @tc.name   : 059: Verify the openPopup interface when the options parameter targetSpace is set to '10'
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1540', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1540 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal73')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal73'),1000);
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0660
     * @tc.name   : 0151 Verify the updatePopup interface when the initial placement parameter in options is set to LEFT, and then changed to BOTTOM (with partialUpdate set to false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0660', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0660 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal74')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal74'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal74_02'),1000);
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0680
     * @tc.name   : 0153  Verify the updatePopup interface when the initial enableArrow parameter in options is set to true, and then changed to false (with partialUpdate set to false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0680', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0680 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal75')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal75'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal75_02'),1000);
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0680 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0710
     * @tc.name   : 0156 Verify the updatePopup interface when the initial arrowOffset parameter in options is set to "15", and then changed to 30 (with partialUpdate set to false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0710', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0710 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal76')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal76'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal76_02'),1000);
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0710 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0740
     * @tc.name   : 0159 Verify the updatePopup interface when the initial targetSpace parameter in options is set to "10", and then changed to 20 (with partialUpdate set to false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0740', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0740 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal77')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal77'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal77_02'),1000);
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0740 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0730
     * @tc.name   : 0158 Verify the updatePopup interface when the initial mask parameter in options is set to true, and then changed to {color:Color.Green} (with partialUpdate set to false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0730', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0730 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal78')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal78'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal78_02'),1000);
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0730 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0810
     * @tc.name   : 0165 Verify the updatePopup interface when the initial radius parameter in options is set to "10px", and then changed to "40lpx" (with partialUpdate set to false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0810', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0810 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal79')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal79'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal79_02'),1000);
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0810 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0780
     * @tc.name   : 0162 Verify the updatePopup interface when the initial arrowPointPosition parameter in options is set to START, and then changed to END (with partialUpdate set to false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0780', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0780 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal80')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal80'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal80_02'),1000);
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0780 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0820
     * @tc.name   : 0166 Verify the updatePopup interface when the initial shadow parameter in options is set to OUTER_DEFAULT_XS, and then changed to OUTER_DEFAULT_LG (with partialUpdate set to false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0820', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0820 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal81')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal81'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal81_02'),1000);
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0820 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0830
     * @tc.name   : 0167 Verify the updatePopup interface when the initial backgroundBlurStyle parameter in options is set to BlurStyle.Thick, and then changed to NONE (with partialUpdate set to false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0830', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0830 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal82')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal82'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal82_02'),1000);
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0830 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0910
     * @tc.name   : 0174 Verify the updatePopup interface when the initial placement parameter in options is set to Left, and then changed to Bottom (with partialUpdate set to undefined)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0910', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0910 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal83')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal83'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal83_02'),1000);
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0910 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0890
     * @tc.name   : 0172 Verify the updatePopup interface when the initial placement parameter in options is set to Left, and then changed to Bottom (with partialUpdate set to true)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0890', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0890 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal84')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal84'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal84_02'),1000);
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0890 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0920
     * @tc.name   : 0175 Verify the updatePopup interface when the initial placement parameter in options is set to Left, and then changed to Bottom (not set partialUpdate)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0920', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0920 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal85')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal85'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal85_02'),1000);
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0920 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0900
     * @tc.name   : 0175 Verify the updatePopup interface when the initial placement parameter in options is set to Left, and then changed to Bottom (set partialUpdate to null)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0900', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0900 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal86')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal86'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal86_02'),1000);
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0900 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0950
     * @tc.name   : 0175 Verify the updatePopup interface when the initial placement parameter in options is set to Left, and then changed to Bottom (not set partialUpdate and closePopup)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0950', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0950 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal87')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal87'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal87_02'),1000);
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal87_03'),1000);
      await button03.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0950 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0900
     * @tc.name   : 0175 Verify the updatePopup interface when the initial autoCancel parameter in options is set to false, and then changed to true (set partialUpdate to false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0690', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0690 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal88')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal88'),1000);
      let text: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal88_03'),1000);
      let point = await text.getBoundsCenter()
      await button01.click()
      await driver.click(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(2000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal88_02'),1000);
      await button02.click()
      await driver.click(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0690 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0960
     * @tc.name   : 0178: Directly call closePopup after verifying the openPopup interface
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0960', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0960 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal89')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal89'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal89_02'),1000);
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0960 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0960
     * @tc.name   : 0142: Verify the openPopup interface when setting followTransformOfTarget to true
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0560', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0560 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal90')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal90'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0560 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0570
     * @tc.name   : 0143: Verify the openPopup interface when setting followTransformOfTarget to false
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0570', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0570 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal91')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal91'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0590
     * @tc.name   : 0145: Verify the openPopup interface when setting followTransformOfTarget to undefined
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0590', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0590 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupGlobalAlt/UiComponentPopupBoxPopupGlobal92')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupGlobal92'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0590 finish.`);
      done()
    })

  })
}