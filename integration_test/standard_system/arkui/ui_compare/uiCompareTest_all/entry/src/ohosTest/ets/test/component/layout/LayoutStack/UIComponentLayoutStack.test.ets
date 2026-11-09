/**
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { KeyCode } from '@kit.InputKit';
import { Driver, ON ,Component } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';


let TAG = 'RunTimeTest';

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function uIComponentLayoutStack() {
  describe('uIComponentLayoutStack', () => {
    beforeAll(() => {

    })
    beforeEach(() => {

    })

    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error(`[${TAG}]`, `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info(`[${TAG}]`, `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done();
    })

    afterAll(() => {

    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_014
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_014', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_014';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack014');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack014_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_015
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_015', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_015';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack015');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack015_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_016
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_016', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_016';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack016');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack016_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_017
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_017', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_017';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack017');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack017_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_018
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_018', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_018';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack018');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack018_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_019
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_019', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_019';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack019');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack019_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_020
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_020', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_020';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack020');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack020_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_021
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_021', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_021';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack021');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack021_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_022
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_022', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_022';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack022');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack022_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_023
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_023', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_023';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack023');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack023_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_024
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_024', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_024';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack024');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack024_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_040
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_040', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_040';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack040');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_060
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_060', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_060';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack060');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack060_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_061
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_061', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_061';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack061');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack061_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_062
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_062', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_062';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack062');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack062_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_063
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_063', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_063';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack063');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack063_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_073
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_073', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_073';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack073');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack073_003'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_074
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_074', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_074';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack074');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack074_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_075
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_075', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_075';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack075');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack075_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_076
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_076', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_076';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack076');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack076_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_077
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_077', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_077';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack077');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack077_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_078
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_078', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_078';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack078');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack078_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_079
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_079', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_079';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack079');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('UIComponentLayoutStack079_001'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_080
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_080', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_080';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack080');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_081
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_081', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_081';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack081');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_082
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_082', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_082';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack082');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_083
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_083', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_083';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack083');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_084
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_084', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_084';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack084');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_085
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_085', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_085';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack085');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_086
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_086', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_086';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack086');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_087
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_087', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_087';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack087');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LAYOUT_STACK_088
     * @tc.name   : Layout stack
     * @tc.desc   : Verify layout stack interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LAYOUT_STACK_088', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_LAYOUT_STACK_088';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/LayoutStack/UIComponentLayoutStack088');
      const driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}