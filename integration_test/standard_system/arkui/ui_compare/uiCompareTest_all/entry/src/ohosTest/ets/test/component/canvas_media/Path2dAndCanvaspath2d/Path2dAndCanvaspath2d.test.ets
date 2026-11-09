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

export default function path2dAndCanvaspath2d() {

  describe('path2dAndCanvaspath2d', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0010
     * @tc.name   : Canvas Path2D LineTo Performance Verification
     * @tc.desc   : Verify canvas path2d and canvaspath2d interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0010 start.`);
      // 步骤1：创建组件，设置频繁调用任务
      Settings.createWindow('testability/pages/component/canvas_media/Path2dAndCanvaspath2d/Path2dAndCanvaspath2d0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：任务中调用Path2D路径对象LineTo方法进行绘制
      // 预期结果：图像正常绘制，无卡顿崩溃
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0020
     * @tc.name   : Canvas Path2D bezierCurveTo Performance Verification
     * @tc.desc   : Verify canvas path2d and canvaspath2d interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0020 start.`);
      // 步骤1：创建组件，设置频繁调用任务
      Settings.createWindow('testability/pages/component/canvas_media/Path2dAndCanvaspath2d/Path2dAndCanvaspath2d0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：任务中调用Path2D路径对象bezierCurveTo方法进行绘制
      // 预期结果：图像正常绘制，无卡顿崩溃
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0030
     * @tc.name   : Canvas Path2D quadraticCurveTo Performance Verification
     * @tc.desc   : Verify canvas path2d and canvaspath2d interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0030 start.`);
      // 步骤1：创建组件，设置频繁调用任务
      Settings.createWindow('testability/pages/component/canvas_media/Path2dAndCanvaspath2d/Path2dAndCanvaspath2d0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：任务中调用Path2D路径对象quadraticCurveTo方法进行绘制
      // 预期结果：图像正常绘制，无卡顿崩溃
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0040
     * @tc.name   : Canvas Path2D arc Performance Verification
     * @tc.desc   : Verify canvas path2d and canvaspath2d interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0040 start.`);
      // 步骤1：创建组件，设置频繁调用任务
      Settings.createWindow('testability/pages/component/canvas_media/Path2dAndCanvaspath2d/Path2dAndCanvaspath2d0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：任务中调用Path2D路径对象arc方法进行绘制
      // 预期结果：图像正常绘制，无卡顿崩溃
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0050
     * @tc.name   : Canvas Path2D arcTo Performance Verification
     * @tc.desc   : Verify canvas path2d and canvaspath2d interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0050 start.`);
      // 步骤1：创建组件，设置频繁调用任务
      Settings.createWindow('testability/pages/component/canvas_media/Path2dAndCanvaspath2d/Path2dAndCanvaspath2d0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：任务中调用Path2D路径对象arcTo方法进行绘制
      // 预期结果：图像正常绘制，无卡顿崩溃
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0060
     * @tc.name   : Canvas Path2D ellipse Performance Verification
     * @tc.desc   : Verify canvas path2d and canvaspath2d interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0060 start.`);
      // 步骤1：创建组件，设置频繁调用任务
      Settings.createWindow('testability/pages/component/canvas_media/Path2dAndCanvaspath2d/Path2dAndCanvaspath2d0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：任务中调用Path2D路径对象ellipse方法进行绘制
      // 预期结果：图像正常绘制，无卡顿崩溃
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0070
     * @tc.name   : Canvas Path2D rect Performance Verification
     * @tc.desc   : Verify canvas path2d and canvaspath2d interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0070 start.`);
      // 步骤1：创建组件，设置频繁调用任务
      Settings.createWindow('testability/pages/component/canvas_media/Path2dAndCanvaspath2d/Path2dAndCanvaspath2d0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：任务中调用Path2D路径对象rect方法进行绘制
      // 预期结果：图像正常绘制，无卡顿崩溃
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_PATH2D_AND_CANVASPATH2D_0070 finish.`);
      done()
    })


  })
}