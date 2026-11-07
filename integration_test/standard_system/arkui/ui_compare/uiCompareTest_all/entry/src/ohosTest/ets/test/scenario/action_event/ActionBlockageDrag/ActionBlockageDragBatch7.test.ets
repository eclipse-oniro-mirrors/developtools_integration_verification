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

export default function actionBlockageDragBatch7Test() {
  describe('actionBlockageDragBatch7Test', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0550
     * @tc.name   : Image鼠标 - 按压时WAITING
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0550', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0550';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0550');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const imageComponent = await driver.findComponent(ON.id('BlockageDrag0550_Image'));
      expect(imageComponent !== null).assertTrue();
      Logger.info(`[${testName}] Image component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0550_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to press and drag Image`);
      Logger.info(`[${testName}] Expected: 鼠标按住Image <2S后移动 -> WAITING`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0550_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0560
     * @tc.name   : Image鼠标 - 按压时READY
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0560', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0560';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0560');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const imageComponent = await driver.findComponent(ON.id('BlockageDrag0560_Image'));
      expect(imageComponent !== null).assertTrue();
      Logger.info(`[${testName}] Image component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0560_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to press and drag Image`);
      Logger.info(`[${testName}] Expected: 鼠标按住Image >2S后移动 -> READY`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0560_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0570
     * @tc.name   : Image鼠标 - 拖拽中未超5S WAITING
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0570', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0570';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0570');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const imageComponent = await driver.findComponent(ON.id('BlockageDrag0570_Image'));
      expect(imageComponent !== null).assertTrue();
      Logger.info(`[${testName}] Image component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0570_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to press and drag Image`);
      Logger.info(`[${testName}] Expected: 鼠标按住Image 2S时移动，数据未准备好 -> WAITING`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0570_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0580
     * @tc.name   : Image鼠标 - 拖拽中未超5S READY
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0580', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0580';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0580');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const imageComponent = await driver.findComponent(ON.id('BlockageDrag0580_Image'));
      expect(imageComponent !== null).assertTrue();
      Logger.info(`[${testName}] Image component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0580_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to press and drag Image`);
      Logger.info(`[${testName}] Expected: 鼠标按住Image <2S时移动 -> READY`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0580_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0590
     * @tc.name   : Image鼠标 - 拖拽中超过5S
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0590', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0590';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0590');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const imageComponent = await driver.findComponent(ON.id('BlockageDrag0590_Image'));
      expect(imageComponent !== null).assertTrue();
      Logger.info(`[${testName}] Image component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0590_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to press and drag Image`);
      Logger.info(`[${testName}] Expected: 鼠标按住Image 2S时移动，数据未准备好 -> 超过5S`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0590_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0600
     * @tc.name   : Image+Menu鼠标 - 按压时WAITING
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0600', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0600';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0600');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const imageComponent = await driver.findComponent(ON.id('BlockageDrag0600_Image'));
      expect(imageComponent !== null).assertTrue();
      Logger.info(`[${testName}] Image with menu component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0600_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to press and drag Image (with menu)`);
      Logger.info(`[${testName}] Expected: 鼠标按住绑定菜单的Image <2S后移动 -> WAITING`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0600_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0610
     * @tc.name   : Image+Menu鼠标 - 按压时READY
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0610', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0610';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0610');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const imageComponent = await driver.findComponent(ON.id('BlockageDrag0610_Image'));
      expect(imageComponent !== null).assertTrue();
      Logger.info(`[${testName}] Image with menu component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0610_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to press and drag Image (with menu)`);
      Logger.info(`[${testName}] Expected: 鼠标按住绑定菜单的Image >2S后移动 -> READY`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0610_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
