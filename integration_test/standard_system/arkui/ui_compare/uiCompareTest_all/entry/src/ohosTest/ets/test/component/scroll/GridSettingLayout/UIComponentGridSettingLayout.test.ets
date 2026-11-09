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

export default function uIComponentGridSettingLayoutTest() {
  describe('uIComponentGridSettingLayoutTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0470_029
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0470_029', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0470_029';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout001');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0470_029');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0480_481
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0480_481', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0480_481';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout002');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0480_481');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0500_012
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0500_012', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0500_012';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout003');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0500_012');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0550_289
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0550_289', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0550_289';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout004');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0550_289');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0510_476
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0510_476', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0510_476';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout005');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0510_476');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0490_309
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0490_309', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0490_309';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout006');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0490_309');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0540_151
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0540_151', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0540_151';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout007');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0540_151');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0520_964
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0520_964', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0520_964';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout008');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0520_964');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0530_795
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0530_795', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0530_795';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout009');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0530_795');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0560_397
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0560_397', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0560_397';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout010');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0560_397');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0430_786
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0430_786', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0430_786';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout011');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0430_786');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0450_330
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0450_330', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0450_330';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout012');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0450_330');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0440_333
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0440_333', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0440_333';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout013');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0440_333');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0240_812
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0240_812', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0240_812';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout014');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollToIndex'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0240_812');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0360_349
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0360_349', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0360_349';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout015');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button1.click();
      let button: Component = await driver.waitForComponent(ON.id('scrollBy'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0360_349');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0290_349
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0290_349', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0290_349';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout016');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.id('scrollBy'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0290_349');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0270_751
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0270_751', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0270_751';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout017');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.id('scrollPage'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0270_751');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0300_639
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0300_639', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0300_639';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout018');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollBy'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0300_639');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0310_384
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0310_384', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0310_384';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout019');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollBy'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0310_384');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0330_675
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0330_675', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0330_675';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout020');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollBy'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0330_675');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0340_161
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0340_161', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0340_161';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout021');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollBy'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0340_161');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0350_390
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0350_390', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0350_390';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout022');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollBy'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0350_390');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0200_060
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0200_060', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0200_060';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout023');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollEdge'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0200_060');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0320_852
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0320_852', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0320_852';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout024');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollBy'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0320_852');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0090_453
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0090_453', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0090_453';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout025');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollTo'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0090_453');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0140_747
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0140_747', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0140_747';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout026');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollTo'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0140_747');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0160_541
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0160_541', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0160_541';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout027');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollTo'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0160_541');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0220_361
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0220_361', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0220_361';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout028');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollToIndex'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0220_361');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0230_076
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0230_076', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0230_076';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout029');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollToIndex'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0230_076');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0130_467
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0130_467', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0130_467';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout030');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollTo'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0130_467');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0210_053
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0210_053', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0210_053';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout031');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollEdge'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0210_053');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0100_126
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0100_126', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0100_126';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout032');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollTo'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0100_126');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0110_305
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0110_305', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0110_305';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout033');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.id('scrollTo'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0110_305');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0150_913
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0150_913', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0150_913';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout034');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.id('scrollTo'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0150_913');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0190_112
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0190_112', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0190_112';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout035');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.id('scrollEdge'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0190_112');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0170_801
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0170_801', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0170_801';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout036');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollTo'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0170_801');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0120_790
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0120_790', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0120_790';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout037');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollTo'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0120_790');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0180_673
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0180_673', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0180_673';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout038');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.id('scrollEdge'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0180_673');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0250_162
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0250_162', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0250_162';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout039');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.id('scrollToIndex'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0250_162');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0280_097
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0280_097', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0280_097';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout040');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollBy'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0280_097');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0260_534
     * @tc.name   : Listandgrid grid settinglayout
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0260_534', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0260_534';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/GridSettingLayout/UIComponentGridSettingLayout041');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scrollPage'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0260_534');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });
  })
}