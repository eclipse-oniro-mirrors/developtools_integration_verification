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

export default function uiComponentPopupboxPickerold() {
  describe('uiComponentPopupboxPickerold', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0030
     * @tc.name   : Pickerold0030
     * @tc.desc   : Verify popupbox pickerold interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0030', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0030 begin');
      
      await Settings.createWindow('testability/pages/component/popup/PopupboxPickerold/Pickerold0030');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 调起CalendarPickerDialog
      const dialogBtn = await driver.findComponent(ON.id('dialogBtn'));
      if (dialogBtn) {
        await dialogBtn.click();
        await driver.delayMs(1000);
        await driver.pressBack();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('POPUPBOX_PICKEROLD_0030');
      
      Logger.info('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0030 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0040
     * @tc.name   : Pickerold0040
     * @tc.desc   : Verify popupbox pickerold interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0040', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0040 begin');
      
      await Settings.createWindow('testability/pages/component/popup/PopupboxPickerold/Pickerold0040');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      const dialogBtn = await driver.findComponent(ON.id('dialogBtn'));
      if (dialogBtn) {
        await dialogBtn.click();
        await driver.delayMs(1000);
        await driver.pressBack();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('POPUPBOX_PICKEROLD_0040');
      
      Logger.info('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0040 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0050
     * @tc.name   : Pickerold0050
     * @tc.desc   : Verify popupbox pickerold interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0050', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0050 begin');
      
      await Settings.createWindow('testability/pages/component/popup/PopupboxPickerold/Pickerold0050');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      const dialogBtn = await driver.findComponent(ON.id('dialogBtn'));
      if (dialogBtn) {
        await dialogBtn.click();
        await driver.delayMs(1000);
        await driver.pressBack();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('POPUPBOX_PICKEROLD_0050');
      
      Logger.info('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0050 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0060
     * @tc.name   : Pickerold0060
     * @tc.desc   : Verify popupbox pickerold interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0060', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0060 begin');
      
      await Settings.createWindow('testability/pages/component/popup/PopupboxPickerold/Pickerold0060');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      const dialogBtn = await driver.findComponent(ON.id('dialogBtn'));
      if (dialogBtn) {
        await dialogBtn.click();
        await driver.delayMs(1000);
        await driver.pressBack();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('POPUPBOX_PICKEROLD_0060');
      
      Logger.info('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0060 end');
    });
  });
}