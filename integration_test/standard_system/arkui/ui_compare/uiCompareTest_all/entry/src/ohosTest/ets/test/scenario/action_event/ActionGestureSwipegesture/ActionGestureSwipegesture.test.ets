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

export default function actionGestureSwipegesture() {
  describe('actionGestureSwipegesture', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_SWIPEGESTURE_INTERFACE_0410
     * @tc.name   : 验证滑动空白区域list响应滑动，滑动红色区域list不滚动
     * @tc.desc   : Verify action gesture swipegesture interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_SWIPEGESTURE_INTERFACE_0410', 0, async () => {
      Logger.info('SUB_ACE_ACTION_GESTURE_SWIPEGESTURE_INTERFACE_0410 begin');
      
      await Settings.createWindow('testability/pages/scenario/action_event/ActionGestureSwipegesture/SwipegestureInterface0410');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 获取屏幕尺寸
      const displayInfo = await driver.getDisplaySize();
      const screenWidth = displayInfo.x;
      const screenHeight = displayInfo.y;
      
      // 在空白区域滑动（应该触发list滚动）
      const whiteAreaX = screenWidth * 0.6; // 空白区域大约在右侧
      await driver.swipe(whiteAreaX, screenHeight * 0.5, whiteAreaX, screenHeight * 0.3, 500);
      await driver.delayMs(500);
      Logger.info('White area swipe completed');
      
      // 在红色区域滑动（不应该触发list滚动）
      const redAreaX = screenWidth * 0.2; // 红色区域大约在左侧
      await driver.swipe(redAreaX, screenHeight * 0.5, redAreaX, screenHeight * 0.3, 500);
      await driver.delayMs(500);
      Logger.info('Red area swipe completed');
      
      await windowSnap.snapShot('SWIPEGESTURE_INTERFACE_0410');
      
      Logger.info('SUB_ACE_ACTION_GESTURE_SWIPEGESTURE_INTERFACE_0410 end');
    });

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_SWIPEGESTURE_INTERFACE_0430
     * @tc.name   : 历史点坐标验证
     * @tc.desc   : Verify action gesture swipegesture interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_SWIPEGESTURE_INTERFACE_0430', 0, async () => {
      Logger.info('SUB_ACE_ACTION_GESTURE_SWIPEGESTURE_INTERFACE_0430 begin');
      
      await Settings.createWindow('testability/pages/scenario/action_event/ActionGestureSwipegesture/SwipegestureInterface0430');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 查找测试按钮并在其上滑动，触发历史点记录
      const btn = await driver.findComponent(ON.id('btn'));
      const btnBounds = await btn.getBoundsCenter();
      
      // 执行滑动操作，触发onTouch和SwipeGesture事件
      await driver.swipe(btnBounds.x - 50, btnBounds.y, btnBounds.x + 50, btnBounds.y + 50, 800);
      await driver.delayMs(500);
      Logger.info('Swipe gesture executed, check logs for history points');
      
      // 再执行一次不同方向的滑动
      await driver.swipe(btnBounds.x, btnBounds.y - 50, btnBounds.x + 50, btnBounds.y + 50, 800);
      await driver.delayMs(500);
      Logger.info('Second swipe gesture executed');
      
      await windowSnap.snapShot('SWIPEGESTURE_INTERFACE_0430');
      
      Logger.info('SUB_ACE_ACTION_GESTURE_SWIPEGESTURE_INTERFACE_0430 end');
      Logger.info('Please check hilog for onTouch history points');
    });
  });
}
