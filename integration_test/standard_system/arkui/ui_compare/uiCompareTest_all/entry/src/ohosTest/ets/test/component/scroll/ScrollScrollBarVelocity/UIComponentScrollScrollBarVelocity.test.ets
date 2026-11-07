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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, Component, MouseButton } from '@kit.TestKit'

export default function uIComponentScrollScrollBarVelocity() {
  describe('uIComponentScrollScrollBarVelocity', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0310
     * @tc.name   : In the scroll container, the velocity parameter of calling fling is 1000
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0310', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0310 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollBarVelocity/UIComponentScrollScrollBarVelocity001');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0310');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0310 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0320
     * @tc.name   : In the scroll container, the velocity parameter of calling fling is -1000
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0320', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0320 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollBarVelocity/UIComponentScrollScrollBarVelocity002');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0320');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0320 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0330
     * @tc.name   : In the scroll container, the velocity parameter of calling fling is 1000.5
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0330', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0330 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollBarVelocity/UIComponentScrollScrollBarVelocity003');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0330');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0330 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0360
     * @tc.name   : In the scroll container, the velocity parameter of calling fling is 0
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0360', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0360 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollBarVelocity/UIComponentScrollScrollBarVelocity006');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0360');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0360 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0370
     * @tc.name   : In the scroll container, call fling to set limit scrolling
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0370', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0370 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollBarVelocity/UIComponentScrollScrollBarVelocity007');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0370');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0370 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0380
     * @tc.name   : Set the velocity property parameter of flipping to the normal value of 100 in multiple nested scroll containers
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0380', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0380 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollBarVelocity/UIComponentScrollScrollBarVelocity008');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0380');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0380 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0400
     * @tc.name   : In the scroll container, call fling to break the animation during the animation
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0400', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0400 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollBarVelocity/UIComponentScrollScrollBarVelocity009');
      let driver: Driver = Driver.create();
      let refresh: Component = await driver.waitForComponent(ON.type('Scroll'), 1000);
      let point = await refresh.getBoundsCenter();
      let button: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button.click();
      await driver.mouseClick({x: point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0400');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0400 finish.`);
      done();
    });
  })
}