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

export default function uiComponentInformationLoadProgress0010() {
  describe('UiComponentInformationLoadProgress0010', () => {
    afterEach(async (done: Function) => {
      await TestHelper.destroyWindow()
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_loadingProgress_0010
     * @tc.name   : LoadingProgress non-linear refresh animation
     * @tc.desc   : Verify the interface under test: Loading animation.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_loadingProgress_0010', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(
        'testability/pages/component/progress/InformationLoadProgress/' +
        'uiComponentInformationLoadProgress0010'
      )
      let driver = await Driver.create()
      await Utils.sleep(500)
      let target = await driver.waitForComponent(ON.id('loadingprogress_0010'), 500)
      await Utils.sleep(300)
      await windowSnap.snapShot('SUB_ACE_UI_loadingProgress_0010_01')
      done()
    })
  })
}
