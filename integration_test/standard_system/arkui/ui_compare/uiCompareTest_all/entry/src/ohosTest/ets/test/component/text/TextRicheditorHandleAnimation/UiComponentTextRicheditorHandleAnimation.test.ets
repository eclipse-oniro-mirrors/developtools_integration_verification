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

export default function uiComponentTextRicheditorHandleAnimation() {
  describe('uiComponentTextRicheditorHandleAnimation', () => {
    let driver = Driver.create();

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle_animation_0005
     * @tc.name   : Text richeditor handle animation
     * @tc.desc   : Verify text richeditor handle animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle_animation_0005', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextRicheditorHandleAnimation/RicheditorHandleAnimation0005');
      await driver.delayMs(1000);
      await windowSnap.snapShot('RicheditorHandleAnimation0005_Initial');
      
      // 选中文本
      let selectBtn = await driver.findComponent(ON.text('选中文本'));
      await selectBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorHandleAnimation0005_Selected');
      
      // 滑动到第2页
      let swipeBtn = await driver.findComponent(ON.text('滑动到第2页'));
      await swipeBtn.click();
      await driver.delayMs(1000);
      await windowSnap.snapShot('RicheditorHandleAnimation0005_Swiped');
      
      let completeBtn = await driver.findComponent(ON.id('btn'));
      await completeBtn.click();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle_animation_0009
     * @tc.name   : Text richeditor handle animation
     * @tc.desc   : Verify text richeditor handle animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle_animation_0009', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextRicheditorHandleAnimation/RicheditorHandleAnimation0009');
      await driver.delayMs(1000);
      await windowSnap.snapShot('RicheditorHandleAnimation0009_Initial');
      
      // 选中文本
      let selectBtn = await driver.findComponent(ON.text('选中文本'));
      await selectBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorHandleAnimation0009_Selected');
      
      // 执行动画
      let animateBtn = await driver.findComponent(ON.text('执行动画'));
      await animateBtn.click();
      await driver.delayMs(3000);
      await windowSnap.snapShot('RicheditorHandleAnimation0009_Animated');
      
      // 重置
      let resetBtn = await driver.findComponent(ON.text('重置'));
      await resetBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorHandleAnimation0009_Reset');
      
      let completeBtn = await driver.findComponent(ON.id('btn'));
      await completeBtn.click();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle_animation_0010
     * @tc.name   : Text richeditor handle animation
     * @tc.desc   : Verify text richeditor handle animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle_animation_0010', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextRicheditorHandleAnimation/RicheditorHandleAnimation0010');
      await driver.delayMs(1000);
      await windowSnap.snapShot('RicheditorHandleAnimation0010_Initial');
      
      // 选中内容
      let selectBtn = await driver.findComponent(ON.text('选中内容'));
      await selectBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorHandleAnimation0010_Selected');
      
      // 执行动画
      let animateBtn = await driver.findComponent(ON.text('执行动画'));
      await animateBtn.click();
      await driver.delayMs(1000);
      await windowSnap.snapShot('RicheditorHandleAnimation0010_Animated');
      
      // 重置
      let resetBtn = await driver.findComponent(ON.text('重置'));
      await resetBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorHandleAnimation0010_Reset');
      
      let completeBtn = await driver.findComponent(ON.id('btn'));
      await completeBtn.click();
      await driver.delayMs(500);
    });
  });
}