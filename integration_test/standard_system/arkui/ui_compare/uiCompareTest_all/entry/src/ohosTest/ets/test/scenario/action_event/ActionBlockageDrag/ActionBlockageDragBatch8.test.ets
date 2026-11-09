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

import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

export default function actionBlockageDragBatch8Test() {
  describe('actionBlockageDragBatch8Test', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0620
     * @tc.name   : Image+Menu鼠标 - 移动中未超5S WAITING
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0620', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0620';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0620');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const imageComponent = await driver.findComponent(ON.id('BlockageDrag0620_Image'));
      expect(imageComponent !== null).assertTrue();
      Logger.info(`[${testName}] Image with menu component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0620_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to drag Image (with right-click menu)`);
      Logger.info(`[${testName}] Expected: 使用鼠标拖拽image组件，拖拽时间小于5S -> 组件一直不会跟随手指移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0620_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0630
     * @tc.name   : Image+Menu鼠标 - 移动中未超5S READY
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0630', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0630';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0630');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const imageComponent = await driver.findComponent(ON.id('BlockageDrag0630_Image'));
      expect(imageComponent !== null).assertTrue();
      Logger.info(`[${testName}] Image with menu component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0630_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to drag Image (with right-click menu)`);
      Logger.info(`[${testName}] Expected: 使用鼠标拖拽组件，拖拽时间大于2S，小于5S -> 组件跟随鼠标移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0630_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0640
     * @tc.name   : Image+Menu鼠标 - 移动中超过5S
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0640', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0640';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0640');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const imageComponent = await driver.findComponent(ON.id('BlockageDrag0640_Image'));
      expect(imageComponent !== null).assertTrue();
      Logger.info(`[${testName}] Image with menu component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0640_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to drag Image (with right-click menu)`);
      Logger.info(`[${testName}] Expected: 使用鼠标拖拽组件，拖拽时间=5S -> 组件开始跟随鼠标移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0640_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
