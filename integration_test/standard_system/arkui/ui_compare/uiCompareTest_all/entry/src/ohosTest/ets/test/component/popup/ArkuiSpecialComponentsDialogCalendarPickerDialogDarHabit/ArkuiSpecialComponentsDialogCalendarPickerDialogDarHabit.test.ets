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

export default function arkuiSpecialComponentsDialogCalendarPickerDialogDarHabit() {

  describe('arkuiSpecialComponentsDialogCalendarPickerDialogDarHabit', () => {
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
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0030
     * @tc.name   : When the language is set to Chinese Simplified, the verification does not affect the callback of the onChange event in the CalendarPickerDialog
     * @tc.desc   : Verify component function special components dialog calendar habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0030 start.`);
      Settings.createWindow('testability/pages/component/popup/ArkuiSpecialComponentsDialogCalenDarHabit/ArkuiSpecialComponentsDialogCalenDarHabit01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit01_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit01_02'),1000);
      let point = await button02.getBoundsCenter()
      await button01.click()
      await button02.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0030 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0100
     * @tc.name   : If the language is set to Chinese Traditional (Chinese Traditional Hong Kong, Chinese Traditional Taiwan), the callback of the onChange event in the CalendarPickerDialog is not affected
     * @tc.desc   : Verify component function special components dialog calendar habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0100', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0100 start.`);
      Settings.createWindow('testability/pages/component/popup/ArkuiSpecialComponentsDialogCalenDarHabit/ArkuiSpecialComponentsDialogCalenDarHabit02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit02_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit02_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit02_03'),1000);
      windowSnap.snapShot()
      let point = await button02.getBoundsCenter()
      await button01.click()
      await button03.click()
      await driver.click(point.x,point.y)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:500, y:1000}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      await button03.click()
      await driver.click(point.x-10,point.y)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:500, y:1000}, MouseButton.MOUSE_BUTTON_LEFT);
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0100 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0050
     * @tc.name   : When the language is set to Chinese Simplified, verification does not affect the display of TextStyle
     * @tc.desc   : Verify component function special components dialog calendar habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0050 start.`);
      Settings.createWindow('testability/pages/component/popup/ArkuiSpecialComponentsDialogCalenDarHabit/ArkuiSpecialComponentsDialogCalenDarHabit03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit03_01'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0050 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0120
     * @tc.name   : When the language is set to Chinese Traditional (Chinese Traditional Hong Kong,Chinese Traditional Taiwan),the verification does not affect the display of TextStyle (text style in the entry area)
     * @tc.desc   : Verify component function special components dialog calendar habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0120 start.`);
      Settings.createWindow('testability/pages/component/popup/ArkuiSpecialComponentsDialogCalenDarHabit/ArkuiSpecialComponentsDialogCalenDarHabit04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit04_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit04_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0120 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0040
     * @tc.name   : When the language is set to Chinese Simplified, verify that the callback of the onChange event in CalendarPicker is not affected
     * @tc.desc   : Verify component function special components dialog calendar habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0040 start.`);
      Settings.createWindow('testability/pages/component/popup/ArkuiSpecialComponentsDialogCalenDarHabit/ArkuiSpecialComponentsDialogCalenDarHabit05')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit05_01'),1000);
      let CalendarPicker01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit05_02'),1000);
      let point = await CalendarPicker01.getBoundsCenter()
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await CalendarPicker01.click();
      await driver.click(point.x,point.y)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0040 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0110
     * @tc.name   : When the language is set to Chinese Simplified, verify that the callback of the onChange event in CalendarPicker is not affected
     * @tc.desc   : Verify component function special components dialog calendar habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0110 start.`);
      Settings.createWindow('testability/pages/component/popup/ArkuiSpecialComponentsDialogCalenDarHabit/ArkuiSpecialComponentsDialogCalenDarHabit06')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit06_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit06_02'),1000);
      let CalendarPicker01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit06_03'),1000);
      let text: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit06_04'),1000);
      let point = await CalendarPicker01.getBoundsCenter()
      await button01.click();
      await driver.waitForIdle(500,2000)
      await CalendarPicker01.click();
      await driver.click(point.x,point.y)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await text.doubleClick();
      await button02.click();
      await driver.waitForIdle(500,2000)
      await CalendarPicker01.click();
      await driver.click(point.x-20,point.y-10)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0110 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0170
     * @tc.name   : When the language is set to Ug, validation does not affect the callback of the onChange event in the CalendarPickerDialog
     * @tc.desc   : Verify component function special components dialog calendar habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0170', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0170 start.`);
      Settings.createWindow('testability/pages/component/popup/ArkuiSpecialComponentsDialogCalenDarHabit/ArkuiSpecialComponentsDialogCalenDarHabit07')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit07_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit07_02'),1000);
      let point = await button02.getBoundsCenter();
      await button01.click()
      await button02.click()
      await driver.waitForIdle(500,2000)
      await driver.click(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0170 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0180
     * @tc.name   : When the language is set to Ug, validation does not affect the callback of the onChange event in the CalendarPicker
     * @tc.desc   : Verify component function special components dialog calendar habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0180 start.`);
      Settings.createWindow('testability/pages/component/popup/ArkuiSpecialComponentsDialogCalenDarHabit/ArkuiSpecialComponentsDialogCalenDarHabit08')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit08_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit08_02'),1000);
      let CalendarPicker01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit08_03'),1000);
      let text: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit08_04'),1000);
      windowSnap.snapShot()
      let point = await CalendarPicker01.getBoundsCenter();
      await button01.click()
      await CalendarPicker01.click()
      await driver.click(point.x,point.y)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await text.doubleClick();
      await button02.click();
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0180 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0190
     * @tc.name   : When the language is set to Ug, validation does not affect the callback of the textStyle in the CalendarPicker
     * @tc.desc   : Verify component function special components dialog calendar habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0190 start.`);
      Settings.createWindow('testability/pages/component/popup/ArkuiSpecialComponentsDialogCalenDarHabit/ArkuiSpecialComponentsDialogCalenDarHabit09')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit09_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit09_02'),1000);
      windowSnap.snapShot()
      await button01.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button02.click();
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0190 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0090
     * @tc.name   : If the language is set to Chinese Traditional (Chinese Traditional Hong Kong,Chinese Traditional Taiwan),verify that the correctness of the value returned by the onAccept event in the CalendarPickerDialog is not affected
     * @tc.desc   : Verify component function special components dialog calendar habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0090', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0090 start.`);
      Settings.createWindow('testability/pages/component/popup/ArkuiSpecialComponentsDialogCalenDarHabit/ArkuiSpecialComponentsDialogCalenDarHabit10')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit10_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit10_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit10_03'),1000);
      windowSnap.snapShot()
      let point = await button02.getBoundsCenter()
      await button01.click()
      await button03.click()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:500, y:1000}, MouseButton.MOUSE_BUTTON_LEFT);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button02.click();
      await button03.click()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:500, y:1000}, MouseButton.MOUSE_BUTTON_LEFT);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0090 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0230
     * @tc.name   : If the language is set to Chinese Traditional (Chinese Traditional Hong Kong,Chinese Traditional Taiwan),verify that the correctness of the value returned by the onAccept event in the CalendarPickerDialog is not affected
     * @tc.desc   : Verify component function special components dialog calendar habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0230 start.`);
      Settings.createWindow('testability/pages/component/popup/ArkuiSpecialComponentsDialogCalenDarHabit/ArkuiSpecialComponentsDialogCalenDarHabit11')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit11_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit11_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit11_03'),1000);
      windowSnap.snapShot()
      await button01.click()
      await button03.click()
      await Utils.sleep(1000)
      await driver.mouseClick({x:500, y:1000}, MouseButton.MOUSE_BUTTON_LEFT);
      windowSnap.snapShot()
      await button02.click()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0230 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0240
     * @tc.name   : If the language is set to Chinese Traditional (Chinese Traditional Hong Kong,Chinese Traditional Taiwan),verify that the correctness of the value returned by the onChange event in the CalendarPickerDialog is not affected
     * @tc.desc   : Verify component function special components dialog calendar habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0240', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0240 start.`);
      Settings.createWindow('testability/pages/component/popup/ArkuiSpecialComponentsDialogCalenDarHabit/ArkuiSpecialComponentsDialogCalenDarHabit12')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit12_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit12_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit12_03'),1000);
      let point = await button02.getBoundsCenter();
      windowSnap.snapShot()
      await button01.click()
      await button03.click()
      await driver.click(point.x,point.y)
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseClick({x:500, y:1000}, MouseButton.MOUSE_BUTTON_LEFT);
      await button02.click()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0240 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0260
     * @tc.name   : When the language is set to en, verification does not affect the display of TextStyle
     * @tc.desc   : Verify component function special components dialog calendar habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0260', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0260 start.`);
      Settings.createWindow('testability/pages/component/popup/ArkuiSpecialComponentsDialogCalenDarHabit/ArkuiSpecialComponentsDialogCalenDarHabit13')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit13_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit13_03'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0260 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0330
     * @tc.name   : When the language is set to bo-CN, verification does not affect the display of TextStyle
     * @tc.desc   : Verify component function special components dialog calendar habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0330', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0330 start.`);
      Settings.createWindow('testability/pages/component/popup/ArkuiSpecialComponentsDialogCalenDarHabit/ArkuiSpecialComponentsDialogCalenDarHabit14')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit14_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit14_03'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0330 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0250
     * @tc.name   : When the language is set to English, the validation does not affect the callback of the onChange event in the CalendarPicker
     * @tc.desc   : Verify component function special components dialog calendar habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0250', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0250 start.`);
      Settings.createWindow('testability/pages/component/popup/ArkuiSpecialComponentsDialogCalenDarHabit/ArkuiSpecialComponentsDialogCalenDarHabit15')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit15_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit15_02'),1000);
      let CalendarPicker: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit15_03'),1000);
      let text: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit15_04'),1000);
      let point = await CalendarPicker.getBoundsCenter();
      await button01.click()
      await CalendarPicker.click()
      await driver.waitForIdle(500,2000)
      await driver.click(point.x,point.y)
      await text.doubleClick();
      await button02.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0250 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0320
     * @tc.name   : When the language is set to bo-CN, verify that it does not affect the callback of the onChange event in CalendarPicker
     * @tc.desc   : Verify component function special components dialog calendar habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0320', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0320 start.`);
      Settings.createWindow('testability/pages/component/popup/ArkuiSpecialComponentsDialogCalenDarHabit/ArkuiSpecialComponentsDialogCalenDarHabit16')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit16_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit16_02'),1000);
      let CalendarPicker: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit16_03'),1000);
      let text: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit16_04'),1000);
      let point = await CalendarPicker.getBoundsCenter();
      await button01.click()
      await CalendarPicker.click()
      await driver.waitForIdle(500,2000)
      await driver.click(point.x,point.y)
      await text.doubleClick();
      await button02.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0320 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0310
     * @tc.name   : When the language is set to bo-CN, validation does not affect the callback of the onChange event in the CalendarPickerDialog
     * @tc.desc   : Verify component function special components dialog calendar habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0310', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0310 start.`);
      Settings.createWindow('testability/pages/component/popup/ArkuiSpecialComponentsDialogCalenDarHabit/ArkuiSpecialComponentsDialogCalenDarHabit17')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit17_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('ArkuiSpecialComponentsDialogCalenDarHabit17_02'),1000);
      let point = await button02.getBoundsCenter();
      await button01.click()
      await button02.click()
      await driver.waitForIdle(500,2000)
      await driver.click(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CALENDAR_HABIT_0310 finish.`);
      done()
    })

  })
}