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

export default function tsTools() {

  describe('tsTools', () => {
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
     * @tc.number : SUB_ACE_TS_TOOLS_0010
     * @tc.name   : Ts tools
     * @tc.desc   : Verify ts tools interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TS_TOOLS_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0010 start.`);
      Settings.createWindow('testability/pages/scenario/misc/TsTools/TsTools0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(5000, 8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_TS_TOOLS_0020
     * @tc.name   : Ts tools
     * @tc.desc   : Verify ts tools interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TS_TOOLS_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0020 start.`);
      Settings.createWindow('testability/pages/scenario/misc/TsTools/TsTools0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(5000, 8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_TS_TOOLS_0040
     * @tc.name   : Ts tools
     * @tc.desc   : Verify ts tools interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TS_TOOLS_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0040 start.`);
      Settings.createWindow('testability/pages/scenario/misc/TsTools/TsTools0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(5000, 8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_TS_TOOLS_0050
     * @tc.name   : Ts tools
     * @tc.desc   : Verify ts tools interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TS_TOOLS_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0050 start.`);
      Settings.createWindow('testability/pages/scenario/misc/TsTools/TsTools0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(5000, 8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_TS_TOOLS_0060
     * @tc.name   : Ts tools
     * @tc.desc   : Verify ts tools interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TS_TOOLS_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0060 start.`);
      Settings.createWindow('testability/pages/scenario/misc/TsTools/TsTools0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(5000, 8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_TS_TOOLS_0080
     * @tc.name   : Ts tools
     * @tc.desc   : Verify ts tools interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TS_TOOLS_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0080 start.`);
      Settings.createWindow('testability/pages/scenario/misc/TsTools/TsTools0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(5000, 8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_TS_TOOLS_0090
     * @tc.name   : Ts tools
     * @tc.desc   : Verify ts tools interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TS_TOOLS_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0090 start.`);
      Settings.createWindow('testability/pages/scenario/misc/TsTools/TsTools0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(5000, 8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_TS_TOOLS_0100
     * @tc.name   : Ts tools
     * @tc.desc   : Verify ts tools interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TS_TOOLS_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0100 start.`);
      Settings.createWindow('testability/pages/scenario/misc/TsTools/TsTools0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(5000, 8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_TS_TOOLS_0120
     * @tc.name   : Ts tools
     * @tc.desc   : Verify ts tools interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TS_TOOLS_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0120 start.`);
      Settings.createWindow('testability/pages/scenario/misc/TsTools/TsTools0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(5000, 8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_TS_TOOLS_0120 finish.`);
      done()
    })

  })
}