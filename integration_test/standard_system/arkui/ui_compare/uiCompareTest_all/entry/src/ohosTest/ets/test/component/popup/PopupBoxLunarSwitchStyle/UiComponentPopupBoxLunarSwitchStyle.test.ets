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
import { uiAppearance } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'

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

export default function uiComponentPopupBoxLunarSwitchStyle() {

  describe('uiComponentPopupBoxLunarSwitchStyle', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0070
     * @tc.name   : Verify that the color of the candy bar is displayed correctly when the three parameters of LunarSwitchStyle are set in dark mode:selectedColor is set to #ff0303,unselectedColor is set to 0x0fff03,trokeColor is set to rgb (0,0,255)
     * @tc.desc   : Verify popupbox lunarswitchstyle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0070 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxLunarSwitchStyle/UiComponentPopupBoxLunarSwitchStyle01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxLunarSwitchStyle01'),1000);
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK).then(() => {
          console.info('Set dark-mode successfully.');
        }).catch((error:Error) => {
          console.error('Set dark-mode failed, ' + error.message);
          done();
        });
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Set dark-mode failed, ' + message);
      }
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:100,y:820},MouseButton.MOUSE_BUTTON_LEFT)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0020
     * @tc.name   : Verify that the color of the candy bar is displayed correctly without setting LunarSwitchStyle in light mode
     * @tc.desc   : Verify popupbox lunarswitchstyle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0020 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxLunarSwitchStyle/UiComponentPopupBoxLunarSwitchStyle02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxLunarSwitchStyle02'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:100,y:820},MouseButton.MOUSE_BUTTON_LEFT)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0040
     * @tc.name   : Verify that the color of the candy bar is displayed correctly when the three parameters of LunarSwitchStyle are set in light mode:selectedColor is set to #ff0303,unselectedColor is set to 0x0fff03,trokeColor is set to rgb (0,0,255)
     * @tc.desc   : Verify popupbox lunarswitchstyle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0040 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxLunarSwitchStyle/UiComponentPopupBoxLunarSwitchStyle03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxLunarSwitchStyle03'),1000);
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT).then(() => {
          console.info('Set dark-mode successfully.');
        }).catch((error:Error) => {
          console.error('Set dark-mode failed, ' + error.message);
          done();
        });
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Set dark-mode failed, ' + message);
      }
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:100,y:820},MouseButton.MOUSE_BUTTON_LEFT)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0050
     * @tc.name   : Verify that the color of the candy bar is displayed correctly when the three parameters of LunarSwitchStyle are set in dark mode:and not set LunarSwitchStyle
     * @tc.desc   : Verify popupbox lunarswitchstyle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0050 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxLunarSwitchStyle/UiComponentPopupBoxLunarSwitchStyle04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxLunarSwitchStyle04'),1000);
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK).then(() => {
          console.info('Set dark-mode successfully.');
        }).catch((error:Error) => {
          console.error('Set dark-mode failed, ' + error.message);
          done();
        });
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Set dark-mode failed, ' + message);
      }
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:100,y:820},MouseButton.MOUSE_BUTTON_LEFT)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0060
     * @tc.name   : Verify that the color of the bind machine is displayed correctly when the three parameters of LunarSwitchStyle are set to outliers in dark mode
     * @tc.desc   : Verify popupbox lunarswitchstyle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0060 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxLunarSwitchStyle/UiComponentPopupBoxLunarSwitchStyle05')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxLunarSwitchStyle05'),1000);
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK).then(() => {
          console.info('Set dark-mode successfully.');
        }).catch((error:Error) => {
          console.error('Set dark-mode failed, ' + error.message);
          done();
        });
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Set dark-mode failed, ' + message);
      }
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:100,y:820},MouseButton.MOUSE_BUTTON_LEFT)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0030
     * @tc.name   : Verify that the color of the bind machine is displayed correctly when the three parameters of LunarSwitchStyle are set to outliers in light mode
     * @tc.desc   : Verify popupbox lunarswitchstyle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0030 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxLunarSwitchStyle/UiComponentPopupBoxLunarSwitchStyle06')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxLunarSwitchStyle06'),1000);
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT).then(() => {
          console.info('Set dark-mode successfully.');
        }).catch((error:Error) => {
          console.error('Set dark-mode failed, ' + error.message);
          done();
        });
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Set dark-mode failed, ' + message);
      }
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:100,y:820},MouseButton.MOUSE_BUTTON_LEFT)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0120
     * @tc.name   : Verify that the color of the candy bar is displayed correctly when the resource reference type is set to LunarSwitchStyle as the default value in dark mode
     * @tc.desc   : Verify popupbox lunarswitchstyle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0120 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxLunarSwitchStyle/UiComponentPopupBoxLunarSwitchStyle07')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxLunarSwitchStyle07'),1000);
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK).then(() => {
          console.info('Set dark-mode successfully.');
        }).catch((error:Error) => {
          console.error('Set dark-mode failed, ' + error.message);
          done();
        });
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Set dark-mode failed, ' + message);
      }
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:100,y:820},MouseButton.MOUSE_BUTTON_LEFT)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0110
     * @tc.name   : Verify that the color of the candy bar is displayed correctly when the resource reference type is set to LunarSwitchStyle as the default value in light mode
     * @tc.desc   : Verify popupbox lunarswitchstyle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0110 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxLunarSwitchStyle/UiComponentPopupBoxLunarSwitchStyle08')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxLunarSwitchStyle08'),1000);
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT).then(() => {
          console.info('Set dark-mode successfully.');
        }).catch((error:Error) => {
          console.error('Set dark-mode failed, ' + error.message);
          done();
        });
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Set dark-mode failed, ' + message);
      }
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:100,y:820},MouseButton.MOUSE_BUTTON_LEFT)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_LUNARSWITCHSTYLE_0110 finish.`);
      done()
    })

  })
}