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
import { window } from '@kit.ArkUI';
import { i18n } from '@kit.LocalizationKit';

export default function navigationFeatureTest() {

  describe('navigationFeatureTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0010
     * @tc.name   : NavigationCommonTitle传入有效Modifier，Full模式下，主副字体样式变化
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0010 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(300, 1000);
      
      // 1.点击mainTitle modifier"设置正常Modifier"按钮
      let mainTitleModifierBtn = await driver.findComponent(ON.id('mainTitleModifierBtn_01'));
      await mainTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      
      // 2.点击subTitle modifier"设置正常Modifier"按钮
      let subTitleModifierBtn = await driver.findComponent(ON.id('subTitleModifierBtn_01'));
      await subTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0010_01');
      await Utils.sleep(500);
      
      // 3.点击mainTitle useStyle开关
      let mainTitleUseStyleBtn = await driver.findComponent(ON.id('mainTitleUseStyleBtn_01'));
      await mainTitleUseStyleBtn.click();
      await driver.waitForIdle(300, 1000);
      
      // 4.点击subTitle useStyle开关
      let subTitleUseStyleBtn = await driver.findComponent(ON.id('subTitleUseStyleBtn_01'));
      await subTitleUseStyleBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0010_02');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0020
     * @tc.name   : NavigationCommonTitle传入有效Modifier，Full模式下，主副字体样式变化，更改标题内容变化
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0020 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(300, 1000);
      
      // 1.点击mainTitle modifier"设置正常Modifier"按钮
      let mainTitleModifierBtn = await driver.findComponent(ON.id('mainTitleModifierBtn_02'));
      await mainTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      
      // 2.点击subTitle modifier"设置正常Modifier"按钮
      let subTitleModifierBtn = await driver.findComponent(ON.id('subTitleModifierBtn_02'));
      await subTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0020_01');
      await Utils.sleep(500);
      
      // 3.连续点击"更改主标题内容"（减少到2次，只截图最后一次）
      let changeMainTitleBtn = await driver.findComponent(ON.id('changeMainTitleBtn_02'));
      for (let i = 0; i < 2; i++) {
        await changeMainTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0020_02');
      await Utils.sleep(500);
      
      // 4.连续点击"更改副标题内容"（减少到2次，只截图最后一次）
      let changeSubTitleBtn = await driver.findComponent(ON.id('changeSubTitleBtn_02'));
      for (let i = 0; i < 2; i++) {
        await changeSubTitleBtn.click();
        await driver.waitForIdle(300, 1000);
      }
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0020_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0030
     * @tc.name   : NavigationCommonTitle传入有效Modifier，Free模式下，主副字体样式变化
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0030 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击"Free"按钮
      let freeModeBtn = await driver.findComponent(ON.id('freeModeBtn_03'));
      await freeModeBtn.click();
      await driver.waitForIdle(300, 1000);
      
      // 1.点击mainTitle modifier"设置正常Modifier"按钮
      let mainTitleModifierBtn = await driver.findComponent(ON.id('mainTitleModifierBtn_03'));
      await mainTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      
      // 2.点击subTitle modifier"设置正常Modifier"按钮
      let subTitleModifierBtn = await driver.findComponent(ON.id('subTitleModifierBtn_03'));
      await subTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0030_01');
      await Utils.sleep(500);
      
      // 3.下拉界面
      await driver.swipe(500, 800, 500, 400, 500);
      await driver.waitForIdle(300, 1000);
      
      // 4.上滑界面
      await driver.swipe(500, 400, 500, 800, 500);
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0030_02');
      await Utils.sleep(500);
      
      // 5.点击mainTitle useStyle开关
      let mainTitleUseStyleBtn = await driver.findComponent(ON.id('mainTitleUseStyleBtn_03'));
      await mainTitleUseStyleBtn.click();
      await driver.waitForIdle(300, 1000);
      
      // 6.点击subTitle useStyle开关
      let subTitleUseStyleBtn = await driver.findComponent(ON.id('subTitleUseStyleBtn_03'));
      await subTitleUseStyleBtn.click();
      await driver.waitForIdle(300, 1000);
      
      // 7.下拉界面（验证样式变化后的滚动效果）
      await driver.swipe(500, 800, 500, 400, 500);
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0030_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0040
     * @tc.name   : NavigationCommonTitle传入有效Modifier，Mini模式下，主副字体样式变化
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0040 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击"Mini"按钮
      let miniModeBtn = await driver.findComponent(ON.id('miniModeBtn_04'));
      await miniModeBtn.click();
      await driver.waitForIdle(300, 1000);
      
      // 1.点击mainTitle modifier"设置正常Modifier"按钮
      let mainTitleModifierBtn = await driver.findComponent(ON.id('mainTitleModifierBtn_04'));
      await mainTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0040_01');
      await Utils.sleep(500);
      
      // 2.点击subTitle modifier"设置正常Modifier"按钮
      let subTitleModifierBtn = await driver.findComponent(ON.id('subTitleModifierBtn_04'));
      await subTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0040_02');
      await Utils.sleep(500);
      
      // 3.点击mainTitle useStyle开关
      let mainTitleUseStyleBtn = await driver.findComponent(ON.id('mainTitleUseStyleBtn_04'));
      await mainTitleUseStyleBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0040_03');
      await Utils.sleep(500);
      
      // 4.点击subTitle useStyle开关
      let subTitleUseStyleBtn = await driver.findComponent(ON.id('subTitleUseStyleBtn_04'));
      await subTitleUseStyleBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0040_04');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0050
     * @tc.name   : NavigationCommonTitle传入有效Modifier，主副字体样式变化，标题栏隐藏再显示，字体样式不发生改变
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0050 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(300, 1000);
      
      // 1.点击mainTitle modifier"设置正常Modifier"按钮
      let mainTitleModifierBtn = await driver.findComponent(ON.id('mainTitleModifierBtn_05'));
      await mainTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0050_01');
      await Utils.sleep(500);
      
      // 2.点击subTitle modifier"设置正常Modifier"按钮
      let subTitleModifierBtn = await driver.findComponent(ON.id('subTitleModifierBtn_05'));
      await subTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0050_02');
      await Utils.sleep(500);
      
      // 3.点击"enableSubTitle"按钮
      let enableSubTitleBtn = await driver.findComponent(ON.id('enableSubTitleBtn_05'));
      await enableSubTitleBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0050_03');
      await Utils.sleep(500);
      
      // 4.点击"enableSubTitle"按钮
      await enableSubTitleBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0050_04');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0060
     * @tc.name   : navigation嵌套子窗，NavigationCommonTitle传入有效Modifier，更改主副标题样式生效
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0060 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击"开启子窗口"按钮
      let openSubWindowBtn = await driver.findComponent(ON.id('openSubWindowBtn_06'));
      await openSubWindowBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击mainTitle modifier"设置正常Modifier"按钮
      let mainTitleModifierBtn = await driver.findComponent(ON.id('mainTitleModifierBtn_06'));
      await mainTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0060_01');
      await Utils.sleep(500);
      
      // 2.点击subTitle modifier"设置正常Modifier"按钮
      let subTitleModifierBtn = await driver.findComponent(ON.id('subTitleModifierBtn_06'));
      await subTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0060_02');
      await Utils.sleep(500);
      
      // 3.点击mainTitle useStyle开关
      let mainTitleUseStyleBtn = await driver.findComponent(ON.id('mainTitleUseStyleBtn_06'));
      await mainTitleUseStyleBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0060_03');
      await Utils.sleep(500);
      
      // 4.点击subTitle useStyle开关
      let subTitleUseStyleBtn = await driver.findComponent(ON.id('subTitleUseStyleBtn_06'));
      await subTitleUseStyleBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0060_04');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0070
     * @tc.name   : navigation嵌套子窗，NavigationCommonTitle传入空Modifier，字体样式为系统默认
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0070 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击"开启子窗口"按钮
      let openSubWindowBtn = await driver.findComponent(ON.id('openSubWindowBtn_07'));
      await openSubWindowBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击mainTitle modifier"空Modifier"按钮
      let mainTitleEmptyModifierBtn = await driver.findComponent(ON.id('mainTitleEmptyModifierBtn_07'));
      await mainTitleEmptyModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0070_01');
      await Utils.sleep(500);
      
      // 2.点击subTitle modifier"空Modifier"按钮
      let subTitleEmptyModifierBtn = await driver.findComponent(ON.id('subTitleEmptyModifierBtn_07'));
      await subTitleEmptyModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0070_02');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0080
     * @tc.name   : navigation嵌套子窗，NavigationCommonTitle传入undefined，字体样式为系统默认
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0080 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature08')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击"开启子窗口"按钮
      let openSubWindowBtn = await driver.findComponent(ON.id('openSubWindowBtn_08'));
      await openSubWindowBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击mainTitle modifier"设为undefined"按钮
      let mainTitleUndefinedBtn = await driver.findComponent(ON.id('mainTitleUndefinedBtn_08'));
      await mainTitleUndefinedBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0080_01');
      await Utils.sleep(500);
      
      // 2.点击subTitle modifier"设为undefined"按钮
      let subTitleUndefinedBtn = await driver.findComponent(ON.id('subTitleUndefinedBtn_08'));
      await subTitleUndefinedBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0080_02');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0090
     * @tc.name   : navigation嵌套子窗，NavigationCommonTitle传入null，字体样式为系统默认
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0090 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 点击"开启子窗口"按钮
      let openSubWindowBtn = await driver.findComponent(ON.id('openSubWindowBtn_09'));
      await openSubWindowBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击mainTitle modifier"设为null"按钮
      let mainTitleNullBtn = await driver.findComponent(ON.id('mainTitleNullBtn_09'));
      await mainTitleNullBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0090_01');
      await Utils.sleep(500);
      
      // 2.点击subTitle modifier"设为null"按钮
      let subTitleNullBtn = await driver.findComponent(ON.id('subTitleNullBtn_09'));
      await subTitleNullBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0090_02');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0100
     * @tc.name   : NavigationCommonTitle传入空Modifier，字体样式为系统默认
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0100 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature10')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击mainTitle modifier"空Modifier"按钮
      let mainTitleEmptyModifierBtn = await driver.findComponent(ON.id('mainTitleEmptyModifierBtn_10'));
      await mainTitleEmptyModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0100_01');
      await Utils.sleep(500);
      
      // 2.点击subTitle modifier"空Modifier"按钮
      let subTitleEmptyModifierBtn = await driver.findComponent(ON.id('subTitleEmptyModifierBtn_10'));
      await subTitleEmptyModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0100_02');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0110
     * @tc.name   : NavigationCommonTitle传入undefined，字体样式为系统默认
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0110 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击mainTitle modifier"设为undefined"按钮
      let mainTitleUndefinedBtn = await driver.findComponent(ON.id('mainTitleUndefinedBtn_11'));
      await mainTitleUndefinedBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0110_01');
      await Utils.sleep(500);
      
      // 2.点击subTitle modifier"设为undefined"按钮
      let subTitleUndefinedBtn = await driver.findComponent(ON.id('subTitleUndefinedBtn_11'));
      await subTitleUndefinedBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0110_02');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0120
     * @tc.name   : NavigationCommonTitle传入null，字体样式为系统默认
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0120 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature12')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击mainTitle modifier"设为null"按钮
      let mainTitleNullBtn = await driver.findComponent(ON.id('mainTitleNullBtn_12'));
      await mainTitleNullBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0120_01');
      await Utils.sleep(500);
      
      // 2.点击subTitle modifier"设为null"按钮
      let subTitleNullBtn = await driver.findComponent(ON.id('subTitleNullBtn_12'));
      await subTitleNullBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0120_02');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0130
     * @tc.name   : NavigationCommonTitle类型title，镜像测试，系统语言设为维吾尔语，字体样式跟随镜像变化
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0130 start.`);
      try {
        // 设置系统语言为维吾尔语
        await i18n.System.setSystemLanguage('ug');
      } catch (e) {
        Logger.error('TEST', `Failed to set system language: ${JSON.stringify(e)}`);
      }
      
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature13')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(300, 1000);
      
      // 1.点击mainTitle modifier"设置正常Modifier"按钮
      let mainTitleModifierBtn = await driver.findComponent(ON.id('mainTitleModifierBtn_13'));
      await mainTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0130_01');
      await Utils.sleep(500);
      
      // 2.点击subTitle modifier"设置正常Modifier"按钮
      let subTitleModifierBtn = await driver.findComponent(ON.id('subTitleModifierBtn_13'));
      await subTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0130_02');
      await Utils.sleep(500);
      
      // 3.点击mainTitle useStyle开关
      let mainTitleUseStyleBtn = await driver.findComponent(ON.id('mainTitleUseStyleBtn_13'));
      await mainTitleUseStyleBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0130_03');
      await Utils.sleep(500);
      
      // 4.点击subTitle useStyle开关
      let subTitleUseStyleBtn = await driver.findComponent(ON.id('subTitleUseStyleBtn_13'));
      await subTitleUseStyleBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0130_04');
      await Utils.sleep(500);
      
      // 恢复系统语言
      try {
        await i18n.System.setSystemLanguage('zh');
      } catch (e) {
        Logger.error('TEST', `Failed to restore system language: ${JSON.stringify(e)}`);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0140
     * @tc.name   : NavigationCommonTitle传入有效Modifier，主副字体样式变化，息屏解锁，回到后台再返回应用不影响字体样式
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0140 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature14')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(300, 1000);
      
      // 1.点击mainTitle modifier"设置正常Modifier"按钮
      let mainTitleModifierBtn = await driver.findComponent(ON.id('mainTitleModifierBtn_14'));
      await mainTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0140_01');
      await Utils.sleep(500);
      
      // 2.点击subTitle modifier"设置正常Modifier"按钮
      let subTitleModifierBtn = await driver.findComponent(ON.id('subTitleModifierBtn_14'));
      await subTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0140_02');
      await Utils.sleep(500);
      
      // 3.锁屏再解锁 - 这里只能截图验证，无法实际锁屏
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0140_03');
      await Utils.sleep(500);
      
      // 4.回到后台再返回应用 - 这里只能截图验证，无法实际切换
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0140_04');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0150
     * @tc.name   : 页面跳转navdestination页面，传入Modifier字体样式可变化
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0150 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature15')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"push"按钮
      let pushBtn = await driver.findComponent(ON.id('pushBtn_15'));
      await pushBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0150_01');
      await Utils.sleep(500);
      
      // 2.点击mainTitle modifier"设置正常Modifier"按钮
      let mainTitleModifierBtn = await driver.findComponent(ON.id('mainTitleModifierBtn_15'));
      await mainTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0150_02');
      await Utils.sleep(500);
      
      // 3.点击subTitle modifier"设置正常Modifier"按钮
      let subTitleModifierBtn = await driver.findComponent(ON.id('subTitleModifierBtn_15'));
      await subTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0150_03');
      await Utils.sleep(500);
      
      // 4.点击mainTitle useStyle开关
      let mainTitleUseStyleBtn = await driver.findComponent(ON.id('mainTitleUseStyleBtn_15'));
      await mainTitleUseStyleBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0150_04');
      await Utils.sleep(500);
      
      // 5.点击subTitle useStyle开关
      let subTitleUseStyleBtn = await driver.findComponent(ON.id('subTitleUseStyleBtn_15'));
      await subTitleUseStyleBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0150_05');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0160
     * @tc.name   : ResourceStr类型title，传入有效Modifier，可改变标题样式
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0160 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature16')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(300, 1000);
      
      // 1.点击mainTitle modifier"设置正常Modifier"按钮
      let mainTitleModifierBtn = await driver.findComponent(ON.id('mainTitleModifierBtn_16'));
      await mainTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0160_01');
      await Utils.sleep(500);
      
      // 2.点击mainTitle useStyle开关
      let mainTitleUseStyleBtn = await driver.findComponent(ON.id('mainTitleUseStyleBtn_16'));
      await mainTitleUseStyleBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0160_02');
      await Utils.sleep(500);
      
      // 3.点击"Free"模式，上下拉动页面
      let freeModeBtn = await driver.findComponent(ON.id('freeModeBtn_16'));
      await freeModeBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 下拉
      await driver.swipe(500, 800, 500, 400, 500);
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0160_03');
      await Utils.sleep(500);
      
      // 上拉
      await driver.swipe(500, 400, 500, 800, 500);
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0160_04');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0170
     * @tc.name   : ResourceStr类型title，传入空Modifier，标题样式为系统默认
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0170 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature17')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(300, 1000);
      
      // 1.点击mainTitle modifier"设置正常Modifier"按钮
      let mainTitleModifierBtn = await driver.findComponent(ON.id('mainTitleModifierBtn_17'));
      await mainTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0170_01');
      await Utils.sleep(500);
      
      // 2.点击"空Modifier"
      let emptyModifierBtn = await driver.findComponent(ON.id('emptyModifierBtn_17'));
      await emptyModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0170_02');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0180
     * @tc.name   : ResourceStr类型title，Modifier传入undefined，标题样式为系统默认
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0180 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature18')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(300, 1000);
      
      // 1.点击mainTitle modifier"设置正常Modifier"按钮
      let mainTitleModifierBtn = await driver.findComponent(ON.id('mainTitleModifierBtn_18'));
      await mainTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0180_01');
      await Utils.sleep(500);
      
      // 2.点击"设为undefined"
      let undefinedBtn = await driver.findComponent(ON.id('undefinedBtn_18'));
      await undefinedBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0180_02');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0190
     * @tc.name   : ResourceStr类型title，Modifier传入null，标题样式为系统默认
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0190 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature19')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(300, 1000);
      
      // 1.点击mainTitle modifier"设置正常Modifier"按钮
      let mainTitleModifierBtn = await driver.findComponent(ON.id('mainTitleModifierBtn_19'));
      await mainTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0190_01');
      await Utils.sleep(500);
      
      // 2.点击"设为null"
      let nullBtn = await driver.findComponent(ON.id('nullBtn_19'));
      await nullBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0190_02');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0200
     * @tc.name   : ResourceStr类型title，镜像测试，系统语言设为维吾尔语，字体样式跟随镜像变化
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0200 start.`);
      try {
        // 设置系统语言为维吾尔语
        await i18n.System.setSystemLanguage('ug');
      } catch (e) {
        Logger.error('TEST', `Failed to set system language: ${JSON.stringify(e)}`);
      }
      
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature20')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(300, 1000);
      
      // 1.点击mainTitle modifier"设置正常Modifier"按钮
      let mainTitleModifierBtn = await driver.findComponent(ON.id('mainTitleModifierBtn_20'));
      await mainTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0200');
      await Utils.sleep(500);
      
      // 恢复系统语言
      try {
        await i18n.System.setSystemLanguage('zh');
      } catch (e) {
        Logger.error('TEST', `Failed to restore system language: ${JSON.stringify(e)}`);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0210
     * @tc.name   : 自定义类型title，传入有效Modifier，不可改变标题样式
     * @tc.desc   : Verify nav navigation featuretest interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0210 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navFeature21')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(300, 1000);
      
      // 1.点击mainTitle modifier"设置正常Modifier"按钮
      let mainTitleModifierBtn = await driver.findComponent(ON.id('mainTitleModifierBtn_21'));
      await mainTitleModifierBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0210_01');
      await Utils.sleep(500);
      
      // 2.点击mainTitle useStyle开关
      let mainTitleUseStyleBtn = await driver.findComponent(ON.id('mainTitleUseStyleBtn_21'));
      await mainTitleUseStyleBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0210_02');
      await Utils.sleep(500);
      
      // 3.点击"Free"模式，上下拉动页面
      let freeModeBtn = await driver.findComponent(ON.id('freeModeBtn_21'));
      await freeModeBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 下拉
      await driver.swipe(500, 800, 500, 400, 500);
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0210_03');
      await Utils.sleep(500);
      
      // 上拉
      await driver.swipe(500, 400, 500, 800, 500);
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0210_04');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0210 finish.`);
      done()
    })
  })
}
