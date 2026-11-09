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
import { Driver, ON, Component, MouseButton, UiWindow } from '@kit.TestKit'
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

export default function uiComponentPopupBoxSpecificationsPageDisplay() {

  describe('uiComponentPopupBoxSpecificationsPageDisplay', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0710
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to EMBEDDED and ImmersiveMode to abnormal values, and levelUniqueId is set to a normal value, the dialog node that pops up is at the top layer 01 of the current page.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0710', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0710 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay01_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay01_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay01_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button04.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0710 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0690
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to EMBEDDED and ImmersiveMode to EXTEND, and levelUniqueId is set to a normal value, the dialog node that pops up is at the top layer 03 of the current page.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0690', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0690 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay02_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay02_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay02_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button04.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0690 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0810
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to OVERLAY and ImmersiveMode to EXTEND, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0810', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0810 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay03_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay03_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay03_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0810 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0780
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to OVERLAY and ImmersiveMode to DEFAULT, the dialog node that pops up is at the global window top layer 04.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0780', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0780 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay04_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay04_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay04_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0780 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0820
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to OVERLAY and ImmersiveMode to abnormal values, the dialog node that pops up is at the global window top layer 05.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0820', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0820 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay05')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay05_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay05_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay05_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0820 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0680
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to EMBEDDED and ImmersiveMode to EXTEND, and levelUniqueId is set to a normal value, the dialog node that pops up is at the top layer 02 of the current page.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0680', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0680 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay06')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay06_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay06_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay06_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0680 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0750
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to EMBEDDED and ImmersiveMode to abnormal values, and levelUniqueId is set to a normal value, the dialog node that pops up is at the current page top layer 07.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0750', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0750 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay07')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay07_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay07_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay07_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0750 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0800
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to OVERLAY and ImmersiveMode to EXTEND, the dialog node that pops up is at the global window top layer 08.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0800', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0800 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay08')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay08_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay08_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay08_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0800 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0770
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to OVERLAY and ImmersiveMode to DEFAULT, the dialog node that pops up is at the global window top layer 09.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0770', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0770 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay09')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay09_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay09_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay09_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0770 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0870
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to abnormal values and ImmersiveMode to DEFAULT, the dialog node that pops up is at the global window top layer 10.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0870', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0870 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay10')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay10_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay10_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay10_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0870 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0890
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to abnormal values and ImmersiveMode to EXTEND, the dialog node that pops up is at the global window top layer 11.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0890', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0890 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay11')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay11_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay11_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay11_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0890 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0910
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to abnormal values and ImmersiveMode to abnormal values, the dialog node that pops up is at the global window top layer 12.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0910', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0910 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay12')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay12_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay12_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay12_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0910 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1510
     * @tc.name   : Verify that when ShowActionSheet sets LevelMode to abnormal values and ImmersiveMode to DEFAULT, the dialog node that pops up is at the global window top layer 13.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1510', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1510 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay13')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay13_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay13_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1550
     * @tc.name   : Verify that when ShowActionSheet sets LevelMode to abnormal values and ImmersiveMode to abnormal values, the dialog node that pops up is at the global window top layer 14.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1550', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1550 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay14')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay14_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay14_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1530
     * @tc.name   : Verify that when ShowActionSheet sets LevelMode to abnormal values and ImmersiveMode to EXTEND, the dialog node that pops up is at the global window top layer 15.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1530', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1530 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay15')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay15_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay15_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1340
     * @tc.name   : Verify that when ShowActionSheet sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, and levelUniqueId to a normal value, the dialog node that pops up is at the global window top layer 16.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1340', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1340 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay16')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay16_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay16_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1390
     * @tc.name   : Verify that when ShowActionSheet sets LevelMode to EMBEDDED, ImmersiveMode to EXTEND, and levelUniqueId to a normal value, the dialog node that pops up is at the global window top layer 17.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1390', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1390 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay17')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay17_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay17_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1430
     * @tc.name   : Verify that when ShowActionSheet sets LevelMode to EMBEDDED, ImmersiveMode to abnormal values, and levelUniqueId to a normal value, the dialog node that pops up is at the global window top layer 18.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1430', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1430 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay18')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay18_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay18_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0280
     * @tc.name   : Verify that when AlertDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 19.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0280', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0280 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay19')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay19_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0310
     * @tc.name   : Verify that when AlertDialog sets LevelMode to EMBEDDED, ImmersiveMode to EXTEND, and levelUniqueId to an abnormal value, the dialog node that pops up is at the global window top layer 20.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0310', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0310 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay20')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay20_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0290
     * @tc.name   : Verify that when AlertDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 21.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0290', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0290 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay21')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay21_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay21_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0340
     * @tc.name   : Verify that when AlertDialog sets LevelMode to EMBEDDED, ImmersiveMode to EXTEND, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 22.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0340', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0340 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay22')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay22_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay22_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0380
     * @tc.name   : Verify that when AlertDialog sets LevelMode to EMBEDDED, ImmersiveMode to abnormal values, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 23.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0380', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0380 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay23')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay23_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay23_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2600
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 24.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2600', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2600 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay24')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay24_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay24_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2660
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to EXTEND, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 25.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2660', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2660 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay25')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay25_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay25_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2640
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to EXTEND, and levelUniqueId to an abnormal value, the dialog node that pops up is at the global window top layer 26.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2640', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2640 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay26')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay26_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay26_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2640 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2670
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to EXTEND, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 27.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2670', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2670 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay27')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay27_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay27_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2670 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2680
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to an abnormal value, and levelUniqueId to an abnormal value, the dialog node that pops up is at the global window top layer 28.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2680', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2680 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay28')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay28_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay28_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2680 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2690
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to an abnormal value, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 29.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2690', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2690 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay29')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay29_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay29_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2690 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2730
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to an abnormal value, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 30.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2730', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2730 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay30')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay30_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay30_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2730 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1860
     * @tc.name   : Verify that when uiContext_openCustomDialogWithController sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 31.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1860', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1860 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay31')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay31_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay31_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1860 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1850
     * @tc.name   : Verify that when uiContext_openCustomDialogWithController sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 32.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1850', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1850 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay32')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay32_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay32_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1850 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1920
     * @tc.name   : Verify that when uiContext_openCustomDialogWithController sets LevelMode to EMBEDDED, ImmersiveMode to EXTEND, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 33.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1920', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1920 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay33')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay33_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay33_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1920 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1930
     * @tc.name   : Verify that when uiContext_openCustomDialogWithController sets LevelMode to EMBEDDED, ImmersiveMode to EXTEND, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 34.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1930', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1930 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay34')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay34_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay34_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1930 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1950
     * @tc.name   : Verify that when uiContext_openCustomDialogWithController sets LevelMode to EMBEDDED, ImmersiveMode to an abnormal value, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 35.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1950', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1950 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay35')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay35_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay35_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1950 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1990
     * @tc.name   : Verify that when uiContext_openCustomDialogWithController sets LevelMode to EMBEDDED, ImmersiveMode to an abnormal value, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 36.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1990', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1990 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay36')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay36_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay36_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1990 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2220
     * @tc.name   : Verify that when uiContext_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 37.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2220', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2220 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay37')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay37_04'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay37_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2230
     * @tc.name   : Verify that when uiContext_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 38.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2230 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay38')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay38_04'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay38_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2300
     * @tc.name   : Verify that when uiContext_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to EXTEND, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 39.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2300', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2300 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay39')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay39_04'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay39_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2280
     * @tc.name   : Verify that when uiContext_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to EXTEND, and levelUniqueId to a normal value, the dialog node that pops up is at the global window top layer 40.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2280', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2280 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay40')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay40_04'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay40_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2320
     * @tc.name   : Verify that when uiContext_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to an abnormal value, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 41.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2320', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2320 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay41')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay41_04'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay41_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2360
     * @tc.name   : Verify that when uiContext_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to an abnormal value, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 42.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2360', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2360 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay42')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay42_04'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay42_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2470
     * @tc.name   : Verify that when uiContext_openCustomDialog sets LevelMode to an abnormal value and ImmersiveMode to DEFAULT, the dialog node that pops up is at the global window top layer 43.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2470', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2470 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay43')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay43_03'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay43_04'),1000);
      await button00.click()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay43_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2420
     * @tc.name   : Verify that when uiContext_openCustomDialog sets LevelMode to OverLay and ImmersiveMode to EXTEND, the dialog node that pops up is at the global window top layer 44.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2420', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2420 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay44')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay44_03'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay44_04'),1000);
      await button00.click()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay44_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2430
     * @tc.name   : Verify that when uiContext_openCustomDialog sets LevelMode to OverLay and ImmersiveMode to an abnormal value, the dialog node that pops up is at the global window top layer 45.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2430', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2430 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay45')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay45_03'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay45_04'),1000);
      await button00.click()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay45_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2540
     * @tc.name   : Verify that when uiContext_openCustomDialog sets LevelMode to an abnormal value and ImmersiveMode to an abnormal value, the dialog node that pops up is at the global window top layer 46.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2540', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2540 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay46')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay46_03'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay46_04'),1000);
      await button00.click()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay46_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2520
     * @tc.name   : Verify that when uiContext_openCustomDialog sets LevelMode to an abnormal value and ImmersiveMode to EXTEND, (router)the dialog node that pops up is at the global window top layer 47.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2520', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2520 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay47')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay47_03'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay47_04'),1000);
      await button00.click()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay47_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2390
     * @tc.name   : Verify that when uiContext_openCustomDialog sets LevelMode to OverLay and ImmersiveMode to DEFAULT, the dialog node that pops up is at the global window top layer 48.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2390', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2390 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay48')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay48_03'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay48_04'),1000);
      await button00.click()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay48_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1080
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to an abnormal value, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 49.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1080 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay49')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay49_03'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay49_04'),1000);
      await button00.click()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay49_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1050
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to EXTEND, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 50.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1050 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay50')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay50_03'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay50_04'),1000);
      await button00.click()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay50_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1060
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to EXTEND, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 51.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1060 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay51')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay51_03'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay51_04'),1000);
      await button00.click()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay51_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1120
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to an abnormal value, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 52.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1120 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay52')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay52_03'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay52_04'),1000);
      await button00.click()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay52_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0980
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 53.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0980', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0980 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay53')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay53_03'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay53_04'),1000);
      await button00.click()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay53_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0980 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0990
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 54.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0990', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0990 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay54')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay54_03'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay54_04'),1000);
      await button00.click()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay54_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0990 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0040
     * @tc.name   : Verify that when ShowActionSheet sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 55.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0040 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay55')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay55_02'),1000);
      await button00.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay55_01'),1000);
      await button01.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0090
     * @tc.name   : Verify that when ShowActionSheet sets LevelMode to EMBEDDED, ImmersiveMode to EXTEND, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 56.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0090', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0090 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay56')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay56_02'),1000);
      await button00.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay56_01'),1000);
      await button01.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0130
     * @tc.name   : Verify that when ShowActionSheet sets LevelMode to EMBEDDED, ImmersiveMode to an abnormal value, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 57.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0130', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0130 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay57')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay57_02'),1000);
      await button00.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay57_01'),1000);
      await button01.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0600
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 58.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0600', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0600 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay58')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay58_03'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay58_04'),1000);
      await button00.click()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay58_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0610
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, and levelUniqueId to a normal value, the dialog node that pops up is at the current page top layer 59.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0610', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0610 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay59')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay59_03'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay59_04'),1000);
      await button00.click()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay59_01'),1000);
      await button02.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0610 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1590
     * @tc.name   : Verify that when showDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, and levelUniqueId to a normal value, the dialog node that pops up is at the page top layer 60.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1590', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1590 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay60')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay60_01'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay60_02'),1000);
      await button00.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1640
     * @tc.name   : Verify that when showDialog sets LevelMode to EMBEDDED, ImmersiveMode to EXTEND, and levelUniqueId to a normal value, the dialog node that pops up is at the page top layer 61.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1640', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1640 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay61')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay61_01'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay61_02'),1000);
      await button00.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1640 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1680
     * @tc.name   : Verify that when showDialog sets LevelMode to EMBEDDED, ImmersiveMode to abnormal value, and levelUniqueId to a normal value, the dialog node that pops up is at the page top layer 62.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1680', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1680 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay62')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay62_01'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay62_02'),1000);
      await button00.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1680 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0840
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to OverLay and ImmersiveMode to an abnormal value, the popped-up dialog node is at the global window top level 63
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0840', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0840 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay63')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay63_04'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay63_03'),1000);
      await button02.click()
      await button00.click()
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay63_01'),1000);
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0840 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0860
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to an abnormal value and ImmersiveMode to DEFAULT, the popped-up dialog node is at the top layer of the global window.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0860', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0860 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay64')
      let driver:Driver=Driver.create();
      let button00: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay64_04'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay64_03'),1000);
      await button02.click()
      await button00.click()
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay64_01'),1000);
      await button01.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0860 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0660
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to EMBEDDED and ImmersiveMode to EXTEND, and levelUniqueId is set to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0660', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0660 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay65')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay65_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay65_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay65_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0740
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to EMBEDDED and ImmersiveMode to abnormal value, and levelUniqueId is set to a normal value, the dialog node that pops up is at the current page top layer 01.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0740', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0740 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay66')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay66_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay66_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0740 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0620
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to EMBEDDED and ImmersiveMode to DEFAULT, and levelUniqueId is set to a normal value, the dialog node that pops up is at the current page top layer 01.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0620', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0620 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay67')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay67_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay67_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0620 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0700
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to EMBEDDED and ImmersiveMode to abnormal value, and levelUniqueId is set to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0700', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0700 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay68')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay68_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay68_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay68_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0700 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0900
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to abnormal value and ImmersiveMode to EXTEND, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0900', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0900 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay69')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay69_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay69_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay69_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0900 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0590
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to EMBEDDED and ImmersiveMode to DEFAULT, and levelUniqueId is set to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0590', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0590 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay70')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay70_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay70_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay70_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1070
     * @tc.name   : Verify that when prompt_openCustomDialog is set with LevelMode as EMBEDDED or ImmersiveMode with abnormal values, and levelUniqueId is set to an abnormal value, the popped-up dialog node appears as the global window top-level
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1070 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay71')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay71_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay71_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay71_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1030
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to EMBEDDED and ImmersiveMode to EXTEND, and levelUniqueId is set to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1030 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay72')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay72_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay72_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay72_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1180
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to OVERLAY and ImmersiveMode to EXTEND, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1180 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay73')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay73_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay73_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay73_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1190
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to OVERLAY and ImmersiveMode to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1190 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay74')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay74_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay74_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay74_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1240
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to abnormal value and ImmersiveMode to DEFAULT, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1240', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1240 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay75')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay75_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay75_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay75_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1270
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to abnormal value and ImmersiveMode to EXTEND, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1270', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1270 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay76')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay76_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay76_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay76_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1280
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to abnormal value and ImmersiveMode to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1280', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1280 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay77')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay77_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay77_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay77_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1150
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to OVERLAY and ImmersiveMode to DEFAULT, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1150 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay78')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay78_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay78_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay78_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0960
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT and levelUniqueId to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0960', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0960 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay79')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay79_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay79_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay79_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0960 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1110
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to abnormal value and levelUniqueId to normal value, the dialog node that pops up is at the current page top layer 01.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1110 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay80')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay80_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay80_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0970
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT and levelUniqueId to normal value, the dialog node that pops up is at the current page top layer 01.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0970', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0970 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay81')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay81_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay81_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0970 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2150
     * @tc.name   : Verify that when uiContext_openCustomDialogWithController sets LevelMode to abnormal value and ImmersiveMode to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2150 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay82')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay82_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay82_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay82_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2060
     * @tc.name   : Verify that when uiContext_openCustomDialogWithController sets LevelMode to OVERLAY and ImmersiveMode to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2060 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay83')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay83_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay83_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay83_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2050
     * @tc.name   : Verify that when uiContext_openCustomDialogWithController sets LevelMode to OVERLAY and ImmersiveMode to EXTEND, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2050 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay84')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay84_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay84_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay84_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2020
     * @tc.name   : Verify that when uiContext_openCustomDialogWithController sets LevelMode to OVERLAY and ImmersiveMode to DEFAULT, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2020 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay85')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay85_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay85_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay85_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2140
     * @tc.name   : Verify that when uiContext_openCustomDialogWithController sets LevelMode to abnormal value and ImmersiveMode to EXTEND, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2140 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay86')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay86_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay86_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay86_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2200
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT and levelUniqueId to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2200', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2200 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay87')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay87_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay87_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay87_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2270
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to EXTEND and levelUniqueId to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2270', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2270 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay88')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay88_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay88_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay88_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2310
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to abnormal value and levelUniqueId to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2310', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2310 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay89')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay89_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay89_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay89_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2480
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to abnormal value and ImmersiveMode to DEFAULT, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2480', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2480 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay90')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay90_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay90_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay90_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2210
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT and levelUniqueId to normal value, the dialog node that pops up is at the current page top layer 01.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2210', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2210 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay91')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay91_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay91_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2350
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to abnormal value and levelUniqueId to normal value, the dialog node that pops up is at the current page top layer 01.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2350', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2350 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay92')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay92_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay92_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2110
     * @tc.name   : Verify that when uiContext_openCustomDialogWithController sets LevelMode to abnormal value and ImmersiveMode to DEFAULT, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2110 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay93')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay93_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay93_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay93_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1830
     * @tc.name   : Verify that when uiContext_openCustomDialogWithController sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT and levelUniqueId to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1830', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1830 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay94')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay94_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay94_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay94_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1830 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1900
     * @tc.name   : Verify that when uiContext_openCustomDialogWithController sets LevelMode to EMBEDDED, ImmersiveMode to EXTEND and levelUniqueId to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1900', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1900 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay95')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay95_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay95_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay95_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1900 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1940
     * @tc.name   : Verify that when uiContext_openCustomDialogWithController sets LevelMode to EMBEDDED, ImmersiveMode to abnormal value and levelUniqueId to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1940', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1940 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay96')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay96_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay96_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay96_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1940 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1840
     * @tc.name   : Verify that when uiContext_openCustomDialogWithController sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT and levelUniqueId to normal value, the dialog node that pops up is at the current page top layer 01.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1840', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1840 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay97')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay97_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay97_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1840 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1980
     * @tc.name   : Verify that when uiContext_openCustomDialogWithController sets LevelMode to EMBEDDED, ImmersiveMode to abnormal value and levelUniqueId to normal value, the dialog node that pops up is at the current page top layer 01.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1980', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1980 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay98')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay98_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay98_04'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1980 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2760
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to OVERLAY and ImmersiveMode to DEFAULT, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2760', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2760 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay99')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay99_05'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay99_02'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay99_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2760 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2790
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to OVERLAY and ImmersiveMode to EXTEND, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2790', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2790 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay100')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay100_05'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay100_02'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay100_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2790 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2800
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to OVERLAY and ImmersiveMode to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2800', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2800 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay101')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay101_05'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay101_02'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay101_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2800 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2850
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to abnormal value and ImmersiveMode to DEFAULT, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2850', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2850 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay102')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay102_05'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay102_02'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay102_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2850 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2880
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to abnormal value and ImmersiveMode to EXTEND, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2880', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2880 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay103')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay103_05'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay103_02'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay103_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2880 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2890
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to abnormal value and ImmersiveMode to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2890', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2890 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay104')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay104_05'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay104_02'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay104_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2890 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2570
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, and levelUniqueId to abnormal value, the dialog node that pops up is at the global window top layer 03.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2570', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2570 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay105')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay105_05'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay105_02'),1000);
      await button01.click()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay105_01'),1000);
      await button03.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:200,y:200},MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2580
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, and levelUniqueId to normal value, the dialog node that pops up is at the current page top layer 01.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2580', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2580 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay106')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay106_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay106_02'),1000);
      await button01.click()
      await Utils.sleep(1000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2720
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to abnormal value, and levelUniqueId to normal value, the dialog node that pops up is at the current page top layer 01.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2720', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2720 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay107')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay107_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay107_02'),1000);
      await button01.click()
      await Utils.sleep(1000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2720 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1330
     * @tc.name   : Verify that when ShowActionSheet is set with LevelMode as EMBEDDED, ImmersiveMode as DEFAULT, and levelUniqueId is set to a normal value, the popped-up dialog node is at the top level of the global window 01.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1330', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1330 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay108')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay108_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay108_02'),1000);
      await button01.click()
      await Utils.sleep(1000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1420
     * @tc.name   : Verify that when ShowActionSheet is set with LevelMode as EMBEDDED, ImmersiveMode is set to an abnormal value, and levelUniqueId is set to a normal value, the dialog that pops up appears as the top-level window of the global node 01.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1420', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1420 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay109')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay109_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay109_02'),1000);
      await button01.click()
      await Utils.sleep(1000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0370
     * @tc.name   : Verify that when AlertDialog is set with LevelMode as EMBEDDED, ImmersiveMode set to an abnormal value, and levelUniqueId set to a normal value, the popped-up dialog node is the top layer 01 of the current page.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0370', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0370 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay110')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay110_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay110_02'),1000);
      await button01.click()
      await Utils.sleep(1000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0630
     * @tc.name   : Verify that when CustomDialogController sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, levelUniqueId to a normal value, showInSubWindow to true, and isModal to false, the dialog node that pops up is at the global window top layer.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0630', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0630 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay111')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay111_04'),1000);
      await button02.click()
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay111_01'),1000);
      await button03.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_0630 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1600
     * @tc.name   : Verify that when showDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, levelUniqueId to a normal value, showInSubWindow to true, and isModal to false, the dialog node that pops up is at the global window top layer.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1600', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1600 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay112')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay112_01'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay112_02'),1000);
      let point = await button03.getBoundsCenter()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2610
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, levelUniqueId to a normal value, showInSubWindow to true, and isModal to false, the dialog node that pops up is at the global window top layer.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2610', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2610 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay113')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay113_01'),1000);
      await button02.click()
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay113_02'),1000);
      await button03.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2610 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1870
     * @tc.name   : Verify that when uiContext_presentCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, levelUniqueId to a normal value, showInSubWindow to true, and isModal to false, the dialog node that pops up is at the global window top layer.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1870', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1870 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay114')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay114_04'),1000);
      await button02.click()
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay114_01'),1000);
      await button03.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1870 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2240
     * @tc.name   : Verify that when uiContext_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, levelUniqueId to a normal value, showInSubWindow to true, and isModal to false, the dialog node that pops up is at the global window top layer.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2240', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2240 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay115')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay115_04'),1000);
      await button02.click()
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay115_01'),1000);
      await button03.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_2240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1350
     * @tc.name   : Verify that when ShowActionSheet sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, levelUniqueId to a normal value, showInSubWindow to true, and isModal to false, the dialog node that pops up is at the global window top layer.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1350', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1350 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay116')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay116_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay116_01'),1000);
      let point = await button03.getBoundsCenter()
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1000
     * @tc.name   : Verify that when prompt_openCustomDialog sets LevelMode to EMBEDDED, ImmersiveMode to DEFAULT, levelUniqueId to a normal value, showInSubWindow to true, and isModal to false, the dialog node that pops up is at the global window top layer.
     * @tc.desc   : Verify popupbox specifications pagedisplay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1000', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1000 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsPageDisplayAlt/UiComponentPopupBoxSpecificationsPageDisplay117')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay117_04'),1000);
      await button02.click()
      windowSnap.snapShot()
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsPageDisplay117_01'),1000);
      await button03.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:200,y:1230},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_PAGEDISPLAY_1000 finish.`);
      done()
    })
  })
}