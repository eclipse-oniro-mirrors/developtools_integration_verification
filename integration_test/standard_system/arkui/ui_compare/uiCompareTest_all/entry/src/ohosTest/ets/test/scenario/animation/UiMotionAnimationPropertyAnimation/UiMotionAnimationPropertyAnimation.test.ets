/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default function uiMotionAnimationPropertyAnimation() {

  describe('uiMotionAnimationPropertyAnimation', () => {
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
     * @tc.number : SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_CURVE_010
     * @tc.name   : Outlier: In the property animation, the parameter delay is .animation({ curve: undefined })
     * @tc.desc   : Verify motion animation propertyanmation curve interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_CURVE_010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_CURVE_010 start.`);
      Settings.createWindow('testability/pages/scenario/animation/UiMotionAnimationPropertyAnimation/UiMotionAnimationPropertyAnimation01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiMotionAnimationPropertyAnimation01'),1000);
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_CURVE_010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_DELAY_010
     * @tc.name   : Outlier: In the property animation, the parameter delay is .animation({ delay: undefined })
     * @tc.desc   : Verify motion animation propertyanmation delay interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_DELAY_010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_DELAY_010 start.`);
      Settings.createWindow('testability/pages/scenario/animation/UiMotionAnimationPropertyAnimation/UiMotionAnimationPropertyAnimation02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiMotionAnimationPropertyAnimation02'),1000);
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_DELAY_010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_PLAYMODE_010
     * @tc.name   : Outlier: In the property animation, the parameter delay is .animation({ playmode: undefined })
     * @tc.desc   : Verify motion animation propertyanmation playmode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_PLAYMODE_010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_PLAYMODE_010 start.`);
      Settings.createWindow('testability/pages/scenario/animation/UiMotionAnimationPropertyAnimation/UiMotionAnimationPropertyAnimation03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiMotionAnimationPropertyAnimation03'),1000);
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_PLAYMODE_010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_DURATION_010
     * @tc.name   : Outlier: In the property animation, the parameter delay is .animation({ duration: undefined })
     * @tc.desc   : Verify motion animation propertyanmation duration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_DURATION_010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_DURATION_010 start.`);
      Settings.createWindow('testability/pages/scenario/animation/UiMotionAnimationPropertyAnimation/UiMotionAnimationPropertyAnimation04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiMotionAnimationPropertyAnimation04'),1000);
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_DURATION_010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_ITERATIONS_010
     * @tc.name   : Outlier: In the property animation, the parameter delay is .animation({ iterations: undefined })
     * @tc.desc   : Verify motion animation propertyanmation iterations interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_ITERATIONS_010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_ITERATIONS_010 start.`);
      Settings.createWindow('testability/pages/scenario/animation/UiMotionAnimationPropertyAnimation/UiMotionAnimationPropertyAnimation05')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiMotionAnimationPropertyAnimation05'),1000);
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_ITERATIONS_010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_TEMPO_010
     * @tc.name   : Outlier: In the property animation, the parameter delay is .animation({ tempo: undefined })
     * @tc.desc   : Verify motion animation propertyanmation tempo interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_TEMPO_010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_TEMPO_010 start.`);
      Settings.createWindow('testability/pages/scenario/animation/UiMotionAnimationPropertyAnimation/UiMotionAnimationPropertyAnimation06')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiMotionAnimationPropertyAnimation06'),1000);
      windowSnap.snapShot()
      await button01.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_MOTION_ANIMATION_PROPERTYANMATION_TEMPO_010 finish.`);
      done()
    })

  })
}