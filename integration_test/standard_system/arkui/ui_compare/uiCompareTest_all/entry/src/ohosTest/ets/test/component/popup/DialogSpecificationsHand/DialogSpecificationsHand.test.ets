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

export default function dialogSpecificationsHand() {

  describe('dialogSpecificationsHand', () => {
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
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_HAND_0020
     * @tc.name   : Component function special components dialog specifications hand
     * @tc.desc   : Verify component function special components dialog specifications hand interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_HAND_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_HAND_0020 start.`);
      Settings.createWindow('testability/pages/component/popup/DialogSpecificationsHand/DialogSpecificationsHand0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('DialogSpecificationsHand0020_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_HAND_0020 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_HAND_0030
     * @tc.name   : Component function special components dialog specifications hand
     * @tc.desc   : Verify component function special components dialog specifications hand interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_HAND_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_HAND_0030 start.`);
      Settings.createWindow('testability/pages/component/popup/DialogSpecificationsHand/DialogSpecificationsHand0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('DialogSpecificationsHand0030_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_HAND_0030 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_HAND_0070
     * @tc.name   : Component function special components dialog specifications hand
     * @tc.desc   : Verify component function special components dialog specifications hand interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_HAND_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_HAND_0070 start.`);
      Settings.createWindow('testability/pages/component/popup/DialogSpecificationsHand/DialogSpecificationsHand0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('DialogSpecificationsHand0070_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('DialogSpecificationsHand0070_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('DialogSpecificationsHand0070_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let cancle: Component = await driver.waitForComponent(ON.text('X'),1000);
      await cancle.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_HAND_0070 finish.`);
      done()
    })









  })
}