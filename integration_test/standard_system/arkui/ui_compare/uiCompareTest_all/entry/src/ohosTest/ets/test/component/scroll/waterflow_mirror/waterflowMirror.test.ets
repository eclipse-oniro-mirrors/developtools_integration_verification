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
import { BusinessError } from '@kit.BasicServicesKit'

export default function waterflowMirrorTest() {

  describe('waterflowMirrorTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0270_321
     * @tc.name   : Testing cachedCount when using rowsTemplate: 1fr 1fr 1fr layout with mirroring effect
     * @tc.desc   : Verify waterflow mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0270_321', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0270_321 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_mirror/waterflow01')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('waterFlow_01'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0270_321')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0270_321 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0110_259
     * @tc.name   : Testing keyboard tab focus navigation when using columnsTemplate: 1fr 1fr 1fr layout with mirroring
     * @tc.desc   : Verify waterflow mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0110_259', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0110_259 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_mirror/waterflow02')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('WaterFlow02'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      await driver.triggerKey(2049);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0110_259_01')
      await driver.waitForIdle(500,2000);
      await driver.triggerKey(2049);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0110_259_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0110_259 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0260_569
     * @tc.name   : Testing keyboard tab focus navigation when using rowsTemplate: 1fr 1fr 1fr layout with mirroring
     * @tc.desc   : Verify waterflow mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0260_569', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0260_569 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_mirror/waterflow03')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('WaterFlow03'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      await driver.triggerKey(2049);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0260_569_01')
      await driver.waitForIdle(500,2000);
      await driver.triggerKey(2049);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0260_569_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0260_569 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0380_779
     * @tc.name   : Testing keyboard focus navigation when using LayoutDirection layout with mirroring effect
     * @tc.desc   : Verify waterflow mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0380_779', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0380_779 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_mirror/waterflow04')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('changeLayoutDirection04'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      await driver.triggerKey(2049);
      await driver.triggerKey(2049);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0380_779_01')
      await Utils.sleep(1000)

      await button.click();
      await driver.waitForIdle(500,2000);
      await driver.triggerKey(2049);
      await driver.triggerKey(2049);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0380_779_02')
      await Utils.sleep(1000)

      await button.click();
      await driver.waitForIdle(500,2000);
      await driver.triggerKey(2049);
      await driver.triggerKey(2049);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0380_779_03')
      await Utils.sleep(1000)

      await button.click();
      await driver.waitForIdle(500,2000);
      await driver.triggerKey(2049);
      await driver.triggerKey(2049);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0380_779_04')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0380_779 finish.`);
      done()
    })
  })
}
