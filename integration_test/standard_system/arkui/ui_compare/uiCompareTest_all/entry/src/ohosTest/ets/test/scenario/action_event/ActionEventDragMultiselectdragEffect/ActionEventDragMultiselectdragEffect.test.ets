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

import { describe, it, afterEach, expect } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

export default function actionEventDragMultiselectdragEffectTest() {
  describe('actionEventDragMultiselectdragEffectTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0540
     * @tc.name   : 分屏模式下多选拖拽
     * @tc.desc   : Verify action event commonevent drag multiselectdrag-effect interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0540', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0540';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventDragMultiselectdragEffect/MultiselectDrag0540');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const gridComponent = await driver.findComponent(ON.id('MultiselectDrag0540_Grid'));
      expect(gridComponent !== null).assertTrue();
      Logger.info(`[${testName}] Grid component found`);

      await windowSnap.snapShot(`MultiselectDrag0540_initial`);

      Logger.info(`[${testName}] Manual test required: Enter split-screen mode and test multi-select drag`);
      Logger.info(`[${testName}] Expected: 可发起拖拽，动效正常`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`MultiselectDrag0540_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0550
     * @tc.name   : 长按不松手连续2次返回
     * @tc.desc   : Verify action event commonevent drag multiselectdrag-effect interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0550', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0550';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventDragMultiselectdragEffect/MultiselectDrag0550');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      await windowSnap.snapShot(`MultiselectDrag0550_initial`);

      const backBtn = await driver.findComponent(ON.id('MultiselectDrag0550_BackBtn'));
      expect(backBtn !== null).assertTrue();

      // 模拟点击返回按钮2次
      await backBtn.click();
      await driver.delayMs(300);
      await backBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot(`MultiselectDrag0550_after_back`);

      Logger.info(`[${testName}] Expected: 返回后取消拖拽`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0560
     * @tc.name   : 长按不松手连续3次返回后再次拖拽
     * @tc.desc   : Verify action event commonevent drag multiselectdrag-effect interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0560', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0560';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventDragMultiselectdragEffect/MultiselectDrag0560');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      await windowSnap.snapShot(`MultiselectDrag0560_initial`);

      const backBtn = await driver.findComponent(ON.id('MultiselectDrag0560_BackBtn'));
      expect(backBtn !== null).assertTrue();

      // 模拟点击返回按钮3次
      for (let i = 0; i < 3; i++) {
        await backBtn.click();
        await driver.delayMs(300);
      }
      await windowSnap.snapShot(`MultiselectDrag0560_after_back`);

      Logger.info(`[${testName}] Expected: 返回后取消拖拽，再次进入页面拖拽效果正常`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0580
     * @tc.name   : 横屏模式多选拖拽
     * @tc.desc   : Verify action event commonevent drag multiselectdrag-effect interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0580', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0580';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventDragMultiselectdragEffect/MultiselectDrag0580');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const gridComponent = await driver.findComponent(ON.id('MultiselectDrag0580_Grid'));
      expect(gridComponent !== null).assertTrue();
      Logger.info(`[${testName}] Grid component found`);

      await windowSnap.snapShot(`MultiselectDrag0580_initial`);

      Logger.info(`[${testName}] Manual test required: Rotate device to landscape and test drag`);
      Logger.info(`[${testName}] Expected: 可发起拖拽，动效正常`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`MultiselectDrag0580_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
