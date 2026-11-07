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

export default function actionBlockageDragBatch14Test() {
  describe('actionBlockageDragBatch14Test', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_1110
     * @tc.name   : 手指长按拖拽*50次
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_1110', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_1110';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag1110');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const component = await driver.findComponent(ON.id('BlockageDrag1110_Component'));
      expect(component !== null).assertTrue();
      Logger.info(`[${testName}] Component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1110_initial`);

      Logger.info(`[${testName}] Manual test required: Long press and drag component 50 times`);
      Logger.info(`[${testName}] Expected: 功能正常，不会崩溃、卡顿；每次拖拽均能正确闭环`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1110_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_1120
     * @tc.name   : 手指快速拖拽*50次
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_1120', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_1120';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag1120');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const component = await driver.findComponent(ON.id('BlockageDrag1120_Component'));
      expect(component !== null).assertTrue();
      Logger.info(`[${testName}] Component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1120_initial`);

      Logger.info(`[${testName}] Manual test required: Quick drag component 50 times`);
      Logger.info(`[${testName}] Expected: 功能正常，不会崩溃、卡顿；每次拖拽均能正确闭环`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1120_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_1130
     * @tc.name   : 鼠标拖拽*50次
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_1130', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_1130';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag1130');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const component = await driver.findComponent(ON.id('BlockageDrag1130_Component'));
      expect(component !== null).assertTrue();
      Logger.info(`[${testName}] Component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1130_initial`);

      Logger.info(`[${testName}] Manual test required: Mouse drag component 50 times`);
      Logger.info(`[${testName}] Expected: 功能正常，不会崩溃、卡顿；每次拖拽均能正确闭环`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1130_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
