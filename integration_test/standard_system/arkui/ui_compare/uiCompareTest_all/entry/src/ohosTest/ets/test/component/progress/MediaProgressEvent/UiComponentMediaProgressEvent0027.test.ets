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

export default function uiComponentMediaProgressEvent0027() {
  describe('UiComponentMediaProgressEvent0027', () => {
    afterEach(async (done: Function) => {
      await TestHelper.destroyWindow()
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_EVENT_0027
     * @tc.name   : Progress privacy hide at 100 percent
     * @tc.desc   : Verify Progress reaches 100% with privacy-hide related visual state in card-like layout.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_EVENT_0027', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/progress/MediaProgressEvent/UiComponentMediaProgressEvent0027')
      let driver = await Driver.create()
      await Utils.sleep(800)
      let target = await driver.waitForComponent(ON.id('progress_event_0027'), 2000)
      await Utils.sleep(300)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_EVENT_0027_01')
      done()
    })
  })
}
