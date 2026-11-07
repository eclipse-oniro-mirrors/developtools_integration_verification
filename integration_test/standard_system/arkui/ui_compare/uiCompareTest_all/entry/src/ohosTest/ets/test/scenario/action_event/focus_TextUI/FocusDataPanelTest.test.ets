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

export default function focusDataPanelTest() {

  describe('focusDataPanelTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_ANIMATETO_0016
     * @tc.name   : Media datapanel animateTo
     * @tc.desc   : Verify media datapanel animateTo interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_ANIMATETO_0016', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_ANIMATETO_0016  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpAnimateTo0016')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpAT0016'), 1000);
      await button.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_ANIMATETO_0016 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_ANIMATETO_0017
     * @tc.name   : Media datapanel animateTo
     * @tc.desc   : Verify media datapanel animateTo interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_ANIMATETO_0017', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_ANIMATETO_0017  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpAnimateTo0017')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpAT0017'), 1000);
      await button.click();
      await driver.waitForIdle(2000,3000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_ANIMATETO_0017 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0010
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0010', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0010  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0010')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0010'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0010 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0020
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0020  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0020')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0020'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0020 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0030
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0030  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0030')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0030'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0030 finish.`);
      done()
    })



    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0040
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0040  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0040')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0040'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0040 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0050
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0050  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0050')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0050'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0050 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0070
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0070  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0070')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0070'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0070 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0080
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0080  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0080')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0080'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0080 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0090
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0090', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0090  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0090')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0090'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0090 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0100
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0100', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0100  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0100')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0100'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0100 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0110
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0110', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0110  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0110')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0110'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0110 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0130
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0130', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0130  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0130')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0130'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0130 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0140
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0140', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0140  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0140')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0140'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0140 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0150
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0150', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0150  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0150')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0150'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0150 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0160
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0160', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0160  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0160')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0160'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0160 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0170
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0170', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0170  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0170')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0170'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0170 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0180
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0180', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0180  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0180')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0180'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0180 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0190
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0190', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0190  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0190')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0190'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0190 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0200
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0200', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0200  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0200')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0200'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0200 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0250
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0250', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0250  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0250')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0250'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0250 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0260
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0260', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0260  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0260')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0260'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0260 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0270
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0270', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0270  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0270')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0270'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0270 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0280
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0280', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0280  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0280')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0280'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
                windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0280 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0290
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0290', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0290  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0290')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0290'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0290 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0300
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0300', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0300  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0300')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0300'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0300 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0310
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0310', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0310  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0310')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0310'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0310 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0320
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0320', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0320  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0320')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0320'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0320 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0330
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0330', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0330  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0330')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0330'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0330 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0340
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0340', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0340  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0340')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0340'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0340 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0350
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0350', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0350  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0350')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0350'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0350 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0360
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0360', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0360  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0360')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0360'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0360 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0370
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0370', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0370  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0370')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0370'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0370 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0380
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0380', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0380  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0380')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0380'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0380 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0390
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0390', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0390  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0390')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0390'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0390 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0400
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0400', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0400  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0400')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0400'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0400 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0410
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0410', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0410  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0410')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0410'), 1000);
      await button.click();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0410 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0430
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0430', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0430  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0430')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0430'), 1000);
      await button.click();
      await driver.waitForIdle(3000,4000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0430 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_DATAPANEL_BODERRAIDUS_0440
     * @tc.name   : Datapanel boderraidus
     * @tc.desc   : Verify datapanel boderraidus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('ARKUI_DATAPANEL_BODERRAIDUS_0440', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0440  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpBorderRadius0440')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DpBR0440'), 1000);
      await button.click();
      await driver.waitForIdle(3000,4000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `ARKUI_DATAPANEL_BODERRAIDUS_0440 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_DATAPANEL_INTERFACE_0180
     * @tc.name   : Information datapanel interface
     * @tc.desc   : Verify information datapanel interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_DATAPANEL_INTERFACE_0180', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_DATAPANEL_INTERFACE_0180  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpInterface0180')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_DATAPANEL_INTERFACE_0180 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_DATAPANEL_INTERFACE_0490
     * @tc.name   : Information datapanel interface
     * @tc.desc   : Verify information datapanel interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_DATAPANEL_INTERFACE_0490', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_DATAPANEL_INTERFACE_0490  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpInterface0490')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_DATAPANEL_INTERFACE_0490 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0010
     * @tc.name   : Media datapanel watches
     * @tc.desc   : Verify media datapanel watches interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0010', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0010  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpWatches0010')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0011
     * @tc.name   : Media datapanel watches
     * @tc.desc   : Verify media datapanel watches interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0011', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0010  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpWatches0011')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0011 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0012
     * @tc.name   : Media datapanel watches
     * @tc.desc   : Verify media datapanel watches interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0012', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0012  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpWatches0012')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0012 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0013
     * @tc.name   : Media datapanel watches
     * @tc.desc   : Verify media datapanel watches interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0013', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0013  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpWatches0013')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0013 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0014
     * @tc.name   : Media datapanel watches
     * @tc.desc   : Verify media datapanel watches interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0014', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0014  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpWatches0014')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0014 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0015
     * @tc.name   : Media datapanel watches
     * @tc.desc   : Verify media datapanel watches interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0015', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0015  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpWatches0015')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0015 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0016
     * @tc.name   : Media datapanel watches
     * @tc.desc   : Verify media datapanel watches interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0016', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0016  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpWatches0016')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0016 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0017
     * @tc.name   : Media datapanel watches
     * @tc.desc   : Verify media datapanel watches interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0017', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0017  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpWatches0017')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0017 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0018
     * @tc.name   : Media datapanel watches
     * @tc.desc   : Verify media datapanel watches interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0018', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0018  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpWatches0018')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0018 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0019
     * @tc.name   : Media datapanel watches
     * @tc.desc   : Verify media datapanel watches interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0019', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0019  start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_DataPanel/DpWatches0019')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_DATAPANEL_WATCHES_0019 finish.`);
      done()
    })
  })
}