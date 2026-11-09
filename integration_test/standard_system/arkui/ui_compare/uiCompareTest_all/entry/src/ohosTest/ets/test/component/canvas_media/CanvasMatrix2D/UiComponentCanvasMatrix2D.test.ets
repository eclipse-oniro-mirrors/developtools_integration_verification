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
import { Driver, ON, Component, MouseButton } from '@kit.TestKit'
/*
 * SUB_ACE_UI_ATTRIBUTES_FONT_INTERFACE_0010:设置文本颜色
 *
 * Settings.createWindow(config.url)：
 *  创建窗口，更改窗口基本配置，更改方式详见model/Settings createWindow方法
 *
 * windowSnap.snapShot(globalThis.context)：
 *  窗口截屏&图片文件保存，存储在设备端
 *  存储文件固定，单挑用例执行后覆盖，用于自动化UI对比
 *  支持调试更改文件名为时间戳格式，更改model/snapShot createAndGetFile方法 注释L35，放开L32，L33
 *
 * Logger日志使用方法：
 *  import Logger form './model/Logger'
 *  Logger.info(TAG,`config = ${config}, err = ${JSON.stringify(exception)}`)
 * */

export default function uiComponentCanvasMatrix2D() {

  describe('uiComponentCanvasMatrix2D', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0110
     * @tc.name   : In the Canvas component, set the sepia in the filter to 0.5
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0110 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0130
     * @tc.name   : In the Canvas component, set the sepia in the filter to 0
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0130 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0250
     * @tc.name   : In the Canvas component, set the invert in the filter to -1
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0250 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0270
     * @tc.name   : In the Canvas component, set the invert in the filter to 0.5
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0270 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0150
     * @tc.name   : In the Canvas component, the sepia is not set
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0150 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0390
     * @tc.name   : In the Canvas component, the brightness is  set to 0.5
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0390 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0210
     * @tc.name   : In the Canvas component, the hugrotate is  set to 0
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0210 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0230
     * @tc.name   : In the Canvas component, the hugrotate is  set to 180
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0230 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D08')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0380
     * @tc.name   : In the Canvas component, the brightness is  set to 0.3
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0380 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0370
     * @tc.name   : In the Canvas component, the brightness is  set to 0
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0370 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D10')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0340
     * @tc.name   : In the Canvas component, the opacity is  set to 1
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0340 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0080
     * @tc.name   : In the Canvas component, the grayscale is  set to 2
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0080 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D12')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0070
     * @tc.name   : In the Canvas component, the grayscale is  set to 1
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0070 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D13')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0060
     * @tc.name   : In the Canvas component, the grayscale is  set to 0.5
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0060 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D14')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0040
     * @tc.name   : In the Canvas component, the grayscale is  set to -1
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0040 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D15')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0120
     * @tc.name   : In the Canvas component, the sepia is  set to 1
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0120 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D16')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0100
     * @tc.name   : In the Canvas component, the sepia is  set to -1
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0100 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D17')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0400
     * @tc.name   : In the Canvas component, the sepia is  set to 1
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0400 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D18')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0410
     * @tc.name   : In the Canvas component, the contrast is  set to default
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0410 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D19')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0450
     * @tc.name   : In the Canvas component, the contrast is  set to 3
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0450 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D20')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0430
     * @tc.name   : In the Canvas component, the contrast is  set to 0.5
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0430 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D21')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0440
     * @tc.name   : In the Canvas component, the contrast is  set to 1
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0440 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D22')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0420
     * @tc.name   : In the Canvas component, the contrast is  set to 0
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0420 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D23')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0200
     * @tc.name   : In the Canvas component, the saturate is  set to 3
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0200 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D24')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0180
     * @tc.name   : In the Canvas component, the saturate is  set to 0.5
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0180 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D25')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0170
     * @tc.name   : In the Canvas component, the saturate is  set to 0
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0170 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D26')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0190
     * @tc.name   : In the Canvas component, the saturate is  set to 1
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0190 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D27')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0160
     * @tc.name   : In the Canvas component, the saturate is  not set
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0160 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D28')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0260
     * @tc.name   : In the Canvas component, the invert is set to 0
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0260 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D29')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0220
     * @tc.name   : In the Canvas component, the invert is set to 90
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0220 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D30')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0240
     * @tc.name   : In the Canvas component, the invert is set to 360
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0240 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D31')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0320
     * @tc.name   : In the Canvas component, the opacity is set to 0
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0320 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D32')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0330
     * @tc.name   : In the Canvas component, the opacity is set to 0.5
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0330 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D33')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0300
     * @tc.name   : In the Canvas component, the opacity is set to defult
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0300 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D34')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0490
     * @tc.name   : In the Canvas component, the blur is set to 5
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0490 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D35')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0470
     * @tc.name   : In the Canvas component, the blur is set to 0
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0470 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D36')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0480
     * @tc.name   : In the Canvas component, the blur is set to 3
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0480 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D37')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0600
     * @tc.name   : In the Canvas component, the direction is set to rtl
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0600 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D38')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0310
     * @tc.name   : In the Canvas component, the opacity is set to -11
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0310 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D39')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0460
     * @tc.name   : In the Canvas component, the blur is set to default
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0460 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D40')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0360
     * @tc.name   : In the Canvas component, the brightness is set to -1
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0360 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D41')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0280
     * @tc.name   : In the Canvas component, the invert is set to 1
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0280 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D42')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0350
     * @tc.name   : In the Canvas component, the brightness is set to default
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0350 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D43')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0590
     * @tc.name   : In the Canvas component, the direction is set to ltr
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0590 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D44')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0050
     * @tc.name   : In the Canvas component, the grayscale is set to 0
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0050 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D45')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0090
     * @tc.name   : In the Canvas component, the grayscale is not set
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0090 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D46')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0140
     * @tc.name   : In the Canvas component, the sepia is set to 2
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0140 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D47')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0290
     * @tc.name   : In the Canvas component, the invert is set to 2
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0290 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D48')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0570
     * @tc.name   : In the Canvas component, the imageSmoothingEnabled is set to true
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0570 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D49')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0580
     * @tc.name   : In the Canvas component, the imageSmoothingEnabled is set to false
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0580 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D50')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0540
     * @tc.name   : In the Canvas component, the imageSmoothingQuality is set to low
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0540 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D51')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0550
     * @tc.name   : In the Canvas component, the imageSmoothingQuality is set to medium
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0550 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D52')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0560
     * @tc.name   : In the Canvas component, the imageSmoothingQuality is set to high
     * @tc.desc   : Verify canvas matrix2d canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0560 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasMatrix2D/UiComponentCanvasMatrix2D53')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MATRIX2D_CANVASPATTERN_0560 finish.`);
      done()
    })

  })
}



