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

export default function uiComponentMenuShadow() {
  describe('uiComponentMenuShadow', () => {

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0200
     * @tc.name   : Component function commomattributes menu shadowset
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0200', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0200 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuShadow/MenuShadow0200');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuShadow0200_1_Initial');
      
      const selectComponent = await driver.findComponent(ON.id('MenuShadow0200_Select'));
      if (selectComponent) {
        await selectComponent.click();
        Logger.info('Select dropdown opened - please verify shadow');
        await driver.delayMs(2000);
        await windowSnap.snapShot('MenuShadow0200_2_SelectOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0200 end');
      Logger.info('Manual verification: Check select menu shadow in light mode');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0210
     * @tc.name   : Component function commomattributes menu shadowset
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0210', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0210 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuShadow/MenuShadow0210');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuShadow0210_1_Initial');
      
      const noArrowButton = await driver.findComponent(ON.id('MenuShadow0210_NoArrowButton'));
      if (noArrowButton) {
        await noArrowButton.click();
        Logger.info('Menu without arrow opened');
        await driver.delayMs(2000);
        await windowSnap.snapShot('MenuShadow0210_2_MenuOpen_NoArrow');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0210 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0220
     * @tc.name   : Component function commomattributes menu shadowset
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0220', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0220 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuShadow/MenuShadow0220');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuShadow0220_1_Initial');
      
      const arrowButton = await driver.findComponent(ON.id('MenuShadow0220_ArrowButton'));
      if (arrowButton) {
        await arrowButton.click();
        Logger.info('Menu with arrow opened');
        await driver.delayMs(2000);
        await windowSnap.snapShot('MenuShadow0220_2_MenuOpen_WithArrow');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0220 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0230
     * @tc.name   : Component function commomattributes menu shadowset
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0230', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0230 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuShadow/MenuShadow0230');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuShadow0230_1_Initial');
      
      const previewButton = await driver.findComponent(ON.id('MenuShadow0230_PreviewButton'));
      if (previewButton) {
        await previewButton.longClick();
        Logger.info('Menu with preview opened - long press');
        await driver.delayMs(2000);
        await windowSnap.snapShot('MenuShadow0230_2_MenuOpen_Preview');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0230 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0240
     * @tc.name   : Component function commomattributes menu shadowset
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0240', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0240 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuShadow/MenuShadow0240');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuShadow0240_1_Initial');
      
      const embededButton = await driver.findComponent(ON.id('MenuShadow0240_EmbededButton'));
      if (embededButton) {
        await embededButton.longClick();
        Logger.info('SubMenu embeded_expand opened');
        await driver.delayMs(2000);
        await windowSnap.snapShot('MenuShadow0240_2_SubMenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0240 end');
      Logger.info('Manual: Click second to last menu item to expand submenu');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0250
     * @tc.name   : Component function commomattributes menu shadowset
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0250', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0250 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuShadow/MenuShadow0250');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuShadow0250_1_Initial');
      
      const sideButton = await driver.findComponent(ON.id('MenuShadow0250_SideButton'));
      if (sideButton) {
        await sideButton.longClick();
        Logger.info('SubMenu side_expand opened');
        await driver.delayMs(2000);
        await windowSnap.snapShot('MenuShadow0250_2_SubMenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0250 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0260
     * @tc.name   : Component function commomattributes menu shadowset
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0260', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0260 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuShadow/MenuShadow0260');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuShadow0260_1_Initial');
      
      const stackButton = await driver.findComponent(ON.id('MenuShadow0260_StackButton'));
      if (stackButton) {
        await stackButton.longClick();
        Logger.info('SubMenu stack_expand opened');
        await driver.delayMs(2000);
        await windowSnap.snapShot('MenuShadow0260_2_SubMenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0260 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0270
     * @tc.name   : Component function commomattributes menu shadowset
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0270', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0270 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuShadow/MenuShadow0270');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuShadow0270_1_Initial');
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0270 end');
      Logger.info('Manual test required: Right-click on button to show web menu');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0280
     * @tc.name   : Component function commomattributes menu shadowset
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0280', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0280 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuShadow/MenuShadow0280');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuShadow0280_1_Initial');
      
      const subWindowButton = await driver.findComponent(ON.id('MenuShadow0280_SubWindowButton'));
      if (subWindowButton) {
        await subWindowButton.click();
        Logger.info('SubWindow menu opened - dark mode');
        await driver.delayMs(2000);
        await windowSnap.snapShot('MenuShadow0280_2_SubWindowMenu');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0280 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0290
     * @tc.name   : Component function commomattributes menu shadowset
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0290', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0290 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuShadow/MenuShadow0290');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuShadow0290_1_Initial');
      
      const selectComponent = await driver.findComponent(ON.id('MenuShadow0290_Select'));
      if (selectComponent) {
        await selectComponent.click();
        Logger.info('Select dropdown opened - dark mode');
        await driver.delayMs(2000);
        await windowSnap.snapShot('MenuShadow0290_2_SelectOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0290 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0300
     * @tc.name   : Component function commomattributes menu shadowset
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0300', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0300 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuShadow/MenuShadow0300');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuShadow0300_1_Initial');
      
      const noArrowButton = await driver.findComponent(ON.id('MenuShadow0300_NoArrowButton'));
      if (noArrowButton) {
        await noArrowButton.click();
        Logger.info('Menu without arrow opened - dark mode');
        await driver.delayMs(2000);
        await windowSnap.snapShot('MenuShadow0300_2_MenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0300 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0310
     * @tc.name   : Component function commomattributes menu shadowset
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0310', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0310 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuShadow/MenuShadow0310');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuShadow0310_1_Initial');
      
      const arrowButton = await driver.findComponent(ON.id('MenuShadow0310_ArrowButton'));
      if (arrowButton) {
        await arrowButton.click();
        Logger.info('Menu with arrow opened - dark mode');
        await driver.delayMs(2000);
        await windowSnap.snapShot('MenuShadow0310_2_MenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0310 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0320
     * @tc.name   : Component function commomattributes menu shadowset
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0320', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0320 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuShadow/MenuShadow0320');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuShadow0320_1_Initial');
      
      const previewButton = await driver.findComponent(ON.id('MenuShadow0320_PreviewButton'));
      if (previewButton) {
        await previewButton.longClick();
        Logger.info('Menu with preview opened - dark mode');
        await driver.delayMs(2000);
        await windowSnap.snapShot('MenuShadow0320_2_MenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0320 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0330
     * @tc.name   : Component function commomattributes menu shadowset
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0330', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0330 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuShadow/MenuShadow0330');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuShadow0330_1_Initial');
      
      const embededButton = await driver.findComponent(ON.id('MenuShadow0330_EmbededButton'));
      if (embededButton) {
        await embededButton.longClick();
        Logger.info('SubMenu embeded_expand opened - dark mode');
        await driver.delayMs(2000);
        await windowSnap.snapShot('MenuShadow0330_2_SubMenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0330 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0340
     * @tc.name   : Component function commomattributes menu shadowset
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0340', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0340 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuShadow/MenuShadow0340');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuShadow0340_1_Initial');
      
      const sideButton = await driver.findComponent(ON.id('MenuShadow0340_SideButton'));
      if (sideButton) {
        await sideButton.longClick();
        Logger.info('SubMenu side_expand opened - dark mode');
        await driver.delayMs(2000);
        await windowSnap.snapShot('MenuShadow0340_2_SubMenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0340 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0350
     * @tc.name   : Component function commomattributes menu shadowset
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0350', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0350 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuShadow/MenuShadow0350');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuShadow0350_1_Initial');
      
      const stackButton = await driver.findComponent(ON.id('MenuShadow0350_StackButton'));
      if (stackButton) {
        await stackButton.longClick();
        Logger.info('SubMenu stack_expand opened - dark mode');
        await driver.delayMs(2000);
        await windowSnap.snapShot('MenuShadow0350_2_SubMenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0350 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0360
     * @tc.name   : Component function commomattributes menu shadowset
     * @tc.desc   : Verify component function commomattributes menu shadowset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0360', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0360 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuShadow/MenuShadow0360');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuShadow0360_1_Initial');
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0360 end');
      Logger.info('Manual test required: Right-click on button to show web menu (dark mode)');
    });
  });
}
