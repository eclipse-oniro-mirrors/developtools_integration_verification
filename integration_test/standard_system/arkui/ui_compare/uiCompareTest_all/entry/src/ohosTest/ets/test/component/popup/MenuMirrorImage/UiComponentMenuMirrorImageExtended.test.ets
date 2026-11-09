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

export default function uiComponentMenuMirrorImageExtended() {
  describe('uiComponentMenuMirrorImageExtended', () => {

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0170
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0170', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0170 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0170');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0170_1_Initial');
      
      // 长按触发菜单
      const longPressButton = await driver.findComponent(ON.id('MenuMirrorImage0170_LongPressButton'));
      if (longPressButton) {
        await longPressButton.longClick();
        Logger.info('Uyghur + Auto test - Long press menu');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0170_2_LongPressMenu');
        
        // 点击菜单项1
        const menuItem1 = await driver.findComponent(ON.id('MenuMirrorImage0170_MenuItem1'));
        if (menuItem1) {
          await menuItem1.click();
          await driver.delayMs(500);
        }
      }
      
      // 测试自定义内容按钮
      await driver.delayMs(500);
      const customButton = await driver.findComponent(ON.id('MenuMirrorImage0170_CustomButton'));
      if (customButton) {
        await customButton.longClick();
        Logger.info('Custom content menu (no mirror support)');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0170_3_CustomContent');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0170 end');
      Logger.info('Manual test: Right-click on RightClickButton to verify menu');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0180
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0180', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0180 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0180');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0180_1_Initial');
      
      const longPressButton = await driver.findComponent(ON.id('MenuMirrorImage0180_LongPressButton'));
      if (longPressButton) {
        await longPressButton.longClick();
        Logger.info('Uyghur + Ltr test');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0180_2_MenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0180 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0190
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0190', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0190 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0190');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0190_1_Initial');
      
      const longPressButton = await driver.findComponent(ON.id('MenuMirrorImage0190_LongPressButton'));
      if (longPressButton) {
        await longPressButton.longClick();
        Logger.info('Uyghur + Rtl test (mirrored layout)');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0190_2_MenuOpen_Rtl');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0190 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0200
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0200', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0200 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0200');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0200_1_Initial');
      
      const longPressButton = await driver.findComponent(ON.id('MenuMirrorImage0200_LongPressButton'));
      if (longPressButton) {
        await longPressButton.longClick();
        Logger.info('Uyghur + undefined test');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0200_2_MenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0200 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0210
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0210', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0210 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0210');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0210_1_Initial');
      
      // 测试bindMenu options
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0210_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('SimplifiedChinese + Auto test - bindMenu options');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0210_2_OptionsMenu');
        
        // 点击菜单项
        const menuItem1 = await driver.findComponent(ON.id('MenuMirrorImage0210_MenuItem1'));
        if (menuItem1) {
          await menuItem1.click();
          await driver.delayMs(500);
        } else {
          // 如果找不到菜单项，点击屏幕关闭菜单
          await driver.click(500, 100);
        }
      }
      
      // 测试bindMenu builder
      await driver.delayMs(500);
      const builderButton = await driver.findComponent(ON.id('MenuMirrorImage0210_BuilderButton'));
      if (builderButton) {
        await builderButton.click();
        Logger.info('bindMenu custom builder');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0210_3_BuilderMenu');
        await driver.click(500, 100);
      }
      
      // 测试自定义内容
      await driver.delayMs(500);
      const customButton = await driver.findComponent(ON.id('MenuMirrorImage0210_CustomButton'));
      if (customButton) {
        await customButton.click();
        Logger.info('Custom content (no mirror support)');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0210_4_CustomContent');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0210 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0230
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0230', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0230 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0230');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0230_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0230_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('SimplifiedChinese + Rtl test (mirrored layout)');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0230_2_MenuOpen_Rtl');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0230 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0240
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0240', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0240 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0240');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0240_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0240_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('SimplifiedChinese + undefined test');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0240_2_MenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0240 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0260
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0260', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0260 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0260');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0260_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0260_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('TraditionalChinese + Ltr test');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0260_2_MenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0260 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0270
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0270', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0270 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0270');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0270_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0270_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('TraditionalChinese + Rtl test (mirrored)');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0270_2_MenuOpen_Rtl');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0270 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0280
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0280', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0280 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0280');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0280_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0280_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('TraditionalChinese + undefined test');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0280_2_MenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0280 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0290
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0290', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0290 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0290');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0290_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0290_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('English + Auto test');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0290_2_MenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0290 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0300
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0300', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0300 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0300');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0300_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0300_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('English + Ltr test');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0300_2_MenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0300 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0310
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0310', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0310 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0310');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0310_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0310_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('English + Rtl test (mirrored)');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0310_2_MenuOpen_Rtl');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0310 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0315
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0315', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0315 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0315');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0315_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0315_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('English + undefined test');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0315_2_MenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0315 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0320
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0320', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0320 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0320');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0320_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0320_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('TraditionalChinese + Auto test');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0320_2_MenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0320 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0330
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0330', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0330 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0330');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0330_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0330_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('Tibetan + Auto test');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0330_2_MenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0330 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0340
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0340', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0340 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0340');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0340_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0340_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('Tibetan + Ltr test');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0340_2_MenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0340 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0350
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0350', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0350 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0350');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0350_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0350_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('Tibetan + Rtl test (mirrored)');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0350_2_MenuOpen_Rtl');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0350 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0360
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0360', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0360 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0360');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0360_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0360_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('Tibetan + undefined test');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0360_2_MenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0360 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0370
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0370', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0370 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0370');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0370_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0370_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('Uyghur bindMenu + Auto test (RTL)');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0370_2_MenuOpen_Rtl');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0370 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0380
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0380', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0380 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0380');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0380_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0380_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('Uyghur bindMenu + Ltr test');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0380_2_MenuOpen');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0380 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0390
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0390', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0390 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0390');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0390_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0390_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('Uyghur bindMenu + Rtl test');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0390_2_MenuOpen_Rtl');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0390 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0400
     * @tc.name   : Component function commomattributes menu mirrorimag
     * @tc.desc   : Verify component function commomattributes menu mirrorimag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0400', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0400 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuMirrorImage/MenuMirrorImage0400');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuMirrorImage0400_1_Initial');
      
      const optionsButton = await driver.findComponent(ON.id('MenuMirrorImage0400_OptionsButton'));
      if (optionsButton) {
        await optionsButton.click();
        Logger.info('Uyghur bindMenu + undefined test');
        await driver.delayMs(1500);
        await windowSnap.snapShot('MenuMirrorImage0400_2_MenuOpen_Rtl');
        await driver.click(500, 100);
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0400 end');
    });
  });
}
