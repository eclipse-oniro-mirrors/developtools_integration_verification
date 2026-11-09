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

import { afterEach, describe, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'

export default function UiComponentTextRichEditorAdaptiveAging() {
  describe('UiComponentTextRichEditorAdaptiveAging', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ADAPTIVE_AGING_0013
     * @tc.name   : Activate rolling verification
     * @tc.type   : Function
     * @tc.size   : UiTest
     * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ADAPTIVE_AGING_0013", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorAdaptiveAging/UiComponentTextRichEditorAdaptiveAging0013")
      let driver = await Driver.create()

      // 1、查找richEditor、setTypingStyle组件
      let richEditor = await driver.findComponent(ON.id("rich_editor_adaptiveAging_0013"))


      // // 2、richEditor并滑动查看
      // await richEditor.inputText(
      //     '++++++++测试头部+++++++++\n' +
      //     '=======================\n' +
      //     '=======================\n' +
      //     '=======================\n' +
      //     '=======================\n' +
      //     '=======================\n' +
      //     '=======================\n' +
      //     '=======================\n' +
      //     '--------测试尾部--------\n');
      // 滑动前截图
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ADAPTIVE_AGING_0013_01")
      await Utils.sleep(1000)
      let point = await richEditor.getBoundsCenter()
      // 模拟滑动测试
      await driver.swipe(point.x, point.y + 70, point.x, point.y - 70, 800)
      // 滑动后截图
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ADAPTIVE_AGING_0013_02")
      await Utils.sleep(1000)
      done()

    })

  })
}