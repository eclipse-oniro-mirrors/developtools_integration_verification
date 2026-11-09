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

import { describe, it, afterEach, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'

export default function uiOhosAnimatorSimpleCreate() {
  describe('uiOhosAnimatorSimpleCreate', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        done()
        return
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window.Cause :${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0030
     * @tc.name   : ohos.animator simple construction method easing and another optional parameter missing test
     * @tc.desc   : Verify ohos animator simple create interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0030', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面
      Settings.createWindow('testability/pages/scenario/animation/UiOhosAnimatorSimpleCreate/UiOhosAnimatorSimpleCreate0030')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮同时触发所有动画
      let btn_start_all_0030 = await driver.waitForComponent(ON.id('btn_start_all_0030'), 500)
      await btn_start_all_0030.click()
      
      // 步骤3：等待第一次动画完成，截图验证
      await Utils.sleep(2500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0030_01')
      await Utils.sleep(1000)

      // 步骤4：等待所有动画完成，截图验证
      await Utils.sleep(2500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0030_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0050
     * @tc.name   : ohos.animator simple construction method fill and another optional parameter missing test
     * @tc.desc   : Verify ohos animator simple create interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0050', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面
      Settings.createWindow('testability/pages/scenario/animation/UiOhosAnimatorSimpleCreate/UiOhosAnimatorSimpleCreate0050')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮同时触发所有动画
      let btn_start_all_0050 = await driver.waitForComponent(ON.id('btn_start_all_0050'), 500)
      await btn_start_all_0050.click()
      
      // 步骤3：等待第一次动画完成，截图验证
      await Utils.sleep(3000)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0050_01')
      await Utils.sleep(1000)

      // 步骤4：等待所有动画完成，截图验证
      await Utils.sleep(2500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0050_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0060
     * @tc.name   : ohos.animator simple construction method direction and iteration missing test
     * @tc.desc   : Verify ohos animator simple create interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0060', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面
      Settings.createWindow('testability/pages/scenario/animation/UiOhosAnimatorSimpleCreate/UiOhosAnimatorSimpleCreate0060')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：触发动画
      let btn_start_0060 = await driver.waitForComponent(ON.id('btn_start_0060'), 500)
      await btn_start_0060.click()
      
      // 步骤3：等待动画执行中，截图验证
      await Utils.sleep(1500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0060_01')
      await Utils.sleep(1000)

      // 步骤4：等待动画完成，截图验证
      await Utils.sleep(1500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0060_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0080
     * @tc.name   : ohos.animator simple construction method easing and another two optional parameters missing test
     * @tc.desc   : Verify ohos animator simple create interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0080', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面
      Settings.createWindow('testability/pages/scenario/animation/UiOhosAnimatorSimpleCreate/UiOhosAnimatorSimpleCreate0080')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮同时触发所有动画
      let btn_start_all_0080 = await driver.waitForComponent(ON.id('btn_start_all_0080'), 500)
      await btn_start_all_0080.click()
      
      // 步骤3：等待第一次动画完成，截图验证
      await Utils.sleep(2500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0080_01')
      await Utils.sleep(1000)

      // 步骤4：等待所有动画完成，截图验证
      await Utils.sleep(2500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0080_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0100
     * @tc.name   : ohos.animator simple construction method fill, direction, iteration missing test
     * @tc.desc   : Verify ohos animator simple create interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0100', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面
      Settings.createWindow('testability/pages/scenario/animation/UiOhosAnimatorSimpleCreate/UiOhosAnimatorSimpleCreate0100')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：触发动画
      let btn_start_0100 = await driver.waitForComponent(ON.id('btn_start_0100'), 500)
      await btn_start_0100.click()
      
      // 步骤3：等待动画执行中，截图验证
      await Utils.sleep(1500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0100_01')
      await Utils.sleep(1000)

      // 步骤4：等待动画完成，截图验证
      await Utils.sleep(1500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0100_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0110
     * @tc.name   : ohos.animator simple construction method only set duration and another optional parameter test
     * @tc.desc   : Verify ohos animator simple create interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0110', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面
      Settings.createWindow('testability/pages/scenario/animation/UiOhosAnimatorSimpleCreate/UiOhosAnimatorSimpleCreate0110')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮同时触发所有动画
      let btn_start_all_0110 = await driver.waitForComponent(ON.id('btn_start_all_0110'), 500)
      await btn_start_all_0110.click()
      
      // 步骤3：等待第一次动画完成，截图验证
      await Utils.sleep(2500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0110_01')
      await Utils.sleep(1000)

      // 步骤4：等待所有动画完成，截图验证
      await Utils.sleep(2500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0110_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0120
     * @tc.name   : ohos.animator simple construction method only set easing and another optional parameter test
     * @tc.desc   : Verify ohos animator simple create interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0120', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面
      Settings.createWindow('testability/pages/scenario/animation/UiOhosAnimatorSimpleCreate/UiOhosAnimatorSimpleCreate0120')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮同时触发所有动画
      let btn_start_all_0120 = await driver.waitForComponent(ON.id('btn_start_all_0120'), 500)
      await btn_start_all_0120.click()
      
      // 步骤3：等待第一次动画完成，截图验证
      await Utils.sleep(1500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0120_01')
      await Utils.sleep(1000)

      // 步骤4：等待所有动画完成，截图验证
      await Utils.sleep(1500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0120_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0130
     * @tc.name   : ohos.animator simple construction method only set delay and another optional parameter test
     * @tc.desc   : Verify ohos animator simple create interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0130', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面
      Settings.createWindow('testability/pages/scenario/animation/UiOhosAnimatorSimpleCreate/UiOhosAnimatorSimpleCreate0130')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮同时触发所有动画
      let btn_start_all_0130 = await driver.waitForComponent(ON.id('btn_start_all_0130'), 500)
      await btn_start_all_0130.click()
      
      // 步骤3：等待第一次动画完成，截图验证
      await Utils.sleep(2000)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0130_01')
      await Utils.sleep(1000)

      // 步骤4：等待所有动画完成，截图验证
      await Utils.sleep(1500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0130_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0140
     * @tc.name   : ohos.animator simple construction method only set fill and another optional parameter test
     * @tc.desc   : Verify ohos animator simple create interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0140', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面
      Settings.createWindow('testability/pages/scenario/animation/UiOhosAnimatorSimpleCreate/UiOhosAnimatorSimpleCreate0140')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮同时触发所有动画
      let btn_start_all_0140 = await driver.waitForComponent(ON.id('btn_start_all_0140'), 500)
      await btn_start_all_0140.click()
      
      // 步骤3：等待第一次动画完成，截图验证
      await Utils.sleep(1500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0140_01')
      await Utils.sleep(1000)

      // 步骤4：等待所有动画完成，截图验证
      await Utils.sleep(1500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0140_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0150
     * @tc.name   : ohos.animator simple construction method only set direction and iteration test
     * @tc.desc   : Verify ohos animator simple create interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0150', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面
      Settings.createWindow('testability/pages/scenario/animation/UiOhosAnimatorSimpleCreate/UiOhosAnimatorSimpleCreate0150')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：触发动画
      let btn_start_0150 = await driver.waitForComponent(ON.id('btn_start_0150'), 500)
      await btn_start_0150.click()
      
      // 步骤3：等待第一次动画完成，截图验证
      await Utils.sleep(1500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0150_01')
      await Utils.sleep(1000)

      // 步骤4：等待所有动画完成，截图验证
      await Utils.sleep(1500)
      await windowSnap.snapShot('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0150_02')
      await Utils.sleep(1000)
      done();
    })
  })
}