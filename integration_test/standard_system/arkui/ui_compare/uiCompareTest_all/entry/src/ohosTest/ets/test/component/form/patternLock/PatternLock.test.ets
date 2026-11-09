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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, Component } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit'

export default function patternLockTest () {

  describe('patternLockTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err:BusinessError) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0027
     * @tc.name   : PatternLock component: Pass abnormal values (1, 0, -1, 100), empty values (undefined, null), and
     * @tc.desc   : Verify media PatternLock outlier parameters interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0027', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0027 start.`);
      Settings.createWindow('testability/pages/component/form/patternLock/patternLock01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0027_01')
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('PatternLock01_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0027_02')
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('PatternLock01_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0027_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0027 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0028
     * @tc.name   : PatternLock component: Set sideLength property with abnormal values (1, 0, -1, 100), empty values
     * @tc.desc   : Verify media PatternLock outlier parameters interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0028', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0028 start.`);
      Settings.createWindow('testability/pages/component/form/patternLock/patternLock02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0028_01')
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('PatternLock02_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0028_02')
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('PatternLock02_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0028_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0028 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0029
     * @tc.name   : PatternLock component: Set circleRadius property with abnormal values (1, 0, -1, 100), empty values
     * @tc.desc   : Verify media PatternLock outlier parameters interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0029', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0029 start.`);
      Settings.createWindow('testability/pages/component/form/patternLock/patternLock03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0029_01')
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('PatternLock03_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0029_02')
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('PatternLock03_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0029_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0029 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0030
     * @tc.name   : PatternLock component: Set backgroundColor property with abnormal values (1, 0, -1, 100), empty
     * @tc.desc   : Verify media PatternLock outlier parameters interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0030 start.`);
      Settings.createWindow('testability/pages/component/form/patternLock/patternLock04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0030_01')
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('PatternLock04_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0030_02')
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('PatternLock04_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0030_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0031
     * @tc.name   : PatternLock component: Set regularColor property with abnormal values (1, 0, -1, 100), empty values
     * @tc.desc   : Verify media PatternLock outlier parameters interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0031', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0031 start.`);
      Settings.createWindow('testability/pages/component/form/patternLock/patternLock05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0031_01')
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('PatternLock05_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0031_02')
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('PatternLock05_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0031_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0031 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0032
     * @tc.name   : PatternLock component: Set selectedColor property with abnormal values (1, 0, -1, 100), empty
     * @tc.desc   : Verify media PatternLock outlier parameters interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0032', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0032 start.`);
      Settings.createWindow('testability/pages/component/form/patternLock/patternLock06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0032_01')
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('PatternLock06_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0032_02')
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('PatternLock06_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0032_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0032 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0033
     * @tc.name   : PatternLock component: Set activeColor property with abnormal values (1, 0, -1, 100), empty values
     * @tc.desc   : Verify media PatternLock outlier parameters interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0033', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0033 start.`);
      Settings.createWindow('testability/pages/component/form/patternLock/patternLock07')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0033_01')
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('PatternLock07_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0033_02')
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('PatternLock07_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0033_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0033 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0034
     * @tc.name   : PatternLock component: Set pathColor property with abnormal values (1, 0, -1, 100), empty values
     * @tc.desc   : Verify media PatternLock outlier parameters interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0034', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0034 start.`);
      Settings.createWindow('testability/pages/component/form/patternLock/patternLock08')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0034_01')
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('PatternLock08_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0034_02')
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('PatternLock08_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0034_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0034 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0035
     * @tc.name   : PatternLock component: Set pathStrokeWidth property with abnormal values (1, 0, -1, 100), empty
     * @tc.desc   : Verify media PatternLock outlier parameters interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0035', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0035 start.`);
      Settings.createWindow('testability/pages/component/form/patternLock/patternLock09')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0035')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0035 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0036
     * @tc.name   : PatternLock component: Set autoReset property with abnormal values (1, 0, -1, 100), empty values
     * @tc.desc   : Verify media PatternLock outlier parameters interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0036', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0036 start.`);
      Settings.createWindow('testability/pages/component/form/patternLock/patternLock10')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0036_01')
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('PatternLock10'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0036_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0036 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0037
     * @tc.name   : PatternLock component: For activateCircleStyle property, set color with abnormal values
     * @tc.desc   : Verify media PatternLock outlier parameters interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0037', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0037 start.`);
      Settings.createWindow('testability/pages/component/form/patternLock/patternLock11')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0037_01')
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('PatternLock11'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0037_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0037 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0038
     * @tc.name   : PatternLock component: For activateCircleStyle property, set radius with abnormal values
     * @tc.desc   : Verify media PatternLock outlier parameters interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0038', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0038 start.`);
      Settings.createWindow('testability/pages/component/form/patternLock/patternLock12')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0038')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0038 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0039
     * @tc.name   : PatternLock component: For activateCircleStyle property, set enableWaveEffect with abnormal values
     * @tc.desc   : Verify media PatternLock outlier parameters interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0039', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0039 start.`);
      Settings.createWindow('testability/pages/component/form/patternLock/patternLock13')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0039_01')
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('PatternLock13'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0039_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0039 finish.`);
      done()
    })
  })
}