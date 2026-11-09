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

import { afterEach, describe, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'

export default function uiComponentTextRichEditorCustomKeyboardAvoidance() {
  describe('uiComponentTextRichEditorCustomKeyboardAvoidance', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        done()
        return
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window.Cause :${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMKEYBOARDAVOIDANCE_0018
     * @tc.name   : Continue inputting content after the page avoids the custom keyboard
     * @tc.desc   : Verify text richeditor customkeyboardavoidance interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMKEYBOARDAVOIDANCE_0018', Level.LEVEL3, async (done: Function) => {
      // 1、打开页面
      Settings.createWindow('testability/pages/component/text/TextRichEditorCustomKeyboardAvoidance/UiComponentTextRichEditorCustomkeyboardavoidance0018')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 2、点击RichEditor组件，调出自定义键盘
      let add_text_btn_0018 = await driver.waitForComponent(ON.id('add_text_btn_0018'),500)
      await add_text_btn_0018.click()
      let richeditor_customkeyboardavoidance_0018 = await driver.waitForComponent(ON.id('richeditor_customkeyboardavoidance_0018'), 500)
      await richeditor_customkeyboardavoidance_0018.click()
      await Utils.sleep(1000)

      // 3、截图1：调出自定义键盘时，窗口上抬并延伸至顶部状态栏
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMKEYBOARDAVOIDANCE_0018_01')
      await Utils.sleep(1000)

      // 4、持续输入内容，测试键盘避让光标
      let keyboard_btn_测_0018 = await driver.waitForComponent(ON.id('keyboard_btn_测_0018'), 500)
      let keyboard_btn_试_0018 = await driver.waitForComponent(ON.id('keyboard_btn_试_0018'), 500)
      let keyboard_btn_文_0018 = await driver.waitForComponent(ON.id('keyboard_btn_文_0018'), 500)
      let keyboard_btn_本_0018 = await driver.waitForComponent(ON.id('keyboard_btn_本_0018'), 500)
      let keyboard_btn_内_0018 = await driver.waitForComponent(ON.id('keyboard_btn_内_0018'), 500)
      let keyboard_btn_容_0018 = await driver.waitForComponent(ON.id('keyboard_btn_容_0018'), 500)
      
      for (let i = 0; i < 5; i++) {
        await keyboard_btn_测_0018.click()
        await keyboard_btn_试_0018.click()
        await keyboard_btn_文_0018.click()
        await keyboard_btn_本_0018.click()
        await keyboard_btn_内_0018.click()
        await keyboard_btn_容_0018.click()
        await Utils.sleep(50)
      }

      await Utils.sleep(1000)

      // 5、截图2：持续输入内容时，自定义键盘能避让光标，确保光标不被键盘遮挡
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMKEYBOARDAVOIDANCE_0018_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMKEYBOARDAVOIDANCE_0020
     * @tc.name   : Continue inputting content after the page avoids the custom keyboard
     * @tc.desc   : Verify text richeditor customkeyboardavoidance interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMKEYBOARDAVOIDANCE_0020', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorCustomKeyboardAvoidance/UiComponentTextRichEditorCustomKeyboardAvoidance0020')
      await Utils.sleep(1000) // 等待窗口创建完成
      let driver = await Driver.create()

     let richeditor0020 = await driver.waitForComponent(ON.id('richeditor0020'),500)
      await richeditor0020.click()
      let addTextBtn0020 = await driver.waitForComponent(ON.id('addTextBtn0020'),500)
      for (let i = 0; i < 5; i++) {
        await addTextBtn0020.click()
      }

     await Utils.sleep(2000)

      // 4、截图并等待
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AVOID_CURSOR_0020_01')
      await Utils.sleep(1000)
      done();
    })



  })
}