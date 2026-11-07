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

export default function Statusmanagerv2Freezing() {

  describe('Statusmanagerv2Freezing', () => {
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
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0060
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0060 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing60')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('button'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0060 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0090
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0090 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing90')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0090 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0070
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0070 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing70')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0070 finish.`);
      done();
    })

      /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0110
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0110 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing110')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0110 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0020
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0020 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing20')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0020 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0080
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0080 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing80')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0080 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0030
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0030 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing30')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0030 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0160
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0160 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing160')
      await windowSnap.snapShot()
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0160 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0050
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0050 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing50')
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0160 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0100
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0100 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing100')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0080 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0150
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0150 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing150')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0150 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0140
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0140 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing140')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0140 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0130
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0030 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing130')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.screenShot();
      await Utils.sleep(10000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0130 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0010
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0010 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing10')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0010 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0170
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0170 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing170')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0170 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0210
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0210 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing210')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0210 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0200
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0200 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing200')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0200 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0190
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0190 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing190')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0190 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0180
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0180 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing180')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      component = await driver.waitForComponent(ON.id('test'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      await driver.waitForIdle(500,2000);
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0180 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0230
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0230 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing230')
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0230 finish.`);
      done();
    })

    // /*
    //  * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0250
    //  * @tc.name   : SUB_ACE_STATUSMANAGERV2_FREEZING_0250
    //  * @tc.desc   : The nested and mixed tabcontent and lazyForEach components in the V1 decorator do not set the component freeze, and the lazyForEach sets the component freeze
    //  * @tc.type   : Function
    //  * @tc.size   : MediumTest
    //  * @tc.level  : 3
    //  */
    // it('SUB_ACE_STATUSMANAGERV2_FREEZING_0250', Level.LEVEL3, async (done: Function) => {
    //   Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0230 start.`);
    //   Settings.createWindow("testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing250")
    //   windowSnap.screenShot();
    //   await Utils.sleep(1000);
    //   Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0250 finish.`);
    //   done();
    // })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0220
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0220 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing220')
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0220 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0240
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0240 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing240')
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0240 finish.`);
      done();
    })

    // /*
    //  * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0270
    //  * @tc.name   : SUB_ACE_STATUSMANAGERV2_FREEZING_0270
    //  * @tc.desc   : The nested and mixed tabcontent and lazyForEach components in the V1 decorator do not set the component freeze, and the lazyForEach sets the component freeze
    //  * @tc.type   : Function
    //  * @tc.size   : MediumTest
    //  * @tc.level  : 3
    //  */
    // it('SUB_ACE_STATUSMANAGERV2_FREEZING_0270', Level.LEVEL3, async (done: Function) => {
    //   Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0270 start.`);
    //   Settings.createWindow("testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing270")
    //   windowSnap.screenShot();
    //   await Utils.sleep(1000);
    //   Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0270 finish.`);
    //   done();
    // })
  //
  //   /*
  //    * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0260
  //    * @tc.name   : SUB_ACE_STATUSMANAGERV2_FREEZING_0260
  //    * @tc.desc   : The nested and mixed tabcontent and lazyForEach components in the V1 decorator do not set the component freeze, and the lazyForEach sets the component freeze
  //    * @tc.type   : Function
  //    * @tc.size   : MediumTest
  //    * @tc.level  : 3
  //    */
  //   it('SUB_ACE_STATUSMANAGERV2_FREEZING_0260', Level.LEVEL3, async (done: Function) => {
  //     Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0260 start.`);
  //     Settings.createWindow("testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing260")
  //     windowSnap.screenShot();
  //     await Utils.sleep(1000);
  //     Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0260 finish.`);
  //     done();
  //   })

    // /*
    //  * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0310
    //  * @tc.name   : SUB_ACE_STATUSMANAGERV2_FREEZING_0310
    //  * @tc.desc   : The nested and mixed tabcontent and lazyForEach components in the V1 decorator do not set the component freeze, and the lazyForEach sets the component freeze
    //  * @tc.type   : Function
    //  * @tc.size   : MediumTest
    //  * @tc.level  : 3
    //  */
    // it('SUB_ACE_STATUSMANAGERV2_FREEZING_0310', Level.LEVEL3, async (done: Function) => {
    //   Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0310 start.`);
    //   Settings.createWindow("testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing310")
    //
    //   Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0310 finish.`);
    //   done();
    // })
    //
    // /*
    //  * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0300
    //  * @tc.name   : SUB_ACE_STATUSMANAGERV2_FREEZING_0300
    //  * @tc.desc   : The nested and mixed tabcontent and lazyForEach components in the V1 decorator do not set the component freeze, and the lazyForEach sets the component freeze
    //  * @tc.type   : Function
    //  * @tc.size   : MediumTest
    //  * @tc.level  : 3
    //  */
    // it('SUB_ACE_STATUSMANAGERV2_FREEZING_0300', Level.LEVEL3, async (done: Function) => {
    //   Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0300 start.`);
    //   Settings.createWindow("testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing300")
    //
    //   Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0300 finish.`);
    //   done();
    // })
    //
    // /*
    //  * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0280
    //  * @tc.name   : SUB_ACE_STATUSMANAGERV2_FREEZING_0280
    //  * @tc.desc   : The nested and mixed tabcontent and lazyForEach components in the V1 decorator do not set the component freeze, and the lazyForEach sets the component freeze
    //  * @tc.type   : Function
    //  * @tc.size   : MediumTest
    //  * @tc.level  : 3
    //  */
    // it('SUB_ACE_STATUSMANAGERV2_FREEZING_0280', Level.LEVEL3, async (done: Function) => {
    //   Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0280 start.`);
    //   Settings.createWindow("testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing280")
    //
    //   Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0280 finish.`);
    //   done();
    // })
    //
    // /*
    //  * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0290
    //  * @tc.name   : SUB_ACE_STATUSMANAGERV2_FREEZING_0290
    //  * @tc.desc   : The nested and mixed tabcontent and lazyForEach components in the V1 decorator do not set the component freeze, and the lazyForEach sets the component freeze
    //  * @tc.type   : Function
    //  * @tc.size   : MediumTest
    //  * @tc.level  : 3
    //  */
    // it('SUB_ACE_STATUSMANAGERV2_FREEZING_0290', Level.LEVEL3, async (done: Function) => {
    //   Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0290 start.`);
    //   Settings.createWindow("testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing290")
    //
    //   Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0290 finish.`);
    //   done();
    // })
    //
    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0040
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0040 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing40')

      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0040 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0320
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0320 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing320')

      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0320 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGERV2_FREEZING_0330
     * @tc.name   : Statusmanagerv2 freezing
     * @tc.desc   : Verify statusmanagerv2 freezing interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGERV2_FREEZING_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0330 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Statusmanagerv2Freezing330')

      Logger.info('TEST', `SUB_ACE_STATUSMANAGERV2_FREEZING_0330 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_APPSTORAGEV2_PERSISTANCEV2MORE_0020
     * @tc.name   : Statusmanager appstoragev2 persistancev2more
     * @tc.desc   : Verify statusmanager appstoragev2 persistancev2more interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_APPSTORAGEV2_PERSISTANCEV2MORE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_APPSTORAGEV2_PERSISTANCEV2MORE_0020 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/Appstoragev2Persistancev2more20')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_APPSTORAGEV2_PERSISTANCEV2MORE_0020 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0090
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0090 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev290')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0090 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0050
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0050 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev250')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0050 finish.`);
      done();
    })


    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0010
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0010 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev250')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0010 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0060
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0060 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev250')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0060 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0100
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0100 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2100')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0100 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0110
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0110 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2110')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0110 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0150
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0150 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2150')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0150 finish.`);
      done();
    })


    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0120
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0120 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2120')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0120 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0200
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0200 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2200')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0200 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0210
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0210 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2210')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0210 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0220
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0220 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2220')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0220 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0230
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0230 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2230')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0230 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0240
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0240 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2240')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0240 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0250
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0250 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2250')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0250 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0260
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0260 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2260')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0260 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0270
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0270 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2270')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0270 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0280
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0280 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2280')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0280 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0310
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0310 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2310')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0310 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0300
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0300 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2300')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0300 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0320
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0320 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2320')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0320 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0330
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0330 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2330')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0330 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0340
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0340 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2340')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0340 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0350
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0350 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2350')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0350 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_STATUSMANAGER_RUSABLEV2_0360
     * @tc.name   : Statusmanager rusablev2
     * @tc.desc   : Verify statusmanager rusablev2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_STATUSMANAGER_RUSABLEV2_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0360 start.`);
      Settings.createWindow('testability/pages/scenario/misc/Statusmanagerv2Freezing/StatusmanagerRusablev2360')
      Logger.info('TEST', `SUB_ACE_STATUSMANAGER_RUSABLEV2_0360 finish.`);
      done();
    })

  })
}