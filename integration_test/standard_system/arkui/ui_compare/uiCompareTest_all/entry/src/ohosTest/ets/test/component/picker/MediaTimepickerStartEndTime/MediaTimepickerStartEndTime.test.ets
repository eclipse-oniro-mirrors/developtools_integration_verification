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
import { Driver, ON, Component } from '@kit.TestKit';

export default function mediaTimepickerStartEndTime() {

  describe('mediaTimepickerStartEndTime', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0011
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0011', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0011 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0011')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0011 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0012
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0012', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0012 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0012')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0012 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0013
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0013', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0013 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0013')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0013 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0014
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0014', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0014 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0014')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0014 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0016
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0016', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0016 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0016')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0016 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0017
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0017', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0017 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0017')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0017 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0018
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0018', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0018 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0018')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0018 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0019
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0019', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0019 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0019')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0019 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0020
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0020 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0020')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0023
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0023', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0023 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0023')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0023 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0026
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0026', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0026 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0026')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0026 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0027
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0027', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0027 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0027')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0027 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0028
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0028', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0028 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0028')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0028 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0029
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0029', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0029 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0029')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0029 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0034
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0034', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0034 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0034')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0034 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0036
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0036', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0036 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0036')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0036 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0037
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0037', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0037 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0037')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0037 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0038
     * @tc.name   : Media TimePicker startendtime
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0038', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0038 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTime/MediaTimepickerStartEndTime0038')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0038 finish.`);
      done()
    })


  })
}