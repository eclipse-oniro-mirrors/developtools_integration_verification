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

import { describe, it, expect, afterEach } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

/*
 * UI组件AbilityformCut测试
 * 测试SegmentButton、ActionSheet、ChipGroup、Chip、Select、Popup等组件
 */
export default function uiComponentAbilityformCutTest() {
  describe('uiComponentAbilityformCutTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        Settings.destroyWindow(Settings.windowClass);
      }
      let driver = Driver.create();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0030
     * @tc.name   : testSegmentButtonMaxFontScale1
     * @tc.desc   : Verify abilityform cut interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0030', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0030 start');
      await Settings.createWindow('testability/pages/scenario/misc/AbilityformCut/AbilityformCut0030');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 验证分段按钮组件存在
      let segmentButton = await driver.findComponent(ON.id('AbilityformCut0030_SegmentButton'));
      expect(segmentButton !== null).assertTrue();
      
      // 点击各个选项测试交互
      let option1 = await driver.findComponent(ON.text('选项一'));
      if (option1) {
        await option1.click();
        await driver.delayMs(300);
      }
      
      let option2 = await driver.findComponent(ON.text('选项二'));
      if (option2) {
        await option2.click();
        await driver.delayMs(300);
      }
      
      let option3 = await driver.findComponent(ON.text('选项三'));
      if (option3) {
        await option3.click();
        await driver.delayMs(300);
      }
      
      await windowSnap.snapShot();
      await driver.delayMs(500);
      
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0030 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0040
     * @tc.name   : testSegmentButtonMaxFontScale2
     * @tc.desc   : Verify abilityform cut interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0040', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0040 start');
      await Settings.createWindow('testability/pages/scenario/misc/AbilityformCut/AbilityformCut0040');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 验证分段按钮组件存在
      let segmentButton = await driver.findComponent(ON.id('AbilityformCut0040_SegmentButton'));
      expect(segmentButton !== null).assertTrue();
      
      // 点击各个选项测试交互
      let option1 = await driver.findComponent(ON.text('选项一'));
      if (option1) {
        await option1.click();
        await driver.delayMs(300);
      }
      
      let option2 = await driver.findComponent(ON.text('选项二'));
      if (option2) {
        await option2.click();
        await driver.delayMs(300);
      }
      
      await windowSnap.snapShot();
      await driver.delayMs(500);
      
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0040 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0080
     * @tc.name   : testActionSheetBasic
     * @tc.desc   : Verify abilityform cut interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0080', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0080 start');
      await Settings.createWindow('testability/pages/scenario/misc/AbilityformCut/AbilityformCut0080');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 验证按钮存在
      let button = await driver.findComponent(ON.id('AbilityformCut0080_Button'));
      expect(button !== null).assertTrue();
      
      // 点击按钮显示ActionSheet
      if (button) {
        await button.click();
        await driver.delayMs(1000);
        
        // 截图验证ActionSheet显示
        await windowSnap.snapShot();
        await driver.delayMs(500);
        
        // 尝试点击选项
        let option1 = await driver.findComponent(ON.text('选项一'));
        if (option1) {
          await option1.click();
          await driver.delayMs(500);
        } else {
          // 如果找不到选项，按返回键关闭
          await driver.pressBack();
          await driver.delayMs(500);
        }
      }
      
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0080 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0090
     * @tc.name   : testChipGroupBasic
     * @tc.desc   : Verify abilityform cut interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0090', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0090 start');
      await Settings.createWindow('testability/pages/scenario/misc/AbilityformCut/AbilityformCut0090');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 验证ChipGroup组件存在
      let chipGroup = await driver.findComponent(ON.id('AbilityformCut0090_ChipGroup'));
      expect(chipGroup !== null).assertTrue();
      
      // 点击各个芯片测试交互
      let chip1 = await driver.findComponent(ON.text('芯片1'));
      if (chip1) {
        await chip1.click();
        await driver.delayMs(300);
      }
      
      let chip3 = await driver.findComponent(ON.text('芯片3'));
      if (chip3) {
        await chip3.click();
        await driver.delayMs(300);
      }
      
      let chip5 = await driver.findComponent(ON.text('芯片5'));
      if (chip5) {
        await chip5.click();
        await driver.delayMs(300);
      }
      
      await windowSnap.snapShot();
      await driver.delayMs(500);
      
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0090 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0100
     * @tc.name   : testChipGroupAging
     * @tc.desc   : Verify abilityform cut interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0100', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0100 start');
      await Settings.createWindow('testability/pages/scenario/misc/AbilityformCut/AbilityformCut0100');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 验证ChipGroup组件存在
      let chipGroup = await driver.findComponent(ON.id('AbilityformCut0100_ChipGroup'));
      expect(chipGroup !== null).assertTrue();
      
      // 点击测试交互
      let chip2 = await driver.findComponent(ON.text('适老化测试2'));
      if (chip2) {
        await chip2.click();
        await driver.delayMs(300);
      }
      
      await windowSnap.snapShot();
      await driver.delayMs(500);
      
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0100 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0110
     * @tc.name   : testChipBasic
     * @tc.desc   : Verify abilityform cut interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0110', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0110 start');
      await Settings.createWindow('testability/pages/scenario/misc/AbilityformCut/AbilityformCut0110');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 验证Chips组件存在
      let chips = await driver.findComponent(ON.id('AbilityformCut0110_Chips'));
      expect(chips !== null).assertTrue();
      
      // 截图初始状态
      await windowSnap.snapShot();
      await driver.delayMs(500);
      
      // 点击重置按钮
      let resetBtn = await driver.findComponent(ON.text('重置所有Chip'));
      if (resetBtn) {
        await resetBtn.click();
        await driver.delayMs(500);
      }
      
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0110 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0190
     * @tc.name   : testChipAging
     * @tc.desc   : Verify abilityform cut interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0190', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0190 start');
      await Settings.createWindow('testability/pages/scenario/misc/AbilityformCut/AbilityformCut0190');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 验证Chips组件存在
      let chips = await driver.findComponent(ON.id('AbilityformCut0190_Chips'));
      expect(chips !== null).assertTrue();
      
      await windowSnap.snapShot();
      await driver.delayMs(500);
      
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0190 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0200
     * @tc.name   : testSelectFont
     * @tc.desc   : Verify abilityform cut interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0200', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0200 start');
      await Settings.createWindow('testability/pages/scenario/misc/AbilityformCut/AbilityformCut0200');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 验证Select组件存在
      let select = await driver.findComponent(ON.id('AbilityformCut0200_Select'));
      expect(select !== null).assertTrue();
      
      // 点击Select展开
      if (select) {
        await select.click();
        await driver.delayMs(800);
        
        // 截图验证字体样式
        await windowSnap.snapShot();
        await driver.delayMs(500);
        
        // 选择一个选项
        let option2 = await driver.findComponent(ON.text('选项二'));
        if (option2) {
          await option2.click();
          await driver.delayMs(500);
        } else {
          await driver.pressBack();
          await driver.delayMs(500);
        }
      }
      
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0200 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0210
     * @tc.name   : testSelectDivider
     * @tc.desc   : Verify abilityform cut interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0210', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0210 start');
      await Settings.createWindow('testability/pages/scenario/misc/AbilityformCut/AbilityformCut0210');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 验证Select组件存在
      let select = await driver.findComponent(ON.id('AbilityformCut0210_Select'));
      expect(select !== null).assertTrue();
      
      // 点击展开查看分割线
      if (select) {
        await select.click();
        await driver.delayMs(800);
        
        // 截图验证分割线样式
        await windowSnap.snapShot();
        await driver.delayMs(500);
        
        // 选择一个选项
        let option3 = await driver.findComponent(ON.text('选项三'));
        if (option3) {
          await option3.click();
          await driver.delayMs(500);
        } else {
          await driver.pressBack();
          await driver.delayMs(500);
        }
      }
      
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0210 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0240
     * @tc.name   : testSelectOptionFont
     * @tc.desc   : Verify abilityform cut interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0240', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0240 start');
      await Settings.createWindow('testability/pages/scenario/misc/AbilityformCut/AbilityformCut0240');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 验证Select组件存在
      let select = await driver.findComponent(ON.id('AbilityformCut0240_Select'));
      expect(select !== null).assertTrue();
      
      // 点击展开查看选项字体
      if (select) {
        await select.click();
        await driver.delayMs(800);
        
        // 截图验证选项字体样式
        await windowSnap.snapShot();
        await driver.delayMs(500);
        
        // 选择一个选项验证选中样式
        let option1 = await driver.findComponent(ON.text('选项一'));
        if (option1) {
          await option1.click();
          await driver.delayMs(500);
        } else {
          await driver.pressBack();
        }
        await driver.delayMs(500);
      }
      
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0240 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0260
     * @tc.name   : testSelectRTL
     * @tc.desc   : Verify abilityform cut interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0260', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0260 start');
      await Settings.createWindow('testability/pages/scenario/misc/AbilityformCut/AbilityformCut0260');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 验证Select组件存在
      let select = await driver.findComponent(ON.id('AbilityformCut0260_Select'));
      expect(select !== null).assertTrue();
      
      // 点击展开
      if (select) {
        await select.click();
        await driver.delayMs(800);
        
        // 截图验证RTL布局
        await windowSnap.snapShot();
        await driver.delayMs(500);
        
        await driver.pressBack();
        await driver.delayMs(500);
      }
      
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0260 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0330
     * @tc.name   : testPopupBasic
     * @tc.desc   : Verify abilityform cut interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0330', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0330 start');
      await Settings.createWindow('testability/pages/scenario/misc/AbilityformCut/AbilityformCut0330');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 验证按钮存在
      let button = await driver.findComponent(ON.id('AbilityformCut0330_Button'));
      expect(button !== null).assertTrue();
      
      // 点击显示Popup
      if (button) {
        await button.click();
        await driver.delayMs(800);
        
        // 截图验证Popup显示
        await windowSnap.snapShot();
        await driver.delayMs(500);
        
        // 点击确认按钮
        let confirmBtn = await driver.findComponent(ON.text('确认'));
        if (confirmBtn) {
          await confirmBtn.click();
          await driver.delayMs(500);
        }
      }
      
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0330 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0340
     * @tc.name   : testPopupDirection
     * @tc.desc   : Verify abilityform cut interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0340', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0340 start');
      await Settings.createWindow('testability/pages/scenario/misc/AbilityformCut/AbilityformCut0340');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 验证结果区域存在
      let result = await driver.findComponent(ON.id('AbilityformCut0340_Result'));
      expect(result !== null).assertTrue();
      
      // 截图验证三种direction布局
      await windowSnap.snapShot();
      await driver.delayMs(500);
      
      // 点击各个确认按钮测试交互
      let confirmBtns = await driver.findComponents(ON.text('确认'));
      if (confirmBtns && confirmBtns.length > 0) {
        for (let i = 0; i < Math.min(confirmBtns.length, 3); i++) {
          await confirmBtns[i].click();
          await driver.delayMs(300);
        }
      }
      
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0340 end');
      done();
    });
  });
}