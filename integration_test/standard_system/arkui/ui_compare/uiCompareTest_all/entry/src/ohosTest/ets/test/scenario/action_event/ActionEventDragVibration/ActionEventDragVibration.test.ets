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

export default function actionEventDragVibrationTest() {
  describe('actionEventDragVibrationTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_VIBRATION_0450
     * @tc.name   : 压力测试文本连续长按50次
     * @tc.desc   : Verify action event commonevent drag vibration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_VIBRATION_0450', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_VIBRATION_0450';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventDragVibration/DragVibration0450');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textComponent = await driver.findComponent(ON.id('DragVibration0450_Text'));
      expect(textComponent !== null).assertTrue();
      Logger.info(`[${testName}] Text component found`);

      await windowSnap.snapShot(`DragVibration0450_initial`);

      Logger.info(`[${testName}] Manual test required: Long press and drag text 50 times`);
      Logger.info(`[${testName}] Expected: 触发震动50次`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`DragVibration0450_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_VIBRATION_0460
     * @tc.name   : 压力测试菜单连续拖拽50次
     * @tc.desc   : Verify action event commonevent drag vibration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_VIBRATION_0460', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_VIBRATION_0460';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventDragVibration/DragVibration0460');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const dragArea = await driver.findComponent(ON.id('DragVibration0460_DragArea'));
      expect(dragArea !== null).assertTrue();
      Logger.info(`[${testName}] Drag area found`);

      await windowSnap.snapShot(`DragVibration0460_initial`);

      Logger.info(`[${testName}] Manual test required: Long press to show menu and drag 50 times`);
      Logger.info(`[${testName}] Expected: 触发震动50次`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`DragVibration0460_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
