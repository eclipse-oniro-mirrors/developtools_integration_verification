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

export default function actionArkuiSr() {
  describe('actionArkuiSr', () => {
    const TAG: string = 'actionArkuiSr';
    let driver = Driver.create();

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_ARKUI_SR20250106997626_0010
     * @tc.name   : 正常模式下改变Z序
     * @tc.desc   : Verify sr20250106997626 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_ARKUI_SR20250106997626_0010', 0, async () => {
      await Settings.createWindow('testability/pages/scenario/action_event/ActionArkuiSr/ActionSr0010');
      await driver.delayMs(500);
      
      // 点击Text1区域
      let text1 = await driver.findComponent(ON.id('text1'));
      await text1.click();
      await driver.delayMs(500);
      Logger.info(TAG, 'SUB_ACE_ACTION_ARKUI_SR20250106997626_0010: 点击Text1');
      
      // 点击"change Text2 zIndex"按钮
      let changeBtn = await driver.findComponent(ON.id('btn'));
      await changeBtn.click();
      await driver.delayMs(500);
      Logger.info(TAG, 'SUB_ACE_ACTION_ARKUI_SR20250106997626_0010: Text2 zIndex已改为1');
      
      // 再次点击中间区域（此时应该点击到Text2）
      let text2 = await driver.findComponent(ON.id('text2'));
      await text2.click();
      await driver.delayMs(500);
      Logger.info(TAG, 'SUB_ACE_ACTION_ARKUI_SR20250106997626_0010: 点击Text2（zIndex=1）');
      
      await windowSnap.snapShot('SUB_ACE_ACTION_ARKUI_SR20250106997626_0010');
    });

    /*
     * @tc.number : SUB_ACE_ACTION_ARKUI_SR20250106997626_0060
     * @tc.name   : 单手模式拖拽缩小动画
     * @tc.desc   : Verify sr20250106997626 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_ARKUI_SR20250106997626_0060', 0, async () => {
      await Settings.createWindow('testability/pages/scenario/action_event/ActionArkuiSr/ActionSr0060');
      await driver.delayMs(500);
      
      // 点击"模拟长按"按钮触发缩小动画
      let longPressBtn = await driver.findComponent(ON.id('btn'));
      await longPressBtn.click();
      await driver.delayMs(1500);
      
      Logger.info(TAG, 'SUB_ACE_ACTION_ARKUI_SR20250106997626_0060: 拖拽缩小动画测试完成');
      await windowSnap.snapShot('SUB_ACE_ACTION_ARKUI_SR20250106997626_0060');
    });

    /*
     * @tc.number : SUB_ACE_ACTION_ARKUI_SR20250106997626_0080
     * @tc.name   : 单手模式右下角position位置验证
     * @tc.desc   : Verify sr20250106997626 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_ARKUI_SR20250106997626_0080', 0, async () => {
      await Settings.createWindow('testability/pages/scenario/action_event/ActionArkuiSr/ActionSr0080');
      await driver.delayMs(500);
      
      // 点击"验证position1位置"按钮
      let verifyBtn = await driver.findComponent(ON.id('btn'));
      await verifyBtn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'SUB_ACE_ACTION_ARKUI_SR20250106997626_0080: position位置验证完成');
      await windowSnap.snapShot('SUB_ACE_ACTION_ARKUI_SR20250106997626_0080');
    });

    /*
     * @tc.number : SUB_ACE_ACTION_ARKUI_SR20250106997626_0100
     * @tc.name   : 单手模式左下角position位置验证
     * @tc.desc   : Verify sr20250106997626 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_ARKUI_SR20250106997626_0100', 0, async () => {
      await Settings.createWindow('testability/pages/scenario/action_event/ActionArkuiSr/ActionSr0100');
      await driver.delayMs(500);
      
      // 点击"验证position2位置"按钮
      let verifyBtn = await driver.findComponent(ON.id('btn'));
      await verifyBtn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'SUB_ACE_ACTION_ARKUI_SR20250106997626_0100: 左下角position位置验证完成');
      await windowSnap.snapShot('SUB_ACE_ACTION_ARKUI_SR20250106997626_0100');
    });

    /*
     * @tc.number : SUB_ACE_ACTION_ARKUI_SR20241018107358_0060
     * @tc.name   : 高级组件metaBall动画效果六
     * @tc.desc   : Verify sr20241018107358 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_ARKUI_SR20241018107358_0060', 0, async () => {
      await Settings.createWindow('testability/pages/scenario/action_event/ActionArkuiSr/MetaBall0060');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(3500);
      
      Logger.info(TAG, 'SUB_ACE_ACTION_ARKUI_SR20241018107358_0060: metaBall动画效果测试完成');
      await windowSnap.snapShot('SUB_ACE_ACTION_ARKUI_SR20241018107358_0060');
    });

    /*
     * @tc.number : SUB_ACE_ACTION_ARKUI_SR20250106997626_0120
     * @tc.name   : 单手模式点击事件Dump
     * @tc.desc   : Verify sr20250106997626 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_ARKUI_SR20250106997626_0120', 0, async () => {
      await Settings.createWindow('testability/pages/scenario/action_event/ActionArkuiSr/ActionSr0120');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(500);
      await btn.click();
      await driver.delayMs(500);
      
      Logger.info(TAG, 'SUB_ACE_ACTION_ARKUI_SR20250106997626_0120: 点击事件Dump测试完成');
      await windowSnap.snapShot('SUB_ACE_ACTION_ARKUI_SR20250106997626_0120');
    });
  });
}
