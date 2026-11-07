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

export default function actionEventCommonEventKeyEventDispatch() {
  describe('actionEventCommonEventKeyEventDispatch', () => {
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
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0040
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0040', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0040';
      let pageName = 'ActionEventCommonEventKeyEventDispatch0040';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventKeyEventDispatch_03/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0050
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0050', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0050';
      let pageName = 'ActionEventCommonEventKeyEventDispatch0050';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventKeyEventDispatch_03/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0060
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0060', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0060';
      let pageName = 'ActionEventCommonEventKeyEventDispatch0060';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventKeyEventDispatch_03/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0180
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0180', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0180';
      let pageName = 'ActionEventCommonEventKeyEventDispatch0180';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventKeyEventDispatch_03/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0190
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0190', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0190';
      let pageName = 'ActionEventCommonEventKeyEventDispatch0190';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventKeyEventDispatch_03/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0200
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0200', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0200';
      let pageName = 'ActionEventCommonEventKeyEventDispatch0200';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventKeyEventDispatch_03/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0250
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0250', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0250';
      let pageName = 'ActionEventCommonEventKeyEventDispatch0250';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventKeyEventDispatch_03/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2500);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 2500);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 2500);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 2500);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 2500);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0260
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0260', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0260';
      let pageName = 'ActionEventCommonEventKeyEventDispatch0260';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventKeyEventDispatch_03/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2500);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 2500);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 2500);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 2500);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 2500);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0270
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0270', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0270';
      let pageName = 'ActionEventCommonEventKeyEventDispatch0270';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventKeyEventDispatch_03/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2500);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 2500);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 2500);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 2500);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 2500);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}