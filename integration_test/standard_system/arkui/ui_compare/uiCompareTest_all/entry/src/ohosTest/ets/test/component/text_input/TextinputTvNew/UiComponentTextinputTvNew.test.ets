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

export default function uiComponentTextinputTvNew() {
  describe('uiComponentTextinputTvNew', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0100
     * @tc.name   : 输入框提示文本超长UX检视
     * @tc.desc   : Verify textinput tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0100', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0100 begin');
      await Settings.createWindow('testability/pages/component/text_input/TextinputTv/TextinputTv0100');
      const driver = Driver.create();
      await driver.delayMs(1000);

      // 截图 - 超长提示文本
      await windowSnap.snapShot('TextinputTv0100_long');

      // 切换到正常提示文本
      const normalBtn = await driver.findComponent(ON.id('normalBtn'));
      if (normalBtn) {
        await normalBtn.click();
        await driver.delayMs(500);
        await windowSnap.snapShot('TextinputTv0100_normal');
      }

      Logger.info('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0100 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0240
     * @tc.name   : 输入法避让测试
     * @tc.desc   : Verify textinput tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0240', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0240 begin');
      await Settings.createWindow('testability/pages/component/text_input/TextinputTv/TextinputTv0240');
      const driver = Driver.create();
      await driver.delayMs(1000);

      // 截图 - 键盘弹出前
      await windowSnap.snapShot('TextinputTv0240_before');

      // 点击底部输入框弹出键盘
      const textInput = await driver.findComponent(ON.id('textInput'));
      if (textInput) {
        await textInput.click();
        await driver.delayMs(1000);
        // 截图 - 键盘弹出后
        await windowSnap.snapShot('TextinputTv0240_keyboard');
      }

      Logger.info('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0240 end');
    });
  });
}
