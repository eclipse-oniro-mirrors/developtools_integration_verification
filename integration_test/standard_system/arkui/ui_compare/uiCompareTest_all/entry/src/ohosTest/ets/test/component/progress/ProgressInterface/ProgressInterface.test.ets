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

export default function progressInterface() {

  describe('progressInterface', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0070
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : For the strokeWidth property, refer to the configuration item in the string.json file and set the progress bar width to 50fp.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0070 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0060
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : For the strokeWidth property, refer to the configuration item in the string.json file and set the progress bar width to 50.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0060 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0140
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Setting colors and adding a sweeping light animation for a ring progress bar without setting the strokeWidth in RingStyleOptions.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0140', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0140 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0140')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0180
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the color for a ring progress bar and add a sweeping light animation, with the color set to $r(app.color.Pink) and the progress type set to ProgressType.Ring.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0180', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0180 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0180')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0180 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0240
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the color and add a sweeping light animation for a linear progress bar without setting the strokeWidth.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0240', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0240 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0240')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0240 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0250
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the color and add a sweeping light animation for a linear progress bar, with the strokeWidth set to 10vp.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0250', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0250 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0250')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0250 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0330
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the scale width parameter of the ring progress bar to the string value "50fp".
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0330', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0330 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0330')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0330 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0080
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : For the strokeWidth property, reference the configuration item in the string.json file to set the progress bar width to 50px.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0080 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0440
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the progress bar width strokeWidth to the string value "50fp" and check the final display effect.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0440', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0440 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0440')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0440 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0320
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the ring progress bar scale width parameter scaleWidth to the string value "50".
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0320', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0320 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0320')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0320 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0460
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the progress bar width strokeWidth to the string value "50vp" and check the final display effect.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0460', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0460 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0460')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0460 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0410
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the total scale count parameter scaleCount of the ring progress bar to 5.5 (effective only under the ScaleRing ring style).
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0410', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0410 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0410')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0410 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0360
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the scale width parameter scaleWidth of the ring progress bar to the numeric value 80.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0360', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0360 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0360')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0360 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0340
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the scale width parameter scaleWidth of the ring progress bar to the string value "50px".
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0340', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0340 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0340')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0340 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0350
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the scale width parameter scaleWidth of the ring progress bar to the string value "50vp".
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0350', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0350 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0350')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0350 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0310
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the color and add a sweeping light animation for the linear progress bar, with the ProgressType set to Linear and the color set to rgb(2, 184, 17).
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0310', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0310 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0310')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0310 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0450
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the progress bar width strokeWidth to the string value "50px" and check the final display effect.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0450', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0450 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0450')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0450 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0470
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the progress bar width strokeWidth to the numeric value 0 and check the final display effect.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0470', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0470 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0470')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0470 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0430
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the progress bar width strokeWidth to the numeric value 0 and check the final display effect.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0430', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0430 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0430')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0430 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0390
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the scale width parameter scaleWidth of the ring progress bar by referencing the configuration items in the string.json file, and configure it with values "50fp", "50vp", and "50px" respectively, then check the display.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0390', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0390 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0390')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0390 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0370
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the scale width parameter of the circular progress bar to 30% as a percentage.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0370', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0370 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0370')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0370 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0400
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the scaleWidth parameter of the circular progress bar to 50, referencing the configuration item in the string.json file.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0400', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0400 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0400')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0400 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0420
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the total scale count parameter scaleCount to 90 (effective only under the ScaleRing circular style).
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0420', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0420 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0420')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0420 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0280
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : For the linear progress bar, set the ProgressType to Linear and set the color to $r(app.color.Pink).
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0280', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0280 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0280')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0280 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0490
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : For the linear progress bar, set the ProgressType to Linear and set the color to $r(app.color.Pink).
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0490', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0490 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0280')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0490 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0480
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the progress bar width strokeWidth to the numerical value of 80vp, and check the final display effect.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0480', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0480 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0480')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0480 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0500
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the progress bar width strokeWidth to the numerical value of 30%, and check the final display effect.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0500', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0500 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0500')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0500 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0200
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the circular progress bar color to Color.Blue and add a sweeping light animation effect, with the ProgressType set to Ring.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0200', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0200 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0200')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0200 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0290
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the linear progress bar color to 0xFF0000 and add a sweeping light animation effect, with the ProgressType set to Linear.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0290', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0290 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0290')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0290 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0300
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the color of the linear progress bar to Color.Blue and add a sweeping light animation effect, with the ProgressType set to Linear.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0300', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0300 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0300')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0300 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0020
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : For the strokeWidth property, reference the configuration item in the float.json file and set the progress bar width to 50fp.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0020 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0260
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the color of the linear progress bar and add a sweeping light animation effect, with the ProgressType set to Linear.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0260', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0260 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0260')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0260 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0270
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Set the color of the linear progress bar to #fc0303 and add a sweeping light animation effect, with the ProgressType set to Linear.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0270', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0270 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0270')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0270 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0010
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Do not configure the following three parameters:strokeWidth?: Length; (Progress bar width)scaleCount?: number; (Total number of scales for the circular progress bar)scaleWidth
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0010', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0010 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0090
     * @tc.name   : Information Progress interface
     * @tc.desc   : Verify information Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : For the strokeWidth property, reference the configuration item in the string.json file and set the progress bar width to 50vp.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0090', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0090 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressInterface/ProgressInterface0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0090 finish.`);
      done()
    })




  })
}