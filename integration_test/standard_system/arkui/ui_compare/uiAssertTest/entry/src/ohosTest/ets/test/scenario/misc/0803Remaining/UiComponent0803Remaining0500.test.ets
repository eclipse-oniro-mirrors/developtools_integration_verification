/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'

export default function uiComponent0803Remaining0500() {
  describe('uiComponent0803Remaining0500', () => {
    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_FOLDERSTACK_0500
     * @tc.name   : ColumnSplit layout ready
     * @tc.desc   : Verify ColumnSplit layout presents ready status.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_FOLDERSTACK_0500', Level.LEVEL3, async (done: Function) => {
      await Settings.changeWindow('testability/pages/scenario/misc/0803Remaining/UiComponent0803Remaining0500')
      let driver = await Driver.create()
      await Utils.sleep(1500)
      let target = await driver.waitForComponent(ON.id('split_status'), 8000)
      if (target == undefined) {
        expect(false).assertTrue()
        done()
        return
      }
      let result = await driver.waitForComponent(ON.id('split_status'), 8000)
      if (result == undefined) {
        expect(false).assertTrue()
        done()
        return
      }
      let text = await result.getText()
      expect(text).assertEqual('split_ready')
      done()
    })
  })
}