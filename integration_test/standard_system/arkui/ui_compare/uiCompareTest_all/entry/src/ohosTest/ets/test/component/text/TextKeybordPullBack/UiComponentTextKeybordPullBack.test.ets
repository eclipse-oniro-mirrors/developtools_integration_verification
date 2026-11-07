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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { Driver, ON } from '@kit.TestKit'
import Utils from '../../../model/Utils'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'

export default function uiComponentTextKeybordPullBack() {
  describe('uiComponentTextKeybordPullBack', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass != undefined) {
        await Settings.windowClass.destroyWindow()
        Settings.windowClass = undefined
      }
      await Utils.sleep(1000)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_KEYBORD_Pull_Back_0020
     * @tc.name   : Switch page to trigger keyboard retract
     * @tc.desc   : Verify text keybord pull back interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_KEYBORD_Pull_Back_0020', 0, async (done: Function) => {
      // 打开测试页面
      Settings.createWindow('testability/pages/component/text/TextKeybordPullBack/UiComponentTextKeybordPullBack0020')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1: 点击输入框拉起键盘
      let text_input_pullback_0020 = await driver.waitForComponent(ON.id('text_input_pullback_0020'), 500)
      await text_input_pullback_0020.click()
      await Utils.sleep(1000)

      // 预期效果1: 输入法拉起
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_KEYBORD_Pull_Back_0020_01')
      await Utils.sleep(1000)

      // 步骤2: 点击按钮切换页面
      let btn_jump_pullback_0020 = await driver.waitForComponent(ON.id('btn_jump_pullback_0020'), 500)
      await btn_jump_pullback_0020.click()
      await Utils.sleep(1000)

      // 步骤3: 截图测试页面切换键盘自动收起
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_KEYBORD_Pull_Back_0020_02')
      await Utils.sleep(1000)

      done()
    })
  })
}