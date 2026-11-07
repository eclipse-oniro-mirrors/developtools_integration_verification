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

export default function uiComponentCalendarPickerBorder() {
  describe('uiComponentCalendarPickerBorder', () => {

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0110
     * @tc.name   : Component function special components dialog specifications ui
     * @tc.desc   : Verify component function special components dialog specifications ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0110', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0110 begin');
      await Settings.createWindow('testability/pages/component/picker/CalendarPickerBorder/CalendarPickerBorder0110');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('CalendarPickerBorder0110_1_Initial');
      
      const calendarPicker = await driver.findComponent(ON.id('CalendarPickerBorder0110_Component'));
      if (calendarPicker) {
        await calendarPicker.click();
        Logger.info('CalendarPicker clicked - dialog opened');
        await driver.delayMs(2000);
        await windowSnap.snapShot('CalendarPickerBorder0110_2_DialogOpen');
        
        // 关闭日历对话框
        await driver.pressBack();
        await driver.delayMs(500);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0110 end');
      Logger.info('Manual verification: Check border styles - top: 2vp, others: 1vp (default)');
    });
  });
}
