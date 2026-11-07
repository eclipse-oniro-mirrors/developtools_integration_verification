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

export default function uIComponentMediaTimePickerStartEndTime() {
  describe('MediaTimePickerStartEndTimeUI', () => {
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
      let pageName = 'UIComponentMediaTimePickerStartEndTime0010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimePickerStartEndTimeUI/' + pageName);
      let driver: Driver = Driver.create();
      let timePicker: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let showDialogButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let timePickerCenter = await timePicker.getBoundsCenter();
      await driver.waitForIdle(500, 500);
      await windowSnap.snapShot(TAG + '_01');
      await showDialogButton.click();
      await driver.waitForIdle(500, 500);
      await windowSnap.snapShot(TAG + '_02');
      await timePicker.click();
      await driver.waitForIdle(500, 500);
      await driver.mouseMoveTo({x: timePickerCenter.x - 200, y: timePickerCenter.y});
      await driver.swipe(timePickerCenter.x - 200, timePickerCenter.y, timePickerCenter.x - 200, timePickerCenter.y - 200, 3000);
      await driver.waitForIdle(500, 1000);
      await driver.swipe(timePickerCenter.x - 200, timePickerCenter.y, timePickerCenter.x - 200, timePickerCenter.y - 200, 3000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '_03');
      await showDialogButton.click();
      await driver.waitForIdle(500, 500);
      await windowSnap.snapShot(TAG + '_04');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}