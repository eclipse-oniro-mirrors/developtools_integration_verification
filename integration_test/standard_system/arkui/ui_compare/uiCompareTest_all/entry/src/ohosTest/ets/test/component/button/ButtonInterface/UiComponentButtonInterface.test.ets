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
 * Button/Checkbox/DatePicker组件测试
 */
export default function uiComponentButtonInterfaceTest() {
  describe('uiComponentButtonInterfaceTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        Settings.destroyWindow(Settings.windowClass);
      }
      let driver = Driver.create();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0080
     * @tc.name   : testButtonLabelForm
     * @tc.desc   : Verify button interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0080', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0080 start');
      await Settings.createWindow('testability/pages/component/button/ButtonInterface/ButtonInterface0080');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 验证各类型Button存在
      let circleBtn = await driver.findComponent(ON.id('ButtonInterface0080_Circle'));
      expect(circleBtn !== null).assertTrue();
      
      let capsuleBtn = await driver.findComponent(ON.id('ButtonInterface0080_Capsule'));
      expect(capsuleBtn !== null).assertTrue();
      
      let normalBtn = await driver.findComponent(ON.id('ButtonInterface0080_Normal'));
      expect(normalBtn !== null).assertTrue();
      
      // 点击各按钮测试
      if (circleBtn) {
        await circleBtn.click();
      }
      await driver.delayMs(300);
      if (capsuleBtn) {
        await capsuleBtn.click();
      }
      await driver.delayMs(300);
      if (normalBtn) {
        await normalBtn.click();
      }
      await driver.delayMs(300);
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0080 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0260
     * @tc.name   : testButtonHeightAdaptivePolicy
     * @tc.desc   : Verify button interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0260', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0260 start');
      await Settings.createWindow('testability/pages/component/button/ButtonInterface/ButtonInterface0260');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let shortBtn = await driver.findComponent(ON.id('ButtonInterface0260_Short'));
      expect(shortBtn !== null).assertTrue();
      
      let longBtn = await driver.findComponent(ON.id('ButtonInterface0260_Long'));
      expect(longBtn !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0260 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0340
     * @tc.name   : testButtonMinFontSize
     * @tc.desc   : Verify button interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0340', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0340 start');
      await Settings.createWindow('testability/pages/component/button/ButtonInterface/ButtonInterface0340');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let minMaxBtn = await driver.findComponent(ON.id('ButtonInterface0340_MinMax'));
      expect(minMaxBtn !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0340 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0430
     * @tc.name   : testButtonWeight
     * @tc.desc   : Verify button interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0430', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0430 start');
      await Settings.createWindow('testability/pages/component/button/ButtonInterface/ButtonInterface0430');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 验证各weight按钮存在
      let btn100 = await driver.findComponent(ON.id('ButtonInterface0430_100'));
      expect(btn100 !== null).assertTrue();
      
      let btn300 = await driver.findComponent(ON.id('ButtonInterface0430_300'));
      expect(btn300 !== null).assertTrue();
      
      let btn600 = await driver.findComponent(ON.id('ButtonInterface0430_600'));
      expect(btn600 !== null).assertTrue();
      
      let btn900 = await driver.findComponent(ON.id('ButtonInterface0430_900'));
      expect(btn900 !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0430 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0620
     * @tc.name   : testButtonUndoRedo
     * @tc.desc   : Verify button interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0620', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0620 start');
      await Settings.createWindow('testability/pages/component/button/ButtonInterface/ButtonInterface0620');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 输入文本
      let input = await driver.findComponent(ON.id('ButtonInterface0620_Input'));
      expect(input !== null).assertTrue();
      if (input) {
        await input.inputText('测试文本');
        await driver.delayMs(500);
      }
      
      // 点击撤销
      let undoBtn = await driver.findComponent(ON.id('ButtonInterface0620_Undo'));
      if (undoBtn) {
        await undoBtn.click();
        await driver.delayMs(300);
        await undoBtn.click();
        await driver.delayMs(300);
      }
      
      // 点击恢复
      let redoBtn = await driver.findComponent(ON.id('ButtonInterface0620_Redo'));
      if (redoBtn) {
        await redoBtn.click();
        await driver.delayMs(300);
      }
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0620 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOX_DFX_0010
     * @tc.name   : testCheckboxOnChange
     * @tc.desc   : Verify button checkbox DFX interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOX_DFX_0010', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOX_DFX_0010 start');
      await Settings.createWindow('testability/pages/component/button/ButtonInterface/CheckboxDfx0010');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击CheckboxGroup全选
      let group = await driver.findComponent(ON.id('CheckboxDfx0010_Group'));
      expect(group !== null).assertTrue();
      if (group) {
        await group.click();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot();
      
      // 再次点击取消全选
      if (group) {
        await group.click();
        await driver.delayMs(500);
      }
      
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOX_DFX_0010 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_Rtl_0010
     * @tc.name   : testCheckboxGroupRtl
     * @tc.desc   : Verify button checkboxgroup rtl interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_Rtl_0010', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_Rtl_0010 start');
      await Settings.createWindow('testability/pages/component/button/ButtonInterface/CheckboxGroupRtl0010');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击各checkbox
      let cb1 = await driver.findComponent(ON.id('CheckboxGroupRtl0010_1'));
      expect(cb1 !== null).assertTrue();
      if (cb1) {
        await cb1.click();
      }
      await driver.delayMs(300);
      
      let cb2 = await driver.findComponent(ON.id('CheckboxGroupRtl0010_2'));
      if (cb2) {
        await cb2.click();
      }
      await driver.delayMs(300);
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_Rtl_0010 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_ADD_0010
     * @tc.name   : testDatePickerMultiColumn
     * @tc.desc   : Verify button DatePicker add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_ADD_0010', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_ADD_0010 start');
      await Settings.createWindow('testability/pages/component/button/ButtonInterface/DatePickerAdd0010');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let picker = await driver.findComponent(ON.id('DatePickerAdd0010_Picker'));
      expect(picker !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_ADD_0010 end');
      Logger.info('TEST', '手动验证: 多指同时滑动DatePicker各列');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_EVENT_0010
     * @tc.name   : testDatePickerOnChange
     * @tc.desc   : Verify button DatePicker event interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_EVENT_0010', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_EVENT_0010 start');
      await Settings.createWindow('testability/pages/component/button/ButtonInterface/DatePickerEvent0010');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let picker = await driver.findComponent(ON.id('DatePickerEvent0010_Picker'));
      expect(picker !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_EVENT_0010 end');
      Logger.info('TEST', '手动验证: 滑动选择1990年7月4日，观察onChange输出');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_UX_005
     * @tc.name   : testButtonStylePolymorphic
     * @tc.desc   : Verify button ux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_UX_005', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_UX_005 start');
      await Settings.createWindow('testability/pages/component/button/ButtonInterface/ButtonUx005');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 测试EMPHASIZED样式
      let testBtn = await driver.findComponent(ON.id('ButtonUx005_TestButton'));
      expect(testBtn !== null).assertTrue();
      if (testBtn) {
        await testBtn.click();
      }
      await driver.delayMs(300);
      
      // 切换到NORMAL样式
      let normalBtn = await driver.findComponent(ON.id('ButtonUx005_SetNormal'));
      if (normalBtn) {
        await normalBtn.click();
      }
      await driver.delayMs(500);
      
      // 切换到TEXTUAL样式
      let textualBtn = await driver.findComponent(ON.id('ButtonUx005_SetTextual'));
      if (textualBtn) {
        await textualBtn.click();
      }
      await driver.delayMs(500);
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_UX_005 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_SCENARIOS_0060
     * @tc.name   : testCheckboxGroupLongName
     * @tc.desc   : Verify button checkboxgroup scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_SCENARIOS_0060', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_SCENARIOS_0060 start');
      await Settings.createWindow('testability/pages/component/button/ButtonInterface/CheckboxGroupScenarios0060');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击全选
      let group = await driver.findComponent(ON.id('CheckboxGroupScenarios0060_Group'));
      expect(group !== null).assertTrue();
      if (group) {
        await group.click();
      }
      await driver.delayMs(500);
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_SCENARIOS_0060 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_SCENARIOS_0060_558
     * @tc.name   : testCheckboxGroupRemoveItem
     * @tc.desc   : Verify button checkboxgroup scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_SCENARIOS_0060_558', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_SCENARIOS_0060_558 start');
      await Settings.createWindow('testability/pages/component/button/ButtonInterface/CheckboxGroupScenarios0060_558');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      // 选中第一项
      let cb0 = await driver.findComponent(ON.id('CheckboxGroupScenarios0060_558_0'));
      expect(cb0 !== null).assertTrue();
      if (cb0) {
        await cb0.click();
      }
      await driver.delayMs(300);
      
      await windowSnap.snapShot();
      
      // 点击移除选中项
      let removeBtn = await driver.findComponent(ON.id('CheckboxGroupScenarios0060_558_Remove'));
      if (removeBtn) {
        await removeBtn.click();
      }
      await driver.delayMs(500);
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_SCENARIOS_0060_558 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_INTERFACE_0190
     * @tc.name   : testDatePickerHeightOverflow
     * @tc.desc   : Verify button DatePicker interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_INTERFACE_0190', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_INTERFACE_0190 start');
      await Settings.createWindow('testability/pages/component/button/ButtonInterface/DatePickerInterface0190');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let picker = await driver.findComponent(ON.id('DatePickerInterface0190_Picker'));
      expect(picker !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_INTERFACE_0190 end');
      done();
    });
  });
}
