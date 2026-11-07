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

export default function uiComponentPopupboxSmartmultiwindow() {
  describe('uiComponentPopupboxSmartmultiwindow', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0820
     * @tc.name   : Smartmultiwindow0820
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0820', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0820 begin');
      
      await Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindowAlt/Smartmultiwindow0820');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 调起TextPickerDialog
      const dialogBtn = await driver.findComponent(ON.id('dialogBtn'));
      if (dialogBtn) {
        await dialogBtn.click();
        await driver.delayMs(1000);
        await driver.pressBack();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('POPUPBOX_SMARTMULTIWINDOW_0820');
      
      Logger.info('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0820 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1940
     * @tc.name   : Smartmultiwindow1940
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1940', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1940 begin');
      
      await Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindowAlt/Smartmultiwindow1940');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 调起DatePickerDialog
      const dialogBtn = await driver.findComponent(ON.id('dialogBtn'));
      if (dialogBtn) {
        await dialogBtn.click();
        await driver.delayMs(1000);
        await driver.pressBack();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('POPUPBOX_SMARTMULTIWINDOW_1940');
      
      Logger.info('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1940 end');
    });
  });
}