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

export default function uiComponentTextRicheditorSetStyledString() {
  describe('uiComponentTextRicheditorSetStyledString', () => {
    let driver = Driver.create();

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_600
     * @tc.name   : Text richeditor setstyledstring
     * @tc.desc   : Verify text richeditor setstyledstring interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_600', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextRicheditorSetStyledString/RicheditorSetStyledString0058');
      await driver.delayMs(1000);
      await windowSnap.snapShot('RicheditorSetStyledString0058');
      
      let completeBtn = await driver.findComponent(ON.id('btn'));
      await completeBtn.click();
      await driver.delayMs(500);
    });
  });
}