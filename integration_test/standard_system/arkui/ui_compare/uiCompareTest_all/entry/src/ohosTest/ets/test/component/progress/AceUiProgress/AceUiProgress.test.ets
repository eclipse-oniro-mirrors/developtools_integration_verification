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

export default function aceUiProgress() {

  describe('aceUiProgress', () => {
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
     * @tc.number : SUB_ACE_UI_Progress_0010
     * @tc.name   : Enable the halo flicker animation by default.
     * @tc.desc   : Verify Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_Progress_0010', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_Progress_0010 start.`);
      // 步骤1：构造一个Image组件，添加mask属性并设置ProgressMask
      Settings.createWindow('testability/pages/component/progress/AceUiProgress/AceUiProgress0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：将进度调至最大（页面中已设置进度为100）
      // 步骤3：观察动画效果
      // 预期结果：默认情况没有光晕闪烁动画
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_Progress_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_Progress_0020
     * @tc.name   : Disable the halo flicker animation.
     * @tc.desc   : Verify Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_Progress_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_Progress_0020 start.`);
      // 步骤1：构造一个Image组件，添加mask属性并设置ProgressMask，enableBreathingAnimation为false
      Settings.createWindow('testability/pages/component/progress/AceUiProgress/AceUiProgress0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：将进度调至最大（页面中已设置进度为100）
      // 步骤3：观察动画效果
      // 预期结果：无光晕闪烁动画
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_Progress_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_Progress_0030
     * @tc.name   : Dynamically set halo flicker animation.
     * @tc.desc   : Verify Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_Progress_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_Progress_0030 start.`);
      // 步骤1：构造一个Image组件，添加mask属性并设置ProgressMask
      Settings.createWindow('testability/pages/component/progress/AceUiProgress/AceUiProgress0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：将进度调至最大（页面中已设置进度为100）
      // 步骤3：观察动画效果
      // 步骤4：设置enableBreathingAnimation为false
      let btnDisable = await driver.waitForComponent(ON.id('btn_disable_breathe_0030'), 500)
      await btnDisable.click()
      await Utils.sleep(500)
      // 步骤5：观察动画效果
      // 预期结果：设置enableBreathe为false时，光晕动画关闭
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_Progress_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_Progress_0040
     * @tc.name   : Enable the halo flicker animation.
     * @tc.desc   : Verify Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_Progress_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_Progress_0040 start.`);
      // 步骤1：构造一个Image组件，添加mask属性并设置ProgressMask，enableBreathingAnimation为true
      Settings.createWindow('testability/pages/component/progress/AceUiProgress/AceUiProgress0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：将进度调至最大（页面中已设置进度为100）
      // 步骤3：观察动画效果
      // 预期结果：有光晕闪烁动画
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_Progress_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_Progress_0050
     * @tc.name   : LoadingProgress light mode conforms to UX specification.
     * @tc.desc   : Verify Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_Progress_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_Progress_0050 start.`);
      // 步骤1：创建loadingProgress组件
      Settings.createWindow('testability/pages/component/progress/AceUiProgress/AceUiProgress0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：观察显示效果
      // 预期结果：显示效果符合UX规范
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_Progress_0050 finish.`);
      done()
    })


  })
}