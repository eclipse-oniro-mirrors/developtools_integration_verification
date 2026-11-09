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

import { screen, window, uiAppearance } from '@kit.ArkUI';
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

export default function arkUIComponentFunctionSpecialComponentsDialogCustomSelectInputMethodOptimization() {
  describe('arkUIComponentFunctionSpecialComponentsDialogCustomSelectInputMethodOptimization', () => {
    beforeAll(() => {

    })
    beforeEach(() => {

      let screenClass: screen.Screen | null = null;
      screen.getAllScreens(async (err: BusinessError, data: screen.Screen[]) => {
        const errCode: number = err.code;
        if (errCode) {
          Logger.error(`[${TAG}]: beforeEach: Failed to get all screens. Code:${err.code},message is ${err.message}`);
          return;
        }
        Logger.info(`[${TAG}]: beforeEach: Succeeded in getting all screens. Data:` + JSON.stringify(data));

        screenClass = data[0];
        screenClass.setOrientation(screen.Orientation.VERTICAL, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            Logger.error(`[${TAG}]: beforeEach: Failed to set the vertical orientation. Code:${err.code},message is ${err.message}`);
            return;
          }
          Logger.info(`[${TAG}]: beforeEach: Succeeded in setting the vertical orientation.`);
        });
      });

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
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0070
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0070', Level.LEVEL3, async (done: Function) => {
      TAG = 'ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0070';
      let pageName = 'ArkUIComponentFunctionSpecialComponentsDialogCustomSelectInputMethodOptimization0070';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/popup/ArkUIComponentFunctionSpecialComponentsDialogCustomSelectInputMethodOptimization/' + pageName, undefined, undefined, undefined, 800);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 2000);
      await button.click();
      await driver.waitForIdle(2000, 5000);
      await windowSnap.snapShot(TAG + '_01');
      let textInput: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await textInput.click();
      await driver.waitForIdle(2000, 5000);
      await windowSnap.snapShot(TAG + '_02');
      await driver.triggerKey(2054);
      await driver.waitForIdle(2000, 5000);
      await windowSnap.snapShot(TAG + '_03');
      await driver.triggerKey(2070);

      let screenClass: screen.Screen | null = null;
      screen.getAllScreens(async (err: BusinessError, data: screen.Screen[]) => {
        const errCode: number = err.code;
        if (errCode) {
          Logger.error(`[${TAG}]: Failed to get all screens. Code:${err.code},message is ${err.message}`);
          return;
        }
        Logger.info(`[${TAG}]: Succeeded in getting all screens. Data:` + JSON.stringify(data));
        screenClass = data[0];
        screenClass.setOrientation(screen.Orientation.HORIZONTAL, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            Logger.error(`[${TAG}]: Failed to set the horizontal orientation. Code:${err.code},message is ${err.message}`);
            return;
          }
          Logger.info(`[${TAG}]: Succeeded in setting the horizontal orientation.`);
        });

        await driver.waitForIdle(2000, 5000);
        let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
        await driver.waitForIdle(500, 2000);
        await button.click();
        await driver.waitForIdle(2000, 5000);
        await windowSnap.snapShot(TAG + '_04');
        let textInput: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
        await textInput.click();
        await driver.waitForIdle(2000, 5000);
        await windowSnap.snapShot(TAG + '_05');
        await driver.waitForIdle(2000, 5000);
        await windowSnap.snapShot(TAG + '_06');
        await driver.triggerKey(2070);

        screenClass.setOrientation(screen.Orientation.VERTICAL, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            Logger.error(`[${TAG}]: Failed to set the vertical orientation. Code:${err.code},message is ${err.message}`);
            return;
          }
          Logger.info(`[${TAG}]: Succeeded in setting the vertical orientation.`);
        });
      });
      await Utils.sleep(10000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0210
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0210', Level.LEVEL3, async (done: Function) => {
      TAG = 'ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0210';
      let pageName = 'ArkUIComponentFunctionSpecialComponentsDialogCustomSelectInputMethodOptimization0210';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/popup/ArkUIComponentFunctionSpecialComponentsDialogCustomSelectInputMethodOptimization/' + pageName, undefined, undefined, undefined, 800);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 2000);
      await button.click();
      await driver.waitForIdle(2000, 5000);
      await windowSnap.snapShot(TAG + '_01');
      let textInput: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await textInput.click();
      await driver.waitForIdle(2000, 5000);
      await windowSnap.snapShot(TAG + '_02');
      await driver.triggerKey(2054);
      await driver.waitForIdle(2000, 5000);
      await windowSnap.snapShot(TAG + '_03');
      await driver.triggerKey(2070);

      let screenClass: screen.Screen | null = null;
      screen.getAllScreens(async (err: BusinessError, data: screen.Screen[]) => {
        const errCode: number = err.code;
        if (errCode) {
          Logger.error(`[${TAG}]: Failed to get all screens. Code:${err.code},message is ${err.message}`);
          return;
        }
        Logger.info(`[${TAG}]: Succeeded in getting all screens. Data:` + JSON.stringify(data));
        screenClass = data[0];
        screenClass.setOrientation(screen.Orientation.HORIZONTAL, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            Logger.error(`[${TAG}]: Failed to set the horizontal orientation. Code:${err.code},message is ${err.message}`);
            return;
          }
          Logger.info(`[${TAG}]: Succeeded in setting the horizontal orientation.`);
        });

        await driver.waitForIdle(2000, 5000);
        let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
        await driver.waitForIdle(500, 2000);
        await button.click();
        await driver.waitForIdle(2000, 5000);
        await windowSnap.snapShot(TAG + '_04');
        let textInput: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
        await textInput.click();
        await driver.waitForIdle(2000, 5000);
        await windowSnap.snapShot(TAG + '_05');
        await driver.waitForIdle(2000, 5000);
        await windowSnap.snapShot(TAG + '_06');
        await driver.triggerKey(2070);

        screenClass.setOrientation(screen.Orientation.VERTICAL, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            Logger.error(`[${TAG}]: Failed to set the vertical orientation. Code:${err.code},message is ${err.message}`);
            return;
          }
          Logger.info(`[${TAG}]: Succeeded in setting the vertical orientation.`);
        });
      });

      await Utils.sleep(10000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}