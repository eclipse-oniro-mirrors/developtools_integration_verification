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
import { Driver, ON, Component } from '@kit.TestKit'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'

export default function uiComponentNavNavdestinationPropertyTest() {
  describe('uiComponentNavNavdestinationPropertyTest', () => {
    let driver: Driver = Driver.create()

    beforeAll(async () => {
      console.info('uiComponentNavNavdestinationPropertyTest beforeAll')
    })

    beforeEach(async () => {
      console.info('uiComponentNavNavdestinationPropertyTest beforeEach')
    })

    afterEach(async () => {
      console.info('uiComponentNavNavdestinationPropertyTest afterEach')
      // 销毁窗口
      if (Settings.windowClass) {
        Settings.destroyWindow(Settings.windowClass)
        await driver.delayMs(500)
      }
    })

    afterAll(async () => {
      console.info('uiComponentNavNavdestinationPropertyTest afterAll')
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_PROPERTY_0110
     * @tc.name   : Nav navdestination property
     * @tc.desc   : Verify nav navdestination property interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_PROPERTY_0110', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavdestinationProperty/NavdestinationProperty0110')
      await driver.delayMs(2000)

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_page'))
      if (btnPush) {
        await btnPush.click()
        await driver.delayMs(500)
      }

      let btnMenu: Component = await driver.findComponent(ON.id('btn_menu'))
      if (btnMenu) {
        await btnMenu.click()
        await driver.delayMs(500)
      }

      let menuIcon1: Component = await driver.findComponent(ON.id('menu_icon_1'))
      expect(menuIcon1 !== null).assertTrue()

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_PROPERTY_0120
     * @tc.name   : Nav navdestination property
     * @tc.desc   : Verify nav navdestination property interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_PROPERTY_0120', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavdestinationProperty/NavdestinationProperty0120')
      await driver.delayMs(2000)

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_page'))
      if (btnPush) {
        await btnPush.click()
        await driver.delayMs(500)
      }

      let btnHideTitle: Component = await driver.findComponent(ON.id('btn_hide_title'))
      if (btnHideTitle) {
        await btnHideTitle.click()
        await driver.delayMs(300)
      }

      let btnHideToolbar: Component = await driver.findComponent(ON.id('btn_hide_toolbar'))
      if (btnHideToolbar) {
        await btnHideToolbar.click()
        await driver.delayMs(300)
      }

      let btnSafeAreaType: Component = await driver.findComponent(ON.id('btn_safe_area_type'))
      if (btnSafeAreaType) {
        await btnSafeAreaType.click()
        await driver.delayMs(300)
      }

      let btnSafeAreaEdge: Component = await driver.findComponent(ON.id('btn_safe_area_edge'))
      if (btnSafeAreaEdge) {
        await btnSafeAreaEdge.click()
        await driver.delayMs(300)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })
  })
}