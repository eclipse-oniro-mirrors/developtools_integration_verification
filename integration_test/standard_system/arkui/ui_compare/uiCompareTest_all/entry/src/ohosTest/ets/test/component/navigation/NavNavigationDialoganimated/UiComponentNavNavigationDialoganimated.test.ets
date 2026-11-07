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

export default function uiComponentNavNavigationDialoganimatedTest() {
  describe('uiComponentNavNavigationDialoganimatedTest', () => {
    let driver: Driver = Driver.create()

    beforeAll(async () => {
      console.info('uiComponentNavNavigationDialoganimatedTest beforeAll')
    })

    beforeEach(async () => {
      console.info('uiComponentNavNavigationDialoganimatedTest beforeEach')
    })

    afterEach(async () => {
      console.info('uiComponentNavNavigationDialoganimatedTest afterEach')
      // 销毁窗口
      if (Settings.windowClass) {
        Settings.destroyWindow(Settings.windowClass)
        await driver.delayMs(500)
      }
    })

    afterAll(async () => {
      console.info('uiComponentNavNavigationDialoganimatedTest afterAll')
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0260
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0260', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0260')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(500)
      }

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_3_dialogs'))
      if (btnPush) {
        await btnPush.click()
        await driver.delayMs(1000)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0270
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0270', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0270')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(300)
      }

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_dialog'))
      if (btnPush) {
        await btnPush.click()
        await driver.delayMs(300)
        await btnPush.click()
        await driver.delayMs(300)
        await btnPush.click()
        await driver.delayMs(300)
      }

      let btnPop: Component = await driver.findComponent(ON.id('btn_pop_3'))
      if (btnPop) {
        await btnPop.click()
        await driver.delayMs(500)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0280
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0280', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0280')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(300)
      }

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_mixed'))
      if (btnPush) {
        await btnPush.click()
        await driver.delayMs(500)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0290
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0290', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0290')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(300)
      }

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_mixed'))
      if (btnPush) {
        await btnPush.click()
        await driver.delayMs(500)
      }

      let btnPop: Component = await driver.findComponent(ON.id('btn_pop_3'))
      if (btnPop) {
        await btnPop.click()
        await driver.delayMs(500)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0300
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0300', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0300')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(300)
      }

      let btnThree: Component = await driver.findComponent(ON.id('btn_push_three'))
      if (btnThree) {
        await btnThree.click()
        await driver.delayMs(300)
      }

      let btnTwo: Component = await driver.findComponent(ON.id('btn_push_two'))
      if (btnTwo) {
        await btnTwo.click()
        await driver.delayMs(300)
      }

      if (btnThree) {
        await btnThree.click()
        await driver.delayMs(300)
      }

      let btnClear: Component = await driver.findComponent(ON.id('btn_clear'))
      if (btnClear) {
        await btnClear.click()
        await driver.delayMs(500)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0310
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0310', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0310')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(300)
      }

      let btnOne: Component = await driver.findComponent(ON.id('btn_push_one'))
      if (btnOne) {
        await btnOne.click()
        await driver.delayMs(300)
      }

      let btnThree: Component = await driver.findComponent(ON.id('btn_push_three'))
      if (btnThree) {
        await btnThree.click()
        await driver.delayMs(300)
      }

      let btnClear: Component = await driver.findComponent(ON.id('btn_clear'))
      if (btnClear) {
        await btnClear.click()
        await driver.delayMs(500)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0320
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0320', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0320')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(300)
      }

      let btnThree: Component = await driver.findComponent(ON.id('btn_push_three'))
      if (btnThree) {
        await btnThree.click()
        await driver.delayMs(300)
      }

      let btnTwo: Component = await driver.findComponent(ON.id('btn_push_two'))
      if (btnTwo) {
        await btnTwo.click()
        await driver.delayMs(300)
      }

      let btnPop: Component = await driver.findComponent(ON.id('btn_pop'))
      if (btnPop) {
        await btnPop.click()
        await driver.delayMs(300)
        await btnPop.click()
        await driver.delayMs(300)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0330
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0330', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0330')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(300)
      }

      let btnOne: Component = await driver.findComponent(ON.id('btn_push_one'))
      if (btnOne) {
        await btnOne.click()
        await driver.delayMs(300)
      }

      let btnThree: Component = await driver.findComponent(ON.id('btn_push_three'))
      if (btnThree) {
        await btnThree.click()
        await driver.delayMs(300)
      }

      let btnPop: Component = await driver.findComponent(ON.id('btn_pop'))
      if (btnPop) {
        await btnPop.click()
        await driver.delayMs(300)
        await btnPop.click()
        await driver.delayMs(300)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0340
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0340', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0340')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(300)
      }

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_standard_dialogs'))
      if (btnPush) {
        await btnPush.click()
        await driver.delayMs(500)
      }

      let btnPop: Component = await driver.findComponent(ON.id('btn_pop_standard_dialogs'))
      if (btnPop) {
        await btnPop.click()
        await driver.delayMs(500)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0350
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0350', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0350')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(300)
      }

      let btnPushBase: Component = await driver.findComponent(ON.id('btn_push_base_dialog'))
      if (btnPushBase) {
        await btnPushBase.click()
        await driver.delayMs(300)
      }

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_standard_dialogs'))
      if (btnPush) {
        await btnPush.click()
        await driver.delayMs(500)
      }

      let btnPop: Component = await driver.findComponent(ON.id('btn_pop_standard_dialogs'))
      if (btnPop) {
        await btnPop.click()
        await driver.delayMs(500)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0360
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0360', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0360')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(300)
      }

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_standard_dialogs'))
      if (btnPush) {
        await btnPush.click()
        await driver.delayMs(500)
      }

      let btnPop: Component = await driver.findComponent(ON.id('btn_pop'))
      if (btnPop) {
        await btnPop.click()
        await driver.delayMs(300)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0370
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0370', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0370')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(300)
      }

      let btnFirst: Component = await driver.findComponent(ON.id('btn_push_first'))
      if (btnFirst) {
        await btnFirst.click()
        await driver.delayMs(300)
      }

      let btnSecond: Component = await driver.findComponent(ON.id('btn_push_second'))
      if (btnSecond) {
        await btnSecond.click()
        await driver.delayMs(300)
      }

      let btnPop: Component = await driver.findComponent(ON.id('btn_pop'))
      if (btnPop) {
        await btnPop.click()
        await driver.delayMs(300)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0380
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0380', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0380')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(300)
      }

      let btnOne: Component = await driver.findComponent(ON.id('btn_push_one'))
      if (btnOne) {
        await btnOne.click()
        await driver.delayMs(300)
      }

      let btnThree: Component = await driver.findComponent(ON.id('btn_push_three'))
      if (btnThree) {
        await btnThree.click()
        await driver.delayMs(300)
      }

      let btnMove: Component = await driver.findComponent(ON.id('btn_move_to_top'))
      if (btnMove) {
        await btnMove.click()
        await driver.delayMs(500)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0390
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0390', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0390')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(300)
      }

      let btnThree: Component = await driver.findComponent(ON.id('btn_push_three'))
      if (btnThree) {
        await btnThree.click()
        await driver.delayMs(300)
      }

      let btnOne: Component = await driver.findComponent(ON.id('btn_push_one'))
      if (btnOne) {
        await btnOne.click()
        await driver.delayMs(300)
      }

      let btnMove: Component = await driver.findComponent(ON.id('btn_move_index'))
      if (btnMove) {
        await btnMove.click()
        await driver.delayMs(500)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0400
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0400', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0400')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(300)
      }

      let btnOne: Component = await driver.findComponent(ON.id('btn_push_one'))
      if (btnOne) {
        await btnOne.click()
        await driver.delayMs(300)
      }

      let btnThree: Component = await driver.findComponent(ON.id('btn_push_three'))
      if (btnThree) {
        await btnThree.click()
        await driver.delayMs(300)
      }

      let btnPopTo: Component = await driver.findComponent(ON.id('btn_pop_to_name'))
      if (btnPopTo) {
        await btnPopTo.click()
        await driver.delayMs(500)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0410
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0410', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0410')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(300)
      }

      let btnOne: Component = await driver.findComponent(ON.id('btn_push_one'))
      if (btnOne) {
        await btnOne.click()
        await driver.delayMs(300)
      }

      let btnThree: Component = await driver.findComponent(ON.id('btn_push_three'))
      if (btnThree) {
        await btnThree.click()
        await driver.delayMs(300)
      }

      if (btnOne) {
        await btnOne.click()
        await driver.delayMs(300)
      }

      let btnPopTo: Component = await driver.findComponent(ON.id('btn_pop_to_name'))
      if (btnPopTo) {
        await btnPopTo.click()
        await driver.delayMs(500)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0420
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0420', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0420')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(300)
      }

      let btnOne: Component = await driver.findComponent(ON.id('btn_push_one'))
      if (btnOne) {
        await btnOne.click()
        await driver.delayMs(300)
      }

      let btnThree: Component = await driver.findComponent(ON.id('btn_push_three'))
      if (btnThree) {
        await btnThree.click()
        await driver.delayMs(300)
      }

      let btnPopTo: Component = await driver.findComponent(ON.id('btn_pop_to_index'))
      if (btnPopTo) {
        await btnPopTo.click()
        await driver.delayMs(500)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0430
     * @tc.name   : Nav navigation dialoganimated
     * @tc.desc   : Verify nav navigation dialoganimated interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0430', 0, async (done: Function) => {
      Settings.createWindow('testability/pages/component/navigation/NavNavigationDialoganimated/NavigationDialoganimated0430')
      await driver.delayMs(2000)

      let btnBase: Component = await driver.findComponent(ON.id('btn_base_scene'))
      if (btnBase) {
        await btnBase.click()
        await driver.delayMs(300)
      }

      let btnOne: Component = await driver.findComponent(ON.id('btn_push_one'))
      if (btnOne) {
        await btnOne.click()
        await driver.delayMs(300)
      }

      let btnThree: Component = await driver.findComponent(ON.id('btn_push_three'))
      if (btnThree) {
        await btnThree.click()
        await driver.delayMs(300)
      }

      if (btnOne) {
        await btnOne.click()
        await driver.delayMs(300)
      }

      let btnPopTo: Component = await driver.findComponent(ON.id('btn_pop_to_index'))
      if (btnPopTo) {
        await btnPopTo.click()
        await driver.delayMs(500)
      }

      await windowSnap.snapShot()
      await driver.delayMs(500)
      done()
    })
  })
}