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

export default function uiComponentSearchTv() {
  describe('uiComponentSearchTv', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_TV_0400
     * @tc.name   : SearchTv0400
     * @tc.desc   : Verify search tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_TV_0400', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_SEARCH_TV_0400 begin');
      
      await Settings.createWindow('testability/pages/component/text_input/SearchTv/SearchTv0400');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      const searchInput = await driver.findComponent(ON.id('searchInput'));
      if (searchInput) {
        await searchInput.click();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('SEARCH_TV_0400');
      Logger.info('SUB_ACE_UI_COMPONENT_SEARCH_TV_0400 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_TV_0410
     * @tc.name   : SearchTv0410
     * @tc.desc   : Verify search tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_TV_0410', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_SEARCH_TV_0410 begin');
      
      await Settings.createWindow('testability/pages/component/text_input/SearchTv/SearchTv0410');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      const searchInput = await driver.findComponent(ON.id('searchInput'));
      if (searchInput) {
        await searchInput.click();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('SEARCH_TV_0410');
      Logger.info('SUB_ACE_UI_COMPONENT_SEARCH_TV_0410 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_TV_0470
     * @tc.name   : SearchTv0470
     * @tc.desc   : Verify search tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_TV_0470', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_SEARCH_TV_0470 begin');
      
      await Settings.createWindow('testability/pages/component/text_input/SearchTv/SearchTv0470');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('SEARCH_TV_0470');
      Logger.info('SUB_ACE_UI_COMPONENT_SEARCH_TV_0470 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_TV_0510
     * @tc.name   : SearchTv0510
     * @tc.desc   : Verify search tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_TV_0510', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_SEARCH_TV_0510 begin');
      
      await Settings.createWindow('testability/pages/component/text_input/SearchTv/SearchTv0510');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击Search输入框获取焦点
      const searchInput = await driver.findComponent(ON.id('searchInput'));
      if (searchInput) {
        await searchInput.click();
        await driver.delayMs(1000);
      }
      
      await windowSnap.snapShot('SEARCH_TV_0510');
      
      Logger.info('SUB_ACE_UI_COMPONENT_SEARCH_TV_0510 end');
    });
  });
}
