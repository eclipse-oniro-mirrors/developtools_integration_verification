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

export default function focusPatternLockTest() {

  describe('focusPatternLockTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_WATCHES_0012
     * @tc.name   : Media PatternLock watches
     * @tc.desc   : Verify media PatternLock watches interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_WATCHES_0012', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_WATCHES_0012  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_PatternLock/PatternLockWatches0012')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_WATCHES_0012 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0010
     * @tc.name   : ArkUI patternlockactivecirclecolor
     * @tc.desc   : Verify ArkUI patternlockactivecirclecolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0010', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0010  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_PatternLock/PLCircleColor0010')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('PLC0010'), 1000);
      await button.click();
      let buttonA: Component = await driver.waitForComponent(ON.id('PLC0010a'), 1000);
      await buttonA.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0020
     * @tc.name   : ArkUI patternlockactivecirclecolor
     * @tc.desc   : Verify ArkUI patternlockactivecirclecolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0020  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_PatternLock/PLCircleColor0020')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('PLC0020'), 1000);
      await button.click();
      let buttonA: Component = await driver.waitForComponent(ON.id('PLC0020a'), 1000);
      await buttonA.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0030
     * @tc.name   : ArkUI patternlockactivecirclecolor
     * @tc.desc   : Verify ArkUI patternlockactivecirclecolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0030  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_PatternLock/PLCircleColor0030')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('PLC0030'), 1000);
      await button.click();
      let buttonA: Component = await driver.waitForComponent(ON.id('PLC0030a'), 1000);
      await buttonA.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0040
     * @tc.name   : ArkUI patternlockactivecirclecolor
     * @tc.desc   : Verify ArkUI patternlockactivecirclecolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0040  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_PatternLock/PLCircleColor0040')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('PLC0040'), 1000);
      await button.click();
      let buttonA: Component = await driver.waitForComponent(ON.id('PLC0040a'), 1000);
      await buttonA.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0040 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0050
     * @tc.name   : ArkUI patternlockactivecirclecolor
     * @tc.desc   : Verify ArkUI patternlockactivecirclecolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0050  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_PatternLock/PLCircleColor0050')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('PLC0050'), 1000);
      await button.click();
      let buttonA: Component = await driver.waitForComponent(ON.id('PLC0050a'), 1000);
      await buttonA.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0050 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0060
     * @tc.name   : ArkUI patternlockactivecirclecolor
     * @tc.desc   : Verify ArkUI patternlockactivecirclecolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0060  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_PatternLock/PLCircleColor0060')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('PLC0060'), 1000);
      await button.click();
      let buttonA: Component = await driver.waitForComponent(ON.id('PLC0060a'), 1000);
      await buttonA.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0060 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0070
     * @tc.name   : ArkUI patternlockactivecirclecolor
     * @tc.desc   : Verify ArkUI patternlockactivecirclecolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0070  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_PatternLock/PLCircleColor0070')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('PLC0070'), 1000);
      await button.click();
      let buttonA: Component = await driver.waitForComponent(ON.id('PLC0070a'), 1000);
      await buttonA.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0080
     * @tc.name   : ArkUI patternlockactivecirclecolor
     * @tc.desc   : Verify ArkUI patternlockactivecirclecolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0080  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_PatternLock/PLCircleColor0080')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('PLC0080'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0080 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0090
     * @tc.name   : ArkUI patternlockactivecirclecolor
     * @tc.desc   : Verify ArkUI patternlockactivecirclecolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0090', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0090  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_PatternLock/PLCircleColor0090')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('PLC0090'), 1000);
      await button.click();
      let buttonA: Component = await driver.waitForComponent(ON.id('PLC0090a'), 1000);
      await buttonA.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0090 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0100
     * @tc.name   : ArkUI patternlockactivecirclecolor
     * @tc.desc   : Verify ArkUI patternlockactivecirclecolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0100', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0100  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_PatternLock/PLCircleColor0100')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('PLC0100'), 1000);
      await button.click();
      let buttonA: Component = await driver.waitForComponent(ON.id('PLC0100a'), 1000);
      await buttonA.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0100 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0110
     * @tc.name   : ArkUI patternlockactivecirclecolor
     * @tc.desc   : Verify ArkUI patternlockactivecirclecolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0110', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0110  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_PatternLock/PLCircleColor0110')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('PLC0110'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PATTERNLOCKACTIVECIRCLECOLOR_0110 finish.`);
      done()
    })
  })
}