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
import { Driver, ON ,Component, UiWindow, MouseButton } from '@kit.TestKit';
import { uiAppearance } from '@kit.ArkUI';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';


let TAG = 'RunTimeTest';

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function uICustomDrawingSafeAreaScene() {
  describe('uICustomDrawingSafeAreaScene', () => {
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
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0330
     * @tc.name   : Custom drawing safearea scene
     * @tc.desc   : Verify custom drawing safearea scene interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0330', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0330';
      let pageName = 'UICustomDrawingSafeAreaScene0330';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UICustomDrawingSafeAreaScene/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0520
     * @tc.name   : Custom drawing safearea scene
     * @tc.desc   : Verify custom drawing safearea scene interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0520', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0520';
      let pageName = 'UICustomDrawingSafeAreaScene0520';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UICustomDrawingSafeAreaScene/' + pageName);
      let driver: Driver = Driver.create();
      let textinput: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let textarea: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(500, 1000);
      await textinput.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.triggerKey(2070);
      await driver.waitForIdle(2000, 3000);
      await textarea.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0530
     * @tc.name   : Custom drawing safearea scene
     * @tc.desc   : Verify custom drawing safearea scene interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0530', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0530';
      let pageName = 'UICustomDrawingSafeAreaScene0530';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UICustomDrawingSafeAreaScene/' + pageName);
      let driver: Driver = Driver.create();
      let tab1: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let tab2: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let tab3: Component = await driver.waitForComponent(ON.id(pageName + '_05'), 1000);
      await driver.waitForIdle(500, 1000);
      await tab1.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_01');
      await tab2.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_02');
      await tab3.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_03');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0540
     * @tc.name   : Custom drawing safearea scene
     * @tc.desc   : Verify custom drawing safearea scene interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0540', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0540';
      let pageName = 'UICustomDrawingSafeAreaScene0540';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UICustomDrawingSafeAreaScene/' + pageName);
      let driver: Driver = Driver.create();
      let tab1: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let tab2: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let tab3: Component = await driver.waitForComponent(ON.id(pageName + '_05'), 1000);
      await driver.waitForIdle(500, 1000);
      await tab1.click();
      await driver.waitForIdle(2000, 3000);
      let textinput: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await textinput.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.triggerKey(2070);
      await driver.waitForIdle(2000, 3000);
      await tab3.click();
      await driver.waitForIdle(2000, 3000);
      let textarea: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(2000, 3000);
      await textarea.click();
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0550
     * @tc.name   : Custom drawing safearea scene
     * @tc.desc   : Verify custom drawing safearea scene interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0550', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0550';
      let pageName = 'UICustomDrawingSafeAreaScene0550';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UICustomDrawingSafeAreaScene/' + pageName);
      let driver: Driver = Driver.create();
      let stepper: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(500, 1000);
      let bounds = await stepper.getBounds();
      await driver.mouseMoveTo({x: bounds.right - 50, y: bounds.bottom - 30});
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.mouseClick({x: bounds.right - 50, y: bounds.bottom - 30}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_02');
      await driver.mouseClick({x: bounds.right - 50, y: bounds.bottom - 30}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_03');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0560
     * @tc.name   : Custom drawing safearea scene
     * @tc.desc   : Verify custom drawing safearea scene interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0560', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0560';
      let pageName = 'UICustomDrawingSafeAreaScene0560';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UICustomDrawingSafeAreaScene/' + pageName);
      let driver: Driver = Driver.create();
      let stepper: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(500, 1000);
      let bounds = await stepper.getBounds();

      let textinput: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await textinput.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.triggerKey(2070);
      await driver.waitForIdle(2000, 3000);

      await driver.mouseMoveTo({x: bounds.right - 50, y: bounds.bottom - 30});
      await driver.mouseClick({x: bounds.right - 50, y: bounds.bottom - 30}, MouseButton.MOUSE_BUTTON_LEFT);
      await Utils.sleep(1000);
      await driver.mouseClick({x: bounds.right - 50, y: bounds.bottom - 30}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(2000, 3000);

      let textarea: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(2000, 3000);
      await textarea.click();
      await windowSnap.snapShot(TAG + '_02');

      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0570
     * @tc.name   : Custom drawing safearea scene
     * @tc.desc   : Verify custom drawing safearea scene interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0570', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0570';
      let pageName = 'UICustomDrawingSafeAreaScene0570';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UICustomDrawingSafeAreaScene/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0580
     * @tc.name   : Custom drawing safearea scene
     * @tc.desc   : Verify custom drawing safearea scene interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0580', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0580';
      let pageName = 'UICustomDrawingSafeAreaScene0580';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UICustomDrawingSafeAreaScene/' + pageName);
      let driver: Driver = Driver.create();
      let textinput: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let textarea: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(500, 1000);
      await textinput.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.triggerKey(2070);
      await driver.waitForIdle(2000, 3000);
      await textarea.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0970
     * @tc.name   : Custom drawing safearea scene
     * @tc.desc   : Verify custom drawing safearea scene interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0970', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_CUSTOM_DRAWING_SAFEAREA_SCENE_0970';
      let pageName = 'UICustomDrawingSafeAreaScene0970';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UICustomDrawingSafeAreaScene/' + pageName + '_pageA');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_pageA' + '_03'), 1000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_01');
      await button.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}