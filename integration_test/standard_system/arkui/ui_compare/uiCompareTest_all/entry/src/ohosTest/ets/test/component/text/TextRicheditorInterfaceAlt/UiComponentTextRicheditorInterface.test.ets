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

export default function uiComponentTextRicheditorInterface() {
  describe('uiComponentTextRicheditorInterface', () => {
    let driver = Driver.create();

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0055
     * @tc.name   : Text richeditor interface
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0055', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextRicheditorInterfaceAlt/RicheditorInterface0055');
      await driver.delayMs(1000);
      await windowSnap.snapShot('RicheditorInterface0055_Initial');
      
      // 删除文本
      let deleteBtn = await driver.findComponent(ON.text('删除文本'));
      await deleteBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorInterface0055_Deleted');
      
      let completeBtn = await driver.findComponent(ON.id('btn'));
      await completeBtn.click();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0057
     * @tc.name   : Text richeditor interface
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0057', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextRicheditorInterfaceAlt/RicheditorInterface0057');
      await driver.delayMs(1000);
      await windowSnap.snapShot('RicheditorInterface0057_Initial');
      
      // 执行连续操作
      let execBtn = await driver.findComponent(ON.text('执行连续操作'));
      await execBtn.click();
      await driver.delayMs(3000);
      await windowSnap.snapShot('RicheditorInterface0057_Multiple');
      
      let completeBtn = await driver.findComponent(ON.id('btn'));
      await completeBtn.click();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0061
     * @tc.name   : Text richeditor interface
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0061', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextRicheditorInterfaceAlt/RicheditorInterface0061');
      await driver.delayMs(1000);
      await windowSnap.snapShot('RicheditorInterface0061_Initial');
      
      // 测试getParagraphs
      let testBtn = await driver.findComponent(ON.text('测试getParagraphs'));
      await testBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorInterface0061_GetParagraphs');
      
      let completeBtn = await driver.findComponent(ON.id('btn'));
      await completeBtn.click();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0086
     * @tc.name   : Text richeditor interface
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0086', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextRicheditorInterfaceAlt/RicheditorInterface0086');
      await driver.delayMs(1000);
      await windowSnap.snapShot('RicheditorInterface0086_Initial');
      
      // 选中文本后剪切
      let selectBtn = await driver.findComponent(ON.text('选中文本后剪切'));
      await selectBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorInterface0086_Selected');
      
      let completeBtn = await driver.findComponent(ON.id('btn'));
      await completeBtn.click();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0087
     * @tc.name   : Text richeditor interface
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0087', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextRicheditorInterfaceAlt/RicheditorInterface0087');
      await driver.delayMs(1000);
      await windowSnap.snapShot('RicheditorInterface0087_Initial');
      
      // 选中文本后复制
      let selectBtn = await driver.findComponent(ON.text('选中文本后复制'));
      await selectBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorInterface0087_Selected');
      
      let completeBtn = await driver.findComponent(ON.id('btn'));
      await completeBtn.click();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0088
     * @tc.name   : Text richeditor interface
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0088', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextRicheditorInterfaceAlt/RicheditorInterface0088');
      await driver.delayMs(1000);
      await windowSnap.snapShot('RicheditorInterface0088_Initial');
      
      // 点击后粘贴内容
      let clickBtn = await driver.findComponent(ON.text('点击后粘贴内容'));
      await clickBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorInterface0088_Click');
      
      let completeBtn = await driver.findComponent(ON.id('btn'));
      await completeBtn.click();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0102
     * @tc.name   : Text richeditor interface
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0102', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextRicheditorInterfaceAlt/RicheditorInterface0102');
      await driver.delayMs(1000);
      await windowSnap.snapShot('RicheditorInterface0102_Initial');
      
      // 点击后输入文本
      let inputBtn = await driver.findComponent(ON.text('点击后输入文本'));
      await inputBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorInterface0102_Click');
      
      let completeBtn = await driver.findComponent(ON.id('btn'));
      await completeBtn.click();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0104
     * @tc.name   : Text richeditor interface
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0104', 0, async () => {
      await Settings.createWindow('testability/pages/component/text/TextRicheditorInterfaceAlt/RicheditorInterface0104');
      await driver.delayMs(1000);
      await windowSnap.snapShot('RicheditorInterface0104_Initial');
      
      // 删除文本
      let deleteBtn = await driver.findComponent(ON.text('删除文本'));
      await deleteBtn.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('RicheditorInterface0104_Deleted');
      
      let completeBtn = await driver.findComponent(ON.id('btn'));
      await completeBtn.click();
      await driver.delayMs(500);
    });
  });
}