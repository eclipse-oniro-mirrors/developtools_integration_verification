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
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'

export default function uiComponentTextRichEditorCustomspan() {
  describe('uiComponentTextRichEditorCustomspan', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0005
     * @tc.name   : Custom drawing pure text span
     * @tc.desc   : Verify text richeditor customspan interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0005', Level.LEVEL3, async (done: Function) => {
      // 步骤1、打开页面，等待页面加载完成
      Settings.createWindow('testability/pages/component/text/TextRichEditorCustomspan/UiComponentTextRichEditorCustomspan0005')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2、查找RichEditor组件
      let rich_editor_customspan_0005 = await driver.waitForComponent(ON.id('rich_editor_customspan_0005'), 500)
      if (!rich_editor_customspan_0005) {
        Logger.error('TEST', 'RichEditor component not found!');
        done();
        return;
      }

      await Utils.sleep(500)

      // 步骤3、观察效果
      // 预期效果：自定义span正常显示
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0005_01')
      await Utils.sleep(1000)
      done();
    })

  })
}