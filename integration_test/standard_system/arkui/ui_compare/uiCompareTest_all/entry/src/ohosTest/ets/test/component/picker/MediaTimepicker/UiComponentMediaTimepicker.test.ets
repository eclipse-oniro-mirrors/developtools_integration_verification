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

export default function uiComponentMediaTimepicker() {
  describe('uiComponentMediaTimepicker', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0032
     * @tc.name   : TimepickerStartendtime0032
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0032', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0032 begin');
      
      await Settings.createWindow('testability/pages/component/picker/MediaTimepicker/TimepickerStartendtime0032');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 调起TimePickerDialog
      const dialogBtn = await driver.findComponent(ON.id('dialogBtn'));
      if (dialogBtn) {
        await dialogBtn.click();
        await driver.delayMs(1000);
        await driver.pressBack();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('MEDIA_TIMEPICKER_STARTENDTIME_0032');
      
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0032 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0020
     * @tc.name   : TimepickerVoice0020
     * @tc.desc   : Verify media TimePicker voice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0020', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0020 begin');
      
      await Settings.createWindow('testability/pages/component/picker/MediaTimepicker/TimepickerVoice0020');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击enable=true按钮
      const enableTrue = await driver.findComponent(ON.id('enableTrue'));
      if (enableTrue) {
        await enableTrue.click();
        await driver.delayMs(500);
      }

      // 调起dialog
      const dialogBtn = await driver.findComponent(ON.id('dialogBtn'));
      if (dialogBtn) {
        await dialogBtn.click();
        await driver.delayMs(1000);
        await driver.pressBack();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('MEDIA_TIMEPICKER_VOICE_0020');
      
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0020 end');
    });
  });
}