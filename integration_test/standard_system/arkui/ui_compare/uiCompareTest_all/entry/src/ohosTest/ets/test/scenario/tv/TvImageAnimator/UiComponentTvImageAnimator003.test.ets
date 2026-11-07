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

import { afterEach, describe, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'
import TestHelper from '../../../model/TestHelper'

export default function uiComponentTvImageAnimator003() {
  describe('UiComponentTvImageAnimator003', () => {
    afterEach(async (done: Function) => {
      await TestHelper.destroyWindow()
      done()
    })

    /*
     * @tc.number : SUB_TV_UX_ImageAnimator_003
     * @tc.name   : TV ImageAnimator overlay style look
     * @tc.desc   : Verify ImageAnimator TV overlay style has no unexpected visual delta.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_TV_UX_ImageAnimator_003', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/scenario/tv/TvImageAnimator/UiComponentTvImageAnimator003')
      let driver = await Driver.create()
      await Utils.sleep(800)
      let target = await driver.waitForComponent(ON.id('tv_imageanimator_003'), 2000)
      await Utils.sleep(300)
      await windowSnap.snapShot('SUB_TV_UX_ImageAnimator_003_01')
      done()
    })
  })
}
