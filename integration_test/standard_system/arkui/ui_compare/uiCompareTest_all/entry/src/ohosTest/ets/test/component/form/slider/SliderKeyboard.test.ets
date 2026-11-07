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
import { KeyCode } from '@kit.InputKit';
import { BusinessError } from '@kit.BasicServicesKit'

export default function sliderKeyboardTest() {

  describe('sliderKeyboardTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0120
     * @tc.name   : Button slider action
     * @tc.desc   : Verify button slider action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0120 start.`);
      Settings.createWindow('testability/pages/component/form/slider/slider01')
      let driver: Driver = Driver.create();
      
      // 等待Slider组件出现
      let sliderComponent: Component = await driver.waitForComponent(ON.id('horizontal_slider'), 1000);
      
      // 点击Slider获取焦点
      await sliderComponent.click();
      await driver.waitForIdle(500, 2000);
      
      // 按下键盘方向键down
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_DOWN);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0120')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0140
     * @tc.name   : Button slider action
     * @tc.desc   : Verify button slider action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0140 start.`);
      Settings.createWindow('testability/pages/component/form/slider/slider02')
      let driver: Driver = Driver.create();
      
      // 等待Slider组件出现
      let sliderComponent: Component = await driver.waitForComponent(ON.id('horizontal_slider'), 1000);
      
      // 点击Slider获取焦点
      await sliderComponent.click();
      await driver.waitForIdle(500, 2000);
      
      // 按下键盘方向键right
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0140')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0170
     * @tc.name   : Button slider action
     * @tc.desc   : Verify button slider action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0170 start.`);
      Settings.createWindow('testability/pages/component/form/slider/slider03')
      let driver: Driver = Driver.create();
      
      // 等待Slider组件出现
      let sliderComponent: Component = await driver.waitForComponent(ON.id('horizontal_slider'), 1000);
      
      // 点击Slider获取焦点
      await sliderComponent.click();
      await driver.waitForIdle(500, 2000);
      
      // 按下键盘方向键left
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0170')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0150
     * @tc.name   : Button slider action
     * @tc.desc   : Verify button slider action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0150 start.`);
      Settings.createWindow('testability/pages/component/form/slider/slider04')
      let driver: Driver = Driver.create();
      
      // 等待Slider组件出现
      let sliderComponent: Component = await driver.waitForComponent(ON.id('vertical_slider'), 1000);
      
      // 点击Slider获取焦点
      await sliderComponent.click();
      await driver.waitForIdle(500, 2000);
      
      // 按下键盘方向键up
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_UP);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0150')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0110
     * @tc.name   : Button slider action
     * @tc.desc   : Verify button slider action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0110 start.`);
      Settings.createWindow('testability/pages/component/form/slider/slider05')
      let driver: Driver = Driver.create();
      
      // 等待Slider组件出现
      let sliderComponent: Component = await driver.waitForComponent(ON.id('vertical_slider'), 1000);
      
      // 点击Slider获取焦点
      await sliderComponent.click();
      await driver.waitForIdle(500, 2000);
      
      // 按下键盘方向键up
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_UP);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0110')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0200
     * @tc.name   : Button slider action
     * @tc.desc   : Verify button slider action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0200 start.`);
      Settings.createWindow('testability/pages/component/form/slider/slider06')
      let driver: Driver = Driver.create();
      
      // 等待Slider组件出现
      let sliderComponent: Component = await driver.waitForComponent(ON.id('horizontal_slider'), 1000);
      
      // 点击Slider获取焦点
      await sliderComponent.click();
      await driver.waitForIdle(500, 2000);
      
      // 水平方向测试
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.waitForIdle(500, 2000);
      
      // 测试其他方向键
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0200')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0160
     * @tc.name   : Button slider action
     * @tc.desc   : Verify button slider action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0160 start.`);
      Settings.createWindow('testability/pages/component/form/slider/slider07')
      let driver: Driver = Driver.create();
      
      // 等待Slider组件出现
      let sliderComponent: Component = await driver.waitForComponent(ON.id('dynamic_slider'), 1000);
      
      // 点击Slider获取焦点
      await sliderComponent.click();
      await driver.waitForIdle(500, 2000);
      
      // 按下键盘方向键down
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_DOWN);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0160')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0180
     * @tc.name   : Button slider action
     * @tc.desc   : Verify button slider action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0180 start.`);
      Settings.createWindow('testability/pages/component/form/slider/slider08')
      let driver: Driver = Driver.create();
      
      // 等待Slider组件出现
      let sliderComponent: Component = await driver.waitForComponent(ON.id('vertical_slider'), 1000);
      
      // 点击Slider获取焦点
      await sliderComponent.click();
      await driver.waitForIdle(500, 2000);
      
      // 按下键盘方向键right
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0180')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0190
     * @tc.name   : Button slider action
     * @tc.desc   : Verify button slider action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0190 start.`);
      Settings.createWindow('testability/pages/component/form/slider/slider09')
      let driver: Driver = Driver.create();
      
      // 等待Slider组件出现
      let sliderComponent: Component = await driver.waitForComponent(ON.id('vertical_slider'), 1000);
      
      // 点击Slider获取焦点
      await sliderComponent.click();
      await driver.waitForIdle(500, 2000);
      
      // 竖屏方向键测试
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.waitForIdle(500, 2000);
      
      // 切换为横屏
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500, 2000);
      
      // 横屏方向键测试
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0190')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0130
     * @tc.name   : Button slider action
     * @tc.desc   : Verify button slider action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0130 start.`);
      Settings.createWindow('testability/pages/component/form/slider/slider10')
      let driver: Driver = Driver.create();
      
      // 等待Slider组件出现
      let sliderComponent: Component = await driver.waitForComponent(ON.id('landscape_slider'), 1000);
      
      // 点击Slider获取焦点
      await sliderComponent.click();
      await driver.waitForIdle(500, 2000);
      
      // 按下键盘方向键left
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await driver.waitForIdle(500, 2000);
      
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0130')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_ACTION_0130 finish.`);
      done()
    })
  })
}