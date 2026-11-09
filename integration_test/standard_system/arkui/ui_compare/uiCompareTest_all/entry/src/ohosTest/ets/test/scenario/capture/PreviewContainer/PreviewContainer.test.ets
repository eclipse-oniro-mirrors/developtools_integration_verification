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

export default function previewContainer() {

  describe('previewContainer', () => {
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
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0010
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0010 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0010')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0020
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0020 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0020')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0030
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0030 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0030')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0040
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0040 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0040')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0050
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0050 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0050')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0060
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0060 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0060')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0070
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0070 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0070')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0080
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0080 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0080')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0090
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0090 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0090')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0100
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0100 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0100')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0110
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0110 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0110')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0120
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0120 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0120')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0130
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0130 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0130')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0140
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0140 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0140')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0150
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0150 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0150')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0160
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0160 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0160')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0170
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0170 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0170')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0180
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0180 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0180')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_CONTINER_0190
     * @tc.name   : Preview continer
     * @tc.desc   : Verify preview continer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_CONTINER_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0190 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewContainer/PreviewContainer0190')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_PREVIEW_CONTINER_0190 finish.`);
      done()
    })



  })
}