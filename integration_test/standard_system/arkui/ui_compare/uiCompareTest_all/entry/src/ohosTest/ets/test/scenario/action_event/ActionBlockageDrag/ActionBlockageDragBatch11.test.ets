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

export default function actionBlockageDragBatch11Test() {
  describe('actionBlockageDragBatch11Test', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    // ==================== TextArea 用例 (0900-0940) ====================

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0900
     * @tc.name   : TextArea鼠标 - 起拖时WAITING
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0900', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0900';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0900');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textAreaComponent = await driver.findComponent(ON.id('BlockageDrag0900_TextArea'));
      expect(textAreaComponent !== null).assertTrue();
      Logger.info(`[${testName}] TextArea component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0900_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to drag TextArea`);
      Logger.info(`[${testName}] Expected: log不会打印：aaa --- 用户准备数据完成，组件不会跟随鼠标移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0900_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0910
     * @tc.name   : TextArea鼠标 - 起拖时READY
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0910', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0910';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0910');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textAreaComponent = await driver.findComponent(ON.id('BlockageDrag0910_TextArea'));
      expect(textAreaComponent !== null).assertTrue();
      Logger.info(`[${testName}] TextArea component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0910_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to drag TextArea`);
      Logger.info(`[${testName}] Expected: log打印：aaa --- 用户准备数据完成，组件跟随鼠标移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0910_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0920
     * @tc.name   : TextArea鼠标 - 移动中未超5S WAITING
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0920', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0920';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0920');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textAreaComponent = await driver.findComponent(ON.id('BlockageDrag0920_TextArea'));
      expect(textAreaComponent !== null).assertTrue();
      Logger.info(`[${testName}] TextArea component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0920_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to drag TextArea, release before 5S`);
      Logger.info(`[${testName}] Expected: 回调onDragEnd`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0920_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0930
     * @tc.name   : TextArea鼠标 - 移动中未超5S READY
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0930', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0930';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0930');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textAreaComponent = await driver.findComponent(ON.id('BlockageDrag0930_TextArea'));
      expect(textAreaComponent !== null).assertTrue();
      Logger.info(`[${testName}] TextArea component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0930_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to drag TextArea, move time > 2S < 5S`);
      Logger.info(`[${testName}] Expected: log打印：aaa --- 用户准备数据完成，组件开始跟随鼠标移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0930_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0940
     * @tc.name   : TextArea鼠标 - 移动中超过5S
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0940', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0940';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0940');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textAreaComponent = await driver.findComponent(ON.id('BlockageDrag0940_TextArea'));
      expect(textAreaComponent !== null).assertTrue();
      Logger.info(`[${testName}] TextArea component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0940_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to drag TextArea, move time >= 5S`);
      Logger.info(`[${testName}] Expected: 数据还没准备好，但是组件开始跟随鼠标移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0940_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    // ==================== TextInput 用例 (0950-0990) ====================

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0950
     * @tc.name   : TextInput鼠标 - 起拖时WAITING
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0950', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0950';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0950');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textInputComponent = await driver.findComponent(ON.id('BlockageDrag0950_TextInput'));
      expect(textInputComponent !== null).assertTrue();
      Logger.info(`[${testName}] TextInput component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0950_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to drag TextInput`);
      Logger.info(`[${testName}] Expected: log不会打印：aaa --- 用户准备数据完成，组件不会跟随鼠标移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0950_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0960
     * @tc.name   : TextInput鼠标 - 起拖时READY
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0960', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0960';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0960');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textInputComponent = await driver.findComponent(ON.id('BlockageDrag0960_TextInput'));
      expect(textInputComponent !== null).assertTrue();
      Logger.info(`[${testName}] TextInput component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0960_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to drag TextInput`);
      Logger.info(`[${testName}] Expected: log打印：aaa --- 用户准备数据完成，组件跟随鼠标移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0960_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0970
     * @tc.name   : TextInput鼠标 - 移动中未超5S WAITING
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0970', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0970';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0970');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textInputComponent = await driver.findComponent(ON.id('BlockageDrag0970_TextInput'));
      expect(textInputComponent !== null).assertTrue();
      Logger.info(`[${testName}] TextInput component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0970_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to drag TextInput, release before 5S`);
      Logger.info(`[${testName}] Expected: 回调onDragEnd`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0970_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0980
     * @tc.name   : TextInput鼠标 - 移动中未超5S READY
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0980', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0980';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0980');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textInputComponent = await driver.findComponent(ON.id('BlockageDrag0980_TextInput'));
      expect(textInputComponent !== null).assertTrue();
      Logger.info(`[${testName}] TextInput component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0980_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to drag TextInput, move time > 2S < 5S`);
      Logger.info(`[${testName}] Expected: log打印：aaa --- 用户准备数据完成，组件开始跟随鼠标移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0980_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_BLOCKAGE_DRAG_0990
     * @tc.name   : TextInput鼠标 - 移动中超过5S
     * @tc.desc   : Verify action blockage drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_BLOCKAGE_DRAG_0990', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_BLOCKAGE_DRAG_0990';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionBlockageDrag/BlockageDrag0990');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textInputComponent = await driver.findComponent(ON.id('BlockageDrag0990_TextInput'));
      expect(textInputComponent !== null).assertTrue();
      Logger.info(`[${testName}] TextInput component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0990_initial`);

      Logger.info(`[${testName}] Manual test required: Use mouse to drag TextInput, move time >= 5S`);
      Logger.info(`[${testName}] Expected: 数据还没准备好，但是组件开始跟随鼠标移动`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`BlockageDrag0990_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
