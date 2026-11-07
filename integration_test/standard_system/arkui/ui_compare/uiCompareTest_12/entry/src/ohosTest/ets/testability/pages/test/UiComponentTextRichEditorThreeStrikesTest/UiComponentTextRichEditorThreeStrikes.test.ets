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

import { describe, it, afterEach, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, MouseButton } from '@kit.TestKit'
import { uiAppearance } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit';
import windowSnap from '../../../model/snapShot'

export default function UiComponentTextRichEditorThreeStrikes() {
  describe('UiComponentTextRichEditorThreeStrikes', () => {
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
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0003
        * @tc.name   : Triple click on empty text
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0003", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorThreeStrikes/UiComponentTextRichEditorThreeStrikes0003")
      await Utils.sleep(1000) // 等待窗口创建完成
      let driver = await Driver.create()

      // 1、查找组件
      let rich_editor_threestrikes_0003 = await driver.waitForComponent(ON.id("rich_editor_threestrikes_0003"), 1500)
      if (!rich_editor_threestrikes_0003) {
        Logger.error('TEST', 'RichEditor component not found!');
        done();
        return;
      }

      await Utils.sleep(1000)
      
      // 2、在空文本区域进行三击操作
      let point_threestrikes_0003 = await rich_editor_threestrikes_0003.getBoundsCenter()
      
      // 3、模拟三击操作：连续三次点击
      await driver.click(point_threestrikes_0003.x,point_threestrikes_0003.y)
      await Utils.sleep(100)
      await driver.click(point_threestrikes_0003.x,point_threestrikes_0003.y)
      await Utils.sleep(100)
      await driver.click(point_threestrikes_0003.x,point_threestrikes_0003.y)
      
      await Utils.sleep(1000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0003_01")
      await Utils.sleep(1000)
      done();
    })

  })
}
