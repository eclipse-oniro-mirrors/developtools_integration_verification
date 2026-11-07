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

export default function uiReverseTest() {

  describe('uiReverseTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0010
     * @tc.name   : * @tc.type   : Function
     * @tc.desc   : Verify column row reverse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0010 start.`);
      Settings.createWindow('testability/pages/scenario/misc/uiReverse/uiReverse01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('uiReverse01_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id('uiReverse01_02'), 1000);
      let button3: Component = await driver.waitForComponent(ON.id('uiReverse01_03'), 1000);
      await button1.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)

      await button2.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)

      await button3.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0020
     * @tc.name   : * @tc.type   : Function
     * @tc.desc   : Verify column row reverse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0020 start.`);
      Settings.createWindow('testability/pages/scenario/misc/uiReverse/uiReverse02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0030
     * @tc.name   : * @tc.type   : Function
     * @tc.desc   : Verify column row reverse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0030 start.`);
      Settings.createWindow('testability/pages/scenario/misc/uiReverse/uiReverse03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('uiReverse03_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id('uiReverse03_02'), 1000);
      let button3: Component = await driver.waitForComponent(ON.id('uiReverse03_03'), 1000);
      await button1.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)

      await button2.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)

      await button3.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0040
     * @tc.name   : * @tc.type   : Function
     * @tc.desc   : Verify column row reverse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0040 start.`);
      Settings.createWindow('testability/pages/scenario/misc/uiReverse/uiReverse04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0060
     * @tc.name   : * @tc.type   : Function
     * @tc.desc   : Verify column row reverse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0060 start.`);
      Settings.createWindow('testability/pages/scenario/misc/uiReverse/uiReverse05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0070
     * @tc.name   : * @tc.type   : Function
     * @tc.desc   : Verify column row reverse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0070 start.`);
      Settings.createWindow('testability/pages/scenario/misc/uiReverse/uiReverse06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0080
     * @tc.name   : * @tc.type   : Function
     * @tc.desc   : Verify column row reverse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0080 start.`);
      Settings.createWindow('testability/pages/scenario/misc/uiReverse/uiReverse07')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('uiReverse07'), 1000);
      await button1.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0090
     * @tc.name   : * @tc.type   : Function
     * @tc.desc   : Verify column row reverse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0090 start.`);
      Settings.createWindow('testability/pages/scenario/misc/uiReverse/uiReverse08')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('uiReverse08'), 1000);
      await button1.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0120
     * @tc.name   : * @tc.type   : Function
     * @tc.desc   : Verify column row reverse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0120 start.`);
      Settings.createWindow('testability/pages/scenario/misc/uiReverse/uiReverse09')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('uiReverse09'), 1000);
      await button1.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0130
     * @tc.name   : * @tc.type   : Function
     * @tc.desc   : Verify column row reverse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0130 start.`);
      Settings.createWindow('testability/pages/scenario/misc/uiReverse/uiReverse10')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('uiReverse10'), 1000);
      await button1.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0140
     * @tc.name   : * @tc.type   : Function
     * @tc.desc   : Verify column row reverse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0140 start.`);
      Settings.createWindow('testability/pages/scenario/misc/uiReverse/uiReverse11')
      let driver:Driver = Driver.create();

      await driver.waitForIdle(500,2000);
      let button1: Component = await driver.waitForComponent(ON.id('uiReverse11_02'), 1000);
      await button1.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)

      let button2: Component = await driver.waitForComponent(ON.id('uiReverse11_03'), 1000);
      await button2.click()
      await driver.waitForIdle(500,2000);
      let button3: Component = await driver.waitForComponent(ON.id('uiReverse11_01'), 1000);
      await button3.click()
      await driver.waitForIdle(500,2000);
      await button1.click()
      await driver.waitForIdle(500,2000);

      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0150
     * @tc.name   : * @tc.type   : Function
     * @tc.desc   : Verify column row reverse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0150 start.`);
      Settings.createWindow('testability/pages/scenario/misc/uiReverse/uiReverse12')
      let driver:Driver = Driver.create();

      await driver.waitForIdle(500,2000);
      let button1: Component = await driver.waitForComponent(ON.id('uiReverse12_02'), 1000);
      await button1.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)

      let button2: Component = await driver.waitForComponent(ON.id('uiReverse12_03'), 1000);
      await button2.click()
      await driver.waitForIdle(500,2000);
      let button3: Component = await driver.waitForComponent(ON.id('uiReverse12_01'), 1000);
      await button3.click()
      await driver.waitForIdle(500,2000);
      await button1.click()
      await driver.waitForIdle(500,2000);

      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_REVERSE_0150 finish.`);
      done()
    })
  })
}