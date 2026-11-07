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

export default function uiComponentMediaDcStress677() {
  describe('UiComponentMediaDcStress677', () => {
    afterEach(async (done: Function) => {
      await TestHelper.destroyWindow()
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DC_0030_677
     * @tc.name   : Single DC container multi-component switch
     * @tc.desc   : Verify multiple components in one container can switch properties visually.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DC_0030_677', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/scenario/container/MediaDcStress/UiComponentMediaDcStress677')
      let driver = await Driver.create()
      await Utils.sleep(800)
      let target = await driver.waitForComponent(ON.id('dc_progress_0030'), 2000)
      await Utils.sleep(300)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_DC_0030_677_01')
      done()
    })
  })
}
