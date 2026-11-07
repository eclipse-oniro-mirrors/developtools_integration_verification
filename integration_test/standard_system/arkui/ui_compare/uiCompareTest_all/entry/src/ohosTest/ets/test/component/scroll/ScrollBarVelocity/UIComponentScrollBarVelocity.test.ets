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

export default function uIComponentScrollBarVelocityTest() {
  describe('uIComponentScrollBarVelocityTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0190
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0190', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0190';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollBarVelocity/UIComponentScrollBarVelocity001');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('Bottom'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id('fling'), 1000);
      let waterFlow: Component = await driver.waitForComponent(ON.id('WaterFlow2'), 1000);
      let point = await waterFlow.getBoundsCenter();
      console.info(`${caseName} point of WaterFlow is ${JSON.stringify(point)}`);
      await button1.click();
      await driver.waitForIdle(1000, 2000);
      await button2.click();
      await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0190');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0290
     * @tc.name   : Scroll scrollbar velocity
     * @tc.desc   : Verify scroll scrollbar velocity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0290', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0290';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollBarVelocity/UIComponentScrollBarVelocity002');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('Bottom'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id('fling'), 1000);
      let list: Component = await driver.waitForComponent(ON.id('List2'), 1000);
      let point = await list.getBoundsCenter();
      console.info(`${caseName} point of List is ${JSON.stringify(point)}`);
      await button1.click();
      await driver.waitForIdle(1000, 2000);
      await button2.click();
      await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0290');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });
  })
}