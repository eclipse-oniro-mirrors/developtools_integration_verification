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

export default function uiComponentMediaPcEventTest() {
  describe('uiComponentMediaPcEventTest', () => {
    let driver: Driver = Driver.create()

    beforeAll(async () => {
      console.info('uiComponentMediaPcEventTest beforeAll')
    })

    beforeEach(async () => {
      console.info('uiComponentMediaPcEventTest beforeEach')
    })

    afterEach(async () => {
      console.info('uiComponentMediaPcEventTest afterEach')
      await driver.delayMs(500)
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass)
      }
    })

    afterAll(async () => {
      console.info('uiComponentMediaPcEventTest afterAll')
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PC_Event_0034
     * @tc.name   : PcEvent0034
     * @tc.desc   : Verify media pc event interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PC_Event_0034', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_PC_Event_0034 START')
      await Settings.createWindow('testability/pages/scenario/action_event/MediaPcEvent_09/PcEvent0034')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      let textTimer = await driver.findComponent(ON.id('textTimer'))
      expect(textTimer !== null).assertTrue()

      let startBtn = await driver.findComponent(ON.id('startBtn'))
      expect(startBtn !== null).assertTrue()
      await startBtn.click()
      await driver.delayMs(1000)

      let pauseBtn = await driver.findComponent(ON.id('pauseBtn'))
      await pauseBtn.click()
      await driver.delayMs(500)

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_PC_Event_0034 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PC_Event_0035
     * @tc.name   : PcEvent0035
     * @tc.desc   : Verify media pc event interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PC_Event_0035', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_PC_Event_0035 START')
      await Settings.createWindow('testability/pages/scenario/action_event/MediaPcEvent_09/PcEvent0035')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      let textTimer = await driver.findComponent(ON.id('textTimer'))
      expect(textTimer !== null).assertTrue()

      let startBtn = await driver.findComponent(ON.id('startBtn'))
      expect(startBtn !== null).assertTrue()
      await startBtn.click()
      await driver.delayMs(1000)

      let pauseBtn = await driver.findComponent(ON.id('pauseBtn'))
      await pauseBtn.click()
      await driver.delayMs(500)

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_PC_Event_0035 END')
      done()
    })
  })
}

