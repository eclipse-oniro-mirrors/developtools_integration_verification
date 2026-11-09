/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
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
import { Driver, ON, Component } from '@kit.TestKit'

export default function stateRepeatArrayLikeTest() {
  describe('stateRepeatArrayLikeTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
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
     * @tc.number : SUB_ACE_STATE_REPEAT_ARRAYLIKE_0010
     * @tc.name   : State repeat arraylike
     * @tc.desc   : Verify state repeat arraylike interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_STATE_REPEAT_ARRAYLIKE_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATE_REPEAT_ARRAYLIKE_0010 start.`);
      Settings.createWindow('testability/pages/scenario/state/StateRepeatArrayLike/StateRepeatArrayLike001');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 4000);
      windowSnap.snapShot('SUB_ACE_STATE_REPEAT_ARRAYLIKE_0010');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATE_REPEAT_ARRAYLIKE_0010 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_STATE_REPEAT_ARRAYLIKE_0020
     * @tc.name   : State repeat arraylike
     * @tc.desc   : Verify state repeat arraylike interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATE_REPEAT_ARRAYLIKE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATE_REPEAT_ARRAYLIKE_0020 start.`);
      Settings.createWindow('testability/pages/scenario/state/StateRepeatArrayLike/StateRepeatArrayLike002');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 4000);
      windowSnap.snapShot('SUB_ACE_STATE_REPEAT_ARRAYLIKE_0020_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATE_REPEAT_ARRAYLIKE_0020 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_STATE_REPEAT_ARRAYLIKE_0030
     * @tc.name   : State repeat arraylike
     * @tc.desc   : Verify state repeat arraylike interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATE_REPEAT_ARRAYLIKE_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATE_REPEAT_ARRAYLIKE_0030 start.`);
      Settings.createWindow('testability/pages/scenario/state/StateRepeatArrayLike/StateRepeatArrayLike003');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 4000);
      windowSnap.snapShot('SUB_ACE_STATE_REPEAT_ARRAYLIKE_0030_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATE_REPEAT_ARRAYLIKE_0030 finish.`);
      done();
    });
  })
}