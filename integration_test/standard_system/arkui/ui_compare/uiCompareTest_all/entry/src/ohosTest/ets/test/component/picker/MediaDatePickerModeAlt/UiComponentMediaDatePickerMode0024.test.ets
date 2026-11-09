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

export default function uiComponentMediaDatePickerMode0024() {
  describe('uiComponentMediaDatePickerMode0024', () => {
    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0024
     * @tc.name   : DatePicker memory leak readiness marker
     * @tc.desc   : Verify DatePicker leak-check readiness marker when native leak tools are unavailable.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_MODE_0024', Level.LEVEL3, async (done: Function) => {
      await Settings.changeWindow('testability/pages/component/picker/MediaDatePickerMode/UiComponentMediaDatePickerMode0024')
      let driver = await Driver.create()
      await Utils.sleep(1500)
      let btn = await driver.waitForComponent(ON.id('datepicker_leak_btn'), 8000)
      if (btn == undefined) {
        expect(false).assertTrue()
        done()
        return
      }
      await btn.click()
      await Utils.sleep(500)
      let result = await driver.waitForComponent(ON.id('assert_result_dp_0024'), 5000)
      if (result == undefined) {
        expect(false).assertTrue()
        done()
        return
      }
      let text = await result.getText()
      expect(text).assertEqual('datepicker_leak_check_pending')
      done()
    })
  })
}