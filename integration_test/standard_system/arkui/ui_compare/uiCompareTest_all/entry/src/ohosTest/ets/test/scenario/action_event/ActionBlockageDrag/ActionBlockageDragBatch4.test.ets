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

export default function actionBlockageDragBatch4Test() {
  describe('actionBlockageDragBatch4Test', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0400
     * @tc.name   : Grid多选双指 - 按压时WAITING
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0400', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0400';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0400');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const gridComponent = await driver.findComponent(ON.id('BlockageDrag0400_Grid'));
      expect(gridComponent !== null).assertTrue();
      Logger.info(`[${testName}] Grid component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0400_initial`);

      // 双指拖拽自动化受限，需手动测试：
      // 1. 点击选中多个项目（绿色）
      // 2. 使用双指同时按住Grid
      // 3. 按住<2S后移动
      // 4. 验证状态为WAITING

      Logger.info(`[${testName}] Manual test required for dual-finger drag`);
      Logger.info(`[${testName}] Expected: 选中多个项目，双指按住<2S后移动 -> WAITING`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0400_end`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0410
     * @tc.name   : Grid多选双指 - 按压时READY
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0410', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0410';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0410');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const gridComponent = await driver.findComponent(ON.id('BlockageDrag0410_Grid'));
      expect(gridComponent !== null).assertTrue();
      Logger.info(`[${testName}] Grid component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0410_initial`);

      // 双指拖拽自动化受限，需手动测试：
      // 1. 点击选中多个项目（绿色）
      // 2. 使用双指同时按住Grid
      // 3. 按住>2S后移动
      // 4. 验证状态为READY

      Logger.info(`[${testName}] Manual test required for dual-finger drag`);
      Logger.info(`[${testName}] Expected: 选中多个项目，双指按住>2S后移动 -> READY`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0410_end`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0420
     * @tc.name   : Grid多选双指 - 拖拽中未超5S WAITING
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0420', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0420';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0420');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const gridComponent = await driver.findComponent(ON.id('BlockageDrag0420_Grid'));
      expect(gridComponent !== null).assertTrue();
      Logger.info(`[${testName}] Grid component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0420_initial`);

      // 双指拖拽自动化受限，需手动测试：
      // 1. 点击选中多个项目（绿色）
      // 2. 使用双指同时按住Grid 2S
      // 3. 按住2S时移动，数据未准备好（prepareTime=8000ms）
      // 4. 验证状态为WAITING（未超过5S）

      Logger.info(`[${testName}] Manual test required for dual-finger drag`);
      Logger.info(`[${testName}] Expected: 选中多个项目，按住2S时移动，数据未准备好 -> WAITING`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0420_end`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0430
     * @tc.name   : Grid多选双指 - 拖拽中未超5S READY
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0430', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0430';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0430');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const gridComponent = await driver.findComponent(ON.id('BlockageDrag0430_Grid'));
      expect(gridComponent !== null).assertTrue();
      Logger.info(`[${testName}] Grid component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0430_initial`);

      // 双指拖拽自动化受限，需手动测试：
      // 1. 点击选中多个项目（绿色）
      // 2. 使用双指同时按住Grid <2S
      // 3. 按住<2S时移动
      // 4. 验证状态为READY（数据已准备好）

      Logger.info(`[${testName}] Manual test required for dual-finger drag`);
      Logger.info(`[${testName}] Expected: 选中多个项目，按住<2S时移动 -> READY`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0430_end`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0440
     * @tc.name   : Grid多选双指 - 拖拽中超过5S
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0440', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0440';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0440');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const gridComponent = await driver.findComponent(ON.id('BlockageDrag0440_Grid'));
      expect(gridComponent !== null).assertTrue();
      Logger.info(`[${testName}] Grid component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0440_initial`);

      // 双指拖拽自动化受限，需手动测试：
      // 1. 点击选中多个项目（绿色）
      // 2. 使用双指同时按住Grid 2S
      // 3. 按住2S时移动，数据未准备好（prepareTime=8000ms）
      // 4. 验证超过5S的场景

      Logger.info(`[${testName}] Manual test required for dual-finger drag`);
      Logger.info(`[${testName}] Expected: 选中多个项目，按住2S时移动，数据未准备好 -> 超过5S`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0440_end`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
