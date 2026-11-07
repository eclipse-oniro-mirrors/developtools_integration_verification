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
import { Driver, ON, Component,} from '@kit.TestKit';


export default function progressLinear() {

  describe('progressLinear', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0010
     * @tc.name   : Progress linear
     * @tc.desc   : Verify Progress linear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0010', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0010 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressLinear/ProgressLinear01')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0010 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0011
     * @tc.name   : Progress linear
     * @tc.desc   : Verify Progress linear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0011', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0011 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressLinear/ProgressLinear02')
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0011 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0012
     * @tc.name   : Progress linear
     * @tc.desc   : Verify Progress linear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0012', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0012 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressLinear/ProgressLinear03')

      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0012 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0013
     * @tc.name   : Progress linear
     * @tc.desc   : Verify Progress linear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0013', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0013 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressLinear/ProgressLinear04')

      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0013 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0014
     * @tc.name   : Progress linear
     * @tc.desc   : Verify Progress linear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0014', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0014 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressLinear/ProgressLinear05')

      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0014 finish.`);
      done();
    })

  })
}