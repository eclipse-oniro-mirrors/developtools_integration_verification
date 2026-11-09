/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

export default function uiComponentCalendarPicker() {
  describe('uiComponentCalendarPicker', () => {
    const TAG: string = 'uiComponentCalendarPicker';
    let driver = Driver.create();

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_BARRIERFREE_0010
     * @tc.name   : Popupbox menu barrierfree
     * @tc.desc   : Verify popupbox menu barrierfree interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_BARRIERFREE_0010', 0, async () => {
      await Settings.createWindow('testability/pages/component/picker/CalendarPicker/CalendarBarrierfree0010');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(2000);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_BARRIERFREE_0010: CalendarPickerDialog无障碍播报测试');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_BARRIERFREE_0010');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_HABIT_0020
     * @tc.name   : Popupbox menu habit
     * @tc.desc   : Verify popupbox menu habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_HABIT_0020', 0, async () => {
      await Settings.createWindow('testability/pages/component/picker/CalendarPicker/CalendarHabit0020');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(2000);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_HABIT_0020: 简体中文CalendarPickerDialog');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_HABIT_0020');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_HABIT_0160
     * @tc.name   : Popupbox menu habit
     * @tc.desc   : Verify popupbox menu habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_HABIT_0160', 0, async () => {
      await Settings.createWindow('testability/pages/component/picker/CalendarPicker/CalendarHabit0160');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(2000);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_HABIT_0160: 维吾尔语CalendarPickerDialog');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_HABIT_0160');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_HABIT_0300
     * @tc.name   : Popupbox menu habit
     * @tc.desc   : Verify popupbox menu habit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_HABIT_0300', 0, async () => {
      await Settings.createWindow('testability/pages/component/picker/CalendarPicker/CalendarHabit0300');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(2000);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_HABIT_0300: 藏语CalendarPickerDialog');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_HABIT_0300');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_BASICCONTAINER_FORMSELECTION_TIMEPICKER_LANGUAGEORDER_0010_DUPLICATE
     * @tc.name   : Component function basiccontainer formselection TimePicker languageorder duplicate
     * @tc.desc   : Verify component function basiccontainer formselection TimePicker languageorder duplicate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_BASICCONTAINER_FORMSELECTION_TIMEPICKER_LANGUAGEORDER_0010_DUPLICATE', 0, async () => {
      await Settings.createWindow('testability/pages/component/picker/CalendarPicker/TimePicker0010');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'TimePicker英文渲染补充测试');
      await windowSnap.snapShot('ARKUI_TIMEPICKER_0010_DUPLICATE');
    });
  });
}
