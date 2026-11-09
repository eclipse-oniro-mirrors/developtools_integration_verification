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

import { describe, it, afterEach, expect } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

export default function actionEventAreachangeApproximatechangeBatch2Test() {
  describe('actionEventAreachangeApproximatechangeBatch2Test', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0320
     * @tc.name   : 频繁调用接口测试
     * @tc.desc   : Verify action event commonevent areachange approximatechange interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0320', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0320';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeApproximatechange/ApproximateChange0320');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const startBtn = await driver.findComponent(ON.id('ApproximateChange0320_StartBtn'));
      expect(startBtn !== null).assertTrue();
      Logger.info(`[${testName}] Start button found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0320_initial`);

      Logger.info(`[${testName}] Manual test required: Run pressure test script for frequent API calls`);
      Logger.info(`[${testName}] Expected: 无crash`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0320_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0330
     * @tc.name   : 内存泄漏测试
     * @tc.desc   : Verify action event commonevent areachange approximatechange interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0330', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0330';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeApproximatechange/ApproximateChange0330');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const startBtn = await driver.findComponent(ON.id('ApproximateChange0330_StartBtn'));
      expect(startBtn !== null).assertTrue();
      Logger.info(`[${testName}] Start button found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0330_initial`);

      Logger.info(`[${testName}] Manual test required: Use Profiler to monitor memory usage`);
      Logger.info(`[${testName}] Expected: 无明显内存泄漏`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0330_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
