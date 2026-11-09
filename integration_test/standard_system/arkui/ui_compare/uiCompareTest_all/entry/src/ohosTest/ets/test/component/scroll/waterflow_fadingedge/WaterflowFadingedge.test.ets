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

export default function waterFlowFadingEdgeTest() {

  describe('waterFlowFadingEdgeTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0010
     * @tc.name   : Test when waterflow component's fadingEdge property is true
     * @tc.desc   : Verify listandgrid waterflow fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_MIRROR_0270_321 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_01'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0010')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0020
     * @tc.name   : Test when waterflow component's fadingEdge property is false
     * @tc.desc   : Verify listandgrid waterflow fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0020 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_02'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0020')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0050
     * @tc.name   : Set waterflow component fade distance to 32vp
     * @tc.desc   : Verify listandgrid waterflow fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0050 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_03'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0050')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_FUNCTION_JICHU_WATERFLOW_0360_637_672
     * @tc.name   : Set Waterflow property: scrollBarWidth with number type
     * @tc.desc   : Verify function jichu waterflow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_JICHU_WATERFLOW_0360_637_672', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_WATERFLOW_0360_637_672 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_04'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0060')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_WATERFLOW_0360_637_672 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_FUNCTION_JICHU_WATERFLOW_0360_637
     * @tc.name   : Set Waterflow property: scrollBarWidth without value (default 4)
     * @tc.desc   : Verify function jichu waterflow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_JICHU_WATERFLOW_0360_637', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_WATERFLOW_0360_637 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_05'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0070')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_WATERFLOW_0360_637 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_FUNCTION_JICHU_WATERFLOW_0360_637_672_462_424_902
     * @tc.name   : Set Waterflow property: scrollBarColor with Color type
     * @tc.desc   : Verify function jichu waterflow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_JICHU_WATERFLOW_0360_637_672_462_424_902', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_WATERFLOW_0360_637_672_462_424_902 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_06_01'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_06_02'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0080')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_WATERFLOW_0360_637_672_462_424_902 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_FUNCTION_JICHU_WATERFLOW_0360_637_672_952
     * @tc.name   : Set Waterflow property: scrollBarColor with number type
     * @tc.desc   : Verify function jichu waterflow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_JICHU_WATERFLOW_0360_637_672_952', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_WATERFLOW_0360_637_672_952 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad07')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_07_01'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_07_02'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0090')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_WATERFLOW_0360_637_672_952 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0410
     * @tc.name   : In SLIDING_WINDOW mode, test onWillScroll event
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0410 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad08')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_08'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0100')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0360
     * @tc.name   : In SLIDING_WINDOW mode, test onReachEnd event
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0360 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad09')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_09'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0110')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0420
     * @tc.name   : In SLIDING_WINDOW mode, test onDidScroll event
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0420 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad10')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_10'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0120')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0350
     * @tc.name   : In SLIDING_WINDOW mode, test onReachStart event
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0350 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad11')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_11'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0130')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0380
     * @tc.name   : In SLIDING_WINDOW mode, test onScrollIndex event
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0380 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad12')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_12'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0140')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0390
     * @tc.name   : In SLIDING_WINDOW mode, test onScrollStart event
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0390 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad13')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_13'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0150')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0370
     * @tc.name   : In SLIDING_WINDOW mode, test onScrollFrameBegin event
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0370 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad14')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_14'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0160')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0400
     * @tc.name   : In SLIDING_WINDOW mode, test onScrollStop event
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0400 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad15')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_15'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0170')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0010
     * @tc.name   : Repeat adaptation for waterflow, basic sliding test
     * @tc.desc   : Verify function repeat waterflow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0010 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad16')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_16'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0180')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0240
     * @tc.name   : Test setting footerContent with Modifier method
     * @tc.desc   : Verify waterflow footer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0240 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad17')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_17'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0190')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0130
     * @tc.name   : Test setting footerContent with Modifier method
     * @tc.desc   : Verify waterflow footer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0130 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad18')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_18'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0200')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0120
     * @tc.name   : Set Text component within footerContent
     * @tc.desc   : Verify waterflow footer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0120 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad19')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_19'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0210')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0110
     * @tc.name   : Set Row component within footerContent
     * @tc.desc   : Verify waterflow footer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0110 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad20')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_20'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0220')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0220
     * @tc.name   : Event test after setting footerContent
     * @tc.desc   : Verify waterflow footer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0220 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad21')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_21'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0230')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0230
     * @tc.name   : Window movement test after setting footerContent
     * @tc.desc   : Verify waterflow footer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0230 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad22')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_22'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0240')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_FOOTER_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0300
     * @tc.name   : Grouped waterfall flow, scroll gesture test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0300 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad23')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('WaterFlowFad23_Splice'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_23'), 1000);
      let point = await button.getBoundsCenter();
      await driver.mouseScroll({x:point.x, y:point.y}, true, 2)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0250')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0200
     * @tc.name   : Grouped waterfall flow, scrollBy(-150) test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0200 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad24')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('WaterFlowFad24_Splice'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);

      let button2: Component = await driver.waitForComponent(ON.id('waterFlowFad_24_01'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);

      let button3: Component = await driver.waitForComponent(ON.id('waterFlowFad_24_02'), 1000);
      await button3.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0260')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0320
     * @tc.name   : Grouped waterfall flow, onReachEnd test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0320 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad25')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('WaterFlowFad25_Splice'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_25'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0270')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0340
     * @tc.name   : Grouped waterfall flow, onScrollIndex test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0340 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad26')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('WaterFlowFad26_Splice'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_26'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0280')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0350
     * @tc.name   : Grouped waterfall flow, onScrollStart test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0350 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad27')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('WaterFlowFad27_Splice'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_27'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0290')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0360
     * @tc.name   : Grouped waterfall flow, onWillScroll test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0360 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad28')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('WaterFlowFad28_Splice'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_28'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0300')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0190
     * @tc.name   : Grouped waterfall flow, scrollBy(150) test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0190 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad29')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('WaterFlowFad29_Splice'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_29'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0310')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0370
     * @tc.name   : Grouped waterfall flow, onDidScroll test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0370 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad30')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('WaterFlowFad30_Splice'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_30'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0320')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0330
     * @tc.name   : Grouped waterfall flow, onScrollFrameBegin test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0330 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad31')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('WaterFlowFad31_Splice'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_31'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0330')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0060
     * @tc.name   : Grouped waterfall flow, delete test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0060 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad32')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('WaterFlowFad32_Splice'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('WaterFlowFad32_Delete'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0340')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0090
     * @tc.name   : Grouped waterfall flow, add group test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0090 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad33')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('WaterFlowFad33_Add'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0350')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0070
     * @tc.name   : Grouped waterfall flow, values test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0070 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad34')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('WaterFlowFad34_Add'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('WaterFlowFad34_Values'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0360')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0040
     * @tc.name   : Grouped waterfall flow, update test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0040 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad35')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('WaterFlowFad35_Add'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('WaterFlowFad35_Update'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0370')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0150
     * @tc.name   : Grouped waterfall flow, scrollPage upward test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0150 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad36')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_36_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_36_02'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0380')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0050
     * @tc.name   : Grouped waterfall flow, splice test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0050 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad37')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('WaterFlowFad37_Splice'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0390')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0030
     * @tc.name   : Grouped waterfall flow, scrollToIndex test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0030 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad38')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_38'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0400')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0140
     * @tc.name   : Grouped waterfall flow, scrollPage downward test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0140 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad39')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_39'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0410')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0170
     * @tc.name   : Grouped waterfall flow, Flowitem width change test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0170 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad40')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1500,2000);
      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_40'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0420')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0180
     * @tc.name   : Grouped waterfall flow, isAtEnd test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0180 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad41')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_41_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('waterFlowFad_41_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0430')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0220
     * @tc.name   : Grouped waterfall flow, scrollEdge.Bottom test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0220 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad42')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_42'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0440')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0240
     * @tc.name   : Grouped waterfall flow, scrollEdge.End test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0240 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad43')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_43'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0450')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0210
     * @tc.name   : Grouped waterfall flow, scrollEdge.Top test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0210 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad44')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_44'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0460')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0230
     * @tc.name   : Grouped waterfall flow, scrollEdge.Start test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0230 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad45')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_45'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0470')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0310
     * @tc.name   : Grouped waterfall flow, onReachStart test in window mode
     * @tc.desc   : Verify waterflow sections interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0310 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad46')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_46'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0480')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SECTIONS_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0200
     * @tc.name   : Switch to SLIDING_WINDOW layout, scrollEdge test
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0200 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad47')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1500,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_47_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('waterFlowFad_47_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0490')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0170
     * @tc.name   : Dynamic layout change between multiple layout modes
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0170 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad48')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_48_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('waterFlowFad_48_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_WATERFLOW_FADINGEDGE_0500')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0260
     * @tc.name   : Switch to SLIDING_WINDOW layout, set footer test
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0260 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad49')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_49'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0260')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0250
     * @tc.name   : Switch to SLIDING_WINDOW layout, dynamic edgeEffect switching test
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0250 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad50')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_50_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('waterFlowFad_50_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0250_01')
      await Utils.sleep(1000)
      let button3: Component = await driver.waitForComponent(ON.id('waterFlowFad_50_03'), 1000);
      await button3.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0250_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0230
     * @tc.name   : Switch to SLIDING_WINDOW layout, getItemRect test for child component size/position
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0230 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad51')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_51_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('waterFlowFad_51_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0230')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0240
     * @tc.name   : Switch to SLIDING_WINDOW layout, set enableScrollInteraction to false test
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0240 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad52')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_52_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('waterFlowFad_52_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);

      let button: Component = await driver.waitForComponent(ON.id('waterFlowFad_52'), 1000);
      let point = await button.getBoundsCenter();
      await driver.mouseScroll({x:point.x, y:point.y}, true, 2)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0240')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0210
     * @tc.name   : Switch to SLIDING_WINDOW layout, scrollToIndex test
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0210 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad53')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_53_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('waterFlowFad_53_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0210')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0220
     * @tc.name   : Switch to SLIDING_WINDOW layout, scrollBy test
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0220 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad54')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_54_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('waterFlowFad_54_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0220')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0280
     * @tc.name   : Switch to SLIDING_WINDOW layout, set nestedScroll test
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0280 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad55')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_55_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('waterFlowFad_55_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0280')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0270
     * @tc.name   : Switch to SLIDING_WINDOW layout, set rowsGap test
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0270 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad56')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_56_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('waterFlowFad_56_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0270_01')
      await Utils.sleep(1000)
      let button3: Component = await driver.waitForComponent(ON.id('waterFlowFad_56_03'), 1000);
      await button3.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0270_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0290
     * @tc.name   : Switch to SLIDING_WINDOW layout, set columnsGap test
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0290 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad57')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_57_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('waterFlowFad_57_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0290_01')
      await Utils.sleep(1000)
      let button3: Component = await driver.waitForComponent(ON.id('waterFlowFad_57_03'), 1000);
      await button3.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0290_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0300
     * @tc.name   : Switch to SLIDING_WINDOW layout, set itemConstraintSize test
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0300 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad58')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_58'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0300')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0340
     * @tc.name   : Switch to SLIDING_WINDOW mode, orientation change sliding test
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0340 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad59')

      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_59_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);


      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', `changeWindowOrientation first success. orientation is: ${globalThis.orientation}`);
      let button2: Component = await driver.waitForComponent(ON.id('waterFlowFad_59_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0340_01')
      await Utils.sleep(1000)

      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', `changeWindowOrientation second success. orientation is: ${globalThis.orientation}`);
      let button3: Component = await driver.waitForComponent(ON.id('waterFlowFad_59_03'), 1000);
      await button3.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0340_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0440
     * @tc.name   : cachedCount test in window layout mode
     * @tc.desc   : Verify waterflow sliding interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0440 start.`);
      Settings.createWindow('testability/pages/component/scroll/waterflow_fadingedge/waterflowFad60')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(1000,2000);
      let button1: Component = await driver.waitForComponent(ON.id('waterFlowFad_60'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0440')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_WATERFLOW_SLIDING_0440 finish.`);
      done()
    })
  })
}