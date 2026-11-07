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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { Driver, ON } from '@kit.TestKit'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'

export default function uiComponentMediaTextpickerOnenterselectedareaTest() {
  describe('uiComponentMediaTextpickerOnenterselectedareaTest', () => {
    let driver: Driver = Driver.create()

    beforeAll(async () => {
      console.info('uiComponentMediaTextpickerOnenterselectedareaTest beforeAll')
    })

    beforeEach(async () => {
      console.info('uiComponentMediaTextpickerOnenterselectedareaTest beforeEach')
    })

    afterEach(async () => {
      console.info('uiComponentMediaTextpickerOnenterselectedareaTest afterEach')
      await driver.delayMs(500)
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass)
      }
    })

    afterAll(async () => {
      console.info('uiComponentMediaTextpickerOnenterselectedareaTest afterAll')
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0014
     * @tc.name   : TextpickerOnenterselectedarea0014
     * @tc.desc   : Verify media TextPicker onenterselectedarea interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0014', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0014 START')
      await Settings.createWindow('testability/pages/component/text_picker/MediaTextpickerOnenterselectedarea/TextpickerOnenterselectedarea0014')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      let textPicker = await driver.findComponent(ON.id('textPicker'))
      expect(textPicker !== null).assertTrue()

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0014 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0015
     * @tc.name   : TextpickerOnenterselectedarea0015
     * @tc.desc   : Verify media TextPicker onenterselectedarea interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0015', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0015 START')
      await Settings.createWindow('testability/pages/component/text_picker/MediaTextpickerOnenterselectedarea/TextpickerOnenterselectedarea0015')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      let openDialogBtn = await driver.findComponent(ON.id('openDialogBtn'))
      expect(openDialogBtn !== null).assertTrue()
      await openDialogBtn.click()
      await driver.delayMs(1500)

      await driver.pressBack()
      await driver.delayMs(500)

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0015 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0016
     * @tc.name   : TextpickerOnenterselectedarea0016
     * @tc.desc   : Verify media TextPicker onenterselectedarea interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0016', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0016 START')
      await Settings.createWindow('testability/pages/component/text_picker/MediaTextpickerOnenterselectedarea/TextpickerOnenterselectedarea0016')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      let textPicker = await driver.findComponent(ON.id('textPicker'))
      expect(textPicker !== null).assertTrue()

      let triggerCount = await driver.findComponent(ON.id('triggerCount'))
      expect(triggerCount !== null).assertTrue()

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0016 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0017
     * @tc.name   : TextpickerOnenterselectedarea0017
     * @tc.desc   : Verify media TextPicker onenterselectedarea interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0017', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0017 START')
      await Settings.createWindow('testability/pages/component/text_picker/MediaTextpickerOnenterselectedarea/TextpickerOnenterselectedarea0017')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      let openDialogBtn = await driver.findComponent(ON.id('openDialogBtn'))
      expect(openDialogBtn !== null).assertTrue()
      await openDialogBtn.click()
      await driver.delayMs(1500)

      await driver.pressBack()
      await driver.delayMs(500)

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0017 END')
      done()
    })
  })
}

