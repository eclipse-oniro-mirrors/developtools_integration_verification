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

export default function uiComponentButtonTimepicker() {
  describe('uiComponentButtonTimepicker', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TIMEPICKER_SOUNDVIBRATION_0020
     * @tc.name   : TimepickerSoundvibration0020
     * @tc.desc   : Verify button TimePicker soundvibration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TIMEPICKER_SOUNDVIBRATION_0020', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_BUTTON_TIMEPICKER_SOUNDVIBRATION_0020 begin');
      
      await Settings.createWindow('testability/pages/component/button/ButtonTimepicker/TimepickerSoundvibration0020');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击haptic按钮开启音振
      const hapticBtn = await driver.findComponent(ON.id('hapticBtn'));
      if (hapticBtn) {
        await hapticBtn.click();
        await driver.delayMs(500);
      }

      // 点击RTL按钮测试动态切换
      const rtlBtn = await driver.findComponent(ON.id('rtlBtn'));
      if (rtlBtn) {
        await rtlBtn.click();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('BUTTON_TIMEPICKER_SOUNDVIBRATION_0020');
      
      Logger.info('SUB_ACE_UI_COMPONENT_BUTTON_TIMEPICKER_SOUNDVIBRATION_0020 end');
    });
  });
}