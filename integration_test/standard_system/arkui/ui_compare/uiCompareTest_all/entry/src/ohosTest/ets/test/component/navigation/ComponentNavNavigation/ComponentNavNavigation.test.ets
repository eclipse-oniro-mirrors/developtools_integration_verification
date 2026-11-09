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

import { afterEach, describe, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Component, Driver, ON } from '@kit.TestKit'


export default function componentNavNavigation() {

  describe('componentNavNavigation', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_001
     * @tc.name   : Stack模式非自定义标题，标题Full模式不包含副标题，使用中文
     * @tc.desc   : Verify nav navigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_001', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_001 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigation/ComponentNavNavigation001')
      let driver:Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation001_002'),1000);
      await Utils.sleep(1000)
      await Button1.click();
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_001 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_0541
     * @tc.name   : navdestination页面静态设置标题栏为红色颜色
     * @tc.desc   : Verify nav navigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_0541', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_0541 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigation/ComponentNavNavigation0541_001')
      let driver:Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation0541_001'),1000);
      await Button1.click();
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_0541 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_029
     * @tc.name   : Navigation title modes with Chinese input
     * @tc.desc   : Verify Navigation title behavior in Split/Full modes including Chinese character input.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_029', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_029 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigation/ComponentNavNavigation029')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation029_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation029_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation029_003'),1000);
      await Button3.click();
      await driver.waitForIdle(2000,3000)
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_029 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_007
     * @tc.name   : Nav navigation
     * @tc.desc   : Verify nav navigation interface behavior and expected UI result for this case.
     * @tc.type   : In Stack mode, the title is not customizable. In Full mode, the subtitle is included, and both the main title and subtitle are set to display extremely long strings in Chinese characters.
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_007', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_007 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigation/ComponentNavNavigation007')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation007_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation007_002'),1000);
      await Button2.click();
      await driver.waitForIdle(2000,3000)
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_007 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_023
     * @tc.name   : Nav navigation
     * @tc.desc   : Verify nav navigation interface behavior and expected UI result for this case.
     * @tc.type   : In Stack mode, the title in Free mode includes both the main title and subtitle, and they are set to display extremely long strings in Chinese characters.
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_023', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_023 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigation/ComponentNavNavigation023')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation023_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation023_002'),1000);
      await Button2.click();
      await driver.waitForIdle(2000,3000)
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_023 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_045
     * @tc.name   : Nav navigation
     * @tc.desc   : Verify nav navigation interface behavior and expected UI result for this case.
     * @tc.type   : In Split mode, the title in Free mode includes both the main title and subtitle, and Chinese characters are passed in.
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_045', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_045 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigation/ComponentNavNavigation045')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation045_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation045_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation045_003'),1000);
      await Button3.click();
      await driver.waitForIdle(2000,3000)
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_045 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_043
     * @tc.name   : Nav navigation
     * @tc.desc   : Verify nav navigation interface behavior and expected UI result for this case.
     * @tc.type   : In Split mode, the title in Free mode includes only the main title, which is set to display an extremely long string in Chinese characters.
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_043', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_043 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigation/ComponentNavNavigation043')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation043_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation043_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation043_003'),1000);
      await Button3.click();
      await driver.waitForIdle(2000,3000)
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_043 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_037
     * @tc.name   : Nav navigation
     * @tc.desc   : Verify nav navigation interface behavior and expected UI result for this case.
     * @tc.type   : In Split mode, under the mini mode, dynamically toggle the visibility of the back icon, set both the main title and subtitle, and input Chinese characters.
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_037', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_037 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigation/ComponentNavNavigation037')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation037_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation037_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation037_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation037_004'),1000);
      await Button4.click();
      await driver.waitForIdle(2000,3000)
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_037 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_054
     * @tc.name   : Nav navigation
     * @tc.desc   : Verify nav navigation interface behavior and expected UI result for this case.
     * @tc.type   : Set the title bar of the NavDestination page to dynamically switch to blue.
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_054', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_054 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigation/ComponentNavNavigation054_001')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation054_001'),1000);
      await Button1.click();
      await driver.waitForIdle(2000,3000)
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation054_A1'),1000);
      await Button2.click();
      await driver.waitForIdle(2000,3000)
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_054 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_015
     * @tc.name   : Nav navigation
     * @tc.desc   : Verify nav navigation interface behavior and expected UI result for this case.
     * @tc.type   : In Stack mode, dynamically hide the back icon in the mini title bar, set primary and secondary titles, and pass in an extremely long Chinese string.
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_015', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_015 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigation/ComponentNavNavigation015')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation015_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation015_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation015_003'),1000);
      await Button3.click();
      await driver.waitForIdle(2000,3000)
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_015 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_019
     * @tc.name   : Nav navigation
     * @tc.desc   : Verify nav navigation interface behavior and expected UI result for this case.
     * @tc.type   : In Stack mode, the title bar in Free mode only includes the primary title and sets the display for extremely long Chinese strings.
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_019', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_019 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigation/ComponentNavNavigation019')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation019_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentNavNavigation019_001'),1000);
      await Button2.click();
      await driver.waitForIdle(2000,3000)
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_019 finish.`);
      done()
    })


  /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_050
     * @tc.name   : The title bar floats above the content area, and the title bar is set with a background color.
     * @tc.type   : function
     * @tc.desc   : 标题栏悬浮在内容区之上，标题栏设置背景颜色
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_050', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_050 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigation/ComponentNavNavigation050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      // 步骤1：上下滑动内容区
      let swip= await driver.waitForComponent(ON.id('list_content_050'), 2000)
      await swip.scrollToTop()
      await Utils.sleep(500)
      await swip.scrollToBottom()
      await Utils.sleep(500)
      // 步骤2：点击切换barStyle按钮
      let barStylebutton= await driver.waitForComponent(ON.id('button_bar_style_050'), 2000)
      await barStylebutton.click()
      await Utils.sleep(500)
      // 步骤3：点击切换NavigationTitleMode按钮
      let NavigationTitleModebutton= await driver.waitForComponent(ON.id('button_title_mode_050'), 2000)
      await NavigationTitleModebutton.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_0501
     * @tc.name   : The title bar floats above the content area, scroll the content area up and down.
     * @tc.desc   : Verify nav navigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_0501', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_0501 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigation/ComponentNavNavigation0501')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤1：上下滑动内容区
      let swip = await driver.waitForComponent(ON.id('list_content_0501'), 2000)
      await swip.scrollToTop()
      await Utils.sleep(500)
      await swip.scrollToBottom()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_0501_01')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_0501 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_0502
     * @tc.name   : The title bar floats above the content area, scroll the content area and set to stack mode.
     * @tc.desc   : Verify nav navigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_0502', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_0502 start.`);
      Settings.createWindow('testability/pages/component/navigation/ComponentNavNavigation/ComponentNavNavigation0502')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤1：上下滑动内容区
      let swip = await driver.waitForComponent(ON.id('list_content_0502'), 2000)
      await swip.scrollToTop()
      await Utils.sleep(500)
      await swip.scrollToBottom()
      await Utils.sleep(500)
      // 步骤2：点击"barStyle:BarStyle.STACK"按钮
      let barStyleButton = await driver.waitForComponent(ON.id('button_bar_style_0502'), 2000)
      await barStyleButton.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_0502_01')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_0502 finish.`);
      done()
    })


  })
}