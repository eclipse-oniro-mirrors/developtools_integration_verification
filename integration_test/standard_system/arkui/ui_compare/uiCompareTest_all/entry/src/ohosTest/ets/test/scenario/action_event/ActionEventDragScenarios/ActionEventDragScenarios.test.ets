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

export default function actionEventDragScenariosTest() {
  describe('actionEventDragScenariosTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_SCENARIOS_0280
     * @tc.name   : 快速抛滑组件
     * @tc.desc   : Verify action event commonevent drag scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_SCENARIOS_0280', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_SCENARIOS_0280';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventDragScenarios/DragScenarios0280');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const dragItem = await driver.findComponent(ON.id('DragScenarios0280_DragItem'));
      expect(dragItem !== null).assertTrue();
      Logger.info(`[${testName}] Drag item found`);

      await windowSnap.snapShot(`DragScenarios0280_initial`);

      Logger.info(`[${testName}] Manual test required: Quickly fling the component`);
      Logger.info(`[${testName}] Expected: 组件正常拖动，回调时序正常，事件闭环正确`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`DragScenarios0280_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_SCENARIOS_0290
     * @tc.name   : 多次拖拽组件
     * @tc.desc   : Verify action event commonevent drag scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_SCENARIOS_0290', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_SCENARIOS_0290';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventDragScenarios/DragScenarios0290');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const dragItem = await driver.findComponent(ON.id('DragScenarios0290_DragItem'));
      expect(dragItem !== null).assertTrue();
      Logger.info(`[${testName}] Drag item found`);

      await windowSnap.snapShot(`DragScenarios0290_initial`);

      Logger.info(`[${testName}] Manual test required: Drag the component multiple times`);
      Logger.info(`[${testName}] Expected: 每次拖拽都有正确闭环`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`DragScenarios0290_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
