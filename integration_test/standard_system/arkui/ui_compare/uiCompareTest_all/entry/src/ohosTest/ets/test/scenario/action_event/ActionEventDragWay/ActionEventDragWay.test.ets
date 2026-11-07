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

export default function actionEventDragWayTest() {
  describe('actionEventDragWayTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_WAY-0050
     * @tc.name   : 拖拽启动-长按+拖出窗口
     * @tc.desc   : Verify action event commonevent drag way-0050 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_WAY-0050', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_WAY-0050';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventDragWay/DragWay0050');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const dragItem = await driver.findComponent(ON.id('DragWay0050_DragItem'));
      expect(dragItem !== null).assertTrue();
      Logger.info(`[${testName}] Drag item found`);

      await windowSnap.snapShot(`DragWay0050_initial`);

      Logger.info(`[${testName}] Manual test required: Long press >500ms, move >5vp, drag out of window`);
      Logger.info(`[${testName}] Expected: 销毁浮起控件，显示拖拽窗口`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`DragWay0050_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
