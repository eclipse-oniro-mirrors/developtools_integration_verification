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

export default function uiComponentMenuExitBatch3Test() {
  describe('uiComponentMenuExitBatch3Test', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0100
     * @tc.name   : Component function commomattributes menu exitlogicoptimization
     * @tc.desc   : Verify component function commomattributes menu exitlogicoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0100', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0100 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuExit/MenuExitLogic0100');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 截图1: 初始状态
      await windowSnap.snapShot('MenuExitLogic0100_1_Initial');
      
      // 点击按钮打开菜单
      const button = await driver.findComponent(ON.id('MenuExitLogic0100_DestroyButton'));
      if (button) {
        await button.click();
        Logger.info('Button clicked, menu should open');
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuExitLogic0100_2_MenuOpen');
        
        // 等待5秒，按钮和菜单应该销毁
        Logger.info('Waiting 5 seconds for button destroy');
        await driver.delayMs(5500);
        await windowSnap.snapShot('MenuExitLogic0100_3_AfterDestroy');
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0100 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0110
     * @tc.name   : Component function commomattributes menu exitlogicoptimization
     * @tc.desc   : Verify component function commomattributes menu exitlogicoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0110', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0110 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuExit/MenuExitLogic0110');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuExitLogic0110_1_Initial');
      
      // 测试1: 点击按钮打开菜单
      const openButton = await driver.findComponent(ON.id('MenuExitLogic0110_OpenButton'));
      if (openButton) {
        await openButton.click();
        Logger.info('Test 1: Menu opened');
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuExitLogic0110_2_MenuOpen');
        
        // 测试2: 点击菜单项1关闭
        const menuItem1 = await driver.findComponent(ON.id('MenuExitLogic0110_MenuItem1'));
        if (menuItem1) {
          await menuItem1.click();
          Logger.info('Menu item 1 clicked');
        } else {
          // 如果找不到菜单项，点击蒙层关闭
          await driver.click(500, 100);
          Logger.info('Clicked mask to close menu');
        }
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuExitLogic0110_3_AfterMenuItem1');
        
        // 测试3: 主动关闭isShow
        await openButton.click();
        await driver.delayMs(1000);
        
        const closeButton = await driver.findComponent(ON.id('MenuExitLogic0110_CloseButton'));
        if (closeButton) {
          await closeButton.click();
          Logger.info('Close button clicked');
        }
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuExitLogic0110_4_AfterCloseButton');
      }
      // 注：熄屏、旋转、手势等需要手动测试
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0110 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0120
     * @tc.name   : Component function commomattributes menu exitlogicoptimization
     * @tc.desc   : Verify component function commomattributes menu exitlogicoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0120', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0120 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuExit/MenuExitLogic0120');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuExitLogic0120_1_Initial');
      
      // 点击按钮打开菜单
      const button = await driver.findComponent(ON.id('MenuExitLogic0120_DestroyButton'));
      if (button) {
        await button.click();
        Logger.info('Button clicked, menu should open');
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuExitLogic0120_2_MenuOpen');
        
        // 等待5秒，按钮和菜单应该销毁
        Logger.info('Waiting 5 seconds for button destroy');
        await driver.delayMs(5500);
        await windowSnap.snapShot('MenuExitLogic0120_3_AfterDestroy');
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0120 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0130
     * @tc.name   : Component function commomattributes menu exitlogicoptimization
     * @tc.desc   : Verify component function commomattributes menu exitlogicoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0130', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0130 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuExit/MenuExitLogic0130');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuExitLogic0130_1_Initial');
      
      // 长按按钮打开上下文菜单
      const button = await driver.findComponent(ON.id('MenuExitLogic0130_ContextMenuButton'));
      if (button) {
        await button.longClick();
        Logger.info('Button long clicked, context menu should open');
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuExitLogic0130_2_MenuOpen');
        
        // 点击模拟关闭按钮
        const closeButton = await driver.findComponent(ON.id('MenuExitLogic0130_CloseButton'));
        if (closeButton) {
          await closeButton.click();
          Logger.info('Close button clicked');
        }
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuExitLogic0130_3_AfterCloseButton');
      }
      // 注：ContextMenu.close() API在当前SDK版本可能不可用
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0130 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0140
     * @tc.name   : Component function commomattributes menu exitlogicoptimization
     * @tc.desc   : Verify component function commomattributes menu exitlogicoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0140', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0140 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuExit/MenuExitLogic0140');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuExitLogic0140_1_Initial');
      
      // 长按按钮打开上下文菜单
      const button = await driver.findComponent(ON.id('MenuExitLogic0140_ContextMenuButton'));
      if (button) {
        await button.longClick();
        Logger.info('Button long clicked, context menu should open');
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuExitLogic0140_2_MenuOpen');
      }
      // 注：点击状态栏/导航条需要手动测试
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0140 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0150
     * @tc.name   : Component function commomattributes menu exitlogicoptimization
     * @tc.desc   : Verify component function commomattributes menu exitlogicoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0150', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0150 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuExit/MenuExitLogic0150');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuExitLogic0150_1_Initial');
      
      // 长按按钮打开菜单
      const contextButton = await driver.findComponent(ON.id('MenuExitLogic0150_ContextMenuButton'));
      if (contextButton) {
        await contextButton.longClick();
        Logger.info('Context menu opened');
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuExitLogic0150_2_MenuOpen');
        
        // 点击菜单项1关闭
        const menuItem1 = await driver.findComponent(ON.id('MenuExitLogic0150_MenuItem1'));
        if (menuItem1) {
          await menuItem1.click();
          Logger.info('Menu item 1 clicked');
        } else {
          // 如果找不到菜单项，点击蒙层关闭
          await driver.click(500, 100);
          Logger.info('Clicked mask to close menu');
        }
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuExitLogic0150_3_AfterMenuItem1');
      }
      // 注：熄屏、旋转、手势等需要手动测试
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0150 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0160
     * @tc.name   : Component function commomattributes menu exitlogicoptimization
     * @tc.desc   : Verify component function commomattributes menu exitlogicoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0160', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0160 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuExit/MenuExitLogic0160');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('MenuExitLogic0160_1_Initial');
      
      // 长按按钮打开上下文菜单
      const button = await driver.findComponent(ON.id('MenuExitLogic0160_DestroyButton'));
      if (button) {
        await button.longClick();
        Logger.info('Button long clicked, context menu should open');
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuExitLogic0160_2_MenuOpen');
        
        // 等待5秒，按钮和菜单应该销毁
        Logger.info('Waiting 5 seconds for button destroy');
        await driver.delayMs(5500);
        await windowSnap.snapShot('MenuExitLogic0160_3_AfterDestroy');
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0160 end');
    });
  });
}