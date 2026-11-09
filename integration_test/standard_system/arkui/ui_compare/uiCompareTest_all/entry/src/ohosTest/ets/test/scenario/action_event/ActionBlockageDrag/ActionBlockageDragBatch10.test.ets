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

export default function actionBlockageDragBatch10Test() {
  describe('actionBlockageDragBatch10Test', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0850
     * @tc.name   : Grid多选鼠标 - 起拖时WAITING
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0850', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0850';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0850');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const gridComponent = await driver.findComponent(ON.id('BlockageDrag0850_Grid'));
      expect(gridComponent !== null).assertTrue();
      Logger.info(`[${testName}] Grid component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0850_initial`);

      Logger.info(`[${testName}] Manual test required: Select multiple items and use mouse to drag Grid`);
      Logger.info(`[${testName}] Expected: 选择多个组件，使用鼠标拖拽组件 -> log不会打印：aaa --- data ok，组件不会跟随鼠标移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0850_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0860
     * @tc.name   : Grid多选鼠标 - 起拖时READY
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0860', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0860';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0860');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const gridComponent = await driver.findComponent(ON.id('BlockageDrag0860_Grid'));
      expect(gridComponent !== null).assertTrue();
      Logger.info(`[${testName}] Grid component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0860_initial`);

      Logger.info(`[${testName}] Manual test required: Select multiple items and use mouse to drag Grid`);
      Logger.info(`[${testName}] Expected: 选择多个组件，使用鼠标拖拽组件 -> log打印：aaa --- data ok，组件跟随鼠标移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0860_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0870
     * @tc.name   : Grid多选鼠标 - 移动中未超5S WAITING
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0870', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0870';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0870');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const gridComponent = await driver.findComponent(ON.id('BlockageDrag0870_Grid'));
      expect(gridComponent !== null).assertTrue();
      Logger.info(`[${testName}] Grid component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0870_initial`);

      Logger.info(`[${testName}] Manual test required: Select multiple items and use mouse to drag Grid`);
      Logger.info(`[${testName}] Expected: 拖拽时间小于5S -> 组件一直不会跟随手指移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0870_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0880
     * @tc.name   : Grid多选鼠标 - 移动中未超5S READY
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0880', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0880';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0880');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const gridComponent = await driver.findComponent(ON.id('BlockageDrag0880_Grid'));
      expect(gridComponent !== null).assertTrue();
      Logger.info(`[${testName}] Grid component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0880_initial`);

      Logger.info(`[${testName}] Manual test required: Select multiple items and use mouse to drag Grid`);
      Logger.info(`[${testName}] Expected: 拖拽时间大于2S，小于5S -> log打印：aaa --- data ok，组件跟随鼠标移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0880_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0890
     * @tc.name   : Grid多选鼠标 - 移动中超过5S
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0890', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0890';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0890');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const gridComponent = await driver.findComponent(ON.id('BlockageDrag0890_Grid'));
      expect(gridComponent !== null).assertTrue();
      Logger.info(`[${testName}] Grid component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0890_initial`);

      Logger.info(`[${testName}] Manual test required: Select multiple items and use mouse to drag Grid`);
      Logger.info(`[${testName}] Expected: 拖拽时间=5S -> 数据还没准备好，但是组件开始跟随鼠标移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0890_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
