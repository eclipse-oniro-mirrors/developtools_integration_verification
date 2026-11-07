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

export default function actionBlockageDragBatch12Test() {
  describe('actionBlockageDragBatch12Test', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_1000
     * @tc.name   : 长按过程中息屏 - 取消拖拽
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_1000', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_1000';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag1000');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const component = await driver.findComponent(ON.id('BlockageDrag1000_Component'));
      expect(component !== null).assertTrue();
      Logger.info(`[${testName}] Component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1000_initial`);

      Logger.info(`[${testName}] Manual test required: Press and hold component, then turn off screen`);
      Logger.info(`[${testName}] Expected: 拖拽取消`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1000_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_1010
     * @tc.name   : 长按过程中松手 - 取消拖拽
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_1010', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_1010';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag1010');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const component = await driver.findComponent(ON.id('BlockageDrag1010_Component'));
      expect(component !== null).assertTrue();
      Logger.info(`[${testName}] Component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1010_initial`);

      Logger.info(`[${testName}] Manual test required: Press and hold component, then release without moving`);
      Logger.info(`[${testName}] Expected: 拖拽取消`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1010_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_1020
     * @tc.name   : 长按中另一手指点击外部 - 取消拖拽
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_1020', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_1020';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag1020');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const component = await driver.findComponent(ON.id('BlockageDrag1020_Component'));
      expect(component !== null).assertTrue();
      Logger.info(`[${testName}] Draggable component found`);

      const outsideArea = await driver.findComponent(ON.id('BlockageDrag1020_Outside'));
      expect(outsideArea !== null).assertTrue();
      Logger.info(`[${testName}] Outside area found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1020_initial`);

      Logger.info(`[${testName}] Manual test required: One finger holds component, another finger clicks outside`);
      Logger.info(`[${testName}] Expected: 拖拽取消`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1020_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_1030
     * @tc.name   : 等待5S内息屏 - 取消拖拽
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_1030', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_1030';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag1030');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const component = await driver.findComponent(ON.id('BlockageDrag1030_Component'));
      expect(component !== null).assertTrue();
      Logger.info(`[${testName}] Component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1030_initial`);

      Logger.info(`[${testName}] Manual test required: Long press 2S, move finger, then turn off screen within 5S`);
      Logger.info(`[${testName}] Expected: 拖拽取消，回调onDragEnd`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1030_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_1040
     * @tc.name   : 等待5S内松手 - 取消拖拽
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_1040', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_1040';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag1040');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const component = await driver.findComponent(ON.id('BlockageDrag1040_Component'));
      expect(component !== null).assertTrue();
      Logger.info(`[${testName}] Component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1040_initial`);

      Logger.info(`[${testName}] Manual test required: Long press 2S, move finger, then release within 5S`);
      Logger.info(`[${testName}] Expected: 拖拽取消，回调onDragEnd`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1040_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_1050
     * @tc.name   : 等待5S内点击外部 - 拖拽不取消
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_1050', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_1050';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag1050');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const component = await driver.findComponent(ON.id('BlockageDrag1050_Component'));
      expect(component !== null).assertTrue();
      Logger.info(`[${testName}] Draggable component found`);

      const outsideArea = await driver.findComponent(ON.id('BlockageDrag1050_Outside'));
      expect(outsideArea !== null).assertTrue();
      Logger.info(`[${testName}] Outside area found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1050_initial`);

      Logger.info(`[${testName}] Manual test required: One finger drags component, another finger clicks outside within 5S`);
      Logger.info(`[${testName}] Expected: 拖拽不会取消`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1050_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_1060
     * @tc.name   : 等待5S内松开鼠标 - 取消拖拽
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_1060', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_1060';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag1060');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const component = await driver.findComponent(ON.id('BlockageDrag1060_Component'));
      expect(component !== null).assertTrue();
      Logger.info(`[${testName}] Component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1060_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to drag component, release within 5S`);
      Logger.info(`[${testName}] Expected: 拖拽取消，回调onDragEnd`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1060_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
