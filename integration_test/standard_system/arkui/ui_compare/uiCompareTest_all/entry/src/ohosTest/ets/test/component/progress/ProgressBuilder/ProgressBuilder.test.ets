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

export default function progressBuilder() {

  describe('progressBuilder', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0110
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Dynamically toggle the values of color, backgroundColor, and style
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0110', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0110 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0110_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressBuilder0110_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressBuilder0110_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0620
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Dynamically toggle the values of color, backgroundColor, and style
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0620', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0620 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0620')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0620 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0370
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the value parameter of the Progress component interface Progress(options: ProgressOptions<Type>) to an abnormal value { value: null }, and pass value: 30 to the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0370', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0370 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0370')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0370 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0580
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set a developer-defined parameter {boolean} for the Progress component.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0580', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0580 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0580')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0580_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressBuilder0580_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0580 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0520
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the enable parameter of the Progress component to an exceptional value {null}.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0520', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0520 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0520')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0520_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressBuilder0520_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0520 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0060
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : The enable parameter of the Progress component is not set.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0060 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0060_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressBuilder0060_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0450
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the parameters of the Progress component interface Progress(options: ProgressOptions<Type>) to normal values {value: 80, total: 50.3}, and pass value: 30 and total: 80 through contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0450', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0450 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0450')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0450 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0290
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the value property of the Progress component to a normal value {value: 100}, and pass value: 30 and total: 80 through contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0290', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0290 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0290')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0290 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0500
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the value property of the Progress component to a normal value {value:10, total:0}, and pass value: 30 and total: 80 through contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0500', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0500 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0500')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0500 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0240
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the value property of the Progress component to a normal value {value:null}, and pass value: 30 and total: 80 through contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0240', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0240 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0240')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0240 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0570
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the total parameter of the Progress component to a normal value {value: 80, total: 50}, pass value and total through the builder, and set the component's own specific properties (such as color, backgroundColor, and style) on the Progress component itself.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0570', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0570 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0570')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0570 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0260
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the value property of the Progress component to a normal value {value: -10}, and pass value: 30 and total: 80 through contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0260', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0260 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0260')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0260 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0130
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Dynamically switch the value of total.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0130', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0130 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0130')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0130_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressBuilder0130_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0130 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0230
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the value property of the Progress component to an exceptional value {value: 150}, and pass value: 30 and total: 80 through contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0230', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0230 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0230')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0230 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0380
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : In the Progress component interface Progress(options: ProgressOptions<Type>), set the value parameter to an abnormal value {value: undefined}, and pass value: 30 to contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0380', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0380 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0380')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0380 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0480
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the value property of the Progress component to an exceptional value {value:80, total:50.3}, and pass value: 80 and total: 30 through contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0480', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0480 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0480')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0480 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0070
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the width and height of the Progress component to be larger than the builder area.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0070 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0190
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Support common events.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0190', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0190 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0190')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0190_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0190 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0460
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the parameters of the Progress component interface Progress(options: ProgressOptions<Type>) to normal values {value: 80, total: 50.3}, and pass value: 30 and total: 80.5 through contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0460', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0460 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0460')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0460 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0080
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the width and height of the Progress component to be smaller than the builder area.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0080 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0080_001'),1000);
      await Button1.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0040
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Place an empty builder inside contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0040 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0310
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the type parameter of the Progress component interface Progress(options: ProgressOptions<Type>) to a normal value Capsule, and pass value: 30 and total: 80 through contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0310', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0310 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0310')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0310 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0600
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set a developer-defined parameter {string} for the Progress component.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0600', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0600 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0600')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0600_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressBuilder0600_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0600 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0030
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set contentModifier to undefined/null/not set.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0030 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0440
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : When setting the Progress component interface Progress(options: ProgressOptions<Type>), the parameters are set to normal values {value: 10, total: 150}, and the contentModifier is passed with value: 30 and total: 80.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0440', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0440 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0440')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0440 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0250
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : When setting the Progress component interface Progress(options: ProgressOptions<Type>), the parameters are set to undefined, and the contentModifier is passed with value: 30 and total: 80.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0250', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0250 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0250')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0250 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0530
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the enable parameter of the Progress component to an abnormal value {undefined}.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0530', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0530 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0530')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0530_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressBuilder0530_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0530 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0160
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Dynamically switch the value of value.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0160', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0160 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0160')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0160_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressBuilder0160_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0160 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0330
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the type parameter of the Progress component interface Progress(options: ProgressOptions<Type>) to the normal value Linear, and pass value: 30 and total: 80 to the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0330', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0330 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0330')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0330 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0550
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the enable parameter of the Progress component to the normal value {true}.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0550', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0550 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0550')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0550_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressBuilder0550_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0550 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0020
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : The contentModifier dynamically switches between normal values and undefined or null.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0020 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0020_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressBuilder0020_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0410
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the value parameter in the Progress component interface Progress(options: ProgressOptions<Type>) to the normal value {value: 1.5}, and pass value: 30 to the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0410', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0410 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0410')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0410 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0590
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the developer-defined parameter {number()[]} for the Progress component.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0590', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0590 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0590')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0590_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressBuilder0590_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0590 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0150
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Dynamically switch the value property.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0150', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0150 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0150')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0150_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressBuilder0150_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0150 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0470
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the parameters in the Progress component interface Progress(options: ProgressOptions<Type>) to the normal values {value: 80, total: 50.3}, and pass value: 80 and total: -30 to the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0470', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0470 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0470')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0470 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0090
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Combine with the Radio component.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0090', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0090 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0090_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressBuilder0090_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0350
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the type parameter in the Progress component interface Progress(options: ProgressOptions<Type>) to the normal value ScaleRing, and pass value: 30 and total: 80 to the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0350', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0350 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0350')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0350 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0430
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the value parameter in the Progress component interface Progress(options: ProgressOptions<Type>) to the normal value {value: 50}, and pass value: 30 to the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0430', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0430 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0430')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0430 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0220
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Is animation supported?
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0220', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0220 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0220')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0220 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0340
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the type parameter in the Progress component interface Progress(options: ProgressOptions<Type>) to the normal value Ring, and pass value: 30 and total: 80 to the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0340', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0340 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0340')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0340 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0490
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the parameters in the Progress component interface Progress(options: ProgressOptions<Type>) to the normal values {value: 80, total: 50}, and pass value: 30 and total: 80 to the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0490', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0490 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0490')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0490 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0510
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the parameters in the Progress component interface Progress(options: ProgressOptions<Type>) to the normal values {value: 80, total: -50}, and pass value: 30 and total: 80 to the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0510', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0510 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0510')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0510 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0420
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the value parameter in the Progress component interface Progress(options: ProgressOptions<Type>) to the normal value {value: 100}, and pass value: 30 to the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0420', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0420 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0420')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0420 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0610
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set multiple contentModifiers.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0610', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0610 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0610')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0610 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0360
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the value parameter in the Progress component interface Progress(options: ProgressOptions<Type>) to the abnormal value {value: 150}, and pass value: 30 to the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0360', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0360 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0360')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0360 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0170
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Dynamically switch animations.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0170', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0170 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0170')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0170_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressBuilder0170_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0170 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0540
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the enable parameter of the Progress component to the normal value {false}.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0540', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0540 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0540')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0540_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressBuilder0540_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0540 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0120
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Dynamically switch the value of contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0120', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0120 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0120_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressBuilder0120_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0270
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the value property of the Progress component to the normal value {value: 0}, and pass value: 30 and total: 80 to the contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0270', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0270 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0270')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0270 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0050
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : The effect order of setting both the parameter “value” and the attribute “value” for the “Progress” element is being tested.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0050 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0390
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the value parameter in the Progress component interface Progress(options: ProgressOptions<Type>) to a normal value {value: -10}, and pass value: 30 to contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0390', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0390 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0390')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0390 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0320
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the type parameter in the Progress component interface Progress(options: ProgressOptions<Type>) to the normal value Eclipse, and pass value: 30 and total: 80 to contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0320', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0320 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0320')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0320 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0140
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Dynamically switch the type parameter.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0140', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0140 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0140')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressBuilder0140_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressBuilder0140_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0560
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the Progress component's total parameter to a normal value {value: 80, total: 50}, and pass color through builder without passing value or total.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0560', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0560 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0560')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0560 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0280
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the value property of the Progress component to a normal value {value: 1.5}, and pass value: 30 and total: 80 through contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0280', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0280 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0280')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0280 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0400
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the value parameter in the Progress component interface Progress(options: ProgressOptions<Type>) to a normal value {value: 0}, and pass value: 30 through contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0400', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0400 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0400')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0400 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0300
     * @tc.name   : Information Progress contentModifier builder
     * @tc.desc   : Verify information Progress contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Set the value property of the Progress component to a normal value {value: 50}, and pass value: 30 and total: 80 through contentModifier.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0300', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0300 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressBuilder/ProgressBuilder0300')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_BUILDER_0300 finish.`);
      done()
    })






  })
}