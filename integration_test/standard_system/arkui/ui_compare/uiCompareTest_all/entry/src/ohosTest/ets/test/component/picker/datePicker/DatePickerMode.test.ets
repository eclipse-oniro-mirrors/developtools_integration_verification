/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
import { Driver, ON, Component, MouseButton } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit'

export default function datePickerModeTest() {

  describe('datePickerModeTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err:BusinessError) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0011
     * @tc.name   : Media DatePicker mode
     * @tc.desc   : Verify media DatePicker mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0011', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0011 start.`);
      Settings.createWindow('testability/pages/component/picker/dataPicker/mode01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button: Component = await driver.waitForComponent(ON.id('DatePickerMode01'), 1000);
      await button.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0011 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0012
     * @tc.name   : Media DatePicker mode
     * @tc.desc   : Verify media DatePicker mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0012', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0012 start.`);
      Settings.createWindow('testability/pages/component/picker/dataPicker/mode02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button: Component = await driver.waitForComponent(ON.id('DatePickerMode02'), 1000);
      await button.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0012 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0013
     * @tc.name   : Media DatePicker mode
     * @tc.desc   : Verify media DatePicker mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0013', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0013 start.`);
      Settings.createWindow('testability/pages/component/picker/dataPicker/mode03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0013 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0016
     * @tc.name   : Media DatePicker mode
     * @tc.desc   : Verify media DatePicker mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0016', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0016 start.`);
      Settings.createWindow('testability/pages/component/picker/dataPicker/mode04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('DatePickerMode04_01'), 1000);
      await button1.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('DatePickerMode04_02'), 1000);
      await button2.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button3: Component = await driver.waitForComponent(ON.id('DatePickerMode04_03'), 1000);
      await button3.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0016 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0017
     * @tc.name   : Media DatePicker mode
     * @tc.desc   : Verify media DatePicker mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0017', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0017 start.`);
      Settings.createWindow('testability/pages/component/picker/dataPicker/mode05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('DatePickerMode05_01'), 1000);
      await button1.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('DatePickerMode05_02'), 1000);
      await button2.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button3: Component = await driver.waitForComponent(ON.id('DatePickerMode05_03'), 1000);
      await button3.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0017 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0018
     * @tc.name   : Media DatePicker mode
     * @tc.desc   : Verify media DatePicker mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0018', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0018 start.`);
      Settings.createWindow('testability/pages/component/picker/dataPicker/mode06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let datePicker: Component = await driver.findComponent(ON.id('DatePickerMode06'));
      let point = await datePicker.getBoundsCenter();
      await driver.swipe(point.x, point.y, point.x, point.y + 50, 3000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.swipe(point.x, point.y + 50, point.x, point.y, 3000);

      let button1: Component = await driver.waitForComponent(ON.id('DatePickerMode06_01'), 1000);
      await button1.click()
      await driver.waitForIdle(500,2000);
      await driver.swipe(point.x, point.y, point.x, point.y + 50, 3000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.swipe(point.x, point.y + 50, point.x, point.y, 3000);

      let button2: Component = await driver.waitForComponent(ON.id('DatePickerMode06_02'), 1000);
      await button2.click()
      await driver.waitForIdle(500,2000);
      await driver.swipe(point.x, point.y, point.x, point.y + 50, 3000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.swipe(point.x, point.y + 50, point.x, point.y, 3000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0018 finish.`);
      done()
    })
  })
}