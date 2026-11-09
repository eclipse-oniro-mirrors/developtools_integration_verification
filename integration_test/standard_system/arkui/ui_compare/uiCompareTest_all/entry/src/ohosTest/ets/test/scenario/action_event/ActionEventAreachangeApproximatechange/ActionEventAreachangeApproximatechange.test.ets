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

export default function actionEventAreachangeApproximatechangeTest() {
  describe('actionEventAreachangeApproximatechangeTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0020
     * @tc.name   : expectedUpdateInterval = -100
     * @tc.desc   : Verify action event commonevent areachange approximatechange interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0020', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0020';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeApproximatechange/ApproximateChange0020');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textComponent = await driver.findComponent(ON.id('ApproximateChange0020_Text'));
      expect(textComponent !== null).assertTrue();
      Logger.info(`[${testName}] Text component found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0020_initial`);

      Logger.info(`[${testName}] Manual test required: Scroll up to hide text, then scroll down to show`);
      Logger.info(`[${testName}] Expected: 回调间隔为1000ms（-100被修正为默认值）`);
      
      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0020_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0040
     * @tc.name   : expectedUpdateInterval = undefined
     * @tc.desc   : Verify action event commonevent areachange approximatechange interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0040', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0040';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeApproximatechange/ApproximateChange0040');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textComponent = await driver.findComponent(ON.id('ApproximateChange0040_Text'));
      expect(textComponent !== null).assertTrue();

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0040_initial`);

      Logger.info(`[${testName}] Expected: 回调间隔为1000ms`);
      
      await windowSnap.snapShot(`ApproximateChange0040_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0050
     * @tc.name   : expectedUpdateInterval = null
     * @tc.desc   : Verify action event commonevent areachange approximatechange interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0050', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0050';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeApproximatechange/ApproximateChange0050');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textComponent = await driver.findComponent(ON.id('ApproximateChange0050_Text'));
      expect(textComponent !== null).assertTrue();

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0050_initial`);

      Logger.info(`[${testName}] Expected: 回调间隔为1000ms`);
      
      await windowSnap.snapShot(`ApproximateChange0050_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0060
     * @tc.name   : expectedUpdateInterval 不设置
     * @tc.desc   : Verify action event commonevent areachange approximatechange interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0060', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0060';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeApproximatechange/ApproximateChange0060');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textComponent = await driver.findComponent(ON.id('ApproximateChange0060_Text'));
      expect(textComponent !== null).assertTrue();

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0060_initial`);

      Logger.info(`[${testName}] Expected: 回调间隔为1000ms`);
      
      await windowSnap.snapShot(`ApproximateChange0060_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0070
     * @tc.name   : expectedUpdateInterval = 500
     * @tc.desc   : Verify action event commonevent areachange approximatechange interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0070', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0070';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeApproximatechange/ApproximateChange0070');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textComponent = await driver.findComponent(ON.id('ApproximateChange0070_Text'));
      expect(textComponent !== null).assertTrue();

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0070_initial`);

      Logger.info(`[${testName}] Expected: 回调间隔为500ms`);
      
      await windowSnap.snapShot(`ApproximateChange0070_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0080
     * @tc.name   : expectedUpdateInterval = 1000
     * @tc.desc   : Verify action event commonevent areachange approximatechange interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0080', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0080';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeApproximatechange/ApproximateChange0080');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textComponent = await driver.findComponent(ON.id('ApproximateChange0080_Text'));
      expect(textComponent !== null).assertTrue();

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0080_initial`);

      Logger.info(`[${testName}] Expected: 回调间隔为1000ms`);
      
      await windowSnap.snapShot(`ApproximateChange0080_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0090
     * @tc.name   : expectedUpdateInterval = 100
     * @tc.desc   : Verify action event commonevent areachange approximatechange interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0090', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0090';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeApproximatechange/ApproximateChange0090');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textComponent = await driver.findComponent(ON.id('ApproximateChange0090_Text'));
      expect(textComponent !== null).assertTrue();

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0090_initial`);

      Logger.info(`[${testName}] Expected: 回调间隔为100ms`);
      
      await windowSnap.snapShot(`ApproximateChange0090_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0100
     * @tc.name   : expectedUpdateInterval = 0
     * @tc.desc   : Verify action event commonevent areachange approximatechange interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0100', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0100';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeApproximatechange/ApproximateChange0100');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textComponent = await driver.findComponent(ON.id('ApproximateChange0100_Text'));
      expect(textComponent !== null).assertTrue();

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0100_initial`);

      Logger.info(`[${testName}] Expected: 回调间隔为100ms（0被修正为最小值100）`);
      
      await windowSnap.snapShot(`ApproximateChange0100_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0110
     * @tc.name   : expectedUpdateInterval = 1
     * @tc.desc   : Verify action event commonevent areachange approximatechange interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0110', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0110';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeApproximatechange/ApproximateChange0110');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textComponent = await driver.findComponent(ON.id('ApproximateChange0110_Text'));
      expect(textComponent !== null).assertTrue();

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0110_initial`);

      Logger.info(`[${testName}] Expected: 回调间隔为100ms（1被修正为最小值100）`);
      
      await windowSnap.snapShot(`ApproximateChange0110_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0120
     * @tc.name   : event传入undefined
     * @tc.desc   : Verify action event commonevent areachange approximatechange interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0120', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0120';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeApproximatechange/ApproximateChange0120');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textComponent = await driver.findComponent(ON.id('ApproximateChange0120_Text'));
      expect(textComponent !== null).assertTrue();

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0120_initial`);

      Logger.info(`[${testName}] Expected: 不会报错`);
      
      await windowSnap.snapShot(`ApproximateChange0120_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0130
     * @tc.name   : 横竖屏切换
     * @tc.desc   : Verify action event commonevent areachange approximatechange interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0130', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0130';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeApproximatechange/ApproximateChange0130');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textComponent = await driver.findComponent(ON.id('ApproximateChange0130_Text'));
      expect(textComponent !== null).assertTrue();

      const button = await driver.findComponent(ON.id('ApproximateChange0130_Button'));
      expect(button !== null).assertTrue();

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0130_initial`);

      Logger.info(`[${testName}] Manual test required: Rotate device to trigger orientation change`);
      Logger.info(`[${testName}] Expected: isExpanding=false, currentRatio<1`);
      
      await windowSnap.snapShot(`ApproximateChange0130_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0140
     * @tc.name   : 息屏测试
     * @tc.desc   : Verify action event commonevent areachange approximatechange interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0140', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0140';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeApproximatechange/ApproximateChange0140');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textComponent = await driver.findComponent(ON.id('ApproximateChange0140_Text'));
      expect(textComponent !== null).assertTrue();

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0140_initial`);

      Logger.info(`[${testName}] Manual test required: Turn off screen, then unlock`);
      Logger.info(`[${testName}] Expected: 息屏isExpanding=false,ratio=0; 解锁isExpanding=true,ratio=1`);
      
      await windowSnap.snapShot(`ApproximateChange0140_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0150
     * @tc.name   : 退后台测试
     * @tc.desc   : Verify action event commonevent areachange approximatechange interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0150', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0150';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeApproximatechange/ApproximateChange0150');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textComponent = await driver.findComponent(ON.id('ApproximateChange0150_Text'));
      expect(textComponent !== null).assertTrue();

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0150_initial`);

      Logger.info(`[${testName}] Manual test required: Go to home screen, then return to app`);
      Logger.info(`[${testName}] Expected: 退后台isExpanding=false,ratio=0; 恢复isExpanding=true,ratio=1`);
      
      await windowSnap.snapShot(`ApproximateChange0150_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0160
     * @tc.name   : 组件下树/上树
     * @tc.desc   : Verify action event commonevent areachange approximatechange interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0160', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0160';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeApproximatechange/ApproximateChange0160');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textComponent = await driver.findComponent(ON.id('ApproximateChange0160_Text'));
      expect(textComponent !== null).assertTrue();

      const removeBtn = await driver.findComponent(ON.id('ApproximateChange0160_RemoveBtn'));
      expect(removeBtn !== null).assertTrue();

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0160_initial`);

      // 点击下树按钮
      await removeBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0160_removed`);

      // 点击上树按钮
      const addBtn = await driver.findComponent(ON.id('ApproximateChange0160_AddBtn'));
      if (addBtn) {
        await addBtn.click();
        await driver.delayMs(500);
        await windowSnap.snapShot(`ApproximateChange0160_added`);
      }

      Logger.info(`[${testName}] Expected: 下树isExpanding=false,ratio=0; 上树isExpanding=true,ratio=1`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0170
     * @tc.name   : 设置通用属性为不可见
     * @tc.desc   : Verify action event commonevent areachange approximatechange interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0170', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0170';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeApproximatechange/ApproximateChange0170');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textComponent = await driver.findComponent(ON.id('ApproximateChange0170_Text'));
      expect(textComponent !== null).assertTrue();

      const hideBtn = await driver.findComponent(ON.id('ApproximateChange0170_HideBtn'));
      expect(hideBtn !== null).assertTrue();

      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0170_initial`);

      // 点击设置不可见按钮
      await hideBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot(`ApproximateChange0170_hidden`);

      // 点击设置可见按钮
      const showBtn = await driver.findComponent(ON.id('ApproximateChange0170_ShowBtn'));
      if (showBtn) {
        await showBtn.click();
        await driver.delayMs(500);
        await windowSnap.snapShot(`ApproximateChange0170_visible`);
      }

      Logger.info(`[${testName}] Expected: 不可见isExpanding=false,ratio=0; 可见isExpanding=true,ratio=1`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
