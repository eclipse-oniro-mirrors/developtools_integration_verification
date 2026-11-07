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
import { BusinessError } from '@kit.BasicServicesKit';
import { KeyCode } from '@kit.InputKit';
import { Driver, ON ,Component } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';


let TAG = 'RunTimeTest';

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function testCase() {
  describe('testCase', () => {
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
          Logger.error(`[${TAG}]`, `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info(`[${TAG}]`, `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done();
    })

    afterAll(() => {

    })

    /*
     * @tc.number : TestCase_7b95b49b1c6b41b0a17704449c409e0d
     * @tc.name   : TestCase_7b95b49b1c6b41b0a17704449c409e0d
     * @tc.desc   : Verify testcase 7b95b49b1c6b41b0a17704449c409e0d interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('TestCase_7b95b49b1c6b41b0a17704449c409e0d', Level.LEVEL0, async (done: Function) => {
      TAG = 'TestCase_7b95b49b1c6b41b0a17704449c409e0d';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/scenario/misc/TestCase/TestCase001');
      let driver: Driver = Driver.create();
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : TestCase_c4b7742b9a304b6faa16642b1d99b837
     * @tc.name   : TestCase_c4b7742b9a304b6faa16642b1d99b837
     * @tc.desc   : Verify testcase c4b7742b9a304b6faa16642b1d99b837 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('TestCase_c4b7742b9a304b6faa16642b1d99b837', Level.LEVEL0, async (done: Function) => {
      TAG = 'TestCase_c4b7742b9a304b6faa16642b1d99b837';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/scenario/misc/TestCase/TestCase002');
      let driver: Driver = Driver.create();
      let textInput: Component = await driver.waitForComponent(ON.id('TestCase002_001'), 1000);
      await textInput.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      let search: Component = await driver.waitForComponent(ON.id('TestCase002_002'), 1000);
      await search.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      let richEditor: Component = await driver.waitForComponent(ON.id('TestCase002_003'), 1000);
      await richEditor.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      let xComponent: Component = await driver.waitForComponent(ON.id('TestCase002_004'), 1000);
      await xComponent.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}