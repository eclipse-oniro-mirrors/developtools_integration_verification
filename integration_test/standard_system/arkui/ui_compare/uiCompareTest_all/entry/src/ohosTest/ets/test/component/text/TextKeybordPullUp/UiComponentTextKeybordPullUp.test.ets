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

import { afterEach, describe, it } from '@ohos/hypium'
import { Driver, ON } from '@kit.TestKit'
import Utils from '../../../model/Utils'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'

export default function uiComponentTextKeybordPullUp() {
  describe('uiComponentTextKeybordPullUp', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass != undefined) {
        await Settings.windowClass.destroyWindow()
        Settings.windowClass = undefined
      }
      await Utils.sleep(1000)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_KEYBORD_Pull_UP_0020
     * @tc.name   : Pull up the input method in the popup control
     * @tc.desc   : Verify text keybord pull up interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_KEYBORD_Pull_UP_0020', 0, async (done: Function) => {
      // 步骤1: 打开测试页面，应用内包含弹窗控件，弹窗控件中嵌入输入框
      Settings.createWindow('testability/pages/component/text/TextKeybordPullUp/UiComponentTextKeybordPullUp0020')
      let driver = await Driver.create()
      await Utils.sleep(1000)

      // 打开弹窗
      let btn_open_dialog_pullup_0020 = await driver.waitForComponent(ON.id('btn_open_dialog_pullup_0020'), 3000)
      await btn_open_dialog_pullup_0020.click()
      await Utils.sleep(2000)

      // 步骤2: 点击弹窗控件中的输入框
      let text_input_dialog_pullup_0020 = await driver.waitForComponent(ON.id('text_input_dialog_pullup_0020'), 3000)
      await text_input_dialog_pullup_0020.click()
      await Utils.sleep(1000)


      // 预期效果1: 输入法成功拉起
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_KEYBORD_Pull_UP_0020_01')
      await Utils.sleep(1000)

      // 关闭弹窗
      let btn_cancel_dialog = await driver.waitForComponent(ON.id('btn_cancel_dialog_pullup_0020'), 1000)
      await btn_cancel_dialog.click()

      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_KEYBORD_Pull_UP_0020_02')
      await Utils.sleep(500)

      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_KEYBORD_Pull_UP_0010
     * @tc.name   : Focus switch to pull up the input box
     * @tc.desc   : Verify text keybord pull up interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_KEYBORD_Pull_UP_0010', 0, async (done: Function) => {
      // 步骤1: 打开测试页面，应用内依次包含 Button、输入框、Button 控件
      Settings.createWindow('testability/pages/component/text/TextKeybordPullUp/UiComponentTextKeybordPullUp0010')
      let driver = await Driver.create()
      await Utils.sleep(2000)

      // 步骤2: 在应用内通过 Tab 键依次走焦
      // 先聚焦到第一个按钮
      let btn_first_pullup_0010 = await driver.waitForComponent(ON.id('btn_first_pullup_0010'), 3000)
      await btn_first_pullup_0010.click()
      await Utils.sleep(1000)

      // 按Tab键走焦到输入框
      await driver.triggerKey(2021) // Tab键的keyCode是2021
      await Utils.sleep(1000)

      // 预期效果1: 走焦至输入框控件时，输入法拉起
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_KEYBORD_Pull_UP_0010_01')
      await Utils.sleep(1000)

      // 再按Tab键走焦到第二个按钮
      await driver.triggerKey(2021) // Tab键的keyCode是2021
      await Utils.sleep(1000)

      // 预期效果2: 从输入框控件走焦至 Button 时，输入法收起
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_KEYBORD_Pull_UP_0010_02')
      await Utils.sleep(1000)

      done()
    })


  })
}