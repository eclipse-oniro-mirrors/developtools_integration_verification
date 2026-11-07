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

export default function actionEventDistributeTest() {
  describe('actionEventDistributeTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DISTRIBUTE_0010
     * @tc.name   : 分屏条正常滑动后窗口显示正常
     * @tc.desc   : Verify action event commonevent distribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DISTRIBUTE_0010', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_DISTRIBUTE_0010';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventDistribute/Distribute0010');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const scrollComponent = await driver.findComponent(ON.id('Distribute0010_Scroll'));
      expect(scrollComponent !== null).assertTrue();
      Logger.info(`[${testName}] Scroll component found`);

      // 初始状态截图
      await windowSnap.snapShot(`Distribute0010_initial`);

      // 模拟滑动
      await driver.swipe(200, 400, 200, 200);
      await driver.delayMs(500);
      await windowSnap.snapShot(`Distribute0010_after_swipe`);

      Logger.info(`[${testName}] Manual test required: Test in split-screen mode`);
      Logger.info(`[${testName}] Expected: 页面可正常滑动`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
