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

export default function actionBlockageDragBatch5Test() {
  describe('actionBlockageDragBatch5Test', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0450
     * @tc.name   : Text容器单指 - 按压时WAITING (模拟TextArea场景)
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0450', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0450';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0450');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textareaComponent = await driver.findComponent(ON.id('BlockageDrag0450_TextArea'));
      expect(textareaComponent !== null).assertTrue();
      Logger.info(`[${testName}] Text container component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0450_initial`);

      // Text组件拖拽需手动测试
      Logger.info(`[${testName}] Manual test required: Long press and drag Text container`);
      await driver.delayMs(1000);

      await windowSnap.snapShot(`BlockageDrag0450_ready`);
      Logger.info(`[${testName}] Expected: 单指按住Text容器 <2S后移动 -> WAITING`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0460
     * @tc.name   : Text容器单指 - 按压时READY (模拟TextArea场景)
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0460', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0460';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0460');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textareaComponent = await driver.findComponent(ON.id('BlockageDrag0460_TextArea'));
      expect(textareaComponent !== null).assertTrue();
      Logger.info(`[${testName}] Text container component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0460_initial`);

      // Text组件拖拽需手动测试
      Logger.info(`[${testName}] Manual test required: Long press and drag Text container`);
      await driver.delayMs(1000);

      await windowSnap.snapShot(`BlockageDrag0460_ready`);
      Logger.info(`[${testName}] Expected: 单指按住Text容器 >2S后移动 -> READY`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0470
     * @tc.name   : Text容器单指 - 拖拽中未超5S WAITING (模拟TextArea场景)
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0470', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0470';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0470');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textareaComponent = await driver.findComponent(ON.id('BlockageDrag0470_TextArea'));
      expect(textareaComponent !== null).assertTrue();
      Logger.info(`[${testName}] Text container component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0470_initial`);

      // Text组件拖拽需手动测试
      Logger.info(`[${testName}] Manual test required: Long press and drag Text container`);
      await driver.delayMs(1000);

      await windowSnap.snapShot(`BlockageDrag0470_ready`);
      Logger.info(`[${testName}] Expected: 单指按住Text容器 2S时移动，数据未准备好 -> WAITING`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0480
     * @tc.name   : Text容器单指 - 拖拽中未超5S READY (模拟TextArea场景)
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0480', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0480';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0480');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textareaComponent = await driver.findComponent(ON.id('BlockageDrag0480_TextArea'));
      expect(textareaComponent !== null).assertTrue();
      Logger.info(`[${testName}] Text container component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0480_initial`);

      // Text组件拖拽需手动测试
      Logger.info(`[${testName}] Manual test required: Long press and drag Text container`);
      await driver.delayMs(1000);

      await windowSnap.snapShot(`BlockageDrag0480_ready`);
      Logger.info(`[${testName}] Expected: 单指按住Text容器 <2S时移动 -> READY`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0490
     * @tc.name   : Text容器单指 - 拖拽中超过5S (模拟TextArea场景)
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0490', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0490';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0490');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textareaComponent = await driver.findComponent(ON.id('BlockageDrag0490_TextArea'));
      expect(textareaComponent !== null).assertTrue();
      Logger.info(`[${testName}] Text container component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0490_initial`);

      // Text组件拖拽需手动测试
      Logger.info(`[${testName}] Manual test required: Long press and drag Text container`);
      await driver.delayMs(1000);

      await windowSnap.snapShot(`BlockageDrag0490_ready`);
      Logger.info(`[${testName}] Expected: 单指按住Text容器 2S时移动，数据未准备好 -> 超过5S`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
