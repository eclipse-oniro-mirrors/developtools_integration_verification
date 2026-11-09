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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, Component } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit'

export default function menuStyleTest() {
  describe('menuStyleTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err: BusinessError) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_0760
     * @tc.name   : menu padding对divider margin的影响测试
     * @tc.desc   : Verify popupbox menu style enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_0760', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_0760 start.`);
      Settings.createWindow('testability/pages/component/popup/menu/menuPadding01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击触发菜单
      let triggerButton: Component = await driver.waitForComponent(ON.id('menu_trigger_01'), 1000);
      await triggerButton.click();
      await driver.waitForIdle(500, 1000);
      
      // 验证菜单是否弹出
      await driver.assertComponentExist(ON.id('menu_container_01'));
      
      // divider的margin效果通过截图验证
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_0760')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_0760 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1050
     * @tc.name   : 二级菜单按压态交互测试
     * @tc.desc   : Verify popupbox menu style enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1050 start.`);
      Settings.createWindow('testability/pages/component/popup/menu/menuHover01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击触发菜单
      let triggerButton: Component = await driver.waitForComponent(ON.id('menu_trigger_02'), 1000);
      await triggerButton.click();
      await driver.waitForIdle(500, 1000);
      
      // 验证菜单是否弹出
      await driver.assertComponentExist(ON.id('menu_container_02'));
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1050')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1010
     * @tc.name   : 二级菜单键盘走焦测试
     * @tc.desc   : Verify popupbox menu style enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1010 start.`);
      Settings.createWindow('testability/pages/component/popup/menu/menuKeyboard01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击触发菜单
      let triggerButton: Component = await driver.waitForComponent(ON.id('menu_trigger_03'), 1000);
      await triggerButton.click();
      await driver.waitForIdle(500, 1000);
      
      // 验证菜单是否弹出
      await driver.assertComponentExist(ON.id('menu_container_03'));
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1010')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1040
     * @tc.name   : 二级菜单手势交互测试
     * @tc.desc   : Verify popupbox menu style enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1040 start.`);
      Settings.createWindow('testability/pages/component/popup/menu/menuGesture01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击触发菜单
      let triggerButton: Component = await driver.waitForComponent(ON.id('menu_trigger_04'), 1000);
      await triggerButton.click();
      await driver.waitForIdle(500, 1000);
      
      // 验证菜单是否弹出
      await driver.assertComponentExist(ON.id('menu_container_04'));
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1040')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1020
     * @tc.name   : 二级菜单三种展开模式样式测试
     * @tc.desc   : Verify popupbox menu style enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1020 start.`);
      Settings.createWindow('testability/pages/component/popup/menu/menuExpand01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击触发菜单
      let triggerButton: Component = await driver.waitForComponent(ON.id('menu_trigger_05'), 1000);
      await triggerButton.click();
      await driver.waitForIdle(500, 1000);
      
      // 验证菜单是否弹出
      await driver.assertComponentExist(ON.id('menu_container_05'));
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1020')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_1020 finish.`);
      done()
    })
  })
}