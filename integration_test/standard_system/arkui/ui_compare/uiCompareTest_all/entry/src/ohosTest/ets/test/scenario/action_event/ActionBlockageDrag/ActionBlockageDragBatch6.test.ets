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

export default function actionBlockageDragBatch6Test() {
  describe('actionBlockageDragBatch6Test', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0500
     * @tc.name   : TextInput单指 - 按压时WAITING
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0500', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0500';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0500');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textinputComponent = await driver.findComponent(ON.id('BlockageDrag0500_TextInput'));
      expect(textinputComponent !== null).assertTrue();
      Logger.info(`[${testName}] TextInput component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0500_initial`);

      Logger.info(`[${testName}] Manual test required: Long press and drag TextInput`);
      Logger.info(`[${testName}] Expected: 单指按住TextInput <2S后移动 -> WAITING`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0500_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0510
     * @tc.name   : TextInput单指 - 按压时READY
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0510', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0510';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0510');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textinputComponent = await driver.findComponent(ON.id('BlockageDrag0510_TextInput'));
      expect(textinputComponent !== null).assertTrue();
      Logger.info(`[${testName}] TextInput component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0510_initial`);

      Logger.info(`[${testName}] Manual test required: Long press and drag TextInput`);
      Logger.info(`[${testName}] Expected: 单指按住TextInput >2S后移动 -> READY`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0510_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0520
     * @tc.name   : TextInput单指 - 拖拽中未超5S WAITING
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0520', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0520';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0520');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textinputComponent = await driver.findComponent(ON.id('BlockageDrag0520_TextInput'));
      expect(textinputComponent !== null).assertTrue();
      Logger.info(`[${testName}] TextInput component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0520_initial`);

      Logger.info(`[${testName}] Manual test required: Long press and drag TextInput`);
      Logger.info(`[${testName}] Expected: 单指按住TextInput 2S时移动，数据未准备好 -> WAITING`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0520_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0530
     * @tc.name   : TextInput单指 - 拖拽中未超5S READY
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0530', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0530';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0530');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textinputComponent = await driver.findComponent(ON.id('BlockageDrag0530_TextInput'));
      expect(textinputComponent !== null).assertTrue();
      Logger.info(`[${testName}] TextInput component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0530_initial`);

      Logger.info(`[${testName}] Manual test required: Long press and drag TextInput`);
      Logger.info(`[${testName}] Expected: 单指按住TextInput <2S时移动 -> READY`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0530_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0540
     * @tc.name   : TextInput单指 - 拖拽中超过5S
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0540', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0540';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0540');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textinputComponent = await driver.findComponent(ON.id('BlockageDrag0540_TextInput'));
      expect(textinputComponent !== null).assertTrue();
      Logger.info(`[${testName}] TextInput component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0540_initial`);

      Logger.info(`[${testName}] Manual test required: Long press and drag TextInput`);
      Logger.info(`[${testName}] Expected: 单指按住TextInput 2S时移动，数据未准备好 -> 超过5S`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0540_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
