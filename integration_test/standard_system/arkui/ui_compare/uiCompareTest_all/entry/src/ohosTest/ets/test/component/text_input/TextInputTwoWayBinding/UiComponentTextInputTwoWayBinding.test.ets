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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, Component, MouseButton } from '@kit.TestKit'
/*
 * SUB_ACE_UI_ATTRIBUTES_FONT_INTERFACE_0010:设置文本颜色
 *
 * Settings.createWindow(config.url)：
 *  创建窗口，更改窗口基本配置，更改方式详见model/Settings createWindow方法
 *
 * windowSnap.snapShot(globalThis.context)：
 *  窗口截屏&图片文件保存，存储在设备端
 *  存储文件固定，单挑用例执行后覆盖，用于自动化UI对比
 *  支持调试更改文件名为时间戳格式，更改model/snapShot createAndGetFile方法 注释L35，放开L32，L33
 *
 * Logger日志使用方法：
 *  import Logger form './model/Logger'
 *  Logger.info(TAG,`config = ${config}, err = ${JSON.stringify(exception)}`)
 * */

export default function uiComponentTextInputTwoWayBinding() {

  describe('uiComponentTextInputTwoWayBinding', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_Two_WAY_BINDING_0060
     * @tc.name   : TextInput/TextArea/Search, do not set onchange
     * @tc.desc   : Verify textinput two way binding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_Two_WAY_BINDING_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_Two_WAY_BINDING_0060 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputTwoWayBinding/UiComponentTextInputTwoWayBinding01')
      let driver:Driver=Driver.create();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTINPUT_Two_WAY_BINDING_0060_01')
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentTextInputTwoWayBinding01_01'),1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextInputTwoWayBinding01_02'),1000);
      await textarea.inputText('aaa');
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTINPUT_Two_WAY_BINDING_0060_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_Two_WAY_BINDING_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTINPUT_Two_WAY_BINDING_0050
     * @tc.name   : TextInput/TextArea/Search, do not set onchange
     * @tc.desc   : Verify textinput two way binding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTINPUT_Two_WAY_BINDING_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_Two_WAY_BINDING_0050 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextInputTwoWayBinding/UiComponentTextInputTwoWayBinding02')
      let driver:Driver=Driver.create();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTINPUT_Two_WAY_BINDING_0050_01')
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentTextInputTwoWayBinding02_01'),1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextInputTwoWayBinding02_02'),1000);
      await textarea.inputText('hello world');
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTINPUT_Two_WAY_BINDING_0050_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTINPUT_Two_WAY_BINDING_0050 finish.`);
      done()
    })

  })
}