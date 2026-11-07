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

import { window } from '@kit.ArkUI';
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

export default function uIComponentTextRichEditorInterface() {
  describe('uIComponentTextRichEditorInterface', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0013
     * @tc.name   : Text richeditor interface
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0013', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0013';
      let pageName = 'UIComponentTextRichEditorInterface0013';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface/' + pageName);
      let driver: Driver = Driver.create();
      let getTypingStyleButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await getTypingStyleButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0016
     * @tc.name   : Text richeditor interface
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0016', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0016';
      let pageName = 'UIComponentTextRichEditorInterface0016';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface/' + pageName);
      let driver: Driver = Driver.create();
      let richEditor: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let getTypingStyleButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let richEditorCenter = await richEditor.getBoundsCenter();
      await driver.mouseMoveTo({x: richEditorCenter.x - 150, y: richEditorCenter.y});
      await driver.click(richEditorCenter.x - 150, richEditorCenter.y);
      await getTypingStyleButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: richEditorCenter.x, y: richEditorCenter.y});
      await driver.click(richEditorCenter.x, richEditorCenter.y);
      await getTypingStyleButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: richEditorCenter.x + 150, y: richEditorCenter.y});
      await driver.click(richEditorCenter.x + 150, richEditorCenter.y);
      await getTypingStyleButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_9999_817
     * @tc.name   : Text richeditor interface
     * @tc.desc   : Verify text richeditor interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_9999_817', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_9999_817';
      let pageName = 'UIComponentTextRichEditorInterface9999_817';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorInterface/' + pageName);
      let driver: Driver = Driver.create();
      let setCaretOffsetAsInsideButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let setCaretOffsetAsOutsideButton: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await setCaretOffsetAsInsideButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await setCaretOffsetAsOutsideButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}