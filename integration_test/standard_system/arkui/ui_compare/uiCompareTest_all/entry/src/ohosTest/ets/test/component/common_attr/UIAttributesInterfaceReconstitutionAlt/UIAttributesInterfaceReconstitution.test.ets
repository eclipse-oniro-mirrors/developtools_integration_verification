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

export default function uIAttributesInterfaceReconstitutionTest() {
  describe('uIAttributesInterfaceReconstitutionTest', () => {
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
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0060
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0060', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0060';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution001');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0060_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0060_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0040
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0040', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0040';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution002');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0040_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0040_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0080
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0080', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0080';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution003');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0080_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0080_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0010
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0010', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0010';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution004');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0010_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0010_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0050
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0050', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0050';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution005');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0050_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0050_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0070
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0070', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0070';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution006');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0070_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0070_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0090
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0090', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0090';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution007');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0090_01');
      let button1: Component = await driver.waitForComponent(ON.id('normal'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0090_02');
      let button2: Component = await driver.waitForComponent(ON.id('abnormal'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0090_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0030
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0030', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0030';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution008');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0030_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0030_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0020
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0020', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0020';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution009');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0020_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0020_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0100
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0100', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0100';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution010');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0100_01');
      let button: Component = await driver.waitForComponent(ON.id('normal'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0100_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0160
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0160', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0160';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution011');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0160_01');
      let button1: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0160_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0140
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0140', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0140';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution012');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0140_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0140_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0130
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0130', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0130';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution013');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0130_01');
      let button1: Component = await driver.waitForComponent(ON.id('normal'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0130_02');
      let button2: Component = await driver.waitForComponent(ON.id('abnormal'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0130_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0120
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0120', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0120';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution014');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0120_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0120_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0150
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0150', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0150';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution015');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0150_01');
      let button1: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0150_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0110
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0110', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0110';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution016');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0110_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0110_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0560
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0560', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0560';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution017');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0560_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0560_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0580
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0580', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0580';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution019');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0580_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0580_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0550
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0550', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0550';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution020');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0550_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0550_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0570
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0570', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0570';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution021');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0570_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0570_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0590
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0590', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0590';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution022');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0590_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0590_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0600
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0600', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0600';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution023');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0600_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0600_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0660
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0660', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0660';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution026');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0660_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0660_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0610
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0610', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0610';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution027');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0610_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0610_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0650
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0650', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0650';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution028');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0650_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0650_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0630
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0630', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0630';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution029');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0630_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0630_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0640
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0640', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0640';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution030');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0640_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0640_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0620
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0620', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0620';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution031');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0620_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0620_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0170
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0170', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0170';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution032');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0170_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0170_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0190
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0190', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0190';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution033');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0190_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 2000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0190_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0180
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0180', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0180';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution034');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0180_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0180_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0210
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0210', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0210';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution035');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0210_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0210_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0200
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0200', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0200';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution036');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0200_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0200_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0220
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0220', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0220';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution037');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0220_01');
      let button: Component = await driver.waitForComponent(ON.id('setting'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0220_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0230
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0230', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0230';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution038');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0230_01');
      let button1: Component = await driver.waitForComponent(ON.id('normal'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0230_02');
      let button2: Component = await driver.waitForComponent(ON.id('abnormal'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0230_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0240
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0240', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0240';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution039');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0240_01');
      let button1: Component = await driver.waitForComponent(ON.id('normal'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0240_02');
      let button2: Component = await driver.waitForComponent(ON.id('abnormal'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0240_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0250
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0250', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0250';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution040');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0250_01');
      let button1: Component = await driver.waitForComponent(ON.id('normal'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0250_02');
      let button2: Component = await driver.waitForComponent(ON.id('abnormal'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0250_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0260
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0260', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0260';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution041');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0260_01');
      let button1: Component = await driver.waitForComponent(ON.id('normal'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0260_02');
      let button2: Component = await driver.waitForComponent(ON.id('abnormal'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0260_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0270
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0270', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0270';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution042');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0270_01');
      let button1: Component = await driver.waitForComponent(ON.id('normal'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0270_02');
      let button2: Component = await driver.waitForComponent(ON.id('abnormal'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0270_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0280
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0280', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0280';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution043');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0280_01');
      let button1: Component = await driver.waitForComponent(ON.id('normal'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0280_02');
      let button2: Component = await driver.waitForComponent(ON.id('abnormal'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0280_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0290
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0290', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0290';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution044');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0290_01');
      let button1: Component = await driver.waitForComponent(ON.id('normal'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0290_02');
      let button2: Component = await driver.waitForComponent(ON.id('abnormal'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0290_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0300
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0300', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0300';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution045');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0300_01');
      let button1: Component = await driver.waitForComponent(ON.id('normal'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0300_02');
      let button2: Component = await driver.waitForComponent(ON.id('abnormal'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0300_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0310
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0310', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0310';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution046');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0310_01');
      let button1: Component = await driver.waitForComponent(ON.id('normal'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0310_02');
      let button2: Component = await driver.waitForComponent(ON.id('abnormal'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0310_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0320
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0320', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0320';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution047');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0320_01');
      let button1: Component = await driver.waitForComponent(ON.id('normal'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0320_02');
      let button2: Component = await driver.waitForComponent(ON.id('abnormal'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0320_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0330
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0330', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0330';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution048');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0330_01');
      let button1: Component = await driver.waitForComponent(ON.id('normal'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0330_02');
      let button2: Component = await driver.waitForComponent(ON.id('abnormal'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0330_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0340
     * @tc.name   : Attributes interface reconstitution
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0340', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0340';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_04/UIAttributesInterfaceReconstitution049');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0340_01');
      let button1: Component = await driver.waitForComponent(ON.id('normal'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0340_02');
      let button2: Component = await driver.waitForComponent(ON.id('abnormal'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0340_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });
  })
}