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
import { BusinessError, commonEventManager, screenLock } from '@kit.BasicServicesKit';
import { KeyCode } from '@kit.InputKit';

import { window, uiAppearance } from '@kit.ArkUI';
import { wifiManager } from '@kit.ConnectivityKit';
import { Driver, ON ,Component, UiWindow } from '@kit.TestKit';

import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';


let TAG = 'RunTimeTest';

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function uIComponentMediaTimePickerEnableCascade() {
  describe('uIComponentMediaTimePickerEnableCascade', () => {
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
          Logger.error(`[${TAG}_afterEach]`, `Failed to destroy the window. Cause : ${JSON.stringify(err)}`);
          return;
        }
        Logger.info(`[${TAG}_afterEach]`, `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done();
    })

    afterAll(() => {

    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0010
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0010', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0010';
      let pageName = 'UIComponentMediaTimePickerEnableCascade0010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/' + pageName);
      let driver: Driver = Driver.create();
      let timePicker: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let centerPoint = await timePicker.getBoundsCenter();
      await timePicker.click();
      await button.click();
      await driver.waitForIdle(500, 500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.mouseMoveTo({x: centerPoint.x, y: centerPoint.y});
      await driver.swipe(centerPoint.x, centerPoint.y, centerPoint.x, centerPoint.y - 150);
      await driver.mouseMoveTo({x: centerPoint.x, y: centerPoint.y - 150});
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0011
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0011', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0011';
      let pageName = 'UIComponentMediaTimePickerEnableCascade0011';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/' + pageName);
      let driver: Driver = Driver.create();
      let timePicker: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let centerPoint = await timePicker.getBoundsCenter();
      await timePicker.click();
      await button.click();
      await driver.waitForIdle(500, 500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.mouseMoveTo({x: centerPoint.x, y: centerPoint.y});
      await driver.swipe(centerPoint.x, centerPoint.y, centerPoint.x, centerPoint.y - 150);
      await driver.mouseMoveTo({x: centerPoint.x, y: centerPoint.y - 150});
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0012
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0012', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0012';
      let pageName = 'UIComponentMediaTimePickerEnableCascade0012';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/' + pageName);
      let driver: Driver = Driver.create();
      let timePicker: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let centerPoint = await timePicker.getBoundsCenter();
      await timePicker.click();
      await button.click();
      await driver.waitForIdle(500, 500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.mouseMoveTo({x: centerPoint.x, y: centerPoint.y});
      await driver.swipe(centerPoint.x, centerPoint.y, centerPoint.x, centerPoint.y - 150);
      await driver.mouseMoveTo({x: centerPoint.x, y: centerPoint.y - 150});
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0013
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0013', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0013';
      let pageName = 'UIComponentMediaTimePickerEnableCascade0013';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/' + pageName);
      let driver: Driver = Driver.create();
      let timePicker: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let centerPoint = await timePicker.getBoundsCenter();
      await timePicker.click();
      await button.click();
      await driver.waitForIdle(500, 500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.mouseMoveTo({x: centerPoint.x, y: centerPoint.y});
      await driver.swipe(centerPoint.x, centerPoint.y, centerPoint.x, centerPoint.y - 150);
      await driver.mouseMoveTo({x: centerPoint.x, y: centerPoint.y - 150});
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0034
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0034', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0034';
      let pageName = 'UIComponentMediaTimePickerEnableCascade0034';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/' + pageName);
      let driver: Driver = Driver.create();
      let showDialogButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let changeCascadeButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let column: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let centerPoint = await column.getBoundsCenter();
      await changeCascadeButton.click();
      await showDialogButton.click();
      await driver.waitForIdle(500, 500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.mouseMoveTo({x: centerPoint.x, y: centerPoint.y});
      await driver.swipe(centerPoint.x, centerPoint.y, centerPoint.x, centerPoint.y - 150);
      await driver.mouseMoveTo({x: centerPoint.x, y: centerPoint.y - 150});
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0035
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0035', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0035';
      let pageName = 'UIComponentMediaTimePickerEnableCascade0035';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/' + pageName);
      let driver: Driver = Driver.create();
      let showDialogButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let changeCascadeButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let column: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let centerPoint = await column.getBoundsCenter();
      await changeCascadeButton.click();
      await showDialogButton.click();
      await driver.waitForIdle(500, 500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.mouseMoveTo({x: centerPoint.x, y: centerPoint.y});
      await driver.swipe(centerPoint.x, centerPoint.y, centerPoint.x, centerPoint.y - 150);
      await driver.mouseMoveTo({x: centerPoint.x, y: centerPoint.y - 150});
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0036
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0036', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0036';
      let pageName = 'UIComponentMediaTimePickerEnableCascade0036';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/' + pageName);
      let driver: Driver = Driver.create();
      let showDialogButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let changeCascadeButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let column: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let centerPoint = await column.getBoundsCenter();
      await changeCascadeButton.click();
      await showDialogButton.click();
      await driver.waitForIdle(500, 500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.mouseMoveTo({x: centerPoint.x, y: centerPoint.y});
      await driver.swipe(centerPoint.x, centerPoint.y, centerPoint.x, centerPoint.y - 150);
      await driver.mouseMoveTo({x: centerPoint.x, y: centerPoint.y - 150});
      await driver.waitForIdle(500, 2000);
       await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0037
     * @tc.name   : Media TimePicker enablecascade
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0037', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0037';
      let pageName = 'UIComponentMediaTimePickerEnableCascade0037';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnableCascade/' + pageName);
      let driver: Driver = Driver.create();
      let showDialogButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let changeCascadeButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let column: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let centerPoint = await column.getBoundsCenter();
      await changeCascadeButton.click();
      await showDialogButton.click();
      await driver.waitForIdle(500, 500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.mouseMoveTo({x: centerPoint.x, y: centerPoint.y});
      await driver.swipe(centerPoint.x, centerPoint.y, centerPoint.x, centerPoint.y - 150);
      await driver.mouseMoveTo({x: centerPoint.x, y: centerPoint.y - 150});
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}