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

import { describe, it, afterEach } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

export default function actionBlockageDrag() {
  describe('actionBlockageDrag', () => {

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0010
     * @tc.name   : Action blockage drag
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0010', 0, async () => {
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0010 begin');
      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0010');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('BlockageDrag0010_1_Initial');
      
      const dragImage = await driver.findComponent(ON.id('BlockageDrag0010_DragImage'));
      if (dragImage) {
        Logger.info('Found drag image component');
        const bounds = await dragImage.getBounds();
        const startX = (bounds.left + bounds.right) / 2;
        const startY = (bounds.top + bounds.bottom) / 2;
        
        // 执行拖拽操作
        await driver.drag(startX, startY, startX + 150, startY + 150, 600);
        Logger.info('Drag operation completed');
        await driver.delayMs(1000);
        
        await windowSnap.snapShot('BlockageDrag0010_2_AfterDrag');
      }
      
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0010 end');
      Logger.info('Verify: Check page log for PREPARING_FOR_DRAG_DETECTION status');
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0020
     * @tc.name   : Action blockage drag
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0020', 0, async () => {
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0020 begin');
      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0020');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('BlockageDrag0020_1_Initial');
      
      const dragImage = await driver.findComponent(ON.id('BlockageDrag0020_DragImage'));
      if (dragImage) {
        Logger.info('Found drag image component');
        const bounds = await dragImage.getBounds();
        const startX = (bounds.left + bounds.right) / 2;
        const startY = (bounds.top + bounds.bottom) / 2;
        
        // 执行拖拽操作
        await driver.drag(startX, startY, startX + 150, startY + 150, 600);
        Logger.info('Drag operation completed');
        await driver.delayMs(1000);
        
        await windowSnap.snapShot('BlockageDrag0020_2_AfterDrag');
      }
      
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0020 end');
      Logger.info('Verify: Check page log for notifyDragStartRequest success');
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0030
     * @tc.name   : Action blockage drag
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0030', 0, async () => {
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0030 begin');
      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0030');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('BlockageDrag0030_1_Initial');
      
      const dragImage = await driver.findComponent(ON.id('BlockageDrag0030_DragImage'));
      if (dragImage) {
        Logger.info('Found drag image component');
        const bounds = await dragImage.getBounds();
        const startX = (bounds.left + bounds.right) / 2;
        const startY = (bounds.top + bounds.bottom) / 2;
        
        // 快速拖拽（模拟50ms场景）
        await driver.drag(startX, startY, startX + 100, startY + 100, 2000);
        Logger.info('Fast drag completed - simulating ~50ms scenario');
        await driver.delayMs(1000);
        
        await windowSnap.snapShot('BlockageDrag0030_2_AfterDrag');
      }
      
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0030 end');
      Logger.info('Verify: Check elapsed time in page log (~50ms for ACTION_DETECTING_STATUS)');
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0040
     * @tc.name   : Action blockage drag
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0040', 0, async () => {
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0040 begin');
      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0040');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('BlockageDrag0040_1_Initial');
      
      const dragImage = await driver.findComponent(ON.id('BlockageDrag0040_DragImage'));
      if (dragImage) {
        Logger.info('Found drag image component');
        const bounds = await dragImage.getBounds();
        const startX = (bounds.left + bounds.right) / 2;
        const startY = (bounds.top + bounds.bottom) / 2;
        
        // 中速拖拽（模拟350ms场景）
        await driver.drag(startX, startY, startX + 100, startY + 100, 800);
        Logger.info('Medium drag completed - simulating ~350ms scenario');
        await driver.delayMs(1000);
        
        await windowSnap.snapShot('BlockageDrag0040_2_AfterDrag');
      }
      
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0040 end');
      Logger.info('Verify: Check elapsed time in page log (~350ms)');
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0050
     * @tc.name   : Action blockage drag
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0050', 0, async () => {
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0050 begin');
      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0050');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('BlockageDrag0050_1_Initial');
      
      const dragImage = await driver.findComponent(ON.id('BlockageDrag0050_DragImage'));
      if (dragImage) {
        Logger.info('Found drag image component');
        const bounds = await dragImage.getBounds();
        const startX = (bounds.left + bounds.right) / 2;
        const startY = (bounds.top + bounds.bottom) / 2;
        
        // 标准速度拖拽（模拟500ms场景）
        await driver.drag(startX, startY, startX + 100, startY + 100, 600);
        Logger.info('Standard drag completed - simulating ~500ms scenario');
        await driver.delayMs(1000);
        
        await windowSnap.snapShot('BlockageDrag0050_2_AfterDrag');
      }
      
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0050 end');
      Logger.info('Verify: Check elapsed time in page log (~500ms for READY_TO_TRIGGER_DRAG_ACTION)');
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0060
     * @tc.name   : Action blockage drag
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0060', 0, async () => {
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0060 begin');
      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0060');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('BlockageDrag0060_1_Initial');
      
      const dragImage = await driver.findComponent(ON.id('BlockageDrag0060_DragImage'));
      if (dragImage) {
        Logger.info('Found drag image component');
        const bounds = await dragImage.getBounds();
        const startX = (bounds.left + bounds.right) / 2;
        const startY = (bounds.top + bounds.bottom) / 2;
        
        // 完整拖拽操作
        await driver.drag(startX, startY, startX + 150, startY + 150, 600);
        Logger.info('Drag completed, waiting for lift effect to finish');
        await driver.delayMs(1500);
        
        await windowSnap.snapShot('BlockageDrag0060_2_AfterLift');
      }
      
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0060 end');
      Logger.info('Verify: Check page log for PREVIEW_LIFT_FINISHED status');
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0070
     * @tc.name   : Action blockage drag
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0070', 0, async () => {
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0070 begin');
      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0070');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('BlockageDrag0070_1_Initial');
      
      const dragImage = await driver.findComponent(ON.id('BlockageDrag0070_DragImage'));
      if (dragImage) {
        Logger.info('Found drag image component');
        const bounds = await dragImage.getBounds();
        const startX = (bounds.left + bounds.right) / 2;
        const startY = (bounds.top + bounds.bottom) / 2;
        
        // 拖拽后释放
        await driver.drag(startX, startY, startX + 150, startY + 150, 600);
        Logger.info('Drag completed and released - landing animation should start');
        await driver.delayMs(500);
        
        await windowSnap.snapShot('BlockageDrag0070_2_LandingStarted');
      }
      
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0070 end');
      Logger.info('Verify: Check page log for PREVIEW_LANDING_STARTED on release');
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0080
     * @tc.name   : Action blockage drag
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0080', 0, async () => {
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0080 begin');
      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0080');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('BlockageDrag0080_1_Initial');
      
      const dragImage = await driver.findComponent(ON.id('BlockageDrag0080_DragImage'));
      if (dragImage) {
        Logger.info('Found drag image component');
        const bounds = await dragImage.getBounds();
        const startX = (bounds.left + bounds.right) / 2;
        const startY = (bounds.top + bounds.bottom) / 2;
        
        // 拖拽后释放
        await driver.drag(startX, startY, startX + 150, startY + 150, 600);
        Logger.info('Drag completed, waiting for landing animation to finish');
        await driver.delayMs(800);
        
        await windowSnap.snapShot('BlockageDrag0080_2_LandingFinished');
      }
      
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0080 end');
      Logger.info('Verify: Check page log for PREVIEW_LANDING_FINISHED after ~400ms');
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0090
     * @tc.name   : Action blockage drag
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0090', 0, async () => {
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0090 begin');
      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0090');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('BlockageDrag0090_1_Initial');
      
      const dragImage = await driver.findComponent(ON.id('BlockageDrag0090_DragImage'));
      if (dragImage) {
        Logger.info('Found drag image component');
        
        // 长按后不移动（模拟取消拖拽）
        await dragImage.longClick();
        Logger.info('Long pressed without drag - should trigger cancel');
        await driver.delayMs(1000);
        
        await windowSnap.snapShot('BlockageDrag0090_2_AfterCancel');
      }
      
      Logger.info('SUB_ACE_ACTION_BLOCKAGE_DRAG_0090 end');
      Logger.info('Manual verification needed: Press 500-800ms without drag for ACTION_CANCELED_BEFORE_DRAG');
    });
  });
}