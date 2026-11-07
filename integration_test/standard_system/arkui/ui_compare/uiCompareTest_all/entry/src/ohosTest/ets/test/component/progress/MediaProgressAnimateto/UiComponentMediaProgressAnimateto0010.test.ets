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

export default function uiComponentMediaProgressAnimateto0010() {
  describe('UiComponentMediaProgressAnimateto0010', () => {
    afterEach(async (done: Function) => {
      await TestHelper.destroyWindow()
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_ANIMATETO_0010
     * @tc.name   : Progress animateTo enableSmoothEffect false
     * @tc.desc   : Verify the interface under test: Progress animateToanimation set enableSmoothEffect property to
     *          false.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_ANIMATETO_0010', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/progress/MediaProgressAnimateto/UiComponentMediaProgressAnimateto0010')
      let driver = await Driver.create()
      await Utils.sleep(500)
      let target = await driver.waitForComponent(ON.id('progress_animateto_0010'), 2000)
      await Utils.sleep(500)
      let btn = await driver.findComponent(ON.text('run'))
      if (btn != undefined) {
        await btn.click()
        await Utils.sleep(1200)
      } else {
        await Utils.sleep(800)
      }
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_ANIMATETO_0010_01')
      done()
    })
  })
}
