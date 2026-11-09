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

export default function actionGestureTapgesture() {
  describe('actionGestureTapgesture', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_TAPGESTURE_0780
     * @tc.name   : 左手滑动scroll且不离开屏幕，右手点击scroll的子组件
     * @tc.desc   : Verify action gesture tapgesture interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_TAPGESTURE_0780', 0, async () => {
      Logger.info('SUB_ACE_ACTION_GESTURE_TAPGESTURE_0780 begin');
      
      await Settings.createWindow('testability/pages/scenario/action_event/ActionGestureTapgesture/TapgestureInterface0780');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 获取屏幕尺寸
      const displayInfo = await driver.getDisplaySize();
      const screenWidth = displayInfo.x;
      const screenHeight = displayInfo.y;
      
      // 尝试模拟滑动Scroll
      const scrollCenterX = screenWidth * 0.5;
      const scrollCenterY = screenHeight * 0.5;
      await driver.swipe(scrollCenterX, scrollCenterY, scrollCenterX, scrollCenterY - 100, 1000);
      await driver.delayMs(200);
      Logger.info('Scroll swipe started');
      
      // 在滑动过程中尝试点击Text（理论上不应触发）
      // 注意：由于Driver限制，这只能模拟简单场景
      const textCenterY = screenHeight * 0.6;
      await driver.click(scrollCenterX, textCenterY);
      await driver.delayMs(500);
      Logger.info('Text click attempted during scroll');
      
      await windowSnap.snapShot('TAPGESTURE_0780');
      
      Logger.info('SUB_ACE_ACTION_GESTURE_TAPGESTURE_0780 end');
    });
  });
}
