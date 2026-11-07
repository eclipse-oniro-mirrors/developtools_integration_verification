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
import { Driver, ON } from '@kit.TestKit';

const TAG = 'toolchainDirecthsp';

export default function toolchainDirecthsp() {
  describe('toolchainDirecthsp', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error(TAG, `Failed to destroy the window. Cause : ${JSON.stringify(err)}`);
          return;
        }
        Logger.info(TAG, `Succeeded in destroy the window.`);
      });
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_DIRECTHSP_0010
     * @tc.name   : Toolchain directhsp
     * @tc.desc   : Verify toolchain directhsp interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_DIRECTHSP_0010', 0, async (done: Function) => {
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0010 start.');
      Settings.createWindow('testability/pages/scenario/misc/ToolchainDirecthsp/Directhsp0010');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);

      let btnElement = await driver.waitForComponent(ON.id('btn'), 2000);
      await btnElement.click();
      await driver.waitForIdle(300, 1000);

      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0010 finish.');
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_DIRECTHSP_0020
     * @tc.name   : Toolchain directhsp
     * @tc.desc   : Verify toolchain directhsp interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_DIRECTHSP_0020', 0, async (done: Function) => {
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0020 start.');
      Settings.createWindow('testability/pages/scenario/misc/ToolchainDirecthsp/Directhsp0020');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);

      let btnElement = await driver.waitForComponent(ON.id('btn'), 2000);
      await btnElement.click();
      await driver.waitForIdle(300, 1000);

      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0020 finish.');
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_DIRECTHSP_0030
     * @tc.name   : Toolchain directhsp
     * @tc.desc   : Verify toolchain directhsp interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_DIRECTHSP_0030', 0, async (done: Function) => {
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0030 start.');
      Settings.createWindow('testability/pages/scenario/misc/ToolchainDirecthsp/Directhsp0030');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);

      let btnElement = await driver.waitForComponent(ON.id('btn'), 2000);
      await btnElement.click();
      await driver.waitForIdle(300, 1000);

      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0030 finish.');
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_DIRECTHSP_0040
     * @tc.name   : Toolchain directhsp
     * @tc.desc   : Verify toolchain directhsp interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_DIRECTHSP_0040', 0, async (done: Function) => {
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0040 start.');
      Settings.createWindow('testability/pages/scenario/misc/ToolchainDirecthsp/Directhsp0040');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);

      let btnElement = await driver.waitForComponent(ON.id('btn'), 2000);
      await btnElement.click();
      await driver.waitForIdle(300, 1000);

      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0040 finish.');
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_DIRECTHSP_0050
     * @tc.name   : Toolchain directhsp
     * @tc.desc   : Verify toolchain directhsp interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_DIRECTHSP_0050', 0, async (done: Function) => {
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0050 start.');
      Settings.createWindow('testability/pages/scenario/misc/ToolchainDirecthsp/Directhsp0050');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);

      let btnElement = await driver.waitForComponent(ON.id('btn'), 2000);
      await btnElement.click();
      await driver.waitForIdle(300, 1000);

      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0050 finish.');
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_DIRECTHSP_0060
     * @tc.name   : Toolchain directhsp
     * @tc.desc   : Verify toolchain directhsp interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_DIRECTHSP_0060', 0, async (done: Function) => {
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0060 start.');
      Settings.createWindow('testability/pages/scenario/misc/ToolchainDirecthsp/Directhsp0060');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);

      let btnElement = await driver.waitForComponent(ON.id('btn'), 2000);
      await btnElement.click();
      await driver.waitForIdle(300, 1000);

      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0060 finish.');
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_DIRECTHSP_0070
     * @tc.name   : Toolchain directhsp
     * @tc.desc   : Verify toolchain directhsp interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_DIRECTHSP_0070', 0, async (done: Function) => {
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0070 start.');
      Settings.createWindow('testability/pages/scenario/misc/ToolchainDirecthsp/Directhsp0070');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);

      let btnElement = await driver.waitForComponent(ON.id('btn'), 2000);
      await btnElement.click();
      await driver.waitForIdle(300, 1000);

      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0070 finish.');
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_DIRECTHSP_0080
     * @tc.name   : Toolchain directhsp
     * @tc.desc   : Verify toolchain directhsp interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_DIRECTHSP_0080', 0, async (done: Function) => {
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0080 start.');
      Settings.createWindow('testability/pages/scenario/misc/ToolchainDirecthsp/Directhsp0080');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);

      let btnElement = await driver.waitForComponent(ON.id('btn'), 2000);
      await btnElement.click();
      await driver.waitForIdle(300, 1000);

      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0080 finish.');
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_DIRECTHSP_0090
     * @tc.name   : Toolchain directhsp
     * @tc.desc   : Verify toolchain directhsp interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_DIRECTHSP_0090', 0, async (done: Function) => {
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0090 start.');
      Settings.createWindow('testability/pages/scenario/misc/ToolchainDirecthsp/Directhsp0090');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);

      let btnElement = await driver.waitForComponent(ON.id('btn'), 2000);
      await btnElement.click();
      await driver.waitForIdle(300, 1000);

      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0090 finish.');
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_DIRECTHSP_0100
     * @tc.name   : Toolchain directhsp
     * @tc.desc   : Verify toolchain directhsp interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_DIRECTHSP_0100', 0, async (done: Function) => {
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0100 start.');
      Settings.createWindow('testability/pages/scenario/misc/ToolchainDirecthsp/Directhsp0100');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);

      let btnElement = await driver.waitForComponent(ON.id('btn'), 2000);
      await btnElement.click();
      await driver.waitForIdle(300, 1000);

      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_DIRECTHSP_0100 finish.');
      done();
    });

  });
}