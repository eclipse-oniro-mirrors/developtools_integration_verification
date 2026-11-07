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

export default function uiComponentCanvasPath2DAndCanvasPattern() {

  describe('uiComponentCanvasPath2DAndCanvasPattern', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0350
     * @tc.name   : Set the value of the setTransform interface to 0.5 for rotateX
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0350 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern01');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0350 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0470
     * @tc.name   : Set the value of the setTransform interface to translateX=50 and translateY=50
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0470 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern02');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0470 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0360
     * @tc.name   : Set the value of the setTransform interface to -0.5
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0360 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern03');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0360 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0270
     * @tc.name   : Set the scaleX value of the setTransform interface to 1
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0270 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern04');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0270 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0500
     * @tc.name   : Set the scaleY=1.5、rotateY=-1、translateY=100
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0500 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern05');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0500 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0420
     * @tc.name   : Set the translateY to 50
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0420 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern06');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0420 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0370
     * @tc.name   : Set the rotateY to 0.5
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0370 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern07');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0370 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0440
     * @tc.name   : Set the translateY to 1000
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0440 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern08');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0440 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0380
     * @tc.name   : Set the rotateY to -0.5
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0380 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern09');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0380 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0450
     * @tc.name   : Set the scaleX to 1.5、scaleY to 1.5
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0450 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern10');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0450 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0410
     * @tc.name   : Set the translateX to 1000
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0410 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern11');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0410 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0310
     * @tc.name   : Set the scaleY TO 1
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0310 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern12');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0310 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0460
     * @tc.name   : Set the value of the setTransform interface to rotateX=0.5 and rotateY=0.5
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0460 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern13');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0460 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0260
     * @tc.name   : Set the value of the setTransform interface to the default value
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0260 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern14');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0260 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0390
     * @tc.name   : Set the value of the setTransform interface to 50 for translateX
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0390 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern15');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0390 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0510
     * @tc.name   : Set scaleY=1.5, rotateY=-1, and translateY=1000 in the value of the setTransform interface
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0510 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern16');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0510 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0300
     * @tc.name   : Set scaleX=40 in the value of the setTransform interface
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0300 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern17');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0300 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0340
     * @tc.name   : Set scaleY=40 in the value of the setTransform interface
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0340 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern18');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0340 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0320
     * @tc.name   : Set scaleY=1.5 in the value of the setTransform interface
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0320 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern19');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0320 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0490
     * @tc.name   : Set scaleX=1.5 rotateX=0.5、translateX=100 in the value of the setTransform interface
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0490 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern20');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0490 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0280
     * @tc.name   : Set scaleX=1.5 in the value of the setTransform interface
     * @tc.desc   : Verify canvas path2d and canvaspattern interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0280 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasPath2DAndCanvasPattern/UiComponentCanvasPath2DAndCanvasPattern21');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATTERN_0280 finish.`);
      done();
    })

  })
}