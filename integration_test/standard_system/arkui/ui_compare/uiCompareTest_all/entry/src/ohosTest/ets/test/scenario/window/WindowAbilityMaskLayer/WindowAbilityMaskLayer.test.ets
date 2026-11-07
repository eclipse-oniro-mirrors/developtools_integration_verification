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

export default function windowAbilityMaskLayer() {

  describe('windowAbilityMaskLayer', () => {
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
     * @tc.number : SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_001
     * @tc.name   : In free-form window mode, with ConfigWindowMask set to true and a product-custom file (abc) present, the mask layer is enabled.
     * @tc.desc   : Verify the interface under test: ，ConfigWindowMask to true, （abc），.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_001', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_001 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/window/WindowAbilityMaskLayer/WindowAbilityMaskLayer001')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：自由窗口，点击按钮开启蒙层
      let maskBtn = await driver.waitForComponent(ON.id('window_ability_mask_layer_001_btn'), 500)
      await maskBtn.click()
      await Utils.sleep(500)

      // 预期结果：
      // 1、窗口蒙层开启，盖住当前窗口
      // 2、蒙层与产品自定义文件中编写的页面显示一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_001 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_002
     * @tc.name   : In free-form window mode, with ConfigWindowMask set to true but no product-custom file (abc) present, the mask layer is not enabled.
     * @tc.desc   : Verify window ability mask layer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_002', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_002 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/window/WindowAbilityMaskLayer/WindowAbilityMaskLayer002')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：自由窗口，点击按钮
      let maskBtn = await driver.waitForComponent(ON.id('window_ability_mask_layer_002_btn'), 500)
      await maskBtn.click()
      await Utils.sleep(500)

      // 预期结果：
      // 1、窗口蒙层不开启
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_002 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_003
     * @tc.name   : In free-form window mode, with ConfigWindowMask set to false, the mask layer is closed.
     * @tc.desc   : Verify the interface under test: ，ConfigWindowMask to false,.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_003', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_003 start.`);
      // 步骤1：打开页面，蒙层已开启
      Settings.createWindow('testability/pages/scenario/window/WindowAbilityMaskLayer/WindowAbilityMaskLayer003')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：自由窗口，蒙层已开启，点击蒙层上的按钮关闭蒙层
      let maskBtn = await driver.waitForComponent(ON.id('window_ability_mask_layer_003_btn'), 500)
      await maskBtn.click()
      await Utils.sleep(500)

      // 预期结果：
      // 1、窗口蒙层关闭
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_003 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_004
     * @tc.name   : In maximized window mode, the mask layer can be enabled and disabled.
     * @tc.desc   : Verify the interface under test for scenario described by case 'SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_004'.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_004', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_004 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/window/WindowAbilityMaskLayer/WindowAbilityMaskLayer004')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：窗口最大化，点击按钮开启蒙层
      let openBtn = await driver.waitForComponent(ON.id('window_ability_mask_layer_004_open_btn'), 500)
      await openBtn.click()
      await Utils.sleep(500)

      // 步骤3：点击蒙层上的按钮关闭蒙层
      let closeBtn = await driver.waitForComponent(ON.id('window_ability_mask_layer_004_close_btn'), 500)
      await closeBtn.click()
      await Utils.sleep(500)

      // 预期结果：
      // 1、窗口蒙层开启，盖住当前窗口（整个屏幕）
      // 2、蒙层关闭
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_004 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_005
     * @tc.name   : When another window is displayed above the mask layer window and partially obscured, the mask layer can be enabled and disabled.
     * @tc.desc   : Verify the interface under test for scenario described by case 'SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_005'.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_005', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_005 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/window/WindowAbilityMaskLayer/WindowAbilityMaskLayer005')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：蒙层窗口上方显示其他窗口，被部分遮挡，点击蒙层窗口上的按钮开启蒙层
      let openBtn = await driver.waitForComponent(ON.id('window_ability_mask_layer_005_open_btn'), 500)
      await openBtn.click()
      await Utils.sleep(500)

      // 步骤3：点击蒙层上的按钮关闭蒙层
      let closeBtn = await driver.waitForComponent(ON.id('window_ability_mask_layer_005_close_btn'), 500)
      await closeBtn.click()
      await Utils.sleep(500)

      // 预期结果：
      // 1、蒙层开启，蒙层只盖住当前蒙层窗口，重叠的部分不会被遮盖
      // 2、蒙层关闭
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_005 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_008
     * @tc.name   : Continuously enable and disable the mask layer 50 times.
     * @tc.desc   : Verify window ability mask layer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_008', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_008 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/window/WindowAbilityMaskLayer/WindowAbilityMaskLayer008')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：连续开启/关闭蒙层50次
      let testBtn = await driver.waitForComponent(ON.id('window_ability_mask_layer_008_btn'), 500)
      await testBtn.click()
      await Utils.sleep(500)

      // 预期结果：
      // 1、蒙层开启/关闭功能正常，不会出现卡顿、崩溃、黑屏等现象
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_008 finish.`);
      done()
    })


  })
}