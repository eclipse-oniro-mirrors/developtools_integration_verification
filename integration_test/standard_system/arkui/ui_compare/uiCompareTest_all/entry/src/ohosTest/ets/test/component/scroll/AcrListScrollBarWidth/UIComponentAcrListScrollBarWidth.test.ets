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
import { BusinessError } from '@kit.BasicServicesKit';

export default function uIComponentAcrListScrollBarWidthTest() {
  describe('uIComponentAcrListScrollBarWidthTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
      }

      Settings.windowClass.destroyWindow((err: BusinessError) => {
        if (err) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARWIDTH_0010
     * @tc.name   : Arclist scrollbarwidth
     * @tc.desc   : Verify arclist scrollbarwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARWIDTH_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARWIDTH_0010 start.`);
      const caseName: string = 'SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARWIDTH_0010';
      Settings.createWindow('testability/pages/component/scroll/AcrListScrollBarWidth/UIComponentAcrListScrollBarWidth001');
      let driver: Driver = Driver.create();
      let arcList: Component = await driver.waitForComponent(ON.type('ArcList'), 1000);
      let point = await arcList.getBoundsCenter();
      console.info(`${caseName} point is ${JSON.stringify(point)}`);
      let rect = await arcList.getBounds();
      console.info(`${caseName} reect is ${(JSON.stringify(rect))}`);
      await driver.mouseClick({x: rect.right - 5, y: point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARWIDTH_0010_01');
      await driver.waitForIdle(500, 2000);
      let button1: Component = await driver.waitForComponent(ON.id('20%'), 1000);
      await button1.click();
      await driver.mouseClick({x: rect.right - 5, y: point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARWIDTH_0010_02');
      await driver.waitForIdle(500, 2000);
      let button2: Component = await driver.waitForComponent(ON.id('-10'), 1000);
      await button2.click();
      await driver.mouseClick({x: rect.right - 5, y: point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARWIDTH_0010_03');
      await driver.waitForIdle(500, 2000);
      let button3: Component = await driver.waitForComponent(ON.id('undefined'), 1000);
      await button3.click();
      await driver.mouseClick({x: rect.right - 5, y: point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARWIDTH_0010_04');
      await driver.waitForIdle(500, 2000);
      let button4: Component = await driver.waitForComponent(ON.id('0'), 1000);
      await button4.click();
      await driver.mouseClick({x: rect.right - 5, y: point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARWIDTH_0010_05');
      await driver.waitForIdle(500, 2000);
      let button5: Component = await driver.waitForComponent(ON.id('100'), 1000);
      await button5.click();
      await driver.mouseClick({x: rect.right - 5, y: point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARWIDTH_0010_06');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBARWIDTH_0010 finish.`);
      done();
    });
  })
}