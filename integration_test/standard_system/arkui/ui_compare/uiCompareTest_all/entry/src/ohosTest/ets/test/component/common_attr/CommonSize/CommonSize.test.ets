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

export default function commonSize() {

  describe('commonSize', () => {
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
     * @tc.number : SUB_ACE_UI_PROGRESS_COMMON_SIZE_0009
     * @tc.name   : Progress common size
     * @tc.desc   : Verify Progress common size interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_PROGRESS_COMMON_SIZE_0009', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_SIZE_0009 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonSize/CommonSize0009')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_SIZE_0009 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_PROGRESS_COMMON_SIZE_0007
     * @tc.name   : Progress common size
     * @tc.desc   : Verify Progress common size interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_PROGRESS_COMMON_SIZE_0007', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_SIZE_0007 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonSize/CommonSize0007')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_SIZE_0007 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_PROGRESS_COMMON_SIZE_0010
     * @tc.name   : Progress common size
     * @tc.desc   : Verify Progress common size interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_PROGRESS_COMMON_SIZE_0010', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_SIZE_0010 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonSize/CommonSize0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_SIZE_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_PROGRESS_COMMON_SIZE_0008
     * @tc.name   : Progress common size
     * @tc.desc   : Verify Progress common size interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_PROGRESS_COMMON_SIZE_0008', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_SIZE_0008 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonSize/CommonSize0008')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_SIZE_0008 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_PROGRESS_COMMON_SIZE_0006
     * @tc.name   : Progress common size
     * @tc.desc   : Verify Progress common size interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_PROGRESS_COMMON_SIZE_0006', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_SIZE_0006 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonSize/CommonSize0006')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_PROGRESS_COMMON_SIZE_0006 finish.`);
      done()
    })

  })
}