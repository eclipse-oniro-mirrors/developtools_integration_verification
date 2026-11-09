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
import { Point } from '@kit.TestKit'

export default function uIComponentButtonTextPickerArkUITest() {
  describe('uIComponentButtonTextPickerArkUITest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0100
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0100', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0100';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI001');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0100');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0090
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0090', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0090';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI002');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0090');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0080
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0080', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0080';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI003');
      let driver: Driver = Driver.create();
      let textPicker: Component = await driver.waitForComponent(ON.id('textpicker'), 1000);
      let point = await textPicker.getBoundsCenter();
      console.info(`${caseName} point of TextPicker is ${JSON.stringify(point)}`);
      let point1: Point = {x: point.x, y: point.y + 40};
      let point2: Point = {x: point.x, y: point.y - 40};
      await driver.mouseDrag(point1, point2);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0080');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0060
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0060', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0060';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI004');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0060');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0050
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0050', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0050';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI005');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0050');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0070
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0070', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0070';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI006');
      let driver: Driver = Driver.create();
      let textPicker: Component = await driver.waitForComponent(ON.id('textpicker'), 1000);
      let point = await textPicker.getBoundsCenter();
      console.info(`${caseName} point of TextPicker is ${JSON.stringify(point)}`);
      let point1: Point = {x: point.x, y: point.y + 40};
      let point2: Point = {x: point.x, y: point.y - 40};
      await driver.mouseDrag(point1, point2);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0070');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0010
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0010', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0010';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI007');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0010');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0130
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0130', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0130';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI008');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0130');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0140
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0140', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0140';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI009');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0140');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0110
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0110', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0110';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI010');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0110');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0120
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0120', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0120';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI011');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0120');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0150
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0150', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0150';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI012');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0150');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0030
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0030', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0030';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI013');
      let driver: Driver = Driver.create();
      let textPicker: Component = await driver.waitForComponent(ON.id('textpicker'), 1000);
      let point = await textPicker.getBoundsCenter();
      console.info(`${caseName} point of TextPicker is ${JSON.stringify(point)}`);
      let point1: Point = {x: point.x, y: point.y + 100};
      let point2: Point = {x: point.x, y: point.y - 100};
      await driver.mouseDrag(point1, point2);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0030');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0160
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0160', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0160';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI014');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0160');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0020
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0020', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0020';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI015');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0020');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0040
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0040', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0040';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI016');
      let driver: Driver = Driver.create();
      let textPicker: Component = await driver.waitForComponent(ON.id('textpicker'), 1000);
      let point = await textPicker.getBoundsCenter();
      console.info(`${caseName} point of TextPicker is ${JSON.stringify(point)}`);
      let point1: Point = {x: point.x, y: point.y + 100};
      let point2: Point = {x: point.x, y: point.y - 100};
      await driver.mouseDrag(point1, point2);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0040');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0580
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0580', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0580';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI017');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0580');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0560
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0560', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0560';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI018');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0560');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0550
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0550', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0550';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI019');
      let driver: Driver = Driver.create();
      let textPicker: Component = await driver.waitForComponent(ON.id('datapicker'), 1000);
      let point = await textPicker.getBoundsCenter();
      console.info(`${caseName} point of TextPicker is ${JSON.stringify(point)}`);
      let point1: Point = {x: point.x, y: point.y + 100};
      let point2: Point = {x: point.x, y: point.y - 100};
      await driver.mouseDrag(point1, point2);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0550');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0570
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0570', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0570';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI020');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0570');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0600
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0600', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0600';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI021');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0600');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0590
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0590', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0590';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI022');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0590');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0510
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0510', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0510';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI023');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0510');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0630
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0630', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0630';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI024');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0630');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0640
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0640', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0640';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI025');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0640');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0610
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0610', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0610';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI026');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0610');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0650
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0650', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0650';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI027');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0650');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0660
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0660', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0660';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI028');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0660');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0530
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0530', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0530';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI029');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0530');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0620
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0620', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0620';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI030');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0620');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0520
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0520', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0520';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI031');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0520');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0540
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0540', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0540';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI032');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0540');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1080
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1080', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1080';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI033');
      let driver: Driver = Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('select'), 1000);
      await select.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1080');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1050
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1050', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1050';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI034');
      let driver: Driver = Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('select'), 1000);
      await select.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1050');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1060
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1060', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1060';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI035');
      let driver: Driver = Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('select'), 1000);
      await select.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1060');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1100
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1100', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1100';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI036');
      let driver: Driver = Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('select'), 1000);
      await select.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1100');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1070
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1070', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1070';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI037');
      let driver: Driver = Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('select'), 1000);
      await select.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1070');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1090
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1090', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1090';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI038');
      let driver: Driver = Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('select'), 1000);
      await select.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1090');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1130
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1130', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1130';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI039');
      let driver: Driver = Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('select'), 1000);
      await select.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1130');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1110
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1110', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1110';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI040');
      let driver: Driver = Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('select'), 1000);
      await select.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1110');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1150
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1150', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1150';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI041');
      let driver: Driver = Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('select'), 1000);
      await select.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1150');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1120
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1120', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1120';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI042');
      let driver: Driver = Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('select'), 1000);
      await select.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1120');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1140
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1140', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1140';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI043');
      let driver: Driver = Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('select'), 1000);
      await select.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1140');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1010
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1010', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1010';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI044');
      let driver: Driver = Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('select'), 1000);
      await select.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1010');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1030
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1030', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1030';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI045');
      let driver: Driver = Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('select'), 1000);
      await select.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1030');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1160
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1160', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1160';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI046');
      let driver: Driver = Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('select'), 1000);
      await select.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1160');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1020
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1020', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1020';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI047');
      let driver: Driver = Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('select'), 1000);
      await select.click();
      await driver.waitForIdle(500, 2000);
      let point = await select.getBoundsCenter();
      console.info(`${caseName} point of Select is ${JSON.stringify(point)}`);
      await driver.mouseClick({x: point.x, y: point.y + 70}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1020');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1040
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1040', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1040';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI048');
      let driver: Driver = Driver.create();
      let select: Component = await driver.waitForComponent(ON.id('select'), 1000);
      await select.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1040');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0170
     * @tc.name   : Button TextPicker ArkUI
     * @tc.desc   : Verify button TextPicker ArkUI interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0170', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0170';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextPickerArkUIAlt/UIComponentButtonTextPickerArkUI049');
      let driver: Driver = Driver.create();
      let textPicker: Component = await driver.waitForComponent(ON.id('textpicker'), 1000);
      let point = await textPicker.getBoundsCenter();
      console.info(`${caseName} point of TextPicker is ${JSON.stringify(point)}`);
      let point1: Point = {x: point.x, y: point.y + 40};
      let point2: Point = {x: point.x, y: point.y - 40};
      await driver.mouseDrag(point1, point2);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0170');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });
  })
}