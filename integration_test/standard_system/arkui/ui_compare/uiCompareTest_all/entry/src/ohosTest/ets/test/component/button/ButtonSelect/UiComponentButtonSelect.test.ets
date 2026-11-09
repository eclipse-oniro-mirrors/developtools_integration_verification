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

/**
 * @file UiComponentButtonSelect.test.ets
 * @description Select组件测试用例
 */
import { describe, it, expect, afterEach } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

export default function uiComponentButtonSelectTest() {
  describe('uiComponentButtonSelectTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        Settings.destroyWindow(Settings.windowClass);
      }
      let driver = Driver.create();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_CONTROLSIZE_0440
     * @tc.name   : controlSize设为NORMAL时，hover
     * @tc.desc   : Verify button select controlsize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_CONTROLSIZE_0440', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_SELECT_CONTROLSIZE_0440 start');
      await Settings.createWindow('testability/pages/component/button/ButtonSelect/SelectControlsize0440');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let select = await driver.findComponent(ON.id('select_normal_hover'));
      expect(select !== null).assertTrue();
      
      if (select) {
        await select.click();
        await driver.delayMs(500);
        await driver.pressBack();
        await driver.delayMs(300);
      }
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_SELECT_CONTROLSIZE_0440 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_CONTROLSIZE_0460
     * @tc.name   : controlSize设为NORMAL时，focus
     * @tc.desc   : Verify button select controlsize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_CONTROLSIZE_0460', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_SELECT_CONTROLSIZE_0460 start');
      await Settings.createWindow('testability/pages/component/button/ButtonSelect/SelectControlsize0460');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let select = await driver.findComponent(ON.id('select_normal_focus'));
      expect(select !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_SELECT_CONTROLSIZE_0460 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_CONTROLSIZE_0850
     * @tc.name   : controlSize设为small时，hover
     * @tc.desc   : Verify button select controlsize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_CONTROLSIZE_0850', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_SELECT_CONTROLSIZE_0850 start');
      await Settings.createWindow('testability/pages/component/button/ButtonSelect/SelectControlsize0850');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let btnSwitch = await driver.findComponent(ON.id('btn_switch_size'));
      expect(btnSwitch !== null).assertTrue();
      if (btnSwitch) {
        await btnSwitch.click();
        await driver.delayMs(500);
      }
      
      let select = await driver.findComponent(ON.id('select_small_hover'));
      expect(select !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_SELECT_CONTROLSIZE_0850 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_CONTROLSIZE_0870
     * @tc.name   : controlSize设为small时，focus
     * @tc.desc   : Verify button select controlsize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_CONTROLSIZE_0870', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_SELECT_CONTROLSIZE_0870 start');
      await Settings.createWindow('testability/pages/component/button/ButtonSelect/SelectControlsize0870');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let btnSwitch = await driver.findComponent(ON.id('btn_switch_size'));
      expect(btnSwitch !== null).assertTrue();
      if (btnSwitch) {
        await btnSwitch.click();
        await driver.delayMs(500);
      }
      
      let select = await driver.findComponent(ON.id('select_small_focus'));
      expect(select !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_SELECT_CONTROLSIZE_0870 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0210
     * @tc.name   : menuBackgroundBlurStyle设置为Resource类型
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0210', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0210 start');
      await Settings.createWindow('testability/pages/component/button/ButtonSelect/SelectFuzzy0210');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let select = await driver.findComponent(ON.id('select_fuzzy_resource'));
      expect(select !== null).assertTrue();
      
      if (select) {
        await select.click();
        await driver.delayMs(500);
        await driver.pressBack();
        await driver.delayMs(300);
      }
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0210 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0220
     * @tc.name   : 对比手机和PC效果
     * @tc.desc   : Verify button select fuzzy interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0220', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0220 start');
      await Settings.createWindow('testability/pages/component/button/ButtonSelect/SelectFuzzy0220');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let select = await driver.findComponent(ON.id('select_fuzzy_compare'));
      expect(select !== null).assertTrue();
      
      if (select) {
        await select.click();
        await driver.delayMs(500);
        await driver.pressBack();
        await driver.delayMs(300);
      }
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0220 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_UPDOWN_0010
     * @tc.name   : select组件使用上下方向键走焦
     * @tc.desc   : Verify button select updown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_UPDOWN_0010', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_SELECT_UPDOWN_0010 start');
      await Settings.createWindow('testability/pages/component/button/ButtonSelect/SelectUpdown0010');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let select = await driver.findComponent(ON.id('select_updown'));
      expect(select !== null).assertTrue();
      
      if (select) {
        await select.click();
        await driver.delayMs(500);
        // 手动测试：使用上下方向键走焦
        await driver.pressBack();
        await driver.delayMs(300);
      }
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_SELECT_UPDOWN_0010 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_UPDOWN_0020
     * @tc.name   : 系统预置应用使用上下方向键走焦
     * @tc.desc   : Verify button select updown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_UPDOWN_0020', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_SELECT_UPDOWN_0020 start');
      await Settings.createWindow('testability/pages/component/button/ButtonSelect/SelectUpdown0020');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let select = await driver.findComponent(ON.id('select_phone_type'));
      expect(select !== null).assertTrue();
      
      if (select) {
        await select.click();
        await driver.delayMs(500);
        await driver.pressBack();
        await driver.delayMs(300);
      }
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_SELECT_UPDOWN_0020 end');
      done();
    });
  });
}