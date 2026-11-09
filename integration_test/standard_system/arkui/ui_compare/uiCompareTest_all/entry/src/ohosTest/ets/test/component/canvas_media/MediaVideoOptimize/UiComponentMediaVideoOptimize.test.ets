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

export default function uiComponentMediaVideoOptimizeTest() {
  describe('uiComponentMediaVideoOptimizeTest', () => {
    let driver: Driver = Driver.create()

    beforeAll(async () => {
      console.info('uiComponentMediaVideoOptimizeTest beforeAll')
    })

    beforeEach(async () => {
      console.info('uiComponentMediaVideoOptimizeTest beforeEach')
    })

    afterEach(async () => {
      console.info('uiComponentMediaVideoOptimizeTest afterEach')
      await driver.delayMs(500)
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass)
      }
    })

    afterAll(async () => {
      console.info('uiComponentMediaVideoOptimizeTest afterAll')
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0070
     * @tc.name   : VideoOptimize0070
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0070', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0070 START')
      await Settings.createWindow('testability/pages/component/canvas_media/MediaVideoOptimize/VideoOptimize0070')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      let seekBtn = await driver.findComponent(ON.id('seekBtn'))
      expect(seekBtn !== null).assertTrue()
      await seekBtn.click()
      await driver.delayMs(500)

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0070 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0370
     * @tc.name   : VideoOptimize0370
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0370', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0370 START')
      await Settings.createWindow('testability/pages/component/canvas_media/MediaVideoOptimize/VideoOptimize0370')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0370 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0380
     * @tc.name   : VideoOptimize0380
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0380', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0380 START')
      await Settings.createWindow('testability/pages/component/canvas_media/MediaVideoOptimize/VideoOptimize0380')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0380 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0390
     * @tc.name   : VideoOptimize0390
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0390', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0390 START')
      await Settings.createWindow('testability/pages/component/canvas_media/MediaVideoOptimize/VideoOptimize0390')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0390 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0400
     * @tc.name   : VideoOptimize0400
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0400', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0400 START')
      await Settings.createWindow('testability/pages/component/canvas_media/MediaVideoOptimize/VideoOptimize0400')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0400 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0410
     * @tc.name   : VideoOptimize0410
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0410', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0410 START')
      await Settings.createWindow('testability/pages/component/canvas_media/MediaVideoOptimize/VideoOptimize0410')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      let playAllBtn = await driver.findComponent(ON.id('playAllBtn'))
      expect(playAllBtn !== null).assertTrue()
      await playAllBtn.click()
      await driver.delayMs(1000)

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0410 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0420
     * @tc.name   : VideoOptimize0420
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0420', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0420 START')
      await Settings.createWindow('testability/pages/component/canvas_media/MediaVideoOptimize/VideoOptimize0420')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      let playAllBtn = await driver.findComponent(ON.id('playAllBtn'))
      expect(playAllBtn !== null).assertTrue()
      await playAllBtn.click()
      await driver.delayMs(500)

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0420 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0430
     * @tc.name   : VideoOptimize0430
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0430', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0430 START')
      await Settings.createWindow('testability/pages/component/canvas_media/MediaVideoOptimize/VideoOptimize0430')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      let playAllBtn = await driver.findComponent(ON.id('playAllBtn'))
      expect(playAllBtn !== null).assertTrue()
      await playAllBtn.click()
      await driver.delayMs(500)

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0430 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0440
     * @tc.name   : VideoOptimize0440
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0440', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0440 START')
      await Settings.createWindow('testability/pages/component/canvas_media/MediaVideoOptimize/VideoOptimize0440')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      let playAllBtn = await driver.findComponent(ON.id('playAllBtn'))
      expect(playAllBtn !== null).assertTrue()
      await playAllBtn.click()
      await driver.delayMs(500)

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0440 END')
      done()
    })
  })
}
