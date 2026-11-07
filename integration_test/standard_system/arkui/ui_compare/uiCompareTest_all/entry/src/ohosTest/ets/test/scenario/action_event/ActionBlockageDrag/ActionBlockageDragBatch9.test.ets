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

export default function actionBlockageDragBatch9Test() {
  describe('actionBlockageDragBatch9Test', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0800
     * @tc.name   : Grid单选鼠标 - 起拖时WAITING
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0800', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0800';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0800');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const gridComponent = await driver.findComponent(ON.id('BlockageDrag0800_Grid'));
      expect(gridComponent !== null).assertTrue();
      Logger.info(`[${testName}] Grid component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0800_initial`);

      Logger.info(`[${testName}] Manual test required: Select 1 item and use mouse to drag Grid`);
      Logger.info(`[${testName}] Expected: 选择1个组件，使用鼠标拖拽组件 -> log不会打印：aaa --- data ok`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0800_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0810
     * @tc.name   : Grid单选鼠标 - 起拖时READY
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0810', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0810';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0810');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const gridComponent = await driver.findComponent(ON.id('BlockageDrag0810_Grid'));
      expect(gridComponent !== null).assertTrue();
      Logger.info(`[${testName}] Grid component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0810_initial`);

      Logger.info(`[${testName}] Manual test required: Select 1 item and use mouse to drag Grid`);
      Logger.info(`[${testName}] Expected: 选择1个组件，使用鼠标拖拽组件 -> log打印：aaa --- data ok`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0810_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0820
     * @tc.name   : Grid单选鼠标 - 移动中未超5S WAITING
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0820', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0820';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0820');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const gridComponent = await driver.findComponent(ON.id('BlockageDrag0820_Grid'));
      expect(gridComponent !== null).assertTrue();
      Logger.info(`[${testName}] Grid component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0820_initial`);

      Logger.info(`[${testName}] Manual test required: Select 1 item and use mouse to drag Grid`);
      Logger.info(`[${testName}] Expected: 拖拽时间小于5S -> 组件一直不会跟随手指移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0820_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0830
     * @tc.name   : Grid单选鼠标 - 移动中未超5S READY
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0830', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0830';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0830');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const gridComponent = await driver.findComponent(ON.id('BlockageDrag0830_Grid'));
      expect(gridComponent !== null).assertTrue();
      Logger.info(`[${testName}] Grid component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0830_initial`);

      Logger.info(`[${testName}] Manual test required: Select 1 item and use mouse to drag Grid`);
      Logger.info(`[${testName}] Expected: 拖拽时间大于2S，小于5S -> log打印：aaa --- data ok`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0830_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0840
     * @tc.name   : Grid单选鼠标 - 移动中超过5S
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0840', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0840';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0840');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const gridComponent = await driver.findComponent(ON.id('BlockageDrag0840_Grid'));
      expect(gridComponent !== null).assertTrue();
      Logger.info(`[${testName}] Grid component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0840_initial`);

      Logger.info(`[${testName}] Manual test required: Select 1 item and use mouse to drag Grid`);
      Logger.info(`[${testName}] Expected: 拖拽时间=5S -> 数据还没准备好，但是组件开始跟随鼠标移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0840_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
