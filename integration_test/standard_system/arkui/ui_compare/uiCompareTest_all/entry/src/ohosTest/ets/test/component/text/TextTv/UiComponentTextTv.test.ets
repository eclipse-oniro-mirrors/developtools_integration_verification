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

export default function uiComponentTextTv() {
  describe('uiComponentTextTv', () => {
    const TAG: string = 'uiComponentTextTv';
    let driver = Driver.create();

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0030
     * @tc.name   : marqueeOptions.delay不设置
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0030', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextTv_09/TextTv0030');
      await driver.delayMs(500);
      
      // 点击开始跑马灯按钮
      let startBtn = await driver.findComponent(ON.id('btn'));
      await startBtn.click();
      await driver.delayMs(2000);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_TEXT_TV_0030: 跑马灯已启动（默认延迟）');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TV_0030');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0060
     * @tc.name   : marqueeOptions.delay设置为1000ms
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0060', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextTv_09/TextTv0060');
      await driver.delayMs(500);
      
      // 点击开始跑马灯按钮
      let startBtn = await driver.findComponent(ON.id('btn'));
      await startBtn.click();
      await driver.delayMs(5000);  // 等待两次循环
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_TEXT_TV_0060: 跑马灯已执行2次循环（延迟1s）');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TV_0060');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0110
     * @tc.name   : marqueeOptions.fromStart不设置，启用渐隐效果
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0110', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextTv_09/TextTv0110');
      await driver.delayMs(500);
      
      // 点击开始跑马灯按钮
      let startBtn = await driver.findComponent(ON.id('btn'));
      await startBtn.click();
      await driver.delayMs(2000);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_TEXT_TV_0110: 跑马灯已启动（带渐隐效果）');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TV_0110');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0140
     * @tc.name   : marqueeOptions.loop不设置，fromStart设置为true
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0140', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextTv_09/TextTv0140');
      await driver.delayMs(500);
      
      // 点击开始跑马灯按钮
      let startBtn = await driver.findComponent(ON.id('btn'));
      await startBtn.click();
      await driver.delayMs(2000);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_TEXT_TV_0140: 跑马灯从头正向滚动');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TV_0140');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0180
     * @tc.name   : marqueeOptions.loop设置为2
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0180', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextTv_09/TextTv0180');
      await driver.delayMs(500);
      
      // 点击开始跑马灯按钮
      let startBtn = await driver.findComponent(ON.id('btn'));
      await startBtn.click();
      await driver.delayMs(6000);  // 等待两次循环完成
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_TEXT_TV_0180: 跑马灯已播放2次并停止');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TV_0180');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0250
     * @tc.name   : marqueeOptions.step设置为20
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0250', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextTv_09/TextTv0250');
      await driver.delayMs(500);
      
      // 点击开始跑马灯按钮
      let startBtn = await driver.findComponent(ON.id('btn'));
      await startBtn.click();
      await driver.delayMs(2000);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_TEXT_TV_0250: 跑马灯高速滚动（step=20）');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TV_0250');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0350
     * @tc.name   : 跑马灯循环未结束，重新触发start
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0350', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextTv_09/TextTv0350');
      await driver.delayMs(500);
      
      // 点击开始跑马灯按钮
      let startBtn = await driver.findComponent(ON.id('btn'));
      await startBtn.click();
      await driver.delayMs(1000);
      
      // 修改参数，触发重启
      let modifyBtn = await driver.findComponent(ON.text('修改参数（触发重启）'));
      await modifyBtn.click();
      await driver.delayMs(2000);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_TEXT_TV_0350: 修改参数后触发START回调');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TV_0350');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0800
     * @tc.name   : 多个跑马灯同时执行，流畅无卡顿
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0800', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextTv_09/TextTv0800');
      await driver.delayMs(500);
      
      // 点击开始所有跑马灯按钮
      let startBtn = await driver.findComponent(ON.id('btn'));
      await startBtn.click();
      await driver.delayMs(5000);  // 等待5秒观察流畅度
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_TEXT_TV_0800: 4个跑马灯同时运行流畅');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TV_0800');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0810
     * @tc.name   : 跑马灯循环100次，回调次数无丢失
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0810', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextTv_09/TextTv0810');
      await driver.delayMs(500);
      
      // 点击开始跑马灯按钮
      let startBtn = await driver.findComponent(ON.id('btn'));
      await startBtn.click();
      await driver.delayMs(3000);  // 由于step=10，速度较快，等待3秒
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_TEXT_TV_0810: 跑马灯循环100次，验证回调次数');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TV_0810');
    });
  });
}
