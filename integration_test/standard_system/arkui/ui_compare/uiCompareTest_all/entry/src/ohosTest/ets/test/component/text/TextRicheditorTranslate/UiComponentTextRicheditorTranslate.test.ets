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

export default function uiComponentTextRicheditorTranslate() {
  describe('uiComponentTextRicheditorTranslate', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TRANSLATE_0003
     * @tc.name   : RicheditorTranslate0003
     * @tc.desc   : Verify text richeditor translate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TRANSLATE_0003', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TRANSLATE_0003 begin');
      
      await Settings.createWindow('testability/pages/component/text/TextRicheditorTranslate/RicheditorTranslate0003');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 模拟长按选中文本
      const textContent = await driver.findComponent(ON.id('rich_text_content'));
      if (textContent) {
        await textContent.longClick();
        await driver.delayMs(1000);
      }
      
      await windowSnap.snapShot('RICHEDITOR_TRANSLATE_0003');
      Logger.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TRANSLATE_0003 end');
    });
  });
}
