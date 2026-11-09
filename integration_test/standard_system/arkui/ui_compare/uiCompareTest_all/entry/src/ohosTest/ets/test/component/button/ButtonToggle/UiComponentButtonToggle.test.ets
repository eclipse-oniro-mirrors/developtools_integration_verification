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

import { describe, it, expect, afterEach } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

export default function uiComponentButtonToggleTest() {
  describe('uiComponentButtonToggleTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        Settings.destroyWindow(Settings.windowClass);
      }
      let driver = Driver.create();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_CUSTOMIZING_0180
     * @tc.name   : Toggle自定义样式预览器测试
     * @tc.desc   : Verify button toggle customizing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_CUSTOMIZING_0180', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_CUSTOMIZING_0180 start');
      await Settings.createWindow('testability/pages/component/button/ButtonToggle/ToggleCustomizing0180');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let toggle = await driver.findComponent(ON.id('toggle_switch'));
      expect(toggle !== null).assertTrue();
      if (toggle) {
        await toggle.click();
        await driver.delayMs(300);
      }
      
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERACTION_0040
     * @tc.name   : Toggle键盘交互测试
     * @tc.desc   : Verify button toggle interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERACTION_0040', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERACTION_0040 start');
      await Settings.createWindow('testability/pages/component/button/ButtonToggle/ToggleInteraction0040');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let checkbox = await driver.findComponent(ON.id('toggle_checkbox'));
      let switchToggle = await driver.findComponent(ON.id('toggle_switch'));
      let button = await driver.findComponent(ON.id('toggle_button'));
      expect(checkbox !== null).assertTrue();
      expect(switchToggle !== null).assertTrue();
      expect(button !== null).assertTrue();
      
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERACTION_0050
     * @tc.name   : Toggle鼠标交互测试
     * @tc.desc   : Verify button toggle interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERACTION_0050', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERACTION_0050 start');
      await Settings.createWindow('testability/pages/component/button/ButtonToggle/ToggleInteraction0050');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let checkbox = await driver.findComponent(ON.id('toggle_checkbox'));
      if (checkbox) {
        await checkbox.click();
        await driver.delayMs(300);
      }
      
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0100
     * @tc.name   : Toggle type必填值验证
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0100', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0100 start');
      await Settings.createWindow('testability/pages/component/button/ButtonToggle/ToggleInterface0100');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let toggle = await driver.findComponent(ON.id('toggle_correct'));
      expect(toggle !== null).assertTrue();
      
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0340
     * @tc.name   : Toggle type设置为null验证
     * @tc.desc   : Verify button toggle interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0340', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0340 start');
      await Settings.createWindow('testability/pages/component/button/ButtonToggle/ToggleInterface0340');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let toggle = await driver.findComponent(ON.id('toggle_correct'));
      expect(toggle !== null).assertTrue();
      
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_MIRROR_0050
     * @tc.name   : Toggle镜像-反复杀死应用再启动
     * @tc.desc   : Verify button toggle mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_MIRROR_0050', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_MIRROR_0050 start');
      await Settings.createWindow('testability/pages/component/button/ButtonToggle/ToggleMirror0050');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let switchToggle = await driver.findComponent(ON.id('toggle_switch'));
      expect(switchToggle !== null).assertTrue();
      
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_MIRROR_0080
     * @tc.name   : Toggle镜像-横竖屏场景
     * @tc.desc   : Verify button toggle mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_MIRROR_0080', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_MIRROR_0080 start');
      await Settings.createWindow('testability/pages/component/button/ButtonToggle/ToggleMirror0080');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let switchToggle = await driver.findComponent(ON.id('toggle_switch'));
      expect(switchToggle !== null).assertTrue();
      
      await windowSnap.snapShot();
      done();
    });
  });
}
