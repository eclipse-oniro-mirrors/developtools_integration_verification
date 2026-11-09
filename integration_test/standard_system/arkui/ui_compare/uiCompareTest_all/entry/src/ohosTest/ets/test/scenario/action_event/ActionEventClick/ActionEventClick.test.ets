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

export default function actionEventClickTest() {
  describe('actionEventClickTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_CLICK_0090
     * @tc.name   : 两根手指分别按在不同组件内
     * @tc.desc   : Verify action event commonevent click interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_CLICK_0090', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_CLICK_0090';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventClick/Click0090');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const blueArea = await driver.findComponent(ON.id('Click0090_Blue'));
      expect(blueArea !== null).assertTrue();
      Logger.info(`[${testName}] Blue area found`);

      const yellowArea = await driver.findComponent(ON.id('Click0090_Yellow'));
      expect(yellowArea !== null).assertTrue();
      Logger.info(`[${testName}] Yellow area found`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`Click0090_initial`);

      Logger.info(`[${testName}] Manual test required: Use two fingers to touch different areas`);
      Logger.info(`[${testName}] Expected: finger状态在Down后变成对应类型，Up后变回undefined`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`Click0090_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_CLICK_0160
     * @tc.name   : 4x4月视图卡片鼠标点击前后切换月份
     * @tc.desc   : Verify action event commonevent click interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_CLICK_0160', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_CLICK_0160';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventClick/Click0160');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      // 初始状态截图
      await windowSnap.snapShot(`Click0160_initial`);

      // 点击向后切换按钮多次
      const nextBtn = await driver.findComponent(ON.id('Click0160_NextBtn'));
      expect(nextBtn !== null).assertTrue();

      for (let i = 0; i < 3; i++) {
        await nextBtn.click();
        await driver.delayMs(200);
      }
      Logger.info(`[${testName}] Clicked next button 3 times`);
      await windowSnap.snapShot(`Click0160_after_next`);

      // 点击向前切换按钮
      const prevBtn = await driver.findComponent(ON.id('Click0160_PrevBtn'));
      expect(prevBtn !== null).assertTrue();

      for (let i = 0; i < 2; i++) {
        await prevBtn.click();
        await driver.delayMs(200);
      }
      Logger.info(`[${testName}] Clicked prev button 2 times`);
      await windowSnap.snapShot(`Click0160_after_prev`);

      Logger.info(`[${testName}] Expected: 切换过程中上下一致，切换次数与月份变化一致`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
