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

export default function uiComponentButtonTextpickerOnscrollstopTest() {
  describe('uiComponentButtonTextpickerOnscrollstopTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0090
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0090', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0090 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop0090');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0090 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0120
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0120', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0120 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop0120');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0120 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0230
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0230', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0230 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop0230');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0230 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0260
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0260', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0260 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop0260');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0260 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0370
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0370', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0370 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop0370');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0370 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0400
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0400', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0400 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop0400');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0400 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0580
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0580', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0580 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop0580');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0580 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0610
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0610', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0610 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop0610');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0610 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0720
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0720', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0720 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop0720');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0720 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0750
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0750', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0750 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop0750');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0750 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0860
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0860', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0860 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop0860');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0860 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0890
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0890', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0890 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop0890');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_0890 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1070
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1070', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1070 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop1070');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1070 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1100
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1100', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1100 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop1100');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1100 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1210
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1210', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1210 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop1210');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1210 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1240
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1240', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1240 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop1240');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1240 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1350
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1350', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1350 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop1350');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1350 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1380
     * @tc.name   : Button TextPicker onscrollstop
     * @tc.desc   : Verify button TextPicker onscrollstop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1380', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1380 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerOnscrollstop/UiComponentButtonTextpickerOnscrollstop1380');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ONSCROLLSTOP_1380 finish.`);
      done();
    });

  });
}