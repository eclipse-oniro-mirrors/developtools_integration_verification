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

import { describe, it, afterEach } from '@ohos/hypium';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';
import { Driver, ON, Component } from '@kit.TestKit';

export default function uiOhosKeyframeanimatetoExpectedframeTest() {
  describe('uiOhosKeyframeanimatetoExpectedframeTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`);
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      });
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0090
     * @tc.name   : Ohos keyframeanimateto expectedframe
     * @tc.desc   : Verify ohos keyframeanimateto expectedframe interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0090', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0090 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/UiOhosKeyframeanimatetoExpectedframe/UiOhosKeyframeanimatetoExpectedframe0090');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0090 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0110
     * @tc.name   : Ohos keyframeanimateto expectedframe
     * @tc.desc   : Verify ohos keyframeanimateto expectedframe interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0110', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0110 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/UiOhosKeyframeanimatetoExpectedframe/UiOhosKeyframeanimatetoExpectedframe0110');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0110 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0120
     * @tc.name   : Ohos keyframeanimateto expectedframe
     * @tc.desc   : Verify ohos keyframeanimateto expectedframe interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0120', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0120 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/UiOhosKeyframeanimatetoExpectedframe/UiOhosKeyframeanimatetoExpectedframe0120');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0120 finish.`);
      done();
    });

  });
}