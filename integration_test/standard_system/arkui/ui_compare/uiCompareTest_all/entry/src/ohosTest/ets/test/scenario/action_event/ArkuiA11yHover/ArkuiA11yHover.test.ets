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

export default function arkuiA11yHover() {
  describe('arkuiA11yHover', () => {
    const TAG: string = 'arkuiA11yHover';
    let driver = Driver.create();

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : Arkui_A11y_Hover_1
     * @tc.name   : 启动无障碍并按压目标对象
     * @tc.desc   : Verify ArkUI a11y hover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('Arkui_A11y_Hover_1', 0, async () => {
      await Settings.createWindow('testability/pages/scenario/action_event/ArkuiA11yHover/A11yHover1');
      await driver.delayMs(500);
      
      // 点击按钮模拟无障碍点击节点1
      let clickBtn = await driver.findComponent(ON.id('btn'));
      await clickBtn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'Arkui_A11y_Hover_1: 节点1获得焦点，焦点框已显示');
      await windowSnap.snapShot('Arkui_A11y_Hover_1');
    });

    /*
     * @tc.number : Arkui_A11y_Hover_7
     * @tc.name   : 聚焦到深层节点的某一目标后无操作
     * @tc.desc   : Verify ArkUI a11y hover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('Arkui_A11y_Hover_7', 0, async () => {
      await Settings.createWindow('testability/pages/scenario/action_event/ArkuiA11yHover/A11yHover7');
      await driver.delayMs(500);
      
      // 点击DeepNode中的文本4
      let clickBtn = await driver.findComponent(ON.id('btn'));
      await clickBtn.click();
      await driver.delayMs(500);
      
      // 点击等待按钮模拟无操作
      let waitBtn = await driver.findComponent(ON.text('等待10秒（模拟无操作）'));
      await waitBtn.click();
      await driver.delayMs(3500);
      
      Logger.info(TAG, 'Arkui_A11y_Hover_7: 焦点框在无操作后保持显示');
      await windowSnap.snapShot('Arkui_A11y_Hover_7');
    });

    /*
     * @tc.number : Arkui_A11y_Hover_8
     * @tc.name   : 动态改变虚拟子节点中的x值
     * @tc.desc   : Verify ArkUI a11y hover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('Arkui_A11y_Hover_8', 0, async () => {
      await Settings.createWindow('testability/pages/scenario/action_event/ArkuiA11yHover/A11yHover8');
      await driver.delayMs(500);
      
      // 点击change X按钮改变节点1的X坐标
      let changeBtn = await driver.findComponent(ON.id('btn'));
      await changeBtn.click();
      await driver.delayMs(500);
      await changeBtn.click();
      await driver.delayMs(500);
      
      // 点击划动焦点框到节点1
      let focusBtn = await driver.findComponent(ON.text('划动焦点框到节点1'));
      await focusBtn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'Arkui_A11y_Hover_8: 焦点框位置随节点X坐标变化');
      await windowSnap.snapShot('Arkui_A11y_Hover_8');
    });

    /*
     * @tc.number : Arkui_A11y_Hover_13
     * @tc.name   : 聚焦到某一按键后无操作
     * @tc.desc   : Verify ArkUI a11y hover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('Arkui_A11y_Hover_13', 0, async () => {
      await Settings.createWindow('testability/pages/scenario/action_event/ArkuiA11yHover/A11yHover13');
      await driver.delayMs(500);
      
      // 点击按压Q键按钮
      let pressBtn = await driver.findComponent(ON.id('btn'));
      await pressBtn.click();
      await driver.delayMs(500);
      
      // 等待10秒验证焦点框不消失
      await driver.delayMs(10500);
      
      Logger.info(TAG, 'Arkui_A11y_Hover_13: 焦点框在10秒后仍保持显示');
      await windowSnap.snapShot('Arkui_A11y_Hover_13');
    });
  });
}
