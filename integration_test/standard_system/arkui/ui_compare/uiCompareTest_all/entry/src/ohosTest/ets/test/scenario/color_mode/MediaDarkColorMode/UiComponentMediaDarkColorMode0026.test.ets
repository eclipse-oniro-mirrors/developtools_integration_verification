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
import { uiAppearance } from '@kit.ArkUI'
import TestHelper from '../../../model/TestHelper'

export default function uiComponentMediaDarkColorMode0026() {
  describe('UiComponentMediaDarkColorMode0026', () => {
    afterEach(async (done: Function) => {
      await TestHelper.destroyWindow()
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0026
     * @tc.name   : Progress in dark color mode
     * @tc.desc   : Verify the interface under test: set dark color mode，Progress.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0026', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/scenario/color_mode/MediaDarkColorMode/UiComponentMediaDarkColorMode0026')
      let driver = await Driver.create()
      await Utils.sleep(500)

      uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK)
      await Utils.sleep(500)
      let target = await driver.waitForComponent(ON.id('dark_colormode_0026'), 500)
      await Utils.sleep(300)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0026_01')
      await Utils.sleep(300)

      uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT)
      await Utils.sleep(300)
      done()
    })
  })
}
