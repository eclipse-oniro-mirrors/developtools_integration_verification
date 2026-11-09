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

export default function uiComponentNavNavigationServiceQuit() {
  describe('uiComponentNavNavigationServiceQuit', () => {
    const TAG: string = 'uiComponentNavNavigationServiceQuit';
    let driver = Driver.create();

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0020
     * @tc.name   : 元服务单Page无Navigation场景 + OnBackpress return false
     * @tc.desc   : Verify nav navigation featuretest service quit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0020', 0, async () => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavigationServiceQuit/ServiceQuit0020');
      await driver.delayMs(500);
      
      // 点击"隐藏navigation"按钮
      let hideBtn = await driver.findComponent(ON.id('btn'));
      await hideBtn.click();
      await driver.delayMs(500);
      
      // 点击"index:onbackpress返回值true"按钮
      let backpressBtn = await driver.findComponent(ON.text('index:onbackpress返回值true'));
      await backpressBtn.click();
      await driver.delayMs(500);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0020: Navigation隐藏，onBackPress测试');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0020');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0070
     * @tc.name   : 元服务单Page，Stack模式Navigation栈数>1
     * @tc.desc   : Verify nav navigation featuretest service quit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0070', 0, async () => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavigationServiceQuit/ServiceQuit0070');
      await driver.delayMs(500);
      
      // 点击"stack"按钮
      let stackBtn = await driver.findComponent(ON.id('btn'));
      await stackBtn.click();
      await driver.delayMs(300);
      
      // 点击"push Page01"按钮两次
      let pushBtn = await driver.findComponent(ON.text('push Page01'));
      await pushBtn.click();
      await driver.delayMs(300);
      await pushBtn.click();
      await driver.delayMs(300);
      
      // 点击"模拟侧滑返回"按钮（应该成功返回）
      let backBtn = await driver.findComponent(ON.text('模拟侧滑返回'));
      await backBtn.click();
      await driver.delayMs(500);
      
      // 点击设置onBackPress为false
      let onbackpressBtn = await driver.findComponent(ON.text('navigationPage01,onbackpress返回值:false'));
      await onbackpressBtn.click();
      await driver.delayMs(300);
      
      // 再次push
      await pushBtn.click();
      await driver.delayMs(300);
      
      // 尝试侧滑返回（此时onBackPress=false，应该成功）
      await backBtn.click();
      await driver.delayMs(500);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0070: Stack模式Navigation栈测试完成');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0070');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0080
     * @tc.name   : 元服务单Page，Split模式Navigation栈数>1
     * @tc.desc   : Verify nav navigation featuretest service quit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0080', 0, async () => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavigationServiceQuit/ServiceQuit0080');
      await driver.delayMs(500);
      
      // 点击"split"按钮
      let splitBtn = await driver.findComponent(ON.id('btn'));
      await splitBtn.click();
      await driver.delayMs(300);
      
      // 点击"push Page01"按钮两次
      let pushBtn = await driver.findComponent(ON.text('push Page01'));
      await pushBtn.click();
      await driver.delayMs(300);
      await pushBtn.click();
      await driver.delayMs(300);
      
      // 点击"模拟侧滑返回"按钮
      let backBtn = await driver.findComponent(ON.text('模拟侧滑返回'));
      await backBtn.click();
      await driver.delayMs(500);
      
      // 点击设置onBackPress为false
      let onbackpressBtn = await driver.findComponent(ON.text('navigationPage01,onbackpress返回值:false'));
      await onbackpressBtn.click();
      await driver.delayMs(300);
      
      // 再次push
      await pushBtn.click();
      await driver.delayMs(300);
      
      // 尝试侧滑返回
      await backBtn.click();
      await driver.delayMs(500);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0080: Split模式Navigation栈测试完成');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0080');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0090
     * @tc.name   : 元服务单Page,Stack模式Navigation + OnBackpress return true
     * @tc.desc   : Verify nav navigation featuretest service quit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0090', 0, async () => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavigationServiceQuit/ServiceQuit0090');
      await driver.delayMs(500);
      
      // 点击"stack"按钮
      let stackBtn = await driver.findComponent(ON.id('btn'));
      await stackBtn.click();
      await driver.delayMs(300);
      
      // 点击"index:onbackpress返回值true"按钮
      let backpressBtn = await driver.findComponent(ON.text('index:onbackpress返回值true'));
      await backpressBtn.click();
      await driver.delayMs(300);
      
      // 点击"模拟侧滑返回"按钮
      let backBtn = await driver.findComponent(ON.text('模拟侧滑返回'));
      await backBtn.click();
      await driver.delayMs(500);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0090: Stack模式，onBackPress=true，元服务退出');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0090');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0100
     * @tc.name   : 元服务单Page,Split模式Navigation + OnBackpress return true
     * @tc.desc   : Verify nav navigation featuretest service quit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0100', 0, async () => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavigationServiceQuit/ServiceQuit0100');
      await driver.delayMs(500);
      
      // 点击"split"按钮
      let splitBtn = await driver.findComponent(ON.id('btn'));
      await splitBtn.click();
      await driver.delayMs(300);
      
      // 点击"index:onbackpress返回值true"按钮
      let backpressBtn = await driver.findComponent(ON.text('index:onbackpress返回值true'));
      await backpressBtn.click();
      await driver.delayMs(300);
      
      // 点击"模拟侧滑返回"按钮
      let backBtn = await driver.findComponent(ON.text('模拟侧滑返回'));
      await backBtn.click();
      await driver.delayMs(500);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0100: Split模式，onBackPress=true，元服务退出');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0100');
    });
  });
}
