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

export default function foregroundColor() {

  describe('foregroundColor', () => {
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
     * @tc.number : SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0018
     * @tc.name   : Progress common foregroundcolor
     * @tc.desc   : Verify Progress common foregroundcolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0018', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0018 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ForegroundColor/ForegroundColor0018')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0018 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0022
     * @tc.name   : Progress common foregroundcolor
     * @tc.desc   : Verify Progress common foregroundcolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0022', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0022 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ForegroundColor/ForegroundColor0022')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0022 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0012
     * @tc.name   : Progress common foregroundcolor
     * @tc.desc   : Verify Progress common foregroundcolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0012', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0012 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ForegroundColor/ForegroundColor0012')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0012 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0010
     * @tc.name   : Progress common foregroundcolor
     * @tc.desc   : Verify Progress common foregroundcolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0010', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0010 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ForegroundColor/ForegroundColor0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0011
     * @tc.name   : Progress common foregroundcolor
     * @tc.desc   : Verify Progress common foregroundcolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0011', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0011 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ForegroundColor/ForegroundColor0011')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0011 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0015
     * @tc.name   : Progress common foregroundcolor
     * @tc.desc   : Verify Progress common foregroundcolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0015', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0015 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ForegroundColor/ForegroundColor0015')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0015 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0014
     * @tc.name   : Progress common foregroundcolor
     * @tc.desc   : Verify Progress common foregroundcolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0014', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0014 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ForegroundColor/ForegroundColor0014')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0014 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0016
     * @tc.name   : Progress common foregroundcolor
     * @tc.desc   : Verify Progress common foregroundcolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0016', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0016 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ForegroundColor/ForegroundColor0016')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0016 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0019
     * @tc.name   : Progress common foregroundcolor
     * @tc.desc   : Verify Progress common foregroundcolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0019', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0019 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ForegroundColor/ForegroundColor0019')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0019 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0020
     * @tc.name   : Progress common foregroundcolor
     * @tc.desc   : Verify Progress common foregroundcolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0020 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ForegroundColor/ForegroundColor0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0023
     * @tc.name   : Progress common foregroundcolor
     * @tc.desc   : Verify Progress common foregroundcolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0023', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0023 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ForegroundColor/ForegroundColor0023')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_FOREGROUNDCOLOR_0023 finish.`);
      done()
    })




  })
}