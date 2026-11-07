/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default function uiComponentNavNavigationAutonegotiation() {
  describe('uiComponentNavNavigationAutonegotiation', () => {

    afterEach(async (done: Function) => {

      await TestHelper.destroyWindow()

      done()

    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0040
     * @tc.name   : stack mode with navdestination, navigation sets height (1000), navbar interface observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0040', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置stack模式
      // 3、设置navdestination
      // 4、navigation设置height（1000）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0040')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0040 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0040'), 500)
      await Utils.sleep(500)

      // 预期效果1：navigation为设置高度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0040_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0210
     * @tc.name   : split mode without navdestination, navigation sets height ("auto"), navbar interface observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0210', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置split模式
      // 3、navigation设置height（"auto"）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0210')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0210 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0210'), 500)
      await Utils.sleep(500)

      // 预期效果1：navigation自适应navbar界面
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0210_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0190
     * @tc.name   : split mode with navdestination, navigation sets height (1000), navdestination sets height auto observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0190', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置split模式
      // 3、设置navdestination并设置height ("auto")
      // 4、navigation设置height（500）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0190')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0190 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0190'), 500)
      await Utils.sleep(500)

      // 跳转到NavDestination
      let button_autonegotiation_0190_push = await driver.waitForComponent(ON.id('button_autonegotiation_0190_push'), 500)
      await button_autonegotiation_0190_push.click()
      await Utils.sleep(500)

      // 预期效果1：navdestination自适应当前navdestcontent的内容
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0190_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0020
     * @tc.name   : stack mode with navdestination, navigation sets height (auto), navdestination sets height 500 observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0020', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置stack模式
      // 3、设置navdestination高度为500
      // 4、navigation设置height（"auto"）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0020')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0020 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0020'), 500)
      await Utils.sleep(500)

      // 跳转到NavDestination
      let button_autonegotiation_0020_push = await driver.waitForComponent(ON.id('button_autonegotiation_0020_push'), 500)
      await button_autonegotiation_0020_push.click()
      await Utils.sleep(500)

      // 预期效果1：navigation自适应navdestination高度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0020_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0070
     * @tc.name   : stack mode with navdestination, navigation sets height (auto), set two pages navdestination to 500 and auto
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0070', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置stack模式
      // 3、设置两个navdestination，分别为height（"auto"）、（500）
      // 4、navigation设置height（"auto"）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0070')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0070 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0070'), 500)
      await Utils.sleep(500)

      // 跳转到页面1（高度500）
      let button_autonegotiation_0070_push1 = await driver.waitForComponent(ON.id('button_autonegotiation_0070_push1'), 500)
      await button_autonegotiation_0070_push1.click()
      await Utils.sleep(500)

      // 预期效果1：切换观察效果-页面1
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0070_01')
      await Utils.sleep(1000)

      // 切换到页面2（高度auto）
      let button_autonegotiation_0070_switch = await driver.waitForComponent(ON.id('button_autonegotiation_0070_switch'), 500)
      await button_autonegotiation_0070_switch.click()
      await Utils.sleep(500)

      // 预期效果2：切换观察效果-页面2
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0070_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0010
     * @tc.name   : stack mode with navdestination, navigation sets height (auto), navbar interface observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0010', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置stack模式
      // 3、设置navdestination
      // 4、navigation设置height（"auto"）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0010')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0010 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0010'), 500)
      await Utils.sleep(500)

      // 预期效果1：navigation自适应navbar界面
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0010_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0170
     * @tc.name   : split mode with navdestination, navigation sets height (1000), navdestination sets height 500 observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0170', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置split模式
      // 3、设置navdestination并设置height (500)
      // 4、navigation设置height（1000）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0170')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0170 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0170'), 500)
      await Utils.sleep(500)

      // 跳转到NavDestination
      let button_autonegotiation_0170_push = await driver.waitForComponent(ON.id('button_autonegotiation_0170_push'), 500)
      await button_autonegotiation_0170_push.click()
      await Utils.sleep(500)

      // 预期效果1：组件为设置高度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0170_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0140
     * @tc.name   : split mode with navdestination, navigation sets height to auto, navdestination sets height less than navbar observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0140', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置split模式
      // 3、设置navdestination高度小于navbar
      // 4、navigation设置height（"auto"）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0140')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0140 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0140'), 500)
      await Utils.sleep(500)

      // 跳转到NavDestination
      let button_autonegotiation_0140_push = await driver.waitForComponent(ON.id('button_autonegotiation_0140_push'), 500)
      await button_autonegotiation_0140_push.click()
      await Utils.sleep(500)

      // 预期效果1：navigation自适应navbar界面
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0140_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0120
     * @tc.name   : split mode with navdestination, navigation sets height to auto, navdestination sets height greater than navbar observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0120', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置split模式
      // 3、设置navdestination高度大于navbar
      // 4、navigation设置height（"auto"）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0120')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0120 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0120'), 500)
      await Utils.sleep(500)

      // 跳转到NavDestination
      let button_autonegotiation_0120_push = await driver.waitForComponent(ON.id('button_autonegotiation_0120_push'), 500)
      await button_autonegotiation_0120_push.click()
      await Utils.sleep(500)

      // 预期效果1：navigation自适应navdestination高度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0120_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0150
     * @tc.name   : split mode with navdestination, navigation sets height to auto, set two pages with different heights, dynamically switch observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0150', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置split模式
      // 3、设置两个navdestination，分别为height（100）、（500）
      // 4、navigation设置height（"auto"）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0150')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0150 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0150'), 500)
      await Utils.sleep(500)

      // 跳转到页面1（高度100）
      let button_autonegotiation_0150_push1 = await driver.waitForComponent(ON.id('button_autonegotiation_0150_push1'), 500)
      await button_autonegotiation_0150_push1.click()
      await Utils.sleep(500)

      // 预期效果1：切换观察效果-页面1
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0150_01')
      await Utils.sleep(2000)

      // 切换到页面2（高度500）
      let button_autonegotiation_0150_switch = await driver.waitForComponent(ON.id('button_autonegotiation_0150_switch'), 500)
      await button_autonegotiation_0150_switch.click()
      await Utils.sleep(500)

      // 预期效果2：切换观察效果-页面2
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0150_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0110
     * @tc.name   : split mode with navdestination, navigation sets height to auto, navbar interface observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0110', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置split模式
      // 3、设置navdestination
      // 4、navigation设置height（"auto"）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0110')
      let driver = await Driver.create()
      await Utils.sleep(500)
      // 预期效果1：navigation自适应navbar界面
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0110_01')
      await Utils.sleep(1000)

      let button_autonegotiation_0110_push = await driver.waitForComponent(ON.id('button_autonegotiation_0110_push'), 500)
      await Utils.sleep(500)
      await button_autonegotiation_0110_push.click()

      // 预期效果2：navidestination设置
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0110_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0180
     * @tc.name   : split mode with navdestination, navigation sets height (500), navdestination sets height 700 observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0180', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置split模式
      // 3、设置navdestination并设置height (700)
      // 4、navigation设置height（500）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0180')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0180 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0180'), 500)
      await Utils.sleep(500)

      // 跳转到NavDestination
      let button_autonegotiation_0180_push = await driver.waitForComponent(ON.id('button_autonegotiation_0180_push'), 500)
      await button_autonegotiation_0180_push.click()
      await Utils.sleep(500)

      // 预期效果1：navdestination高度为500
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0180_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0160
     * @tc.name   : split mode with navdestination, navigation sets height to fixed value 1000, navbar interface observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0160', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置split模式
      // 3、设置navdestination
      // 4、navigation设置height（1000）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0160')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0160 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0160'), 500)
      await Utils.sleep(500)

      // 预期效果1：navigation为设置高度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0160_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0030
     * @tc.name   : stack mode with navdestination, navigation sets height (auto), navdestination sets height ("auto") observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0030', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置stack模式
      // 3、设置navdestination并设置height（"auto"）
      // 4、navigation设置height（"auto"）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0030')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0030 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0030'), 500)
      await Utils.sleep(500)

      // 跳转到NavDestination
      let button_autonegotiation_0030_push = await driver.waitForComponent(ON.id('button_autonegotiation_0030_push'), 500)
      await button_autonegotiation_0030_push.click()
      await Utils.sleep(500)

      // 预期效果1：navdestination自适应当前navdestcontent的内容
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0030_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0060
     * @tc.name   : stack mode with navdestination, navigation sets height (1000), navdestination sets height ("auto") observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0060', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置stack模式
      // 3、设置navdestination并设置height（"auto"）
      // 4、navigation设置height（1000）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0060')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0060 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0060'), 500)
      await Utils.sleep(500)

      // 跳转到NavDestination
      let button_autonegotiation_0060_push = await driver.waitForComponent(ON.id('button_autonegotiation_0060_push'), 500)
      await button_autonegotiation_0060_push.click()
      await Utils.sleep(500)

      // 预期效果1：navdestination自适应当前navdestcontent的内容
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0060_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0050
     * @tc.name   : stack mode with navdestination, navigation sets height (1000), navdestination sets height 500 observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0050', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置stack模式
      // 3、设置navdestination并设置height（500）
      // 4、navigation设置height（1000）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0050')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0050 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0050'), 500)
      await Utils.sleep(500)

      // 跳转到NavDestination
      let button_autonegotiation_0050_push = await driver.waitForComponent(ON.id('button_autonegotiation_0050_push'), 500)
      await button_autonegotiation_0050_push.click()
      await Utils.sleep(500)

      // 预期效果1：为设置高度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0050_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0130
     * @tc.name   : split mode with navdestination, navigation sets height to auto, navdestination sets auto, observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0130', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置split模式
      // 3、设置navdestination并设置height ("auto")
      // 4、navigation设置height（"auto"）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0130')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0130 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0130'), 500)
      await Utils.sleep(500)

      // 跳转到NavDestination
      let button_autonegotiation_0130_push = await driver.waitForComponent(ON.id('button_autonegotiation_0130_push'), 500)
      await button_autonegotiation_0130_push.click()
      await Utils.sleep(500)

      // 预期效果1：navdestination自适应当前navdestcontent的内容，navigation适应navbar和navicontent二者最大高度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0130_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0100
     * @tc.name   : stack mode with navdestination, navigation does not set height, navdestination does not set height observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0100', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置stack模式
      // 3、设置navdestination且不设置高度
      // 4、navigation不设置高度
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0100')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0100 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0100'), 500)
      await Utils.sleep(500)

      // 跳转到NavDestination
      let button_autonegotiation_0100_push = await driver.waitForComponent(ON.id('button_autonegotiation_0100_push'), 500)
      await button_autonegotiation_0100_push.click()
      await Utils.sleep(500)

      // 预期效果1：navdestination自适应当前navdestcontent的内容
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0100_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0200
     * @tc.name   : stack mode without navdestination, navigation sets height ("auto"), navbar interface observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0200', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置stack模式
      // 3、navigation设置height（"auto"）
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0200')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0200 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0200'), 500)
      await Utils.sleep(500)

      // 预期效果1：navigation自适应navbar界面
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0200_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0080
     * @tc.name   : stack mode with navdestination, navigation does not set height, navbar interface observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0080', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置stack模式
      // 3、设置navdestination
      // 4、navigation不设置高度
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0080')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0080 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0080'), 500)
      await Utils.sleep(500)

      // 预期效果1：navigation自适应高度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0080_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0090
     * @tc.name   : stack mode with navdestination, navigation does not set height, navdestination sets 500 observation effect
     * @tc.desc   : Verify nav navigation autonegotiation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0090', Level.LEVEL3, async (done: Function) => {
      // 1、新建ets页面
      // 2、mode设置stack模式
      // 3、设置navdestination并设置height（500）
      // 4、navigation不设置高度
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAutonegotiation/UiComponentNavNavigationAutonegotiation0090')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let navigation_autonegotiation_0090 = await driver.waitForComponent(ON.id('navigation_autonegotiation_0090'), 500)
      await Utils.sleep(500)

      // 跳转到NavDestination
      let button_autonegotiation_0090_push = await driver.waitForComponent(ON.id('button_autonegotiation_0090_push'), 500)
      await button_autonegotiation_0090_push.click()
      await Utils.sleep(500)

      // 预期效果1：navigation自适应高度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_AUTONEGOTIATION_0090_01')
      await Utils.sleep(1000)

      done();
    })

  })
}