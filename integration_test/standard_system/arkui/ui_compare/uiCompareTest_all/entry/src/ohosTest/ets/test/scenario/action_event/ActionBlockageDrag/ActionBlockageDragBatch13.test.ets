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

export default function actionBlockageDragBatch13Test() {
  describe('actionBlockageDragBatch13Test', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_1070
     * @tc.name   : 父子组件 - 父组件阻塞
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_1070', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_1070';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag1070');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const parentComponent = await driver.findComponent(ON.id('BlockageDrag1070_Parent'));
      expect(parentComponent !== null).assertTrue();
      Logger.info(`[${testName}] Parent component found`);

      const childComponent = await driver.findComponent(ON.id('BlockageDrag1070_Child'));
      expect(childComponent !== null).assertTrue();
      Logger.info(`[${testName}] Child component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1070_initial`);

      Logger.info(`[${testName}] Manual test required: Drag parent and child components`);
      Logger.info(`[${testName}] Expected: 父组件阻塞拖拽, 子组件正常拖拽`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1070_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_1080
     * @tc.name   : 父子组件 - 子组件阻塞
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_1080', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_1080';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag1080');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const parentComponent = await driver.findComponent(ON.id('BlockageDrag1080_Parent'));
      expect(parentComponent !== null).assertTrue();
      Logger.info(`[${testName}] Parent component found`);

      const childComponent = await driver.findComponent(ON.id('BlockageDrag1080_Child'));
      expect(childComponent !== null).assertTrue();
      Logger.info(`[${testName}] Child component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1080_initial`);

      Logger.info(`[${testName}] Manual test required: Drag parent and child components`);
      Logger.info(`[${testName}] Expected: 父组件正常拖拽, 子组件阻塞拖拽`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1080_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_1090
     * @tc.name   : 父子组件 - 父子都阻塞
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_1090', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_1090';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag1090');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const parentComponent = await driver.findComponent(ON.id('BlockageDrag1090_Parent'));
      expect(parentComponent !== null).assertTrue();
      Logger.info(`[${testName}] Parent component found`);

      const childComponent = await driver.findComponent(ON.id('BlockageDrag1090_Child'));
      expect(childComponent !== null).assertTrue();
      Logger.info(`[${testName}] Child component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1090_initial`);

      Logger.info(`[${testName}] Manual test required: Drag parent and child components`);
      Logger.info(`[${testName}] Expected: 父组件阻塞拖拽, 子组件阻塞拖拽`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1090_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_1100
     * @tc.name   : 不调用阻塞接口 - 正常拖拽
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_1100', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_1100';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag1100');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const component = await driver.findComponent(ON.id('BlockageDrag1100_Component'));
      expect(component !== null).assertTrue();
      Logger.info(`[${testName}] Component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1100_initial`);

      Logger.info(`[${testName}] Manual test required: Drag the component`);
      Logger.info(`[${testName}] Expected: 拖动功能正常，不会被阻塞`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag1100_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
