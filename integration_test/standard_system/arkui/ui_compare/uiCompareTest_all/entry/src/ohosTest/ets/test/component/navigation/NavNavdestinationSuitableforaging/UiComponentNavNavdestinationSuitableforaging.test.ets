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

export default function uiComponentNavNavdestinationSuitableforagingTest() {
  describe('uiComponentNavNavdestinationSuitableforagingTest', () => {
    let driver: Driver = Driver.create()

    beforeAll(async () => {
      console.info('uiComponentNavNavdestinationSuitableforagingTest beforeAll')
    })

    beforeEach(async () => {
      console.info('uiComponentNavNavdestinationSuitableforagingTest beforeEach')
    })

    afterEach(async () => {
      console.info('uiComponentNavNavdestinationSuitableforagingTest afterEach')
      await driver.delayMs(500)
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass)
      }
    })

    afterAll(async () => {
      console.info('uiComponentNavNavdestinationSuitableforagingTest afterAll')
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_SUITABLEFORAGING_0030
     * @tc.name   : NavdestinationSuitableforaging0030
     * @tc.desc   : Verify nav navdestination suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_SUITABLEFORAGING_0030', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_SUITABLEFORAGING_0030 START')
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationSuitableforaging/NavdestinationSuitableforaging0030')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      let menuBtn = await driver.findComponent(ON.id('menuBtn'))
      expect(menuBtn !== null).assertTrue()
      await menuBtn.click()
      await driver.delayMs(500)

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_SUITABLEFORAGING_0030 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_SUITABLEFORAGING_0060
     * @tc.name   : NavdestinationSuitableforaging0060
     * @tc.desc   : Verify nav navdestination suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_SUITABLEFORAGING_0060', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_SUITABLEFORAGING_0060 START')
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationSuitableforaging/NavdestinationSuitableforaging0060')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      let navigationArea = await driver.findComponent(ON.id('navigationArea'))
      expect(navigationArea !== null).assertTrue()

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_SUITABLEFORAGING_0060 END')
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_SUITABLEFORAGING_0090
     * @tc.name   : NavdestinationSuitableforaging0090
     * @tc.desc   : Verify nav navdestination suitableforaging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_SUITABLEFORAGING_0090', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_SUITABLEFORAGING_0090 START')
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationSuitableforaging/NavdestinationSuitableforaging0090')
      await driver.delayMs(1000)

      let title = await driver.findComponent(ON.id('title'))
      expect(title !== null).assertTrue()

      let menuBtn = await driver.findComponent(ON.id('menuBtn'))
      expect(menuBtn !== null).assertTrue()
      await menuBtn.click()
      await driver.delayMs(500)

      await windowSnap.snapShot()
      await driver.delayMs(500)
      console.info('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_SUITABLEFORAGING_0090 END')
      done()
    })
  })
}
