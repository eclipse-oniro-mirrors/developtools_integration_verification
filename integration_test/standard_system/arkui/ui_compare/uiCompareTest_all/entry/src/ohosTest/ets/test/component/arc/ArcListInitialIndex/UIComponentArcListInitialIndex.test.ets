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

export default function uIComponentArcListInitialIndexTest() {
  describe('uIComponentArcListInitialIndexTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_INITIALINDEX_0010
     * @tc.name   : Arclist initialindex
     * @tc.desc   : Verify arclist initialindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_INITIALINDEX_0010', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_ARCLIST_INITIALINDEX_0010';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/arc/ArcListInitialIndex/UIComponentArcListInitialIndex001');
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_INITIALINDEX_0010_03');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('abnormal'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_INITIALINDEX_0010_02');
      let button2: Component = await driver.waitForComponent(ON.id('undefined'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_INITIALINDEX_0010');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_INITIALINDEX_0020
     * @tc.name   : Arclist initialindex
     * @tc.desc   : Verify arclist initialindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_INITIALINDEX_0020', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_ARCLIST_INITIALINDEX_0020';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/arc/ArcListInitialIndex/UIComponentArcListInitialIndex004');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_INITIALINDEX_0020');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0040
     * @tc.name   : Listandgrid list fadingedge
     * @tc.desc   : Verify listandgrid list fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0040 start.`);
      Settings.createWindow('testability/pages/component/arc/ListAndGridListFadingEdge_04/UIComponentListAndGridListFadingEdge003');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0040');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0040 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0150
     * @tc.name   : Listandgrid list fadingedge
     * @tc.desc   : Verify listandgrid list fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0150 start.`);
      Settings.createWindow('testability/pages/component/arc/ListAndGridListFadingEdge_04/UIComponentListAndGridListFadingEdge004');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0150');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0150 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0030
     * @tc.name   : Listandgrid list fadingedge
     * @tc.desc   : Verify listandgrid list fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0030 start.`);
      Settings.createWindow('testability/pages/component/arc/ListAndGridListFadingEdge_04/UIComponentListAndGridListFadingEdge005');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0030');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0030 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0060
     * @tc.name   : Listandgrid list fadingedge
     * @tc.desc   : Verify listandgrid list fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0060 start.`);
      Settings.createWindow('testability/pages/component/arc/ListAndGridListFadingEdge_04/UIComponentListAndGridListFadingEdge006');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0060');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0060 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0100
     * @tc.name   : Listandgrid list fadingedge
     * @tc.desc   : Verify listandgrid list fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0100 start.`);
      Settings.createWindow('testability/pages/component/arc/ListAndGridListFadingEdge_04/UIComponentListAndGridListFadingEdge007');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0100');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0100 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0090
     * @tc.name   : Listandgrid list fadingedge
     * @tc.desc   : Verify listandgrid list fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0090 start.`);
      Settings.createWindow('testability/pages/component/arc/ListAndGridListFadingEdge_04/UIComponentListAndGridListFadingEdge008');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0090');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0090 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0050
     * @tc.name   : Listandgrid list fadingedge
     * @tc.desc   : Verify listandgrid list fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0050 start.`);
      Settings.createWindow('testability/pages/component/arc/ListAndGridListFadingEdge_04/UIComponentListAndGridListFadingEdge009');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0050');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0050 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0070
     * @tc.name   : Listandgrid list fadingedge
     * @tc.desc   : Verify listandgrid list fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0070 start.`);
      Settings.createWindow('testability/pages/component/arc/ListAndGridListFadingEdge_04/UIComponentListAndGridListFadingEdge010');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0070');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0070 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0110
     * @tc.name   : Listandgrid list fadingedge
     * @tc.desc   : Verify listandgrid list fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0110 start.`);
      Settings.createWindow('testability/pages/component/arc/ListAndGridListFadingEdge_04/UIComponentListAndGridListFadingEdge011');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0110');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_FADINGEDGE_0110 finish.`);
      done();
    });
  })
}