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

import { describe, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'

export default function uiComponentDynamicUec0016() {
  describe('uiComponentDynamicUec0016', () => {
    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_DYNAMICCOMPONENT_UEC_ARKUI_0016
     * @tc.name   : UIExtensionComponent onError/host path
     * @tc.desc   : Verify UIExtensionComponent mounts and reports error/status for provider path.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it(
      'SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_DYNAMICCOMPONENT_UEC_ARKUI_0016',
      Level.LEVEL3,
      async (done: Function) => {
      await Settings.changeWindow('testability/pages/scenario/misc/DynamicUec/UiComponentDynamicUec0016')
      let driver = await Driver.create()
      await Utils.sleep(800)
      let ok = false
      for (let i = 0; i < 10; i++) {
        let result = await driver.waitForComponent(ON.id('uec_status'), 2000)
        if (result != undefined) {
          let text = await result.getText()
          if (text != undefined && text.indexOf('uec_error:') >= 0) {
            ok = true
            break
          }
        }
        await Utils.sleep(300)
      }
      expect(ok).assertTrue()
      done()
    })
  })
}