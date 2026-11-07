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
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, Component, ON } from '@kit.TestKit'

export default function uIComponentScrollScrollbarVelocity() {

  describe('uIComponentScrollScrollbarVelocity', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0110
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0110', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0110 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity001')
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0110';
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity001'))
      await component.click();
      await Utils.sleep(3000)
      windowSnap.snapShot(caseName);
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0130
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0130', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0130 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0130'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity003')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity003'))
      await component.click();
      await Utils.sleep(3000)
      windowSnap.snapShot(caseName);
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0120
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0120', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0120 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0120'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity005')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity005'))
      await component.click();
      await Utils.sleep(3000)
      windowSnap.snapShot(caseName);
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0140
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0140', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0140 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0140'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity006')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity006'))
      await component.click();
      await Utils.sleep(3000)
      windowSnap.snapShot(caseName);
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0200
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0200', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0200 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0200'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity007')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity007'))
      await component.click();
      Settings.changeSize(300, 300)
      await Utils.sleep(3000)
      windowSnap.snapShot(caseName)
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0180
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0180', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0180 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0180'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity010')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity010'))
      await component.click();
      Settings.changeWindowOrientation()
      windowSnap.snapShot(caseName)
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0190
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0190', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0190 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0190'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity008')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity008'))
      let component2: Component = await driver.findComponent(ON.id('InterruptAnimation'))
      await component.click();
      await component2.longClick();
      windowSnap.snapShot(caseName);
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0170
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0170', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0170 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0170'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity009')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity009'))
      await component.click();
      windowSnap.snapShot(caseName)
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0210
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0210', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0210 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0170'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity011')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity011'))
      await component.click();
      windowSnap.snapShot(caseName)
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0260
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0260', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0260 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0260'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity012')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity012'))
      await component.click();
      windowSnap.snapShot(caseName)
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0220
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0220', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0220 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0220'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity013')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity013'))
      await component.click();
      windowSnap.snapShot(caseName)
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0280
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0280', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0280 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0280'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity014')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity014'))
      await component.click();
      Settings.changeWindowOrientation()
      windowSnap.snapShot(caseName)
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0300
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0300', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0300 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0300'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity016')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity016'))
      await component.click();
      Settings.changeSize(500, 500)
      windowSnap.snapShot(caseName)
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0230
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0230', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0230 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0230'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity017')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity017'))
      await component.click();
      windowSnap.snapShot(caseName)
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0230 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0290
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0290', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0290 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0290'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity018')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity018'))
      let component2: Component = await driver.findComponent(ON.id('InterruptAnimation'))
      await component.click();
      await Utils.sleep(1000)
      await component2.longClick();
      windowSnap.snapShot(caseName);
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0290 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0270
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0270', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0270 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0270'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity019')
      await Utils.sleep(3000)
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity019'))
      await component.click();
      windowSnap.snapShot(caseName);
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0070
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0070', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0070 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0070'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity021')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity021'))
      await component.click();
      await Utils.sleep(3000)
      windowSnap.snapShot(caseName);
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0010
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0010', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0010 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0010'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity022')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity022'))
      await component.click();
      await Utils.sleep(3000)
      windowSnap.snapShot(caseName);
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0020
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0020', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0020 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0020'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity023')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity023'))
      await component.click();
      await Utils.sleep(3000)
      windowSnap.snapShot(caseName)
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0090
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0090', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0090 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0090'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity024')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity024'))
      let component2: Component = await driver.findComponent(ON.id('InterruptAnimation'))
      await component.click();
      await component2.longClick();
      windowSnap.snapShot(caseName)
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0060
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0060', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0060 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0060'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity026')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity026'))
      await component.click();
      await Utils.sleep(3000)
      windowSnap.snapShot(caseName)
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0100
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0100', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0100 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0100'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity028')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity028'))
      await component.click();
      Settings.changeSize(500, 500);
      windowSnap.snapShot(caseName)
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0080
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0080', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0080 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0080'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity029')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity029'))
      await component.click();
      Settings.changeWindowOrientation();
      windowSnap.snapShot(caseName)
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0030
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0030', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0030 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0030'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarVelocity030')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarVelocity030'))
      await component.click();
      await Utils.sleep(3000)
      windowSnap.snapShot(caseName)
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0030 finish.`);
      done()
    })
  })
}
