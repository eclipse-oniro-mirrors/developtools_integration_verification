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
import { Driver, ON, Component } from '@kit.TestKit'

export default function uIComponentListOffSetTest() {
  describe('uIComponentListOffSetTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0050
     * @tc.name   : Listandgrid list offset
     * @tc.desc   : Verify listandgrid list offset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0050 start.`);
      Settings.createWindow('testability/pages/component/scroll/ListOffSet/UIComponentListOffSet001');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0050');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0050 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0220
     * @tc.name   : Listandgrid list offset
     * @tc.desc   : Verify listandgrid list offset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0220 start.`);
      Settings.createWindow('testability/pages/component/scroll/ListOffSet/UIComponentListOffSet002');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0220');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0220 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0030
     * @tc.name   : Listandgrid list offset
     * @tc.desc   : Verify listandgrid list offset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0030 start.`);
      Settings.createWindow('testability/pages/component/scroll/ListOffSet/UIComponentListOffSet003');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0030');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0030 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0251
     * @tc.name   : Listandgrid list offset
     * @tc.desc   : Verify listandgrid list offset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0251', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0251';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ListOffSet/UIComponentListOffSet004');
      let driver: Driver = Driver.create();
      let List1: Component = await driver.waitForComponent(ON.id('List1'), 1000);
      let point1 = await List1.getBoundsCenter();
      console.info(`${caseName} point of List1 is ${JSON.stringify(point1)}`);
      let List2: Component = await driver.waitForComponent(ON.id('List2'), 1000);
      let point2 = await List2.getBoundsCenter();
      console.info(`${caseName} point of List2 is ${JSON.stringify(point2)}`);
      await driver.drag(point1.x, point1.y - 170, point1.x, point1.y + 170);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0251_02');
      await driver.waitForIdle(500, 2000);
      await driver.drag(point2.x, point2.y + 170, point2.x, point2.y - 170);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0251');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });
  })
}