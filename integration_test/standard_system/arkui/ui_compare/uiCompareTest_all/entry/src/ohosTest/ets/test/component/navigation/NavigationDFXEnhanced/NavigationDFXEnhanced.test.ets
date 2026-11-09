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

export default function navigationDFXEnhanced() {
  describe('navigationDFXEnhanced', () => {

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : NavigationRouterTestLevel3_SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DUMPDFX_0510
     * @tc.name   : NavigationRouterTestLevel3_SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DUMPDFX_0510
     * @tc.desc   : Verify navigationroutertestlevel3 sub ace ui component nav navigation dumpdfx interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('NavigationRouterTestLevel3_SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DUMPDFX_0510', 0, async () => {
      Logger.info('NavigationRouterTestLevel3_SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DUMPDFX_0510 begin');
      await Settings.createWindow('testability/pages/component/navigation/NavigationDFXEnhanced/NavigationDFX0510');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('NavigationDFX0510_1_Initial');
      
      // Step 1: Push pageOne
      const pushPageOneBtn = await driver.findComponent(ON.id('NavigationDFX0510_PushPageOne'));
      if (pushPageOneBtn) {
        await pushPageOneBtn.click();
        Logger.info('Step 1: Pushed pageOne');
        await driver.delayMs(1000);
        await windowSnap.snapShot('NavigationDFX0510_2_PageOnePushed');
      }
      
      // Step 2: Push pageTwo
      await driver.pressBack();
      await driver.delayMs(500);
      const pushPageTwoBtn = await driver.findComponent(ON.id('NavigationDFX0510_PushPageTwo'));
      if (pushPageTwoBtn) {
        await pushPageTwoBtn.click();
        Logger.info('Step 2: Pushed pageTwo');
        await driver.delayMs(1000);
        await windowSnap.snapShot('NavigationDFX0510_3_PageTwoPushed');
      }
      
      // Step 3: Move pageOne to top
      await driver.pressBack();
      await driver.delayMs(500);
      const moveToTopBtn = await driver.findComponent(ON.id('NavigationDFX0510_MoveToTop'));
      if (moveToTopBtn) {
        await moveToTopBtn.click();
        Logger.info('Step 3: Moved pageOne to top - Check hilog for DFX logs');
        await driver.delayMs(1500);
        await windowSnap.snapShot('NavigationDFX0510_4_MoveToTop');
      }
      
      // Step 4: Move index 0 to top
      await driver.pressBack();
      await driver.delayMs(500);
      const moveIndexBtn = await driver.findComponent(ON.id('NavigationDFX0510_MoveIndexToTop'));
      if (moveIndexBtn) {
        await moveIndexBtn.click();
        Logger.info('Step 4: Moved index 0 to top - Check hilog for DFX logs');
        await driver.delayMs(1500);
        await windowSnap.snapShot('NavigationDFX0510_5_MoveIndexToTop');
      }
      
      Logger.info('NavigationRouterTestLevel3_SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DUMPDFX_0510 end');
      Logger.info('Manual verification: Check hilog for:');
      Logger.info('- sync with js stack, id: NavigationID, UINodeId: xx, preStackSize: 2, newStackSize: 2');
      Logger.info('- transition start, disableAllAnimation: 0, animated: 1, isPopPage: 0...');
    });
  });
}
