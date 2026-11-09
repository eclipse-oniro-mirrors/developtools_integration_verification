/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, afterEach } from '@ohos/hypium';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';
import { Driver, ON, Component } from '@kit.TestKit';

export default function uiComponentColumnRowResourceTest() {
  describe('uiComponentColumnRowResourceTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`);
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      });
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0010
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0010', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0010 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0010');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0010 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0020
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0020', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0020 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0020');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0020 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0030
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0030', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0030 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0030');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0030 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0040
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0040', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0040 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0040');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0040 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0050
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0050', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0050 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0050');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0050 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0060
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0060', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0060 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0060');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0060 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0070
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0070', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0070 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0070');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0070 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0080
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0080', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0080 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0080');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0080 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0090
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0090', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0090 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0090');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0090 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0100
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0100', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0100 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0100');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0100 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0110
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0110', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0110 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0110');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0110 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0120
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0120', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0120 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0120');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0120 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0130
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0130', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0130 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0130');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0130 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0140
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0140', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0140 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0140');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0140 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0150
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0150', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0150 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0150');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0150 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0160
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0160', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0160 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0160');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0160 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0170
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0170', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0170 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0170');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0170 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0180
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0180', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0180 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0180');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0180 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0190
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0190', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0190 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0190');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0190 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0200
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0200', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0200 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0200');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0200 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0210
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0210', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0210 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0210');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0210 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0220
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0220', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0220 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0220');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0220 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0230
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0230', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0230 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0230');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0230 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0240
     * @tc.name   : Column row resource
     * @tc.desc   : Verify column row resource interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0240', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0240 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnRowResource/UiComponentColumnRowResource0240');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0240 finish.`);
      done();
    });

  });
}