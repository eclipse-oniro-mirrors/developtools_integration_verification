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

import { afterEach, describe, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'
import TestHelper from '../../../model/TestHelper'

export default function uiComponentTextPickerGestured0cf() {
  describe('UiComponentTextPickerGestured0cf', () => {
    afterEach(async (done: Function) => {
      await TestHelper.destroyWindow()
      done()
    })

    /*
     * @tc.number : TestCase_d0cf236fa8224bb4b73ffea51564af48
     * @tc.name   : Resource TextPicker fling down
     * @tc.desc   : Verify Resource-range TextPicker selection changes after fling down.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_d0cf236fa8224bb4b73ffea51564af48', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text_picker/TextPickerGesture/UiComponentTextPickerGestured0cf')
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let picker = await driver.waitForComponent(ON.id('textpicker_gesture_d0cf'), 5000)
      expect(picker !== undefined).assertTrue()
      if (picker === undefined) {
        done()
        return
      }
      let rect = await picker.getBounds()
      let centerX: number = Math.floor(rect.left + (rect.right - rect.left) / 2)
      let height: number = Math.floor(rect.bottom - rect.top)
      let startY: number = Math.floor(rect.top + height * 0.8)
      let endY: number = Math.floor(rect.top + height * 0.2)
      let leftX: number = Math.floor(rect.left + (rect.right - rect.left) * 0.25)
      let rightX: number = Math.floor(rect.left + (rect.right - rect.left) * 0.75)
      await driver.swipe(centerX, startY, centerX, endY, 600)
      await Utils.sleep(600)
      await windowSnap.snapShot('TestCase_d0cf236fa8224bb4b73ffea51564af48_01')
      done()
    })
  })
}
