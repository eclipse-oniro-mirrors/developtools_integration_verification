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

export default function uiComponentButtonTextpickerMirrorimageTest() {
  describe('uiComponentButtonTextpickerMirrorimageTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0010
     * @tc.name   : Button TextPicker mirrorimage
     * @tc.desc   : Verify button TextPicker mirrorimage interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0010', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0010 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerMirrorimage/UiComponentButtonTextpickerMirrorimage0010');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0010 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0040
     * @tc.name   : Button TextPicker mirrorimage
     * @tc.desc   : Verify button TextPicker mirrorimage interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0040', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0040 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerMirrorimage/UiComponentButtonTextpickerMirrorimage0040');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0040 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0160
     * @tc.name   : Button TextPicker mirrorimage
     * @tc.desc   : Verify button TextPicker mirrorimage interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0160', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0160 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerMirrorimage/UiComponentButtonTextpickerMirrorimage0160');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0160 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0210
     * @tc.name   : Button TextPicker mirrorimage
     * @tc.desc   : Verify button TextPicker mirrorimage interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0210', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0210 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerMirrorimage/UiComponentButtonTextpickerMirrorimage0210');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0210 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0240
     * @tc.name   : Button TextPicker mirrorimage
     * @tc.desc   : Verify button TextPicker mirrorimage interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0240', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0240 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerMirrorimage/UiComponentButtonTextpickerMirrorimage0240');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0240 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0310
     * @tc.name   : Button TextPicker mirrorimage
     * @tc.desc   : Verify button TextPicker mirrorimage interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0310', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0310 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerMirrorimage/UiComponentButtonTextpickerMirrorimage0310');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0310 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0460
     * @tc.name   : Button TextPicker mirrorimage
     * @tc.desc   : Verify button TextPicker mirrorimage interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0460', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0460 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerMirrorimage/UiComponentButtonTextpickerMirrorimage0460');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0460 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0600
     * @tc.name   : Button TextPicker mirrorimage
     * @tc.desc   : Verify button TextPicker mirrorimage interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0600', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0600 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerMirrorimage/UiComponentButtonTextpickerMirrorimage0600');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0600 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0610
     * @tc.name   : Button TextPicker mirrorimage
     * @tc.desc   : Verify button TextPicker mirrorimage interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0610', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0610 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonTextpickerMirrorimage/UiComponentButtonTextpickerMirrorimage0610');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_MIRRORIMAGE_0610 finish.`);
      done();
    });

  });
}