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

export default function builder() {

  describe('builder', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0040
     * @tc.name   : LoadingProgress component set enableLoading to false、 contentModifier set enableLoading to
     * @tc.desc   : Verify the interface under test: LoadingProgress component set enableLoading to false、 contentModifier set enableLoading to true.
     * @tc.type   : Set enableLoading to false directly on the LoadingProgress component itself, and set enableLoading to true within the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0040 start.`);
      Settings.createWindow('testability/pages/scenario/state/Builder/Builder0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0160
     * @tc.name   : Information LoadingProgress contentModifier builder
     * @tc.desc   : Verify information LoadingProgress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the padding to 20 within the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0160', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0160 start.`);
      Settings.createWindow('testability/pages/scenario/state/Builder/Builder0160')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0160 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0100
     * @tc.name   : Information LoadingProgress contentModifier builder
     * @tc.desc   : Verify information LoadingProgress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Add a Radio component inside the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0100', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0100 start.`);
      Settings.createWindow('testability/pages/scenario/state/Builder/Builder0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0030
     * @tc.name   : Information LoadingProgress contentModifier builder
     * @tc.desc   : Verify information LoadingProgress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the color property to red directly on the LoadingProgress component itself, and set color to green within the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0030 start.`);
      Settings.createWindow('testability/pages/scenario/state/Builder/Builder0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0130
     * @tc.name   : Information LoadingProgress contentModifier builder
     * @tc.desc   : Verify information LoadingProgress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the color property to red directly on the LoadingProgress component itself, and set color to green within the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0130', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0130 start.`);
      Settings.createWindow('testability/pages/scenario/state/Builder/Builder0130')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0130 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0060
     * @tc.name   : LoadingProgress component set enableLoading set 、 contentModifier set enableLoading to tru
     * @tc.desc   : Verify the interface under test: LoadingProgress component set enableLoading set 、 contentModifier set enableLoading to true.
     * @tc.type   : Do not set enableLoading on the LoadingProgress component itself; instead, set enableLoading to true within the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0060 start.`);
      Settings.createWindow('testability/pages/scenario/state/Builder/Builder0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0140
     * @tc.name   : Information LoadingProgress contentModifier builder
     * @tc.desc   : Verify information LoadingProgress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the height to 200 and the width to 100 within the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0140', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0140 start.`);
      Settings.createWindow('testability/pages/scenario/state/Builder/Builder0140')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0050
     * @tc.name   : Information LoadingProgress contentModifier builder
     * @tc.desc   : Verify information LoadingProgress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set enableLoading to true directly on the LoadingProgress component, and set enableLoading to false within the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0050 start.`);
      Settings.createWindow('testability/pages/scenario/state/Builder/Builder0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0110
     * @tc.name   : Information LoadingProgress contentModifier builder
     * @tc.desc   : Verify information LoadingProgress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Add a Text component inside the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0110', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0110 start.`);
      Settings.createWindow('testability/pages/scenario/state/Builder/Builder0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0150
     * @tc.name   : Information LoadingProgress contentModifier builder
     * @tc.desc   : Verify information LoadingProgress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set margin to 20 within the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0150', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0150 start.`);
      Settings.createWindow('testability/pages/scenario/state/Builder/Builder0150')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0150 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0090
     * @tc.name   : Information LoadingProgress contentModifier builder
     * @tc.desc   : Verify information LoadingProgress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Add a Button component inside the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0090', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0090 start.`);
      Settings.createWindow('testability/pages/scenario/state/Builder/Builder0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0180
     * @tc.name   : Information LoadingProgress contentModifier builder
     * @tc.desc   : Verify information LoadingProgress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set Visibility to Hidden, border to 20, and padding to 10 within the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0180', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0180 start.`);
      Settings.createWindow('testability/pages/scenario/state/Builder/Builder0180')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0180 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0010
     * @tc.name   : Information LoadingProgress contentModifier builder
     * @tc.desc   : Verify information LoadingProgress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Do not set the color property on the LoadingProgress component itself; instead, set the color within the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0010', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0010 start.`);
      Settings.createWindow('testability/pages/scenario/state/Builder/Builder0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0120
     * @tc.name   : Information LoadingProgress contentModifier builder
     * @tc.desc   : Verify information LoadingProgress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set border to 50 within the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0120', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0120 start.`);
      Settings.createWindow('testability/pages/scenario/state/Builder/Builder0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0230
     * @tc.name   : Information LoadingProgress contentModifier builder
     * @tc.desc   : Verify information LoadingProgress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Verify that focus can be triggered normally.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0230', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0230 start.`);
      Settings.createWindow('testability/pages/scenario/state/Builder/Builder0230')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0230 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0240
     * @tc.name   : Information LoadingProgress contentModifier builder
     * @tc.desc   : Verify information LoadingProgress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Verify that touch can be triggered normally.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0240', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0240 start.`);
      Settings.createWindow('testability/pages/scenario/state/Builder/Builder0240')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      let Button1: Component = await driver.waitForComponent(ON.id('Builder0240_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('Builder0240_001'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('Builder0240_001'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0240 finish.`);
      done()
    })



  })
}