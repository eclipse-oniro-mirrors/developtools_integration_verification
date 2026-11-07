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

export default function uiComponentTextinputTv() {
  describe('uiComponentTextinputTv', () => {
    const TAG: string = 'uiComponentTextinputTv';
    let driver = Driver.create();

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0010
     * @tc.name   : Textinput tv
     * @tc.desc   : Verify textinput tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0010', 0, async () => {
      await Settings.createWindow('testability/pages/component/text_input/TextinputTv/TextinputTv0010');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0010: 错误提示文本超长UX检视');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0010');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0030
     * @tc.name   : Textinput tv
     * @tc.desc   : Verify textinput tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0030', 0, async () => {
      await Settings.createWindow('testability/pages/component/text_input/TextinputTv/TextinputTv0030');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0030: 普通文本输入框hover态UX检视');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0030');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0100
     * @tc.name   : Textinput tv
     * @tc.desc   : Verify textinput tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0100', 0, async () => {
      await Settings.createWindow('testability/pages/component/text_input/TextinputTv/TextinputTv0100');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0100: 输入框提示文本超长UX检视');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0100');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0130
     * @tc.name   : Textinput tv
     * @tc.desc   : Verify textinput tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0130', 0, async () => {
      await Settings.createWindow('testability/pages/component/text_input/TextinputTv/TextinputTv0130');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0130: 自定义参数-输入框背板颜色');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0130');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0240
     * @tc.name   : Textinput tv
     * @tc.desc   : Verify textinput tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0240', 0, async () => {
      await Settings.createWindow('testability/pages/component/text_input/TextinputTv/TextinputTv0240');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0240: 输入法避让测试');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0240');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_SEARCH_TV_FOCUS_0310
     * @tc.name   : Textinput search tv focus
     * @tc.desc   : Verify textinput search tv focus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_SEARCH_TV_FOCUS_0310', 0, async () => {
      await Settings.createWindow('testability/pages/component/text_input/TextinputTv/TextinputTv0310');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(500);
      await btn.click();
      await driver.delayMs(500);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_TEXTINPUT_SEARCH_TV_FOCUS_0310: 切换镜像语言后走焦功能');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTINPUT_SEARCH_TV_FOCUS_0310');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_BASICCONTAINER_FORMSELECTION_TIMEPICKER_LANGUAGEORDER_0010
     * @tc.name   : Component function basiccontainer formselection TimePicker languageorder
     * @tc.desc   : Verify component function basiccontainer formselection TimePicker languageorder interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_BASICCONTAINER_FORMSELECTION_TIMEPICKER_LANGUAGEORDER_0010', 0, async () => {
      await Settings.createWindow('testability/pages/component/text_input/TextinputTv/TextinputTvTimepicker');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'ARKUI_COMPONENTFUNCTION_BASICCONTAINER_FORMSELECTION_TIMEPICKER_LANGUAGEORDER_0010: TimePicker英文渲染');
      await windowSnap.snapShot('ARKUI_COMPONENTFUNCTION_BASICCONTAINER_FORMSELECTION_TIMEPICKER_LANGUAGEORDER_0010');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_TV_0510
     * @tc.name   : Search tv
     * @tc.desc   : Verify search tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_TV_0510', 0, async () => {
      await Settings.createWindow('testability/pages/component/text_input/SearchTv/SearchTv0510');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'SUB_ACE_UI_COMPONENT_SEARCH_TV_0510: 搜索框输入法避让测试');
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SEARCH_TV_0510');
    });

    /*
     * @tc.number : TextInput_Focus_Test
     * @tc.name   : TextInput_Focus_Test
     * @tc.desc   : Verify textinput focus test interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TextInput_Focus_Test', 0, async () => {
      await Settings.createWindow('testability/pages/component/text_input/TextinputTv/TextinputFocusTest');
      await driver.delayMs(500);
      
      let btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(500);
      await btn.click();
      await driver.delayMs(500);
      
      Logger.info(TAG, 'TextInput_Focus_Test: 综合焦点管理测试');
      await windowSnap.snapShot('TextInput_Focus_Test');
    });
  });
}
