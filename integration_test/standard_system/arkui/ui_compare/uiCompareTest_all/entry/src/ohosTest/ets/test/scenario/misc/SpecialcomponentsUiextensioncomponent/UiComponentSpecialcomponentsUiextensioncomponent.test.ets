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

export default function uiComponentSpecialcomponentsUiextensioncomponent() {
  describe('uiComponentSpecialcomponentsUiextensioncomponent', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_AREACHANGEPLACEHOLDER_0070
     * @tc.name   : AreachangePlaceholder0070
     * @tc.desc   : Verify special components UIExtensionComponent areachangeplaceholder interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_AREACHANGEPLACEHOLDER_0070', 0, async () => {
      Logger.info('AREACHANGEPLACEHOLDER_0070 begin');
      
      await Settings.createWindow('testability/pages/scenario/misc/SpecialcomponentsUiextensioncomponent/AreachangePlaceholder0070');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 测试Size+按钮
      const sizePlusBtn = await driver.findComponent(ON.id('btn_size_plus'));
      if (sizePlusBtn) {
        await sizePlusBtn.click();
        await driver.delayMs(500);
      }
      
      // 测试模拟折叠屏展开
      const foldExpandBtn = await driver.findComponent(ON.id('btn_fold_expand'));
      if (foldExpandBtn) {
        await foldExpandBtn.click();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('AREACHANGEPLACEHOLDER_0070');
      Logger.info('AREACHANGEPLACEHOLDER_0070 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_DPI_0010
     * @tc.name   : Dpi0010
     * @tc.desc   : Verify special components UIExtensionComponent dpi interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_DPI_0010', 0, async () => {
      Logger.info('DPI_0010 begin');
      
      await Settings.createWindow('testability/pages/scenario/misc/SpecialcomponentsUiextensioncomponent/Dpi0010');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('DPI_0010');
      Logger.info('DPI_0010 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_DPI_0020
     * @tc.name   : Dpi0020
     * @tc.desc   : Verify special components UIExtensionComponent dpi interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_DPI_0020', 0, async () => {
      Logger.info('DPI_0020 begin');
      
      await Settings.createWindow('testability/pages/scenario/misc/SpecialcomponentsUiextensioncomponent/Dpi0020');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('DPI_0020');
      Logger.info('DPI_0020 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_DPI_0040
     * @tc.name   : Dpi0040
     * @tc.desc   : Verify special components UIExtensionComponent dpi interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_DPI_0040', 0, async () => {
      Logger.info('DPI_0040 begin');
      
      await Settings.createWindow('testability/pages/scenario/misc/SpecialcomponentsUiextensioncomponent/Dpi0040');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('DPI_0040');
      Logger.info('DPI_0040 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_PLACEHOLDER_0010
     * @tc.name   : Placeholder0010
     * @tc.desc   : Verify special components UIExtensionComponent placeholder interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_PLACEHOLDER_0010', 0, async () => {
      Logger.info('PLACEHOLDER_0010 begin');
      
      await Settings.createWindow('testability/pages/scenario/misc/SpecialcomponentsUiextensioncomponent/Placeholder0010');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('PLACEHOLDER_0010');
      Logger.info('PLACEHOLDER_0010 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_WINDOW_MODE_0006
     * @tc.name   : WindowMode0006
     * @tc.desc   : Verify special components UIExtensionComponent window mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_WINDOW_MODE_0006', 0, async () => {
      Logger.info('WINDOW_MODE_0006 begin');
      
      await Settings.createWindow('testability/pages/scenario/misc/SpecialcomponentsUiextensioncomponent/WindowMode0006');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击测试按钮
      const testBtn = await driver.findComponent(ON.id('btn_test_window_mode'));
      if (testBtn) {
        await testBtn.click();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('WINDOW_MODE_0006');
      Logger.info('WINDOW_MODE_0006 end');
    });
  });
}
