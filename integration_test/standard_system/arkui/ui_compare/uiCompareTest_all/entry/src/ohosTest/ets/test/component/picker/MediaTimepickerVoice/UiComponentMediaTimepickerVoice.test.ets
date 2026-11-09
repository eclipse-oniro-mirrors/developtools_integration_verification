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

export default function uiComponentMediaTimepickerVoiceTest() {
  describe('uiComponentMediaTimepickerVoiceTest', () => {
    let driver: Driver = Driver.create()

    beforeAll(async () => {
      console.info('uiComponentMediaTimepickerVoiceTest beforeAll')
    })

    beforeEach(async () => {
      console.info('uiComponentMediaTimepickerVoiceTest beforeEach')
    })

    afterEach(async () => {
      console.info('uiComponentMediaTimepickerVoiceTest afterEach')
      await driver.delayMs(500)
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass)
      }
    })

    afterAll(async () => {
      console.info('uiComponentMediaTimepickerVoiceTest afterAll')
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0014
     * @tc.name   : TimepickerVoice0014
     * @tc.desc   : Verify media TimePicker voice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0014', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0014 START')
      await Settings.createWindow('testability/pages/component/picker/MediaTimepickerVoice/TimepickerVoice0014')
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
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0014 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0019
     * @tc.name   : TimepickerVoice0019
     * @tc.desc   : Verify media TimePicker voice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0019', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0019 START')
      await Settings.createWindow('testability/pages/component/picker/MediaTimepickerVoice/TimepickerVoice0019')
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
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0019 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0021
     * @tc.name   : TimepickerVoice0021
     * @tc.desc   : Verify media TimePicker voice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0021', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0021 START')
      await Settings.createWindow('testability/pages/component/picker/MediaTimepickerVoice/TimepickerVoice0021')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      let musicBtn = await driver.findComponent(ON.id('musicBtn'))
      expect(musicBtn !== null).assertTrue()
      await musicBtn.click()
      await driver.delayMs(500)

      let openDialogBtn = await driver.findComponent(ON.id('openDialogBtn'))
      expect(openDialogBtn !== null).assertTrue()
      await openDialogBtn.click()
      await driver.delayMs(1500)

      await driver.pressBack()
      await driver.delayMs(500)

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0021 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0022
     * @tc.name   : TimepickerVoice0022
     * @tc.desc   : Verify media TimePicker voice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0022', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0022 START')
      await Settings.createWindow('testability/pages/component/picker/MediaTimepickerVoice/TimepickerVoice0022')
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
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0022 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0023
     * @tc.name   : TimepickerVoice0023
     * @tc.desc   : Verify media TimePicker voice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0023', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0023 START')
      await Settings.createWindow('testability/pages/component/picker/MediaTimepickerVoice/TimepickerVoice0023')
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
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0023 END')
      done()
    })
  })
}

