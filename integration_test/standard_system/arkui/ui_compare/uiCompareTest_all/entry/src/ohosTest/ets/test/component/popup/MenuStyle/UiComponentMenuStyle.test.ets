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

export default function uiComponentMenuStyle() {
  describe('uiComponentMenuStyle', () => {
    const TAG: string = 'uiComponentMenuStyle';
    let driver = Driver.create();

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_0030
     * @tc.name   : Popupbox menu style enhancement
     * @tc.desc   : Verify popupbox menu style enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_0030', 0, async () => {
      await Settings.createWindow('testability/pages/component/popup/MenuStyle/MenuStyle0030');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.longClick();
      await driver.delayMs(1500);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_0030: MenuItemDivider固定数值分割线');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_0030');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_0040
     * @tc.name   : Popupbox menu style enhancement
     * @tc.desc   : Verify popupbox menu style enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_0040', 0, async () => {
      await Settings.createWindow('testability/pages/component/popup/MenuStyle/MenuStyle0040');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.longClick();
      await driver.delayMs(1500);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_0040: MenuItemDivider百分比分割线');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_0040');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TOUCH_0080
     * @tc.name   : Popupbox menu touch
     * @tc.desc   : Verify popupbox menu touch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TOUCH_0080', 0, async () => {
      await Settings.createWindow('testability/pages/component/popup/MenuStyle/MenuTouch0080');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(1500);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TOUCH_0080: Menu切后台测试');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TOUCH_0080');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0010
     * @tc.name   : Popupbox menu uiextension
     * @tc.desc   : Verify popupbox menu uiextension interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0010', 0, async () => {
      await Settings.createWindow('testability/pages/component/popup/MenuStyle/MenuUiextension0010');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.longClick();
      await driver.delayMs(1500);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0010: Menu在UIExtension中显示');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0010');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_BLUR_011
     * @tc.name   : Popupbox menu blur
     * @tc.desc   : Verify popupbox menu blur interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_BLUR_011', 0, async () => {
      await Settings.createWindow('testability/pages/component/popup/MenuStyle/SelectBlur0011');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_BLUR_011: Select-API10');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_BLUR_011');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_BLUR_012
     * @tc.name   : Popupbox menu blur
     * @tc.desc   : Verify popupbox menu blur interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_BLUR_012', 0, async () => {
      await Settings.createWindow('testability/pages/component/popup/MenuStyle/ToolbarBlur0012');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_BLUR_012: toolbarConfiguration-API10');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_BLUR_012');
    });
  });
}
