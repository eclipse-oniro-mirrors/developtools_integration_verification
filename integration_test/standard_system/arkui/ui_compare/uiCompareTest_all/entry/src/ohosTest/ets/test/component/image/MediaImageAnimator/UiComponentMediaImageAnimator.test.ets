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

export default function uiComponentMediaImageAnimatorTest() {
  describe('uiComponentMediaImageAnimatorTest', () => {
    let driver: Driver = Driver.create()

    beforeAll(async () => {
      console.info('uiComponentMediaImageAnimatorTest beforeAll')
    })

    beforeEach(async () => {
      console.info('uiComponentMediaImageAnimatorTest beforeEach')
    })

    afterEach(async () => {
      console.info('uiComponentMediaImageAnimatorTest afterEach')
      await driver.delayMs(500)
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass)
      }
    })

    afterAll(async () => {
      console.info('uiComponentMediaImageAnimatorTest afterAll')
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_MONITORINVISIBLEAREA_0018
     * @tc.name   : ImageanimatorMonitorinvisiblearea0018
     * @tc.desc   : Verify media imageanimator monitorinvisiblearea interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_MONITORINVISIBLEAREA_0018', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_MONITORINVISIBLEAREA_0018 START')
      await Settings.createWindow('testability/pages/component/image/MediaImageAnimator/ImageanimatorMonitorinvisiblearea0018')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      let toggleBtn = await driver.findComponent(ON.id('toggleBtn'))
      expect(toggleBtn !== null).assertTrue()
      await toggleBtn.click()
      await driver.delayMs(500)

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_MONITORINVISIBLEAREA_0018 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_MONITORINVISIBLEAREA_0033
     * @tc.name   : ImageanimatorMonitorinvisiblearea0033
     * @tc.desc   : Verify media imageanimator monitorinvisiblearea interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_MONITORINVISIBLEAREA_0033', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_MONITORINVISIBLEAREA_0033 START')
      await Settings.createWindow('testability/pages/component/image/MediaImageAnimator/ImageanimatorMonitorinvisiblearea0033')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      let toggleBtn = await driver.findComponent(ON.id('toggleBtn'))
      expect(toggleBtn !== null).assertTrue()
      await toggleBtn.click()
      await driver.delayMs(500)

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_MONITORINVISIBLEAREA_0033 END')
      done()
    })
  })
}

