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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { Driver, ON ,Component, UiWindow } from '@kit.TestKit';
import { screen, uiAppearance } from '@kit.ArkUI';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';


let TAG = 'RunTimeTest';

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function uIComponentPopupBoxModalTransitionKeyboard() {
  describe('uIComponentPopupBoxModalTransitionKeyboard', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MODALTRANSITION_KEYBOARD_0010
     * @tc.name   : Popupbox modaltransition keyboard
     * @tc.desc   : Verify popupbox modaltransition keyboard interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MODALTRANSITION_KEYBOARD_0010', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_POPUPBOX_MODALTRANSITION_KEYBOARD_0010';
      let pageName = 'UIComponentPopupBoxModalTransitionKeyboard0010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxModalTransitionKeyboard/' + pageName, undefined, undefined, undefined, 800);
      let driver: Driver = Driver.create();

      // 1.
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await button.click();
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_01');

      // 2.
      let textInput: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(2000, 4000);
      await textInput.click();
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_02');

      // 3.
      await driver.triggerKey(2054);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_03');

      // 4.
      await textInput.click();
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_04');

      // 5.
      let bindSheetColumn: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let sheetBounds = await bindSheetColumn.getBounds();
      let sheetCenter = await bindSheetColumn.getBoundsCenter();
      await driver.mouseMoveTo({x: sheetBounds.left - 50, y: sheetCenter.y});
      await driver.click(sheetBounds.left - 50, sheetCenter.y);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_05');

      // 6.
      await button.click();
      await driver.waitForIdle(2000, 4000);
      textInput = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await textInput.click();
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_06');

      // 7.
      let pageColumn: Component = await driver.waitForComponent(ON.id(pageName + '_05'), 1000);
      let pageBounds = await pageColumn.getBounds();
      let pageCenter = await pageColumn.getBoundsCenter();
      await driver.mouseMoveTo({x: pageBounds.left, y: pageCenter.y});
      await driver.swipe(pageBounds.left, pageCenter.y, pageBounds.left + 150, pageCenter.y);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_07');

      // 8.
      await textInput.click();
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_08');

      // 9.
      let closeButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(500, 1000);
      await closeButton.click();
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_09');

      // 10.
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

        // 1.
        let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
        await driver.waitForIdle(500, 1000);
        await button.click();
        await driver.waitForIdle(2000, 4000);
        await windowSnap.snapShot(TAG + '_10');
        Logger.info(`[${TAG}]: Done 1`);

        // 2.
        let textInput: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
        await driver.waitForIdle(2000, 4000);
        await textInput.click();
        await driver.waitForIdle(2000, 4000);
        await windowSnap.snapShot(TAG + '_11');
        Logger.info(`[${TAG}]: Done 2`);

        // 3.
        await driver.triggerKey(2054);
        await driver.waitForIdle(2000, 4000);
        await windowSnap.snapShot(TAG + '_12');
        Logger.info(`[${TAG}]: Done 3`);

        // 4.
        await textInput.click();
        await driver.waitForIdle(2000, 4000);
        await windowSnap.snapShot(TAG + '_13');
        Logger.info(`[${TAG}]: Done 4`);

        // 5.
        await driver.waitForIdle(500, 1000);
        await driver.triggerKey(2054);
        let bindSheetColumn: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
        let sheetBounds = await bindSheetColumn.getBounds();
        let sheetCenter = await bindSheetColumn.getBoundsCenter();
        await driver.mouseMoveTo({x: sheetBounds.right + 50, y: sheetCenter.y});
        await driver.click(sheetBounds.left - 50, sheetCenter.y);
        await driver.waitForIdle(2000, 4000);
        await windowSnap.snapShot(TAG + '_14');
        Logger.info(`[${TAG}]: Done 5`);


        // 6.
        await button.click();
        await driver.waitForIdle(2000, 4000);
        textInput = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
        await textInput.click();
        await driver.waitForIdle(2000, 4000);
        await windowSnap.snapShot(TAG + '_15');
        Logger.info(`[${TAG}]: Done 6`);

        // 7.
        let pageColumn: Component = await driver.waitForComponent(ON.id(pageName + '_05'), 1000);
        let closeButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
        let pageBounds = await pageColumn.getBounds();
        let pageCenter = await pageColumn.getBoundsCenter();
        await driver.mouseMoveTo({x: pageBounds.left, y: pageCenter.y});
        await driver.triggerKey(2054);
        await driver.waitForIdle(500, 1000);
        await driver.swipe(pageBounds.left, pageCenter.y, pageBounds.left + 150, pageCenter.y);
        await driver.waitForIdle(2000, 4000);
        await windowSnap.snapShot(TAG + '_16');
        Logger.info(`[${TAG}]: Done 7`);

        // 8.
        await textInput.click();
        await driver.waitForIdle(2000, 4000);
        await windowSnap.snapShot(TAG + '_17');
        Logger.info(`[${TAG}]: Done 8`);

        // 9.
        await driver.waitForIdle(500, 1000);
        await driver.triggerKey(2054);
        await driver.waitForIdle(500, 1000);
        closeButton = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
        await closeButton.click();
        await driver.waitForIdle(2000, 4000);
        await windowSnap.snapShot(TAG + '_18');
        Logger.info(`[${TAG}]: Done 9`);

        screenClass.setOrientation(screen.Orientation.VERTICAL, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            Logger.error(`[${TAG}]: Failed to set the vertical orientation. Code:${err.code},message is ${err.message}`);
            return;
          }
          Logger.info(`[${TAG}]: Succeeded in setting the vertical orientation.`);
        });
      });
      await Utils.sleep(20000);

      //11.
      button = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await button.click();
      await driver.waitForIdle(2000, 4000);
      textInput = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      bindSheetColumn = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      await textInput.click();
      await driver.waitForIdle(2000, 4000);
      sheetBounds = await bindSheetColumn.getBounds();
      sheetCenter = await bindSheetColumn.getBoundsCenter();
      await driver.mouseMoveTo({x: sheetCenter.x, y: sheetBounds.top - 100});
      await driver.drag(sheetCenter.x, sheetBounds.top - 100, sheetCenter.x, sheetBounds.top - 300);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_19');

      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MODALTRANSITION_KEYBOARD_0040
     * @tc.name   : Popupbox modaltransition keyboard
     * @tc.desc   : Verify popupbox modaltransition keyboard interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MODALTRANSITION_KEYBOARD_0040', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_POPUPBOX_MODALTRANSITION_KEYBOARD_0040';
      let pageName = 'UIComponentPopupBoxModalTransitionKeyboard0040';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxModalTransitionKeyboard/' + pageName, undefined, undefined, undefined, 800);
      let driver: Driver = Driver.create();

      // 1.
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await button.click();
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_01');

      // 2.
      let textInput: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(2000, 4000);
      await textInput.click();
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_02');

      // 3.
      await driver.triggerKey(2054);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_03');

      // 4.
      await textInput.click();
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_04');

      // 5.
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2054);
      let pageColumn: Component = await driver.waitForComponent(ON.id(pageName + '_05'), 1000);
      let pageBounds = await pageColumn.getBounds();
      let pageCenter = await pageColumn.getBoundsCenter();
      await driver.mouseMoveTo({x: pageBounds.left, y: pageCenter.y});
      await driver.swipe(pageBounds.left, pageCenter.y, pageBounds.left + 150, pageCenter.y);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_05');

      // 6.
      await textInput.click();
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_06');

      // 7.
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2054);
      let closeButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(500, 1000);
      await closeButton.click();
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_07');

      // 8.
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

        // 1.
        let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
        await driver.waitForIdle(500, 1000);
        await button.click();
        await driver.waitForIdle(2000, 4000);
        await windowSnap.snapShot(TAG + '_08');
        Logger.info(`[${TAG}]: Done 1`);

        // 2.
        let textInput: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
        await driver.waitForIdle(2000, 4000);
        await textInput.click();
        await driver.waitForIdle(2000, 4000);
        await windowSnap.snapShot(TAG + '_09');
        Logger.info(`[${TAG}]: Done 2`);

        // 3.
        await driver.triggerKey(2054);
        await driver.waitForIdle(2000, 4000);
        await windowSnap.snapShot(TAG + '_10');
        Logger.info(`[${TAG}]: Done 3`);

        // 4.
        await textInput.click();
        await driver.waitForIdle(2000, 4000);
        await windowSnap.snapShot(TAG + '_11');
        Logger.info(`[${TAG}]: Done 4`);

        // 5.
        let pageColumn: Component = await driver.waitForComponent(ON.id(pageName + '_05'), 1000);
        let closeButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
        let pageBounds = await pageColumn.getBounds();
        let pageCenter = await pageColumn.getBoundsCenter();
        await driver.mouseMoveTo({x: pageBounds.left, y: pageCenter.y});
        await driver.waitForIdle(500, 1000);
        await driver.triggerKey(2054);
        await driver.waitForIdle(500, 1000);
        await driver.swipe(pageBounds.left, pageCenter.y, pageBounds.left + 150, pageCenter.y);
        await driver.waitForIdle(2000, 4000);
        await windowSnap.snapShot(TAG + '_12');
        Logger.info(`[${TAG}]: Done 5`);

        // 6.
        await textInput.click();
        await driver.waitForIdle(2000, 4000);
        await windowSnap.snapShot(TAG + '_13');
        Logger.info(`[${TAG}]: Done 6`);

        // 7.
        await driver.waitForIdle(500, 1000);
        await driver.triggerKey(2054);
        await driver.waitForIdle(500, 1000);
        closeButton = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
        await closeButton.click();
        await driver.waitForIdle(2000, 4000);
        await windowSnap.snapShot(TAG + '_14');
        Logger.info(`[${TAG}]: Done 7`);

        screenClass.setOrientation(screen.Orientation.VERTICAL, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            Logger.error(`[${TAG}]: Failed to set the vertical orientation. Code:${err.code},message is ${err.message}`);
            return;
          }
          Logger.info(`[${TAG}]: Succeeded in setting the vertical orientation.`);
        });
      });
      await Utils.sleep(20000);

      //11.
      button = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await button.click();
      await driver.waitForIdle(2000, 4000);
      textInput = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let bindSheetColumn = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      await textInput.click();
      await driver.waitForIdle(2000, 4000);
      let sheetBounds = await bindSheetColumn.getBounds();
      let sheetCenter = await bindSheetColumn.getBoundsCenter();
      await driver.mouseMoveTo({x: sheetCenter.x, y: sheetBounds.top - 100});
      await driver.drag(sheetCenter.x, sheetBounds.top - 100, sheetCenter.x, sheetBounds.top - 300);
      await driver.waitForIdle(2000, 4000);
      await windowSnap.snapShot(TAG + '_15');

      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}