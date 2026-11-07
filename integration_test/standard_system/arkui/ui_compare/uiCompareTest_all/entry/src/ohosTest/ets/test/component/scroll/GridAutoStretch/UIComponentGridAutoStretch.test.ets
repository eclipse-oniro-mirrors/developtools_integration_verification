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

export default function uIComponentGridAutoStretchTest() {
  describe('uIComponentGridAutoStretchTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0070
     * @tc.name   : Listandgrid grid auto stretch
     * @tc.desc   : Verify listandgrid grid auto stretch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0070 start.`);
      Settings.createWindow('testability/pages/component/scroll/GridAutoStretch/UIComponentGridAutoStretch001');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('change'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0070');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0070 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0060
     * @tc.name   : Listandgrid grid auto stretch
     * @tc.desc   : Verify listandgrid grid auto stretch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0060 start.`);
      Settings.createWindow('testability/pages/component/scroll/GridAutoStretch/UIComponentGridAutoStretch002');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('change'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0060');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0060 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0050
     * @tc.name   : Listandgrid grid auto stretch
     * @tc.desc   : Verify listandgrid grid auto stretch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0050 start.`);
      Settings.createWindow('testability/pages/component/scroll/GridAutoStretch/UIComponentGridAutoStretch003');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('change'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0050');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0050 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0100_410
     * @tc.name   : Listandgrid grid auto stretch
     * @tc.desc   : Verify listandgrid grid auto stretch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0100_410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0100_410 start.`);
      Settings.createWindow('testability/pages/component/scroll/GridAutoStretch/UIComponentGridAutoStretch004');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('change'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      let button2: Component = await driver.waitForComponent(ON.id('scrollToIndex'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0100_410');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_AUTO_STRETCH_0100_410 finish.`);
      done();
    });
  })
}