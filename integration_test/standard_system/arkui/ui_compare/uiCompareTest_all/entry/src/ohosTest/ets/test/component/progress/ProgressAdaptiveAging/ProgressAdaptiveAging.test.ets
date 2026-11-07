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

export default function progressAdaptiveAging() {

  describe('progressAdaptiveAging', () => {
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
     * @tc.number : SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0020
     * @tc.name   : ArkUI Progress adaptive aging
     * @tc.desc   : Verify ArkUI Progress adaptive aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0020 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressAdaptiveAging/ProgressAdaptiveAging0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0020_001'),1000);
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0020_002'),1000);
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0020_003'),1000);
      let Button4: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0020_004'),1000);
      let Button5: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0020_005'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button3.click();
      await driver.waitForIdle(500,2000)
      await Button4.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button3.click();
      await driver.waitForIdle(500,2000)
      await Button4.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0040
     * @tc.name   : ArkUI Progress adaptive aging
     * @tc.desc   : Verify ArkUI Progress adaptive aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0040 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressAdaptiveAging/ProgressAdaptiveAging0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0040_001'),1000);
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0040_002'),1000);
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0040_003'),1000);
      let Button4: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0040_004'),1000);
      let Button5: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0040_005'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button3.click();
      await driver.waitForIdle(500,2000)
      await Button4.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0010
     * @tc.name   : ArkUI Progress adaptive aging
     * @tc.desc   : Verify ArkUI Progress adaptive aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0010', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0010 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressAdaptiveAging/ProgressAdaptiveAging0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0010_001'),1000);
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0010_002'),1000);
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0010_003'),1000);
      let Button4: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0010_004'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button3.click();
      await driver.waitForIdle(500,2000)
      await Button4.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0060
     * @tc.name   : ArkUI Progress adaptive aging
     * @tc.desc   : Verify ArkUI Progress adaptive aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0060 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressAdaptiveAging/ProgressAdaptiveAging0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0060_001'),1000);
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0060_002'),1000);
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0060_003'),1000);
      let Button4: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0060_004'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button3.click();
      await driver.waitForIdle(500,2000)
      await Button4.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0030
     * @tc.name   : ArkUI Progress adaptive aging
     * @tc.desc   : Verify ArkUI Progress adaptive aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0030 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressAdaptiveAging/ProgressAdaptiveAging0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0030_001'),1000);
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0030_002'),1000);
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0030_003'),1000);
      let Button4: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0030_004'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button3.click();
      await driver.waitForIdle(500,2000)
      await Button4.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0080
     * @tc.name   : ArkUI Progress adaptive aging
     * @tc.desc   : Verify ArkUI Progress adaptive aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0080 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressAdaptiveAging/ProgressAdaptiveAging0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0080_001'),1000);
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0080_002'),1000);
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0080_003'),1000);
      let Button4: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0080_004'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button3.click();
      await driver.waitForIdle(500,2000)
      await Button4.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0050
     * @tc.name   : ArkUI Progress adaptive aging
     * @tc.desc   : Verify ArkUI Progress adaptive aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0050 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressAdaptiveAging/ProgressAdaptiveAging0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0050_001'),1000);
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0050_002'),1000);
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0050_003'),1000);
      let Button4: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0050_004'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button3.click();
      await driver.waitForIdle(500,2000)
      await Button4.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0070
     * @tc.name   : ArkUI Progress adaptive aging
     * @tc.desc   : Verify ArkUI Progress adaptive aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0070 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressAdaptiveAging/ProgressAdaptiveAging0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0070_001'),1000);
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0070_002'),1000);
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0070_003'),1000);
      let Button4: Component = await driver.waitForComponent(ON.id('ProgressAdaptiveAging0070_004'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button3.click();
      await driver.waitForIdle(500,2000)
      await Button4.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PROGRESS_ADAPTIVE_AGING_0070 finish.`);
      done()
    })









  })
}