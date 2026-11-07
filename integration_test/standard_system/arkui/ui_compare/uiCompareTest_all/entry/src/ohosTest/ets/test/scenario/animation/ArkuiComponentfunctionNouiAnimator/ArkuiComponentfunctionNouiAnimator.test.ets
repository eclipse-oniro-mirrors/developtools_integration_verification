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

export default function arkuiComponentfunctionNouiAnimatorTest() {
  describe('arkuiComponentfunctionNouiAnimatorTest', () => {
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
     * @tc.number : ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_BEGIN_010
     * @tc.name   : Component function noui animator begin
     * @tc.desc   : Verify component function noui animator begin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_BEGIN_010', 0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_BEGIN_010 start.`);
      Settings.createWindow('testability/pages/scenario/animation/ArkuiComponentfunctionNouiAnimatorBegin/ArkuiComponentfunctionNouiAnimatorBegin010');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_BEGIN_010 finish.`);
      done();
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_DELAY_010
     * @tc.name   : Component function noui animator delay
     * @tc.desc   : Verify component function noui animator delay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_DELAY_010', 0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_DELAY_010 start.`);
      Settings.createWindow('testability/pages/scenario/animation/ArkuiComponentfunctionNouiAnimatorDelay/ArkuiComponentfunctionNouiAnimatorDelay010');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_DELAY_010 finish.`);
      done();
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_DIRECTION_010
     * @tc.name   : Component function noui animator direction
     * @tc.desc   : Verify component function noui animator direction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_DIRECTION_010', 0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_DIRECTION_010 start.`);
      Settings.createWindow('testability/pages/scenario/animation/ArkuiComponentfunctionNouiAnimatorDirection/ArkuiComponentfunctionNouiAnimatorDirection010');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_DIRECTION_010 finish.`);
      done();
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_DURATION_010
     * @tc.name   : Component function noui animator duration
     * @tc.desc   : Verify component function noui animator duration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_DURATION_010', 0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_DURATION_010 start.`);
      Settings.createWindow('testability/pages/scenario/animation/ArkuiComponentfunctionNouiAnimatorDuration/ArkuiComponentfunctionNouiAnimatorDuration010');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_DURATION_010 finish.`);
      done();
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_EASE_010
     * @tc.name   : Component function noui animator ease
     * @tc.desc   : Verify component function noui animator ease interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_EASE_010', 0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_EASE_010 start.`);
      Settings.createWindow('testability/pages/scenario/animation/ArkuiComponentfunctionNouiAnimatorEase/ArkuiComponentfunctionNouiAnimatorEase010');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_EASE_010 finish.`);
      done();
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_EASE_020
     * @tc.name   : Component function noui animator ease
     * @tc.desc   : Verify component function noui animator ease interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_EASE_020', 0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_EASE_020 start.`);
      Settings.createWindow('testability/pages/scenario/animation/ArkuiComponentfunctionNouiAnimatorEase/ArkuiComponentfunctionNouiAnimatorEase020');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_EASE_020 finish.`);
      done();
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_END_010
     * @tc.name   : Component function noui animator end
     * @tc.desc   : Verify component function noui animator end interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_END_010', 0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_END_010 start.`);
      Settings.createWindow('testability/pages/scenario/animation/ArkuiComponentfunctionNouiAnimatorEnd/ArkuiComponentfunctionNouiAnimatorEnd010');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_END_010 finish.`);
      done();
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_FILL_010
     * @tc.name   : Component function noui animator fill
     * @tc.desc   : Verify component function noui animator fill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_FILL_010', 0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_FILL_010 start.`);
      Settings.createWindow('testability/pages/scenario/animation/ArkuiComponentfunctionNouiAnimatorFill/ArkuiComponentfunctionNouiAnimatorFill010');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_FILL_010 finish.`);
      done();
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_ITERATIONS_010
     * @tc.name   : Component function noui animator iterations
     * @tc.desc   : Verify component function noui animator iterations interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_ITERATIONS_010', 0, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_ITERATIONS_010 start.`);
      Settings.createWindow('testability/pages/scenario/animation/ArkuiComponentfunctionNouiAnimatorIterations/ArkuiComponentfunctionNouiAnimatorIterations010');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_NOUI_ANIMATOR_ITERATIONS_010 finish.`);
      done();
    });

  });
}