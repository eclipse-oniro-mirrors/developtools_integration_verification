/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
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

export default function navigationEnableModeChangeAnimationTest() {

  describe('navigationEnableModeChangeAnimationTest', () => {
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
      await Settings.changeWindowOrientation('end')
      await driver.waitForIdle(500, 2000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0010
     * @tc.name   : Navigation支持关闭单双栏切换动效（enableModeChangeAnimation正常值测试）
     * @tc.desc   : Verify nav navigation enablemodechangeanimation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0010 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navEnableModeChangeAnimation01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.进入"Navigation支持关闭单双栏切换动效"页面
      // 2.点击"基础场景"按钮
      let basicSceneBtn = await driver.findComponent(ON.id('basicSceneBtn_01'));
      await basicSceneBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0010_01');
      await Utils.sleep(500);
      
      // 3.点击"enableModeChangeAnimation：xx"按钮，设置为true
      let enableModeChangeAnimationTrueBtn = await driver.findComponent(ON.id('enableModeChangeAnimationTrueBtn_01'));
      await enableModeChangeAnimationTrueBtn.click();
      await driver.waitForIdle(300, 1000);
      
      // 4.连续切换点击"NavigationMode：Split"、"NavigationMode：Stack"按钮
      let navigationModeSplitBtn = await driver.findComponent(ON.id('navigationModeSplitBtn_01'));
      await navigationModeSplitBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0010_02');
      await Utils.sleep(500);
      
      let navigationModeStackBtn = await driver.findComponent(ON.id('navigationModeStackBtn_01'));
      await navigationModeStackBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0010_03');
      await Utils.sleep(500);
      
      // 设置为false
      let enableModeChangeAnimationFalseBtn = await driver.findComponent(ON.id('enableModeChangeAnimationFalseBtn_01'));
      await enableModeChangeAnimationFalseBtn.click();
      await driver.waitForIdle(300, 1000);
      
      await navigationModeSplitBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0010_04');
      await Utils.sleep(500);
      
      await navigationModeStackBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0010_05');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0020
     * @tc.name   : Navigation支持关闭单双栏切换动效（enableModeChangeAnimation异常值测试）
     * @tc.desc   : Verify nav navigation enablemodechangeanimation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0020 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navEnableModeChangeAnimation02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.进入"Navigation支持关闭单双栏切换动效"页面
      // 2.点击"基础场景"按钮
      let basicSceneBtn = await driver.findComponent(ON.id('basicSceneBtn_02'));
      await basicSceneBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0020_01');
      await Utils.sleep(500);
      
      // 3.点击"enableModeChangeAnimation：xx"按钮，设置为undefined
      let enableModeChangeAnimationUndefinedBtn = await driver.findComponent(ON.id('enableModeChangeAnimationUndefinedBtn_02'));
      await enableModeChangeAnimationUndefinedBtn.click();
      await driver.waitForIdle(300, 1000);
      
      // 4.连续切换点击"NavigationMode：Split"、"NavigationMode：Stack"按钮
      let navigationModeSplitBtn = await driver.findComponent(ON.id('navigationModeSplitBtn_02'));
      await navigationModeSplitBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0020_02');
      await Utils.sleep(500);
      
      let navigationModeStackBtn = await driver.findComponent(ON.id('navigationModeStackBtn_02'));
      await navigationModeStackBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0020_03');
      await Utils.sleep(500);
      
      // 设置为null
      let enableModeChangeAnimationNullBtn = await driver.findComponent(ON.id('enableModeChangeAnimationNullBtn_02'));
      await enableModeChangeAnimationNullBtn.click();
      await driver.waitForIdle(300, 1000);
      
      await navigationModeSplitBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0020_04');
      await Utils.sleep(500);
      
      await navigationModeStackBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0020_05');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0030
     * @tc.name   : Navigation支持关闭单双栏切换动效（Auto模式，横竖屏切换测试）
     * @tc.desc   : Verify nav navigation enablemodechangeanimation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0030 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navEnableModeChangeAnimation03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.进入"Navigation支持关闭单双栏切换动效"页面
      // 2.点击"基础场景"按钮
      let basicSceneBtn = await driver.findComponent(ON.id('basicSceneBtn_03'));
      await basicSceneBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0030_01');
      await Utils.sleep(500);
      
      // 3.点击"enableModeChangeAnimation：xx"按钮，设置为false
      let enableModeChangeAnimationFalseBtn = await driver.findComponent(ON.id('enableModeChangeAnimationFalseBtn_03'));
      await enableModeChangeAnimationFalseBtn.click();
      await driver.waitForIdle(300, 1000);
      
      // 4.点击"NavigationMode：Auto"按钮
      let navigationModeAutoBtn = await driver.findComponent(ON.id('navigationModeAutoBtn_03'));
      await navigationModeAutoBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0030_02');
      await Utils.sleep(500);
      
      // 5.竖屏转横屏
      await Settings.changeWindowOrientation('landscape');
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0030_03');
      await Utils.sleep(500);
      
      // 6.横屏转竖屏
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0030_04');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0040
     * @tc.name   : Navigation支持关闭单双栏切换动效（Stack切换Split、Split切换Stack场景测试）
     * @tc.desc   : Verify nav navigation enablemodechangeanimation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0040 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navEnableModeChangeAnimation04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.进入"Navigation支持关闭单双栏切换动效"页面
      // 2.点击"基础场景"按钮
      let basicSceneBtn = await driver.findComponent(ON.id('basicSceneBtn_04'));
      await basicSceneBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0040_01');
      await Utils.sleep(500);
      
      // 3.点击"enableModeChangeAnimation：xx"按钮，设置为false
      let enableModeChangeAnimationFalseBtn = await driver.findComponent(ON.id('enableModeChangeAnimationFalseBtn_04'));
      await enableModeChangeAnimationFalseBtn.click();
      await driver.waitForIdle(300, 1000);
      
      // 4.连续切换点击"NavigationMode：Split"、"NavigationMode：Stack"按钮
      let navigationModeSplitBtn = await driver.findComponent(ON.id('navigationModeSplitBtn_04'));
      await navigationModeSplitBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0040_02');
      await Utils.sleep(500);
      
      let navigationModeStackBtn = await driver.findComponent(ON.id('navigationModeStackBtn_04'));
      await navigationModeStackBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0040_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0050
     * @tc.name   : Navigation支持关闭单双栏切换动效（Stack切换Auto、Auto切换Stack场景测试）
     * @tc.desc   : Verify nav navigation enablemodechangeanimation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0050 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navEnableModeChangeAnimation05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.进入"Navigation支持关闭单双栏切换动效"页面
      // 2.点击"基础场景"按钮
      let basicSceneBtn = await driver.findComponent(ON.id('basicSceneBtn_05'));
      await basicSceneBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0050_01');
      await Utils.sleep(500);
      
      // 3.点击"enableModeChangeAnimation：xx"按钮，设置为false
      let enableModeChangeAnimationFalseBtn = await driver.findComponent(ON.id('enableModeChangeAnimationFalseBtn_05'));
      await enableModeChangeAnimationFalseBtn.click();
      await driver.waitForIdle(300, 1000);
      
      // 4.点击"NavigationMode：Auto"按钮
      let navigationModeAutoBtn = await driver.findComponent(ON.id('navigationModeAutoBtn_05'));
      await navigationModeAutoBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0050_02');
      await Utils.sleep(500);
      
      // 5.竖屏转横屏
      await Settings.changeWindowOrientation('landscape');
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0050_03');
      await Utils.sleep(500);
      
      // 6.点击"NavigationMode：Stack"按钮
      let navigationModeStackBtn = await driver.findComponent(ON.id('navigationModeStackBtn_05'));
      await navigationModeStackBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0050_04');
      await Utils.sleep(500);
      
      // 7.点击"NavigationMode：Auto"按钮
      await navigationModeAutoBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0050_05');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0060
     * @tc.name   : Navigation支持关闭单双栏切换动效（Split切换Auto、Auto切换Split场景测试）
     * @tc.desc   : Verify nav navigation enablemodechangeanimation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0060 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navEnableModeChangeAnimation06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.进入"Navigation支持关闭单双栏切换动效"页面
      // 2.点击"基础场景"按钮
      let basicSceneBtn = await driver.findComponent(ON.id('basicSceneBtn_06'));
      await basicSceneBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0060_01');
      await Utils.sleep(500);
      
      // 3.点击"enableModeChangeAnimation：xx"按钮，设置为false
      let enableModeChangeAnimationFalseBtn = await driver.findComponent(ON.id('enableModeChangeAnimationFalseBtn_06'));
      await enableModeChangeAnimationFalseBtn.click();
      await driver.waitForIdle(300, 1000);
      
      // 4.点击"NavigationMode：Split"按钮
      let navigationModeSplitBtn = await driver.findComponent(ON.id('navigationModeSplitBtn_06'));
      await navigationModeSplitBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0060_02');
      await Utils.sleep(500);
      
      // 5.点击"NavigationMode：Auto"按钮
      let navigationModeAutoBtn = await driver.findComponent(ON.id('navigationModeAutoBtn_06'));
      await navigationModeAutoBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0060_03');
      await Utils.sleep(500);
      
      // 6.点击"NavigationMode：Split"按钮
      await navigationModeSplitBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0060_04');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0070
     * @tc.name   : Navigation支持关闭单双栏切换动效（隐藏、显示navbar场景测试）
     * @tc.desc   : Verify nav navigation enablemodechangeanimation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0070 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navEnableModeChangeAnimation07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.进入"Navigation支持关闭单双栏切换动效"页面
      // 2.点击"基础场景"按钮
      let basicSceneBtn = await driver.findComponent(ON.id('basicSceneBtn_07'));
      await basicSceneBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0070_01');
      await Utils.sleep(500);
      
      // 3.点击"enableModeChangeAnimation：xx"按钮，设置为false
      let enableModeChangeAnimationFalseBtn = await driver.findComponent(ON.id('enableModeChangeAnimationFalseBtn_07'));
      await enableModeChangeAnimationFalseBtn.click();
      await driver.waitForIdle(300, 1000);
      
      // 4.竖屏转横屏
      await Settings.changeWindowOrientation('landscape');
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0070_02');
      await Utils.sleep(500);
      
      // 5.点击"hideBar：xx"按钮，设置为true
      let hideBarTrueBtn = await driver.findComponent(ON.id('hideBarTrueBtn_07'));
      await hideBarTrueBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0070_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0080
     * @tc.name   : Navigation支持关闭单双栏切换动效（modifier测试）
     * @tc.desc   : Verify nav navigation enablemodechangeanimation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0080 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navEnableModeChangeAnimation08')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.进入"Navigation支持关闭单双栏切换动效"页面
      // 2.点击"modifier场景"按钮
      let modifierSceneBtn = await driver.findComponent(ON.id('modifierSceneBtn_08'));
      await modifierSceneBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0080_01');
      await Utils.sleep(500);
      
      // 3.连续切换点击"NavigationMode：Split"、"NavigationMode：Stack"按钮
      let navigationModeSplitBtn = await driver.findComponent(ON.id('navigationModeSplitBtn_08'));
      await navigationModeSplitBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0080_02');
      await Utils.sleep(500);
      
      let navigationModeStackBtn = await driver.findComponent(ON.id('navigationModeStackBtn_08'));
      await navigationModeStackBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0080_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0090
     * @tc.name   : Navigation支持关闭单双栏切换动效（单双栏组合场景测试）
     * @tc.desc   : Verify nav navigation enablemodechangeanimation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0090 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navEnableModeChangeAnimation09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.进入"Navigation支持关闭单双栏切换动效"页面
      // 2.点击"基础场景"按钮
      let basicSceneBtn = await driver.findComponent(ON.id('basicSceneBtn_09'));
      await basicSceneBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0090_01');
      await Utils.sleep(500);
      
      // 3.点击"enableModeChangeAnimation：xx"按钮，设置为false
      let enableModeChangeAnimationFalseBtn = await driver.findComponent(ON.id('enableModeChangeAnimationFalseBtn_09'));
      await enableModeChangeAnimationFalseBtn.click();
      await driver.waitForIdle(300, 1000);
      
      // 4.连续切换点击"NavigationMode：Split"、"NavigationMode：Auto"
      let navigationModeSplitBtn = await driver.findComponent(ON.id('navigationModeSplitBtn_09'));
      await navigationModeSplitBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0090_02');
      await Utils.sleep(500);
      
      let navigationModeAutoBtn = await driver.findComponent(ON.id('navigationModeAutoBtn_09'));
      await navigationModeAutoBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0090_03');
      await Utils.sleep(500);
      
      // 5.竖屏转横屏
      await Settings.changeWindowOrientation('landscape');
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0090_04');
      await Utils.sleep(500);
      
      // 6.点击"enableModeChangeAnimation：xx"按钮，设置为true
      let enableModeChangeAnimationTrueBtn = await driver.findComponent(ON.id('enableModeChangeAnimationTrueBtn_09'));
      await enableModeChangeAnimationTrueBtn.click();
      await driver.waitForIdle(300, 1000);
      
      // 7.连续切换点击"NavigationMode：Stack"、"NavigationMode：Split"
      let navigationModeStackBtn = await driver.findComponent(ON.id('navigationModeStackBtn_09'));
      await navigationModeStackBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0090_05');
      await Utils.sleep(500);
      
      await navigationModeSplitBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0090_06');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0090 finish.`);
      done()
    })
  })
}
