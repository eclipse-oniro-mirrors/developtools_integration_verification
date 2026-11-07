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

export default function uiComponentTextRicheditorAiColor() {
  describe('uiComponentTextRicheditorAiColor', () => {
    let driver = Driver.create();

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AI_COLOR_0004
     * @tc.name   : Text richeditor ai color
     * @tc.desc   : Verify text richeditor ai color interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AI_COLOR_0004', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextRicheditorAiColor/RicheditorAiColor0004');
      await driver.delayMs(1000);
      await windowSnap.snapShot('RicheditorAiColor0004_Initial');
      
      // 测试undefined颜色
      let undefinedBtn = await driver.findComponent(ON.text('undefined'));
      await undefinedBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorAiColor0004_Undefined');
      
      // 测试超长hex颜色
      let hexBtn = await driver.findComponent(ON.text('超长hex'));
      await hexBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorAiColor0004_LongHex');
      
      // 测试错误格式颜色
      let errorBtn = await driver.findComponent(ON.text('错误格式'));
      await errorBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorAiColor0004_ErrorFormat');
      
      let completeBtn = await driver.findComponent(ON.id('btn'));
      await completeBtn.click();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AI_COLOR_0007
     * @tc.name   : Text richeditor ai color
     * @tc.desc   : Verify text richeditor ai color interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AI_COLOR_0007', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextRicheditorAiColor/RicheditorAiColor0007');
      await driver.delayMs(1000);
      await windowSnap.snapShot('RicheditorAiColor0007_Initial');
      
      // 测试undefined修饰线颜色
      let undefinedBtn = await driver.findComponent(ON.text('undefined'));
      await undefinedBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorAiColor0007_Undefined');
      
      // 测试超长hex修饰线颜色
      let hexBtn = await driver.findComponent(ON.text('超长hex'));
      await hexBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorAiColor0007_LongHex');
      
      // 测试错误RGB修饰线颜色
      let rgbBtn = await driver.findComponent(ON.text('错误RGB'));
      await rgbBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorAiColor0007_ErrorRGB');
      
      let completeBtn = await driver.findComponent(ON.id('btn'));
      await completeBtn.click();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AI_COLOR_0015
     * @tc.name   : Text richeditor ai color
     * @tc.desc   : Verify text richeditor ai color interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AI_COLOR_0015', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextRicheditorAiColor/RicheditorAiColor0015');
      await driver.delayMs(1000);
      await windowSnap.snapShot('RicheditorAiColor0015_Doc');
      
      let completeBtn = await driver.findComponent(ON.id('btn'));
      await completeBtn.click();
      await driver.delayMs(500);
    });
  });
}