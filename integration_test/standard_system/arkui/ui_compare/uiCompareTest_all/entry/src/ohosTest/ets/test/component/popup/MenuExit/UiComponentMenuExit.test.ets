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

export default function uiComponentMenuExit() {
  describe('uiComponentMenuExit', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0010
     * @tc.name   : Component function commomattributes menu exitlogicoptimization
     * @tc.desc   : Verify component function commomattributes menu exitlogicoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0010', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0010 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuExit/MenuExitLogic0010');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 长按弹出菜单
      const triggerBtn = await driver.findComponent(ON.id('triggerBtn'));
      if (triggerBtn) {
        await triggerBtn.longClick();
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuExitLogic0010_menu_shown');
        
        // 点击关闭按钮测试主动关闭
        const closeBtn = await driver.findComponent(ON.id('closeBtn'));
        if (closeBtn) {
          await closeBtn.click();
          await driver.delayMs(500);
          await windowSnap.snapShot('MenuExitLogic0010_menu_closed');
        }
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0010 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0020
     * @tc.name   : Component function commomattributes menu exitlogicoptimization
     * @tc.desc   : Verify component function commomattributes menu exitlogicoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0020', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0020 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuExit/MenuExitLogic0020');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 长按弹出菜单
      const triggerBtn = await driver.findComponent(ON.id('triggerBtn'));
      if (triggerBtn) {
        await triggerBtn.longClick();
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuExitLogic0020_menu_shown');
        // 注：点击状态栏/导航条需要手动测试
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0020 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0030
     * @tc.name   : Component function commomattributes menu exitlogicoptimization
     * @tc.desc   : Verify component function commomattributes menu exitlogicoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0030', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0030 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuExit/MenuExitLogic0030');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 长按弹出菜单
      const triggerBtn = await driver.findComponent(ON.id('triggerBtn'));
      if (triggerBtn) {
        await triggerBtn.longClick();
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuExitLogic0030_menu_shown');
        
        // 点击菜单项测试关闭
        const menuItem1 = await driver.findComponent(ON.text('菜单项1'));
        if (menuItem1) {
          await menuItem1.click();
          await driver.delayMs(500);
          await windowSnap.snapShot('MenuExitLogic0030_item_clicked');
        }
      }
      // 注：熄屏、退后台、旋转等需要手动测试
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0030 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0050
     * @tc.name   : Component function commomattributes menu exitlogicoptimization
     * @tc.desc   : Verify component function commomattributes menu exitlogicoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0050', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0050 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuExit/MenuExitLogic0050');
      const driver = Driver.create();
      await driver.delayMs(1000);
      await windowSnap.snapShot('MenuExitLogic0050');
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0050 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0060
     * @tc.name   : Component function commomattributes menu exitlogicoptimization
     * @tc.desc   : Verify component function commomattributes menu exitlogicoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0060', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0060 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuExit/MenuExitLogic0060');
      const driver = Driver.create();
      await driver.delayMs(1000);
      await windowSnap.snapShot('MenuExitLogic0060');
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0060 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0070
     * @tc.name   : Component function commomattributes menu exitlogicoptimization
     * @tc.desc   : Verify component function commomattributes menu exitlogicoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0070', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0070 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuExit/MenuExitLogic0070');
      const driver = Driver.create();
      await driver.delayMs(1000);
      await windowSnap.snapShot('MenuExitLogic0070');
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0070 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0080
     * @tc.name   : Component function commomattributes menu exitlogicoptimization
     * @tc.desc   : Verify component function commomattributes menu exitlogicoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0080', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0080 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuExit/MenuExitLogic0080');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 右键弹出菜单（模拟为长按）
      const triggerBtn = await driver.findComponent(ON.id('triggerBtn'));
      if (triggerBtn) {
        await triggerBtn.longClick();
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuExitLogic0080_menu_shown');
        
        // 销毁目标节点
        const destroyBtn = await driver.findComponent(ON.id('destroyBtn'));
        if (destroyBtn) {
          await destroyBtn.click();
          await driver.delayMs(500);
          await windowSnap.snapShot('MenuExitLogic0080_node_destroyed');
        }
      }
      
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0080 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0090
     * @tc.name   : Component function commomattributes menu exitlogicoptimization
     * @tc.desc   : Verify component function commomattributes menu exitlogicoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0090', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0090 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuExit/MenuExitLogic0090');
      const driver = Driver.create();
      await driver.delayMs(1000);
      const triggerBtn = await driver.findComponent(ON.id('triggerBtn'));
      if (triggerBtn) {
        await triggerBtn.click();
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuExitLogic0090');
      }
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0090 end');
    });
  });
}
