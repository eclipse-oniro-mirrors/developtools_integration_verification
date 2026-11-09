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

export default function uiComponentTextinputSearchFocus() {
  describe('uiComponentTextinputSearchFocus', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_SEARCH_TV_FOCUS_0310
     * @tc.name   : TextinputSearchFocus0310
     * @tc.desc   : Verify textinput search tv focus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_SEARCH_TV_FOCUS_0310', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_TEXTINPUT_SEARCH_TV_FOCUS_0310 begin');
      
      await Settings.createWindow('testability/pages/component/text_input/TextinputSearchFocus/TextinputSearchFocus0310');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击TextInput获取焦点
      const textInput = await driver.findComponent(ON.id('textInput'));
      if (textInput) {
        await textInput.click();
        await driver.delayMs(500);
      }
      
      // 点击Search获取焦点
      const searchInput = await driver.findComponent(ON.id('searchInput'));
      if (searchInput) {
        await searchInput.click();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('TEXTINPUT_SEARCH_TV_FOCUS_0310');
      
      Logger.info('SUB_ACE_UI_COMPONENT_TEXTINPUT_SEARCH_TV_FOCUS_0310 end');
    });
  });
}
