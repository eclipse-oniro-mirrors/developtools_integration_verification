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

export default function actionGesturePangesture() {
  describe('actionGesturePangesture', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_PANGESTURE_BACKWARDANALYSIS_0040
     * @tc.name   : PanGesture复杂场景
     * @tc.desc   : Verify action gesture pangesture backwardanalysis interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_PANGESTURE_BACKWARDANALYSIS_0040', 0, async () => {
      Logger.info('SUB_ACE_ACTION_GESTURE_PANGESTURE_BACKWARDANALYSIS_0040 begin');
      
      await Settings.createWindow('testability/pages/scenario/action_event/ActionGesturePangesture/PangestureBackward0040');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('PANGESTURE_BACKWARDANALYSIS_0040');
      
      Logger.info('SUB_ACE_ACTION_GESTURE_PANGESTURE_BACKWARDANALYSIS_0040 end');
    });

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_PANGESTURE_INTUREFACE_0850
     * @tc.name   : PanGesture参数校验
     * @tc.desc   : Verify action gesture pangesture intureface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_PANGESTURE_INTUREFACE_0850', 0, async () => {
      Logger.info('SUB_ACE_ACTION_GESTURE_PANGESTURE_INTUREFACE_0850 begin');
      
      await Settings.createWindow('testability/pages/scenario/action_event/ActionGesturePangesture/PangestureInterface0850');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 查找测试按钮
      const btn = await driver.findComponent(ON.id('btn'));
      const btnBounds = await btn.getBoundsCenter();
      
      // 水平滑动（应该触发）
      await driver.swipe(btnBounds.x, btnBounds.y, btnBounds.x + 100, btnBounds.y, 500);
      await driver.delayMs(500);
      Logger.info('Horizontal swipe completed');
      
      // 垂直滑动（不应该触发）
      await driver.swipe(btnBounds.x, btnBounds.y, btnBounds.x, btnBounds.y - 100, 500);
      await driver.delayMs(500);
      Logger.info('Vertical swipe completed');
      
      await windowSnap.snapShot('PANGESTURE_INTUREFACE_0850');
      
      Logger.info('SUB_ACE_ACTION_GESTURE_PANGESTURE_INTUREFACE_0850 end');
    });

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_PANGESTURE_INTUREFACE_0870
     * @tc.name   : PanGesture组件下树
     * @tc.desc   : Verify action gesture pangesture intureface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_PANGESTURE_INTUREFACE_0870', 0, async () => {
      Logger.info('SUB_ACE_ACTION_GESTURE_PANGESTURE_INTUREFACE_0870 begin');
      
      await Settings.createWindow('testability/pages/scenario/action_event/ActionGesturePangesture/PangestureInterface0870');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 在Button1上开始滑动
      const btn1 = await driver.findComponent(ON.id('btn1'));
      const btn1Bounds = await btn1.getBoundsCenter();
      
      // 开始滑动但不完成（模拟手指不松开的状态）
      await driver.swipe(btn1Bounds.x, btn1Bounds.y, btn1Bounds.x + 50, btn1Bounds.y, 1000);
      await driver.delayMs(300);
      
      // 点击Button2使Button1下树
      const btn2 = await driver.findComponent(ON.id('btn2'));
      await btn2.click();
      await driver.delayMs(500);
      Logger.info('Button2 clicked, Button1 should be removed');
      
      await windowSnap.snapShot('PANGESTURE_INTUREFACE_0870');
      
      Logger.info('SUB_ACE_ACTION_GESTURE_PANGESTURE_INTUREFACE_0870 end');
    });
  });
}
