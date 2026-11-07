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
import { displaySync } from '@kit.ArkGraphics2D'
import { BusinessError } from '@kit.BasicServicesKit'

export default function expectedFrameTest() {

  describe('expectedFrameTest', () => {
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
     * @tc.number : SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0040
     * @tc.name   : Under standard test conditions, testing the animation effect when the expected frame rate
     * @tc.desc   : Verify ohos keyframeanimateto expectedframe interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0040 start.`);
      Settings.createWindow('testability/pages/scenario/misc/expectedFrame/expectedFrame01')
      let driver:Driver = Driver.create();
      let buttonCircle: Component = await driver.waitForComponent(ON.id('Circle01'), 1000);
      let button01: Component = await driver.waitForComponent(ON.id('changeRateRange120_01'), 1000);
      let button02: Component = await driver.waitForComponent(ON.id('changeRateRange60_01'), 1000);
      let button03: Component = await driver.waitForComponent(ON.id('changeRateRange30_01'), 1000);
      await button01.click();
      let callback = (frameInfo: displaySync.IntervalInfo) => {
        console.info('DisplaySync', 'TimeStamp:' + frameInfo.timestamp + ' TargetTimeStamp: ' + frameInfo.targetTimestamp);
      }
      let backDisplaySync: displaySync.DisplaySync = displaySync.create();
      backDisplaySync?.on('frame', callback)
      await buttonCircle.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0040_01')
      await Utils.sleep(1000)
      await button02.click();
      await buttonCircle.click()
      windowSnap.snapShot('SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0040_02')
      await Utils.sleep(1000)
      await button03.click();
      await buttonCircle.click()
      windowSnap.snapShot('SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0040_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0010
     * @tc.name   : Under standard test conditions, testing the animation effect when the expected frame rate
     * @tc.desc   : Verify ohos keyframeanimateto expectedframe interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0010 start.`);
      Settings.createWindow('testability/pages/scenario/misc/expectedFrame/expectedFrame02')
      let driver:Driver = Driver.create();
      let buttonCircle: Component = await driver.waitForComponent(ON.id('Circle02'), 1000);
      let callback = (frameInfo: displaySync.IntervalInfo) => {
        console.info('DisplaySync', 'TimeStamp:' + frameInfo.timestamp + ' TargetTimeStamp: ' + frameInfo.targetTimestamp);
      }
      let backDisplaySync: displaySync.DisplaySync = displaySync.create();
      backDisplaySync?.on('frame', callback)
      await buttonCircle.click()
      windowSnap.snapShot('SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0010')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0020
     * @tc.name   : Under standard test conditions, testing the animation effect when the expected frame rate
     * @tc.desc   : Verify ohos keyframeanimateto expectedframe interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0020 start.`);
      Settings.createWindow('testability/pages/scenario/misc/expectedFrame/expectedFrame03')
      let driver:Driver = Driver.create();
      let buttonCircle: Component = await driver.waitForComponent(ON.id('Circle03'), 1000);
      let button01: Component = await driver.waitForComponent(ON.id('changeRateRange120_03'), 1000);
      let button02: Component = await driver.waitForComponent(ON.id('changeRateRange120_03'), 1000);
      let button03: Component = await driver.waitForComponent(ON.id('changeRateRange120_03'), 1000);
      await button01.click();
      await buttonCircle.click()
      let callback = (frameInfo: displaySync.IntervalInfo) => {
        console.info('DisplaySync', 'TimeStamp:' + frameInfo.timestamp + ' TargetTimeStamp: ' + frameInfo.targetTimestamp);
      }
      let backDisplaySync: displaySync.DisplaySync = displaySync.create();
      backDisplaySync?.on('frame', callback)
      windowSnap.snapShot('SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0020_01')
      await Utils.sleep(1000)
      await button02.click();
      await buttonCircle.click()
      windowSnap.snapShot('SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0020_02')
      await Utils.sleep(1000)
      await button03.click();
      await buttonCircle.click()
      windowSnap.snapShot('SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0020_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0020 finish.`);
      done()
    })
  })
}
