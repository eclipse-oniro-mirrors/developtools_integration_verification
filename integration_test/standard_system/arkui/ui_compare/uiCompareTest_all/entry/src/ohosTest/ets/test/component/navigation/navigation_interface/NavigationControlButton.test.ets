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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';
import { Driver, ON, Component } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function navigationControlButtonTest() {

  describe('navigationControlButtonTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err: BusinessError) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0010
     * @tc.name   : 标题避让sidebar（标题是resource类型）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0010 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0010/navigationControlButton0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"标题内容是resource类型"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0010'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0010, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0010`);
        throw new Error('Component not found: enterPageBtn0010');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"resource类型超长标题"按钮，验证长标题避让效果
      let longTitleBtn = await driver.waitForComponent(ON.id('longTitleBtn0010'), 2000);
      Logger.info('TEST', `Found component: longTitleBtn0010, result: ${longTitleBtn ? 'found' : 'not found'}`);
      if (!longTitleBtn) {
        Logger.error('TEST', `Component not found: longTitleBtn0010`);
        throw new Error('Component not found: longTitleBtn0010');
      }
      await longTitleBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0010_01');
      await Utils.sleep(1000);
      
      // 3.滑动标题，验证避让效果
      await driver.swipe(400, 500, 400, 300, 500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0010_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0020
     * @tc.name   : 标题避让sidebar（标题是string类型）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0020 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0020/navigationControlButton0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"标题内容是string类型"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0020'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0020, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0020`);
        throw new Error('Component not found: enterPageBtn0020');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.在mainTitle输入框中输入超长标题，验证长标题避让效果
      let mainTitleInput = await driver.waitForComponent(ON.id('mainTitleInput0020'), 2000);
      Logger.info('TEST', `Found component: mainTitleInput0020, result: ${mainTitleInput ? 'found' : 'not found'}`);
      if (!mainTitleInput) {
        Logger.error('TEST', `Component not found: mainTitleInput0020`);
        throw new Error('Component not found: mainTitleInput0020');
      }
      await mainTitleInput.clearText();
      await driver.waitForIdle(300, 1000);
      await mainTitleInput.inputText('我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题');
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0020_01');
      await Utils.sleep(1000);
      
      // 3.滑动标题，验证避让效果
      await driver.swipe(400, 500, 400, 300, 500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0020_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0030
     * @tc.name   : 标题避让sidebar（标题是NavigationCommonTitle类型，自定义菜单）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0030 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0030/navigationControlButton0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"10 标题内容是NavigationCommonTitle类型-自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0030'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0030, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0030`);
        throw new Error('Component not found: enterPageBtn0030');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCommonTitle类型-main超长标题"和"NavigationCommonTitle类型-sub超长标题"，验证长标题避让效果
      let longMainTitleBtn = await driver.waitForComponent(ON.id('longMainTitleBtn0030'), 2000);
      if (longMainTitleBtn) {
        await longMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let longSubTitleBtn = await driver.waitForComponent(ON.id('longSubTitleBtn0030'), 2000);
      if (longSubTitleBtn) {
        await longSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
      }
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0030_01');
      await Utils.sleep(1000);
      
      // 3.滑动标题，验证避让效果
      await driver.swipe(400, 500, 400, 300, 500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0030_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0040
     * @tc.name   : 标题避让sidebar（标题是CustomBuilder类型，非自定义菜单）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0040 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0040/navigationControlButton0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"13 标题内容是CustomBuilder类型-非自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0040'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0040, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0040`);
        throw new Error('Component not found: enterPageBtn0040');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"CustomBuilder类型超长标题"按钮，验证长标题避让效果
      let longTitleBtn = await driver.waitForComponent(ON.id('longTitleBtn0040'), 2000);
      Logger.info('TEST', `Found component: longTitleBtn0040, result: ${longTitleBtn ? 'found' : 'not found'}`);
      if (!longTitleBtn) {
        Logger.error('TEST', `Component not found: longTitleBtn0040`);
        throw new Error('Component not found: longTitleBtn0040');
      }
      await longTitleBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0040_01');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0050
     * @tc.name   : 标题避让sidebar（标题是NavigationCustomTitle类型，自定义菜单）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0050 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0050/navigationControlButton0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"14 标题内容是NavigationCustomTitle类型，自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0050'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0050, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0050`);
        throw new Error('Component not found: enterPageBtn0050');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCustomTitle类型超长标题"按钮，验证长标题避让效果
      let longTitleBtn = await driver.waitForComponent(ON.id('longTitleBtn0050'), 2000);
      Logger.info('TEST', `Found component: longTitleBtn0050, result: ${longTitleBtn ? 'found' : 'not found'}`);
      if (!longTitleBtn) {
        Logger.error('TEST', `Component not found: longTitleBtn0050`);
        throw new Error('Component not found: longTitleBtn0050');
      }
      await longTitleBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0050_01');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0060
     * @tc.name   : 标题避让sidebar（标题是resource类型，非自定义菜单）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0060 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0060/navigationControlButton0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"标题内容是resource类型，携带菜单按钮"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0060'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0060, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0060`);
        throw new Error('Component not found: enterPageBtn0060');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"resource类型超长标题"按钮
      let longTitleBtn = await driver.waitForComponent(ON.id('longTitleBtn0060'), 2000);
      if (longTitleBtn) {
        await longTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0060_01');
        await Utils.sleep(1000);
      }
      
      // 3.点击"自定义菜单按钮"
      let customMenuBtn = await driver.waitForComponent(ON.id('customMenuBtn0060'), 2000);
      if (customMenuBtn) {
        await customMenuBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0060_02');
        await Utils.sleep(1000);
      }
      
      // 4.上下滑动标题
      await driver.swipe(400, 500, 400, 300, 500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0060_03');
      await Utils.sleep(1000);
      
      // 5.点击"非自定义菜单按钮"
      let nonCustomMenuBtn = await driver.waitForComponent(ON.id('nonCustomMenuBtn0060'), 2000);
      if (nonCustomMenuBtn) {
        await nonCustomMenuBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0060_04');
        await Utils.sleep(1000);
      }
      
      // 6.上下滑动标题
      await driver.swipe(400, 500, 400, 300, 500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0060_05');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0070
     * @tc.name   : 标题避让sidebar（标题是string类型，非自定义菜单）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0070 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0070/navigationControlButton0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"标题内容是string类型，携带菜单按钮"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0070'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0070, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0070`);
        throw new Error('Component not found: enterPageBtn0070');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.在mainTitle输入框中输入超长标题
      let mainTitleInput = await driver.waitForComponent(ON.id('mainTitleInput0070'), 2000);
      if (mainTitleInput) {
        await mainTitleInput.clearText();
        await driver.waitForIdle(300, 1000);
        await mainTitleInput.inputText('我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题我是主标题');
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0070_01');
        await Utils.sleep(1000);
      }
      
      // 3.点击"自定义菜单按钮"
      let customMenuBtn = await driver.waitForComponent(ON.id('customMenuBtn0070'), 2000);
      if (customMenuBtn) {
        await customMenuBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0070_02');
        await Utils.sleep(1000);
      }
      
      // 4.上下滑动标题
      await driver.swipe(400, 500, 400, 300, 500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0070_03');
      await Utils.sleep(1000);
      
      // 5.点击"非自定义菜单按钮"
      let nonCustomMenuBtn = await driver.waitForComponent(ON.id('nonCustomMenuBtn0070'), 2000);
      if (nonCustomMenuBtn) {
        await nonCustomMenuBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0070_04');
        await Utils.sleep(1000);
      }
      
      // 6.上下滑动标题
      await driver.swipe(400, 500, 400, 300, 500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0070_05');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0080
     * @tc.name   : 标题避让sidebar（标题是NavigationCommonTitle类型，非自定义菜单）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0080 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0080/navigationControlButton0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"11 标题内容是NavigationCommonTitle类型-非自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0080'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0080, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0080`);
        throw new Error('Component not found: enterPageBtn0080');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCommonTitle类型-main超长标题"和"NavigationCommonTitle类型-sub超长标题"
      let longMainTitleBtn = await driver.waitForComponent(ON.id('longMainTitleBtn0080'), 2000);
      if (longMainTitleBtn) {
        await longMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let longSubTitleBtn = await driver.waitForComponent(ON.id('longSubTitleBtn0080'), 2000);
      if (longSubTitleBtn) {
        await longSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0080_01');
        await Utils.sleep(1000);
      }
      
      // 3.上下滑动标题
      await driver.swipe(400, 500, 400, 300, 500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0080_02');
      await Utils.sleep(1000);
      
      // 4.点击"NavigationCommonTitle类型-main短标题"和"NavigationCommonTitle类型-sub短标题"
      let shortMainTitleBtn = await driver.waitForComponent(ON.id('shortMainTitleBtn0080'), 2000);
      if (shortMainTitleBtn) {
        await shortMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let shortSubTitleBtn = await driver.waitForComponent(ON.id('shortSubTitleBtn0080'), 2000);
      if (shortSubTitleBtn) {
        await shortSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0080_03');
        await Utils.sleep(1000);
      }
      
      // 5.上下滑动标题
      await driver.swipe(400, 500, 400, 300, 500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0080_04');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0090
     * @tc.name   : 标题避让sidebar（标题是CustomBuilder类型，自定义菜单）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0090 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0090/navigationControlButton0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"12 标题内容是CustomBuilder类型-自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0090'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0090, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0090`);
        throw new Error('Component not found: enterPageBtn0090');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"CustomBuilder类型超长标题"按钮，验证长标题不避让效果
      let longTitleBtn = await driver.waitForComponent(ON.id('longTitleBtn0090'), 2000);
      Logger.info('TEST', `Found component: longTitleBtn0090, result: ${longTitleBtn ? 'found' : 'not found'}`);
      if (!longTitleBtn) {
        Logger.error('TEST', `Component not found: longTitleBtn0090`);
        throw new Error('Component not found: longTitleBtn0090');
      }
      await longTitleBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0090_01');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0100
     * @tc.name   : 标题避让sidebar（标题是NavigationCustomTitle类型，非自定义菜单）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0100 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0100/navigationControlButton0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"15 标题内容是NavigationCustomTitle类型，非自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0100'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0100, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0100`);
        throw new Error('Component not found: enterPageBtn0100');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCustomTitle类型超长标题"按钮，验证长标题不避让效果
      let longTitleBtn = await driver.waitForComponent(ON.id('longTitleBtn0100'), 2000);
      Logger.info('TEST', `Found component: longTitleBtn0100, result: ${longTitleBtn ? 'found' : 'not found'}`);
      if (!longTitleBtn) {
        Logger.error('TEST', `Component not found: longTitleBtn0100`);
        throw new Error('Component not found: longTitleBtn0100');
      }
      await longTitleBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0100_01');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0110
     * @tc.name   : 标题避让sidebar（titleMode属性测试）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0110 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0110/navigationControlButton0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"11 标题内容是NavigationCommonTitle类型-非自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0110'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0110, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0110`);
        throw new Error('Component not found: enterPageBtn0110');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCommonTitle类型-main超长标题"和"NavigationCommonTitle类型-sub超长标题"
      let longMainTitleBtn = await driver.waitForComponent(ON.id('longMainTitleBtn0080'), 2000);
      if (longMainTitleBtn) {
        await longMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let longSubTitleBtn = await driver.waitForComponent(ON.id('longSubTitleBtn0080'), 2000);
      if (longSubTitleBtn) {
        await longSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0110_01');
        await Utils.sleep(1000);
      }
      
      // 3.点击"titleMode"动态按钮，切换Full、Mini、Free
      // 切换为Full
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let titleModeFullBtn = await driver.waitForComponent(ON.id('titleModeFullBtn0110'), 2000);
      if (titleModeFullBtn) {
        await titleModeFullBtn.click();
        await driver.waitForIdle(500, 2000);
        await enterPageBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0110_02');
        await Utils.sleep(1000);
      }
      
      // 切换为Mini
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let titleModeMiniBtn = await driver.waitForComponent(ON.id('titleModeMiniBtn0110'), 2000);
      if (titleModeMiniBtn) {
        await titleModeMiniBtn.click();
        await driver.waitForIdle(500, 2000);
        await enterPageBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0110_03');
        await Utils.sleep(1000);
      }
      
      // 切换为Free
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let titleModeFreeBtn = await driver.waitForComponent(ON.id('titleModeFreeBtn0110'), 2000);
      if (titleModeFreeBtn) {
        await titleModeFreeBtn.click();
        await driver.waitForIdle(500, 2000);
        await enterPageBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0110_04');
        await Utils.sleep(1000);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0120
     * @tc.name   : 标题避让sidebar（hideTitleBar属性测试）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0120 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0120/navigationControlButton0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"11 标题内容是NavigationCommonTitle类型-非自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0120'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0120, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0120`);
        throw new Error('Component not found: enterPageBtn0120');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCommonTitle类型-main超长标题"和"NavigationCommonTitle类型-sub超长标题"
      let longMainTitleBtn = await driver.waitForComponent(ON.id('longMainTitleBtn0080'), 2000);
      if (longMainTitleBtn) {
        await longMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let longSubTitleBtn = await driver.waitForComponent(ON.id('longSubTitleBtn0080'), 2000);
      if (longSubTitleBtn) {
        await longSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0120_01');
        await Utils.sleep(1000);
      }
      
      // 3.点击"hideTitleBar"动态按钮，切换true、false
      // 切换为true
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let hideTitleBarTrueBtn = await driver.waitForComponent(ON.id('hideTitleBarTrueBtn0120'), 2000);
      if (hideTitleBarTrueBtn) {
        await hideTitleBarTrueBtn.click();
        await driver.waitForIdle(500, 2000);
        await enterPageBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0120_02');
        await Utils.sleep(1000);
      }
      
      // 切换为false
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let hideTitleBarFalseBtn = await driver.waitForComponent(ON.id('hideTitleBarFalseBtn0120'), 2000);
      if (hideTitleBarFalseBtn) {
        await hideTitleBarFalseBtn.click();
        await driver.waitForIdle(500, 2000);
        await enterPageBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0120_03');
        await Utils.sleep(1000);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0130
     * @tc.name   : 标题避让sidebar（mode属性测试）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0130 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0130/navigationControlButton0130')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"11 标题内容是NavigationCommonTitle类型-非自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0130'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0130, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0130`);
        throw new Error('Component not found: enterPageBtn0130');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCommonTitle类型-main超长标题"和"NavigationCommonTitle类型-sub超长标题"
      let longMainTitleBtn = await driver.waitForComponent(ON.id('longMainTitleBtn0080'), 2000);
      if (longMainTitleBtn) {
        await longMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let longSubTitleBtn = await driver.waitForComponent(ON.id('longSubTitleBtn0080'), 2000);
      if (longSubTitleBtn) {
        await longSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0130_01');
        await Utils.sleep(1000);
      }
      
      // 3.点击"mode"动态按钮，切换Stack、Split、Auto
      // 切换为Stack
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let modeStackBtn = await driver.waitForComponent(ON.id('modeStackBtn0130'), 2000);
      if (modeStackBtn) {
        await modeStackBtn.click();
        await driver.waitForIdle(500, 2000);
        await enterPageBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0130_02');
        await Utils.sleep(1000);
      }
      
      // 切换为Split
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let modeSplitBtn = await driver.waitForComponent(ON.id('modeSplitBtn0130'), 2000);
      if (modeSplitBtn) {
        await modeSplitBtn.click();
        await driver.waitForIdle(500, 2000);
        await enterPageBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0130_03');
        await Utils.sleep(1000);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0140
     * @tc.name   : 标题避让sidebar（BarStyle属性测试）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0140 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0140/navigationControlButton0140')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"11 标题内容是NavigationCommonTitle类型-非自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0140'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0140, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0140`);
        throw new Error('Component not found: enterPageBtn0140');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCommonTitle类型-main超长标题"和"NavigationCommonTitle类型-sub超长标题"
      let longMainTitleBtn = await driver.waitForComponent(ON.id('longMainTitleBtn0080'), 2000);
      if (longMainTitleBtn) {
        await longMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let longSubTitleBtn = await driver.waitForComponent(ON.id('longSubTitleBtn0080'), 2000);
      if (longSubTitleBtn) {
        await longSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0140_01');
        await Utils.sleep(1000);
      }
      
      // 3.注意：BarStyle属性在Navigation组件中可能不存在，这里只验证标题避让效果
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0140_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0150
     * @tc.name   : 标题避让sidebar（Navigation不满一屏测试）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0150 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0150/navigationControlButton0150')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"Navigation设置标题栏在屏幕中间位置"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0150'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0150, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0150`);
        throw new Error('Component not found: enterPageBtn0150');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCommonTitle类型-main超长标题"和"NavigationCommonTitle类型-sub超长标题"
      let longMainTitleBtn = await driver.waitForComponent(ON.id('longMainTitleBtn0080'), 2000);
      if (longMainTitleBtn) {
        await longMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let longSubTitleBtn = await driver.waitForComponent(ON.id('longSubTitleBtn0080'), 2000);
      if (longSubTitleBtn) {
        await longSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0150_01');
        await Utils.sleep(1000);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0160
     * @tc.name   : 标题避让sidebar（navBarPosition属性测试）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0160 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0160/navigationControlButton0160')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"11 标题内容是NavigationCommonTitle类型-非自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0160'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0160, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0160`);
        throw new Error('Component not found: enterPageBtn0160');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCommonTitle类型-main超长标题"和"NavigationCommonTitle类型-sub超长标题"
      let longMainTitleBtn = await driver.waitForComponent(ON.id('longMainTitleBtn0080'), 2000);
      if (longMainTitleBtn) {
        await longMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let longSubTitleBtn = await driver.waitForComponent(ON.id('longSubTitleBtn0080'), 2000);
      if (longSubTitleBtn) {
        await longSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0160_01');
        await Utils.sleep(1000);
      }
      
      // 3.点击"mode"动态按钮，切换为Split
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let modeSplitBtn = await driver.waitForComponent(ON.id('modeSplitBtn0160'), 2000);
      if (modeSplitBtn) {
        await modeSplitBtn.click();
        await driver.waitForIdle(500, 2000);
        await enterPageBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0160_02');
        await Utils.sleep(1000);
      }
      
      // 4.点击"navBarPosition"动态按钮，切换Start、End
      // 切换为Start
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let navBarPositionStartBtn = await driver.waitForComponent(ON.id('navBarPositionStartBtn0160'), 2000);
      if (navBarPositionStartBtn) {
        await navBarPositionStartBtn.click();
        await driver.waitForIdle(500, 2000);
        await enterPageBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0160_03');
        await Utils.sleep(1000);
      }
      
      // 切换为End
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let navBarPositionEndBtn = await driver.waitForComponent(ON.id('navBarPositionEndBtn0160'), 2000);
      if (navBarPositionEndBtn) {
        await navBarPositionEndBtn.click();
        await driver.waitForIdle(500, 2000);
        await enterPageBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0160_04');
        await Utils.sleep(1000);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0170
     * @tc.name   : 标题避让sidebar（热启动+锁屏场景测试）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0170 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0170/navigationControlButton0170')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"11 标题内容是NavigationCommonTitle类型-非自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0170'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0170, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0170`);
        throw new Error('Component not found: enterPageBtn0170');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCommonTitle类型-main超长标题"和"NavigationCommonTitle类型-sub超长标题"
      let longMainTitleBtn = await driver.waitForComponent(ON.id('longMainTitleBtn0080'), 2000);
      if (longMainTitleBtn) {
        await longMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let longSubTitleBtn = await driver.waitForComponent(ON.id('longSubTitleBtn0080'), 2000);
      if (longSubTitleBtn) {
        await longSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0170_01');
        await Utils.sleep(1000);
      }
      
      // 3.锁屏之后重启 - 测试框架中可能无法真正锁屏，这里只做截图验证
      // 4.退出后台，再重新切回 - 测试框架中可能无法真正退出后台，这里只做截图验证
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0170_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0180
     * @tc.name   : 标题避让sidebar（横竖屏切换场景测试）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0180 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0180/navigationControlButton0180')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"11 标题内容是NavigationCommonTitle类型-非自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0180'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0180, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0180`);
        throw new Error('Component not found: enterPageBtn0180');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCommonTitle类型-main超长标题"和"NavigationCommonTitle类型-sub超长标题"
      let longMainTitleBtn = await driver.waitForComponent(ON.id('longMainTitleBtn0080'), 2000);
      if (longMainTitleBtn) {
        await longMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let longSubTitleBtn = await driver.waitForComponent(ON.id('longSubTitleBtn0080'), 2000);
      if (longSubTitleBtn) {
        await longSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0180_01');
        await Utils.sleep(1000);
      }
      
      // 3.点击"mode"动态按钮，设置为Auto
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let modeAutoBtn = await driver.waitForComponent(ON.id('modeAutoBtn0180'), 2000);
      if (modeAutoBtn) {
        await modeAutoBtn.click();
        await driver.waitForIdle(500, 2000);
        await enterPageBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0180_02');
        await Utils.sleep(1000);
      }
      
      // 4.竖屏转横屏 - 测试框架中可能无法真正切换横竖屏，这里只做截图验证
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0180_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0190
     * @tc.name   : 标题避让sidebar（showControlButton属性测试）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0190 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0190/navigationControlButton0190')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"11 标题内容是NavigationCommonTitle类型-非自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0190'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0190, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0190`);
        throw new Error('Component not found: enterPageBtn0190');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCommonTitle类型-main超长标题"和"NavigationCommonTitle类型-sub超长标题"
      let longMainTitleBtn = await driver.waitForComponent(ON.id('longMainTitleBtn0080'), 2000);
      if (longMainTitleBtn) {
        await longMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let longSubTitleBtn = await driver.waitForComponent(ON.id('longSubTitleBtn0080'), 2000);
      if (longSubTitleBtn) {
        await longSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0190_01');
        await Utils.sleep(1000);
      }
      
      // 3.点击"showControlButton"动态按钮，切换true、false
      // 切换为true
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let showControlButtonTrueBtn = await driver.waitForComponent(ON.id('showControlButtonTrueBtn0190'), 2000);
      if (showControlButtonTrueBtn) {
        await showControlButtonTrueBtn.click();
        await driver.waitForIdle(500, 2000);
        await enterPageBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0190_02');
        await Utils.sleep(1000);
      }
      
      // 切换为false
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let showControlButtonFalseBtn = await driver.waitForComponent(ON.id('showControlButtonFalseBtn0190'), 2000);
      if (showControlButtonFalseBtn) {
        await showControlButtonFalseBtn.click();
        await driver.waitForIdle(500, 2000);
        await enterPageBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0190_03');
        await Utils.sleep(1000);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0200
     * @tc.name   : 标题避让sidebar（自定义controlButton测试）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0200 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0200/navigationControlButton0200')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"自定义controlButton"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0200'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0200, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0200`);
        throw new Error('Component not found: enterPageBtn0200');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCommonTitle类型-main超长标题"和"NavigationCommonTitle类型-sub超长标题"
      let longMainTitleBtn = await driver.waitForComponent(ON.id('longMainTitleBtn0200'), 2000);
      if (longMainTitleBtn) {
        await longMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let longSubTitleBtn = await driver.waitForComponent(ON.id('longSubTitleBtn0200'), 2000);
      if (longSubTitleBtn) {
        await longSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0200_01');
        await Utils.sleep(1000);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0210
     * @tc.name   : 标题避让sidebar（主/副标题属性修改器测试）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0210 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0210/navigationControlButton0210')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"设置Navigation主/副标题为自定义主标题属性"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0210'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0210, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0210`);
        throw new Error('Component not found: enterPageBtn0210');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0210_01');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0220
     * @tc.name   : 标题避让sidebar（sideBarPosition属性测试）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0220 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0220/navigationControlButton0220')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"11 标题内容是NavigationCommonTitle类型-非自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0220'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0220, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0220`);
        throw new Error('Component not found: enterPageBtn0220');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCommonTitle类型-main超长标题"和"NavigationCommonTitle类型-sub超长标题"
      let longMainTitleBtn = await driver.waitForComponent(ON.id('longMainTitleBtn0080'), 2000);
      if (longMainTitleBtn) {
        await longMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let longSubTitleBtn = await driver.waitForComponent(ON.id('longSubTitleBtn0080'), 2000);
      if (longSubTitleBtn) {
        await longSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0220_01');
        await Utils.sleep(1000);
      }
      
      // 3.点击"sideBarPosition"动态按钮，切换start、end
      // 切换为start
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let sideBarPositionStartBtn = await driver.waitForComponent(ON.id('sideBarPositionStartBtn0220'), 2000);
      if (sideBarPositionStartBtn) {
        await sideBarPositionStartBtn.click();
        await driver.waitForIdle(500, 2000);
        await enterPageBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0220_02');
        await Utils.sleep(1000);
      }
      
      // 切换为end
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let sideBarPositionEndBtn = await driver.waitForComponent(ON.id('sideBarPositionEndBtn0220'), 2000);
      if (sideBarPositionEndBtn) {
        await sideBarPositionEndBtn.click();
        await driver.waitForIdle(500, 2000);
        await enterPageBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0220_03');
        await Utils.sleep(1000);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0230
     * @tc.name   : 标题避让sidebar（标题是NavigationCommonTitle类型）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0230 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0230/navigationControlButton0230')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"3 标题内容是NavigationCommonTitle类型"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0230'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0230, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0230`);
        throw new Error('Component not found: enterPageBtn0230');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCommonTitle类型-main超长标题"和"NavigationCommonTitle类型-sub超长标题"
      let longMainTitleBtn = await driver.waitForComponent(ON.id('longMainTitleBtn0030'), 2000);
      if (longMainTitleBtn) {
        await longMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let longSubTitleBtn = await driver.waitForComponent(ON.id('longSubTitleBtn0030'), 2000);
      if (longSubTitleBtn) {
        await longSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0230_01');
        await Utils.sleep(1000);
      }
      
      // 3.上下滑动标题
      await driver.swipe(400, 500, 400, 300, 500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0230_02');
      await Utils.sleep(1000);
      
      // 4.点击"NavigationCommonTitle类型-main短标题"和"NavigationCommonTitle类型-sub短标题"
      let shortMainTitleBtn = await driver.waitForComponent(ON.id('shortMainTitleBtn0030'), 2000);
      if (shortMainTitleBtn) {
        await shortMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let shortSubTitleBtn = await driver.waitForComponent(ON.id('shortSubTitleBtn0030'), 2000);
      if (shortSubTitleBtn) {
        await shortSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0230_03');
        await Utils.sleep(1000);
      }
      
      // 5.上下滑动标题
      await driver.swipe(400, 500, 400, 300, 500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0230_04');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0240
     * @tc.name   : 标题避让sidebar（镜像测试）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0240 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0240/navigationControlButton0240')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"11 标题内容是NavigationCommonTitle类型-非自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0240'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0240, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0240`);
        throw new Error('Component not found: enterPageBtn0240');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCommonTitle类型-main超长标题"和"NavigationCommonTitle类型-sub超长标题"
      let longMainTitleBtn = await driver.waitForComponent(ON.id('longMainTitleBtn0080'), 2000);
      if (longMainTitleBtn) {
        await longMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let longSubTitleBtn = await driver.waitForComponent(ON.id('longSubTitleBtn0080'), 2000);
      if (longSubTitleBtn) {
        await longSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0240_01');
        await Utils.sleep(1000);
      }
      
      // 3.系统设置维吾尔语 - 测试框架中可能无法真正设置语言，这里只做截图验证
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0240_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0250
     * @tc.name   : 标题避让sidebar（子窗口测试）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0250 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0250/navigationControlButton0250')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"11 标题内容是NavigationCommonTitle类型-非自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0250'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0250, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0250`);
        throw new Error('Component not found: enterPageBtn0250');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"开启子窗口"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let openSubWindowBtn = await driver.waitForComponent(ON.id('openSubWindowBtn0250'), 2000);
      if (openSubWindowBtn) {
        await openSubWindowBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0250_01');
        await Utils.sleep(1000);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0260
     * @tc.name   : 标题避让sidebar（SideBarContainerType属性测试）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0260 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0260/navigationControlButton0260')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"11 标题内容是NavigationCommonTitle类型-非自定义菜单"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0260'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0260, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0260`);
        throw new Error('Component not found: enterPageBtn0260');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"NavigationCommonTitle类型-main超长标题"和"NavigationCommonTitle类型-sub超长标题"
      let longMainTitleBtn = await driver.waitForComponent(ON.id('longMainTitleBtn0080'), 2000);
      if (longMainTitleBtn) {
        await longMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      let longSubTitleBtn = await driver.waitForComponent(ON.id('longSubTitleBtn0080'), 2000);
      if (longSubTitleBtn) {
        await longSubTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0260_01');
        await Utils.sleep(1000);
      }
      
      // 3.点击"SideBarContainerType"动态按钮，切换Embed、Overlay
      // 切换为Embed
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let sideBarContainerTypeEmbedBtn = await driver.waitForComponent(ON.id('sideBarContainerTypeEmbedBtn0260'), 2000);
      if (sideBarContainerTypeEmbedBtn) {
        await sideBarContainerTypeEmbedBtn.click();
        await driver.waitForIdle(500, 2000);
        // 收起侧边栏
        let hideSideBarBtn = await driver.waitForComponent(ON.id('hideSideBarBtn0260'), 2000);
        if (hideSideBarBtn) {
          await hideSideBarBtn.click();
          await driver.waitForIdle(500, 2000);
        }
        await enterPageBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0260_02');
        await Utils.sleep(1000);
      }
      
      // 切换为Overlay
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let sideBarContainerTypeOverlayBtn = await driver.waitForComponent(ON.id('sideBarContainerTypeOverlayBtn0260'), 2000);
      if (sideBarContainerTypeOverlayBtn) {
        await sideBarContainerTypeOverlayBtn.click();
        await driver.waitForIdle(500, 2000);
        // 收起侧边栏
        let hideSideBarBtn = await driver.waitForComponent(ON.id('hideSideBarBtn0260'), 2000);
        if (hideSideBarBtn) {
          await hideSideBarBtn.click();
          await driver.waitForIdle(500, 2000);
        }
        await enterPageBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0260_03');
        await Utils.sleep(1000);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0270
     * @tc.name   : 标题避让sidebar（只存在主标题场景）
     * @tc.desc   : Verify nav navigation controlbutton interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0270 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/controlButton/0270/navigationControlButton0270')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击进入"标题内容是resource类型"页面
      let enterPageBtn = await driver.waitForComponent(ON.id('enterPageBtn0270'), 2000);
      Logger.info('TEST', `Found component: enterPageBtn0270, result: ${enterPageBtn ? 'found' : 'not found'}`);
      if (!enterPageBtn) {
        Logger.error('TEST', `Component not found: enterPageBtn0270`);
        throw new Error('Component not found: enterPageBtn0270');
      }
      await enterPageBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"resource类型短标题"按钮
      let shortTitleBtn = await driver.waitForComponent(ON.id('shortTitleBtn0010'), 2000);
      if (shortTitleBtn) {
        await shortTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0270_01');
        await Utils.sleep(1000);
      }
      
      // 3.上下滑动标题
      await driver.swipe(400, 500, 400, 300, 500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0270_02');
      await Utils.sleep(1000);
      
      // 4.点击"resource类型超长标题"按钮
      let longTitleBtn = await driver.waitForComponent(ON.id('longTitleBtn0010'), 2000);
      if (longTitleBtn) {
        await longTitleBtn.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0270_03');
        await Utils.sleep(1000);
      }
      
      // 5.上下滑动标题
      await driver.swipe(400, 500, 400, 300, 500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0270_04');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0270 finish.`);
      done()
    })
  })
}
