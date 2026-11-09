/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { KeyCode } from '@kit.InputKit'

export default function uiComponentMediaCalendarPickerDate() {

  describe('uiComponentMediaCalendarPickerDate', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0012
     * @tc.name   : CalendarPicker/CalendarPickerDialog set start equal end
     * @tc.desc   : Verify media CalendarPicker date interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0012', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0012 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaCalendarPickerDateAlt/UiComponentMediaCalendarPickerDate01')
      let driver: Driver = Driver.create();
      let picker: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate01_01'), 1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate01_02'), 1000);
      await picker.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await driver.waitForIdle(500, 2000);
      await picker.click();
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0012 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0013
     * @tc.name   : CalendarPicker/CalendarPickerDialog sets an irregular date format
     * @tc.desc   : Verify media CalendarPicker date interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0013', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0013 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaCalendarPickerDateAlt/UiComponentMediaCalendarPickerDate02')
      let driver: Driver = Driver.create();
      let picker: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate02_01'), 1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate02_02'), 1000);
      await picker.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await driver.waitForIdle(500, 2000);
      await picker.click();
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0013 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0014
     * @tc.name   : Set start and end to null/undefined in CalendarPicker/CalendarPickerDialog
     * @tc.desc   : Verify media CalendarPicker date interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0014', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0014 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaCalendarPickerDateAlt/UiComponentMediaCalendarPickerDate03')
      let driver: Driver = Driver.create();
      let picker: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate03_01'), 1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate03_02'), 1000);
      await picker.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await driver.waitForIdle(500, 2000);
      await picker.click();
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0014 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0015
     * @tc.name   : CalendarPicker/CalendarPickerDialog选择超出范围日期
     * @tc.desc   : Verify media CalendarPicker date interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0015', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0015 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaCalendarPickerDateAlt/UiComponentMediaCalendarPickerDate04')
      let driver: Driver = Driver.create();
      let picker: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate04_01'), 1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate04_02'), 1000);
      await picker.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await driver.waitForIdle(500, 2000);
      await picker.click();
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0015 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0016
     * @tc.name   : Dynamically modify the maximum and minimum dates of CalendarPicker/CalendarPickerDialog
     * @tc.desc   : Verify media CalendarPicker date interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0016', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0016 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaCalendarPickerDateAlt/UiComponentMediaCalendarPickerDate05')
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate05_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate05_02'), 1000);
      let picker: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate05_04'), 1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate05_05'), 1000);
      await button1.click();
      await picker.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await driver.waitForIdle(500, 2000);
      await picker.click();
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await button.click();
      //范围2
      await Utils.sleep(1000)
      await button2.click();
      await picker.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await driver.waitForIdle(500, 2000);
      await picker.click();
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await button.click();
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0016 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0017
     * @tc.name   : CalendarPicker/CalendarPickerDialog selects a date earlier than the start time
     * @tc.desc   : Verify media CalendarPicker date interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0017', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0017 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaCalendarPickerDateAlt/UiComponentMediaCalendarPickerDate06')
      let driver: Driver = Driver.create();
      let picker: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate06_01'), 1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate06_02'), 1000);
      await picker.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await driver.waitForIdle(500, 2000);
      await picker.click();
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0017 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0018
     * @tc.name   : CalendarPicker/CalendarPickerDialog selects a date later than the start time
     * @tc.desc   : Verify media CalendarPicker date interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0018', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0018 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaCalendarPickerDateAlt/UiComponentMediaCalendarPickerDate07')
      let driver: Driver = Driver.create();
      let picker: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate07_01'), 1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate07_02'), 1000);
      await picker.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await driver.waitForIdle(500, 2000);
      await picker.click();
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0018 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0019
     * @tc.name   : CalendarPicker/CalendarPickerDialog set start later than current system date, selected date not set
     * @tc.desc   : Verify media CalendarPicker date interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0019', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0019 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaCalendarPickerDateAlt/UiComponentMediaCalendarPickerDate08')
      let driver: Driver = Driver.create();
      let picker: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate08_01'), 1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate08_02'), 1000);
      await picker.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await driver.waitForIdle(500, 2000);
      await picker.click();
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0019 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0020
     * @tc.name   : CalendarPicker/CalendarPickerDialog set end earlier than current system date, selected date not set
     * @tc.desc   : Verify media CalendarPicker date interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0020 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaCalendarPickerDateAlt/UiComponentMediaCalendarPickerDate09')
      let driver: Driver = Driver.create();
      let picker: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate09_01'), 1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentMediaCalendarPickerDate09_02'), 1000);
      await picker.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await driver.waitForIdle(500, 2000);
      await picker.click();
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0020 finish.`);
      done()
    })

  })
}