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

export default function uiComponentPopupBoxPicker() {

  describe('uiComponentPopupBoxPicker', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0010
     * @tc.name   : Add a callback when textPickerDialog pops up
     * @tc.desc   : Verify popupbox Picker interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0010 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPicker/UiComponentPopupBoxPicker01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPicker01'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:500, y:800}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0020
     * @tc.name   : Add a callback when textPickerDialog exits
     * @tc.desc   : Verify popupbox Picker interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0020 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPicker/UiComponentPopupBoxPicker02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPicker02'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:200, y:800}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0030
     * @tc.name   : Add a callback before textPickerDialog display animation
     * @tc.desc   : Verify popupbox Picker interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0030 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPicker/UiComponentPopupBoxPicker03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPicker03'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:500, y:800}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0040
     * @tc.name   : Add a callback before textPickerDialog exit animation
     * @tc.desc   : Verify popupbox Picker interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0040 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPicker/UiComponentPopupBoxPicker04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPicker04'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:200, y:800}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0050
     * @tc.name   : Add a callback when datePickerDialog pops up
     * @tc.desc   : Verify popupbox Picker interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0050 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPicker/UiComponentPopupBoxPicker05')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPicker05'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:500, y:850}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0060
     * @tc.name   : Add a callback when datePickerDialog exits
     * @tc.desc   : Verify popupbox Picker interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0060 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPicker/UiComponentPopupBoxPicker06')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPicker06'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:200, y:850}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0070
     * @tc.name   : Add a callback before datePickerDialog display animation
     * @tc.desc   : Verify popupbox Picker interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0070 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPicker/UiComponentPopupBoxPicker07')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPicker07'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:500, y:850}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0080
     * @tc.name   : Add a callback before datePickerDialog exit animation
     * @tc.desc   : Verify popupbox Picker interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0080 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPicker/UiComponentPopupBoxPicker08')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPicker08'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:200, y:850}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0130
     * @tc.name   : Add a callback when calendarPickerDialog pops up
     * @tc.desc   : Verify popupbox Picker interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0130 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPicker/UiComponentPopupBoxPicker09')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPicker09'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:500, y:900}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0140
     * @tc.name   : Add a callback when calendarPickerDialog exits
     * @tc.desc   : Verify popupbox Picker interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0140 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPicker/UiComponentPopupBoxPicker10')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPicker10'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:200, y:900}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0150
     * @tc.name   : Add a callback before calendarPickerDialog display animation
     * @tc.desc   : Verify popupbox Picker interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0150 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPicker/UiComponentPopupBoxPicker11')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPicker11'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:500, y:900}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0160
     * @tc.name   : Add a callback before calendarPickerDialog exit animation
     * @tc.desc   : Verify popupbox Picker interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0160 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPicker/UiComponentPopupBoxPicker12')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPicker12'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:200, y:900}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0160 finish.`);
      done()
    })



  })
}