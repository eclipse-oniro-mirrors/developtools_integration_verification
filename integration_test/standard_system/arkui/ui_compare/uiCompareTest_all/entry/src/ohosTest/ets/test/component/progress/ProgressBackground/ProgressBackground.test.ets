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

export default function progressBackground() {

  describe('progressBackground', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0010
     * @tc.name   : Media Progress background
     * @tc.desc   : Verify media Progress background interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0010', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0010 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBackground/ProgressBackground0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0013
     * @tc.name   : Media Progress background
     * @tc.desc   : Verify media Progress background interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0013', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0013 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBackground/ProgressBackground0013')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0013 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0015
     * @tc.name   : Media Progress background
     * @tc.desc   : Verify media Progress background interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0015', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0015 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBackground/ProgressBackground0015')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0015 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0016
     * @tc.name   : Media Progress background
     * @tc.desc   : Verify media Progress background interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0016', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0016 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBackground/ProgressBackground0016')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0016 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0017
     * @tc.name   : Media Progress background
     * @tc.desc   : Verify media Progress background interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0017', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0017 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBackground/ProgressBackground0017')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0017 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0019
     * @tc.name   : Media Progress background
     * @tc.desc   : Verify media Progress background interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0019', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0019 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBackground/ProgressBackground0019')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0019 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0026
     * @tc.name   : Media Progress background
     * @tc.desc   : Verify media Progress background interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0026', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0026 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBackground/ProgressBackground0026')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0026 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0029
     * @tc.name   : Media Progress background
     * @tc.desc   : Verify media Progress background interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0029', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0029 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBackground/ProgressBackground0029')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0029 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0031
     * @tc.name   : Media Progress background
     * @tc.desc   : Verify media Progress background interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0031', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0031 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBackground/ProgressBackground0031')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BACKGROUND_0031 finish.`);
      done()
    })



  })
}