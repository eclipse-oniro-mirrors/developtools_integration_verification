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

export default function mediaTimepickerEnableCascade() {

  describe('mediaTimepickerEnableCascade', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0018
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0018', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0018 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0018')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0018 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0019
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0019', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0019 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0019')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0019 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0020
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0020 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0020')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0021
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0021', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0021 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0021')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0021 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0029
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0029', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0029 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0029')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0029 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0030
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0030 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0030')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0031
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0031', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0031 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0031')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0031 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0032
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0032', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0032 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0032')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0032 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0033
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0033', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0033 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0033')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0033 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0042
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0042', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0042 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0042')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0042 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0043
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0043', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0043 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0043')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0043 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0044
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0044', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0044 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0044')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0044 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0045
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0045', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0045 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0045')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0045 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0047
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0047', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0047 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0047')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0047 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0048
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0048', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0048 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0048')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0048 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0049
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0049', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0049 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0049')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0049 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0050
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0050 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0050')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0051
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0051', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0051 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0051')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0051 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0052
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0052', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0052 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0052')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0052 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0053
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0053', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0053 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0053')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0053 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0054
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0054', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0054 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0054')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0054 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0058
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0058', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0058 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0058')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0058 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0059
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0059', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0059 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0059')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0059 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0060
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0060 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0060')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0061
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0061', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0061 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0061')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0061 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0066
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0066', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0066 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0066')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0066 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0067
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0067', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0067 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0067')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0067 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0068
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0068', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0068 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0068')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0068 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0069
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0069', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0069 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0069')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0069 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0070
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0070 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0070')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(8000,10000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0071
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0071', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0071 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0071')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(8000,10000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0071 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0072
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0072', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0072 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0072')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(8000,10000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0072 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0073
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0073', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0073 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0073')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0073 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0074
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0074', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0074 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0074')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0074 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0075
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0075', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0075 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0075')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0075 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0076
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0076', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0076 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0076')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0076 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0077
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0077', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0077 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0077')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0077 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0078
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0078', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0078 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0078')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0078 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0079
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0079', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0079 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0079')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0079 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0080
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0080 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0080')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0081
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0081', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0081 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0081')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0081 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0082
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0082', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0082 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0082')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0082 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0083
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0083', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0083 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0083')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0083 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0084
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0084', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0084 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0084')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0084 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0085
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0085', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0085 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0085')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0085 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0086
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0086', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0086 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0086')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0086 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0087
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0087', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0087 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/MediaTimepickerEnableCascade0087')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0087 finish.`);
      done()
    })






  })
}