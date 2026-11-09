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
import Settings from '../../../../model/Settings'
import Utils from '../../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../../model/snapShot'
import TestHelper from '../../../../model/TestHelper'

export default function uiComponentMediaImageOnError0022() {
  describe('UiComponentMediaImageOnError0022', () => {
    afterEach(async (done: Function) => {
      await TestHelper.destroyWindow()
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_MSG_0022
     * @tc.name   : Image onError make svg dom failed
     * @tc.desc   : Verify Image onError make-svg-dom-failed visual fallback presentation.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_MSG_0022', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/image/on_error/MediaImageOnError/UiComponentMediaImageOnError0022')
      let driver = await Driver.create()
      await Utils.sleep(800)
      let target = await driver.waitForComponent(ON.id('image_onerror_0022'), 2000)
      await Utils.sleep(300)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_MSG_0022_01')
      done()
    })
  })
}
