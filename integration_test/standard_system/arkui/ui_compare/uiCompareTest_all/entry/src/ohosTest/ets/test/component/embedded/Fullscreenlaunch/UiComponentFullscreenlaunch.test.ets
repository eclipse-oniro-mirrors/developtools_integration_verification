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

export default function uiComponentFullscreenlaunch() {
  describe('uiComponentFullscreenlaunch', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_ONERROR_ONTERMINATED_0004
     * @tc.name   : FullscreenlaunchOnerror0004
     * @tc.desc   : Verify special components fullscreenlaunchcomponent onerror onterminated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_ONERROR_ONTERMINATED_0004', 0, async () => {
      Logger.info('FULLSCREENLAUNCHCOMPONENT_ONERROR_ONTERMINATED_0004 begin');
      
      await Settings.createWindow('testability/pages/component/embedded/Fullscreenlaunch/FullscreenlaunchOnerror0004');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 模拟触发onError回调
      const triggerBtn = await driver.findComponent(ON.id('triggerBtn'));
      if (triggerBtn) {
        await triggerBtn.click();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('FULLSCREENLAUNCHCOMPONENT_ONERROR_0004');
      
      Logger.info('FULLSCREENLAUNCHCOMPONENT_ONERROR_ONTERMINATED_0004 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_ONERROR_ONTERMINATED_0005
     * @tc.name   : FullscreenlaunchOnerror0005
     * @tc.desc   : Verify special components fullscreenlaunchcomponent onerror onterminated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_ONERROR_ONTERMINATED_0005', 0, async () => {
      Logger.info('FULLSCREENLAUNCHCOMPONENT_ONERROR_ONTERMINATED_0005 begin');
      
      await Settings.createWindow('testability/pages/component/embedded/Fullscreenlaunch/FullscreenlaunchOnerror0005');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 模拟触发onError回调
      const triggerBtn = await driver.findComponent(ON.id('triggerBtn'));
      if (triggerBtn) {
        await triggerBtn.click();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('FULLSCREENLAUNCHCOMPONENT_ONERROR_0005');
      
      Logger.info('FULLSCREENLAUNCHCOMPONENT_ONERROR_ONTERMINATED_0005 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_ONERROR_ONTERMINATED_0006
     * @tc.name   : FullscreenlaunchOnerror0006
     * @tc.desc   : Verify special components fullscreenlaunchcomponent onerror onterminated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_ONERROR_ONTERMINATED_0006', 0, async () => {
      Logger.info('FULLSCREENLAUNCHCOMPONENT_ONERROR_ONTERMINATED_0006 begin');
      
      await Settings.createWindow('testability/pages/component/embedded/Fullscreenlaunch/FullscreenlaunchOnerror0006');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 模拟触发onError回调
      const triggerBtn = await driver.findComponent(ON.id('triggerBtn'));
      if (triggerBtn) {
        await triggerBtn.click();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('FULLSCREENLAUNCHCOMPONENT_ONERROR_0006');
      
      Logger.info('FULLSCREENLAUNCHCOMPONENT_ONERROR_ONTERMINATED_0006 end');
    });
  });
}
