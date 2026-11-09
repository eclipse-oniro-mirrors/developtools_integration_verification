/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
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
import { Driver, ON, Component, On } from '@kit.TestKit'
import { Point } from '@kit.TestKit'

export default function functionRepeatWaterFlowTest() {
  describe('functionRepeatWaterFlowTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
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
     * @tc.number : SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0070
     * @tc.name   : Function repeat waterflow
     * @tc.desc   : Verify function repeat waterflow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0070 start.`);
      Settings.createWindow('testability/pages/component/scroll/FunctionRepeatWaterFlow/FunctionRepeatWaterFlow001');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('changeDir'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0070_01');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0070 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0050
     * @tc.name   : Function repeat waterflow
     * @tc.desc   : Verify function repeat waterflow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0050 start.`);
      Settings.createWindow('testability/pages/component/scroll/FunctionRepeatWaterFlow/FunctionRepeatWaterFlow002');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('changeColumnsGap'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0050_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0050 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0110
     * @tc.name   : Function repeat waterflow
     * @tc.desc   : Verify function repeat waterflow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0110', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0110';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/FunctionRepeatWaterFlow/FunctionRepeatWaterFlow003');
      let driver: Driver = Driver.create();
      let waterFlow: Component = await driver.waitForComponent(ON.id('WaterFlow'), 1000);
      let point = await waterFlow.getBoundsCenter();
      console.info(`${caseName} point of waterFlow is ${JSON.stringify(point)}`);
      await driver.mouseScroll(point, true, 3);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0110_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0100
     * @tc.name   : Function repeat waterflow
     * @tc.desc   : Verify function repeat waterflow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0100', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0100';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/FunctionRepeatWaterFlow/FunctionRepeatWaterFlow004');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0100_04');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0060
     * @tc.name   : Function repeat waterflow
     * @tc.desc   : Verify function repeat waterflow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0060', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0060';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/FunctionRepeatWaterFlow/FunctionRepeatWaterFlow005');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('changeRowsGap'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0060_05');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0200
     * @tc.name   : Function repeat waterflow
     * @tc.desc   : Verify function repeat waterflow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0200', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0200';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/FunctionRepeatWaterFlow/FunctionRepeatWaterFlow006');
      let driver: Driver = Driver.create();
      let list: Component = await driver.waitForComponent(ON.id('List'), 1000);
      let point = await list.getBoundsCenter();
      console.info(`${caseName} point of List is ${JSON.stringify(point)}`);
      await driver.mouseScroll(point, true, 3);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0200_06');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0120
     * @tc.name   : Function repeat waterflow
     * @tc.desc   : Verify function repeat waterflow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0120', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0120';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/FunctionRepeatWaterFlow/FunctionRepeatWaterFlow007');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('changeScrollBarState'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0120_07');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0130
     * @tc.name   : Function repeat waterflow
     * @tc.desc   : Verify function repeat waterflow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0130', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0130';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/FunctionRepeatWaterFlow/FunctionRepeatWaterFlow008');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('changeEdgeEffect'), 1000);
      await button.click();
      let waterFlow: Component = await driver.waitForComponent(ON.id('WaterFlow'), 1000);
      let point = await waterFlow.getBoundsCenter();
      console.info(`${caseName} point of WaterFlow is ${JSON.stringify(point)}`);
      let point1: Point = { x: point.x, y: point.y - 100 };
      let point2: Point = { x: point.x, y: point.y + 100 };
      await driver.drag(point1.x, point1.y, point2.x, point2.y);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0130_08');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });
  })
}