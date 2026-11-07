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

export default function uIComponentListAndGridListScrollPageTest() {
  describe('uIComponentListAndGridListScrollPageTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_SCROLLPAGE_0140
     * @tc.name   : Listandgrid list scrollpage
     * @tc.desc   : Verify listandgrid list scrollpage interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_SCROLLPAGE_0140', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_SCROLLPAGE_0140';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListScrollPage/UIComponentListAndGridListScrollPage001');
      let driver: Driver = Driver.create();
      let list: Component = await driver.waitForComponent(ON.type('List'), 1000);
      let rect1 = await list.getBounds();
      console.info(`${caseName} rect of List is ${JSON.stringify(rect1)}`);
      await driver.mouseLongClick({x: rect1.right - 10, y: rect1.bottom - 200}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_SCROLLPAGE_0140');
      let scrollBar: Component = await driver.waitForComponent(ON.type('ScrollBar'), 1000);
      let rect2 = await scrollBar.getBounds();
      console.info(`${caseName} rect of List is ${JSON.stringify(rect2)}`);
      await driver.mouseLongClick({x: rect2.right - 2, y: rect2.top + 2}, MouseButton.MOUSE_BUTTON_LEFT);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_SCROLLPAGE_0140_02');
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_SCROLLPAGE_0140');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });
  })
}