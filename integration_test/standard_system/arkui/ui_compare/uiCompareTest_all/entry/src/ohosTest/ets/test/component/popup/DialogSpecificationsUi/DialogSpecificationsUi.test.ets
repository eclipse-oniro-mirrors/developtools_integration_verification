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

export default function dialogSpecificationsUi() {

  describe('dialogSpecificationsUi', () => {
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
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0040
     * @tc.name   : Component function special components dialog specifications ui
     * @tc.desc   : Verify component function special components dialog specifications ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0040 start.`);
      Settings.createWindow('testability/pages/component/popup/DialogSpecificationsUi/DialogSpecificationsUi0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0040_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0040_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0040 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0030
     * @tc.name   : Component function special components dialog specifications ui
     * @tc.desc   : Verify component function special components dialog specifications ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0030 start.`);
      Settings.createWindow('testability/pages/component/popup/DialogSpecificationsUi/DialogSpecificationsUi0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0030_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0030_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0030 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0020
     * @tc.name   : Component function special components dialog specifications ui
     * @tc.desc   : Verify component function special components dialog specifications ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0020 start.`);
      Settings.createWindow('testability/pages/component/popup/DialogSpecificationsUi/DialogSpecificationsUi0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0020_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0020_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0020 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0050
     * @tc.name   : Component function special components dialog specifications ui
     * @tc.desc   : Verify component function special components dialog specifications ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0050 start.`);
      Settings.createWindow('testability/pages/component/popup/DialogSpecificationsUi/DialogSpecificationsUi0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0050_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0050_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0050_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      await Button3.click();
      await driver.waitForIdle(500,2000)
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button4: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0050_004'),1000);
      await Button4.click();
      await driver.waitForIdle(500,2000)
      await Button4.click();
      await driver.waitForIdle(500,2000)
      await Button4.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0050 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0060
     * @tc.name   : Component function special components dialog specifications ui
     * @tc.desc   : Verify component function special components dialog specifications ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0060 start.`);
      Settings.createWindow('testability/pages/component/popup/DialogSpecificationsUi/DialogSpecificationsUi0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0060_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0060_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0060 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0090
     * @tc.name   : Component function special components dialog specifications ui
     * @tc.desc   : Verify component function special components dialog specifications ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0090', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0090 start.`);
      Settings.createWindow('testability/pages/component/popup/DialogSpecificationsUi/DialogSpecificationsUi0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0090_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0090_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0090 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0080
     * @tc.name   : Component function special components dialog specifications ui
     * @tc.desc   : Verify component function special components dialog specifications ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0080 start.`);
      Settings.createWindow('testability/pages/component/popup/DialogSpecificationsUi/DialogSpecificationsUi0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0080_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0080_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0080 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0120
     * @tc.name   : Component function special components dialog specifications ui
     * @tc.desc   : Verify component function special components dialog specifications ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0120', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0120 start.`);
      Settings.createWindow('testability/pages/component/popup/DialogSpecificationsUi/DialogSpecificationsUi0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0120_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('DialogSpecificationsUi0120_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0120 finish.`);
      done()
    })



  })
}