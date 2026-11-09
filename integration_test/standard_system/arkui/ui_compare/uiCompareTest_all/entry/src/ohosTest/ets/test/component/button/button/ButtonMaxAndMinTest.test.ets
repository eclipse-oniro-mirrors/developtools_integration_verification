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
import { uiAppearance } from '@kit.ArkUI';
import { Driver, ON, Component } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit'

export default function buttonMaxAndMinTest() {
  describe('buttonMaxAndMinTest', () => {
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
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0010
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0010 start.`);
      // 打开适老化开关到最大（3.2倍）
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);

      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击change size按钮切换不同的字体缩放比例
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_01'), 1000);
      
      // 切换到1.75倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0010_175')
      await Utils.sleep(1000);

      // 切换到2.0倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0010_200')
      await Utils.sleep(1000);

      // 切换到3.2倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0010_320')
      await Utils.sleep(1000);

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0020
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.7，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0020 start.`);
      // 打开适老化开关到最大（3.2倍）
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);

      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击change size按钮切换不同的字体缩放比例
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_02'), 1000);
      
      // 切换到1.75倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0020_175')
      await Utils.sleep(1000);

      // 切换到2.0倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0020_200')
      await Utils.sleep(1000);

      // 切换到3.2倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0020_320')
      await Utils.sleep(1000);

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0030
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0030 start.`);
      // 打开适老化开关到最大（3.2倍）
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);

      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击change size按钮切换不同的字体缩放比例
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_03'), 1000);
      
      // 切换到1.75倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0030_175')
      await Utils.sleep(1000);

      // 切换到2.0倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0030_200')
      await Utils.sleep(1000);

      // 切换到3.2倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0030_320')
      await Utils.sleep(1000);

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0040
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为-1，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0040 start.`);
      // 打开适老化开关到最大（3.2倍）
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);

      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击change size按钮切换不同的字体缩放比例
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_04'), 1000);
      
      // 切换到1.75倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0040_175')
      await Utils.sleep(1000);

      // 切换到2.0倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0040_200')
      await Utils.sleep(1000);

      // 切换到3.2倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0040_320')
      await Utils.sleep(1000);

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0050
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为undefined，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0050 start.`);
      // 打开适老化开关到最大（3.2倍）
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);

      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击change size按钮切换不同的字体缩放比例
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_05'), 1000);
      
      // 切换到1.75倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0050_175')
      await Utils.sleep(1000);

      // 切换到2.0倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0050_200')
      await Utils.sleep(1000);

      // 切换到3.2倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0050_320')
      await Utils.sleep(1000);

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0060
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为null，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0060 start.`);
      // 打开适老化开关到最大（3.2倍）
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);

      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击change size按钮切换不同的字体缩放比例
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_06'), 1000);
      
      // 切换到1.75倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0060_175')
      await Utils.sleep(1000);

      // 切换到2.0倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0060_200')
      await Utils.sleep(1000);

      // 切换到3.2倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0060_320')
      await Utils.sleep(1000);

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0070
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0070 start.`);
      // 打开适老化开关到最大（3.2倍）
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);

      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击change size按钮切换不同的字体缩放比例
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_07'), 1000);
      
      // 切换到1.75倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0070_175')
      await Utils.sleep(1000);

      // 切换到2.0倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0070_200')
      await Utils.sleep(1000);

      // 切换到3.2倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0070_320')
      await Utils.sleep(1000);

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0080
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0080 start.`);
      // 打开适老化开关到最大（3.2倍）
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);

      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin08')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击change size按钮切换不同的字体缩放比例
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_08'), 1000);
      
      // 切换到1.75倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0080_175')
      await Utils.sleep(1000);

      // 切换到2.0倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0080_200')
      await Utils.sleep(1000);

      // 切换到3.2倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0080_320')
      await Utils.sleep(1000);

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0090
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为20，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0090 start.`);
      // 打开适老化开关到最大（3.2倍）
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);

      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击change size按钮切换不同的字体缩放比例
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_09'), 1000);
      
      // 切换到1.75倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0090_175')
      await Utils.sleep(1000);

      // 切换到2.0倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0090_200')
      await Utils.sleep(1000);

      // 切换到3.2倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0090_320')
      await Utils.sleep(1000);

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0100
     * @tc.name   : Button minFontScale和maxFontScale测试 - 不设置minFontScale，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0100 start.`);
      // 打开适老化开关到最大（3.2倍）
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);

      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin10')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击change size按钮切换不同的字体缩放比例
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_10'), 1000);
      
      // 切换到1.75倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0100_175')
      await Utils.sleep(1000);

      // 切换到2.0倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0100_200')
      await Utils.sleep(1000);

      // 切换到3.2倍
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0100_320')
      await Utils.sleep(1000);

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0110
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1.5
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0110 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_11'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0110_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0110_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0110_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0120
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1.75
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0120 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin12')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_12'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0120_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0120_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0120_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0130
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0130 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin13')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_13'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0130_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0130_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0130_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0140
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为-1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0140 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin14')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_14'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0140_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0140_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0140_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0150
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为0
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0150 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin15')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_15'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0150_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0150_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0150_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0160
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为undefined
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0160 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin16')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_16'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0160_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0160_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0160_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0170
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为null
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0170 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin17')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_17'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0170_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0170_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0170_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0180
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0180 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin18')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_18'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0180_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0180_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0180_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0190
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为20
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0190 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin19')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_19'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0190_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0190_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0190_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0200
     * @tc.name   : Button minFontScale和maxFontScale测试 - 不设置minFontScale，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0200 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin20')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_20'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0200_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0200_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0200_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0210
     * @tc.name   : Button minFontScale和maxFontScale测试 - 打开适老化开关，minFontScale为0.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0210 start.`);
      await uiAppearance.setFontScale(1.75);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin21')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_21'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0210_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0210_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0210_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0220
     * @tc.name   : Button minFontScale和maxFontScale测试 - 打开适老化开关到最大，最大只能放大到2倍
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0220 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin22')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_22'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0220_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0220_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0220_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0230
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1，maxFontScale为1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0230 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin23')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_23'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0230_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0230_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0230_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0240
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0240 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin24')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_24'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0240_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0240_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0240_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0250
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.7，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0250 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin25')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_25'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0250_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0250_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0250_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0260
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0260 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin26')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_26'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0260_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0260_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0260_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0270
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为-1，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0270 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin27')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_27'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0270_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0270_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0270_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0280
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为undefined，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0280 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin28')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_28'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0280_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0280_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0280_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0290
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为null，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0290 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin29')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_29'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0290_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0290_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0290_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0300
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0300 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin30')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_30'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0300_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0300_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0300_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0310
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0310 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin31')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_31'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0310_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0310_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0310_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0320
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为20，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0320 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin32')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_32'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0320_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0320_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0320_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0330
     * @tc.name   : Button minFontScale和maxFontScale测试 - 不设置minFontScale，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0330 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin33')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_33'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0330_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0330_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0330_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0340
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1.5
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0340 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin34')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_34'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0340_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0340_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0340_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0350
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1.75
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0350 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin35')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_35'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0350_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0350_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0350_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0360
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0360 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin36')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_36'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0360_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0360_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0360_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0370
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为-1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0370 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin37')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_37'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0370_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0370_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0370_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0380
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为0
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0380 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin38')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_38'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0380_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0380_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0380_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0390
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为undefined
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0390 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin39')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_39'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0390_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0390_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0390_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0400
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为null
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0400 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin40')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_40'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0400_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0400_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0400_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0410
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0410 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin41')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_41'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0410_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0410_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0410_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0420
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为20
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0420 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin42')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_42'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0420_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0420_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0420_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0430
     * @tc.name   : Button minFontScale和maxFontScale测试 - 不设置minFontScale，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0430 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin43')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_43'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0430_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0430_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0430_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0440
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0440 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin44')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_44'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0440_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0440_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0440_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0450
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.7，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0450 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin45')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_45'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0450_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0450_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0450_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0460
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0460 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin46')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_46'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0460_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0460_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0460_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0470
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为-1，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0470 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin47')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_47'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0470_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0470_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0470_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0480
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为undefined，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0480 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin48')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_48'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0480_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0480_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0480_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0490
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为null，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0490 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin49')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_49'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0490_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0490_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0490_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0500
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0500 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin50')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_50'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0500_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0500_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0500_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0510
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0510 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin51')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_51'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0510_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0510_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0510_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0520
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为20，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0520 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin52')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_52'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0520_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0520_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0520_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0530
     * @tc.name   : Button minFontScale和maxFontScale测试 - 不设置minFontScale，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0530 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin53')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_53'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0530_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0530_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0530_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0540
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1.5
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0540 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin54')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_54'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0540_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0540_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0540_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0550
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1.75
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0550 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin55')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_55'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0550_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0550_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0550_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0560
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0560 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin56')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_56'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0560_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0560_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0560_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0560 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0570
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为-1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0570 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin57')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_57'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0570_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0570_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0570_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0580
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为0
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0580 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin58')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_58'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0580_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0580_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0580_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0590
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为undefined
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0590 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin59')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_59'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0590_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0590_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0590_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0600
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为null
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0600 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin60')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_60'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0600_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0600_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0600_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0610
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0610 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin61')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_61'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0610_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0610_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0610_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0610 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0620
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为20
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0620 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin62')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_62'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0620_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0620_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0620_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0620 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0630
     * @tc.name   : Button minFontScale和maxFontScale测试 - 不设置minFontScale，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0630 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin63')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_63'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0630_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0630_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0630_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0630 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0640
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0640 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin64')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_64'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0640_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0640_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0640_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0640 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0650
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.7，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0650 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin65')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_65'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0650_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0650_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0650_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0650 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0660
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0660 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin66')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_66'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0660_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0660_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0660_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0670
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为-1，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0670', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0670 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin67')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_67'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0670_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0670_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0670_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0670 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0680
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为undefined，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0680', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0680 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin68')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_68'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0680_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0680_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0680_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0680 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0690
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为null，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0690', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0690 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin69')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_69'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0690_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0690_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0690_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0690 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0700
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0700 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin70')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_70'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0700_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0700_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0700_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0700 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0710
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0710 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin71')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_71'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0710_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0710_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0710_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0710 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0720
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为20，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0720', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0720 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin72')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_72'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0720_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0720_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0720_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0720 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0730
     * @tc.name   : Button minFontScale和maxFontScale测试 - 不设置minFontScale，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0730', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0730 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin73')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_73'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0730_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0730_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0730_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0730 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0740
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1.5
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0740', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0740 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin74')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_74'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0740_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0740_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0740_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0740 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0750
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1.75
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0750', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0750 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin75')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_75'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0750_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0750_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0750_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0750 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0760
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0760', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0760 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin76')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_76'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0760_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0760_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0760_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0760 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0770
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为-1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0770', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0770 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin77')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_77'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0770_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0770_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0770_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0770 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0780
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为0
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0780', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0780 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin78')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_78'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0780_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0780_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0780_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0780 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0790
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为undefined
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0790', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0790 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin79')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_79'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0790_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0790_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0790_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0790 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0800
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为null
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0800', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0800 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin80')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_80'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0800_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0800_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0800_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0800 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0810
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0810', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0810 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin81')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_81'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0810_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0810_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0810_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0810 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0820
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为20
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0820', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0820 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin82')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_82'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0820_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0820_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0820_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0820 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0830
     * @tc.name   : Button minFontScale和maxFontScale测试 - 不设置minFontScale，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0830', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0830 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin83')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_83'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0830_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0830_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0830_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0830 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0840
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0840', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0840 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin84')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_84'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0840_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0840_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0840_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0840 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0850
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.7，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0850', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0850 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin85')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_85'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0850_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0850_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0850_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0850 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0860
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0860', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0860 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin86')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_86'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0860_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0860_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0860_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0860 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0870
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为-1，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0870', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0870 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin87')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_87'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0870_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0870_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0870_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0870 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0880
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为undefined，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0880', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0880 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin88')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_88'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0880_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0880_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0880_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0880 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0890
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为null，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0890', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0890 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin89')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_89'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0890_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0890_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0890_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0890 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0900
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0900', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0900 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin90')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_90'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0900_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0900_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0900_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0900 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0910
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0910', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0910 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin91')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_91'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0910_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0910_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0910_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0910 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0920
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为20，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0920', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0920 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin92')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_92'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0920_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0920_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0920_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0920 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0940
     * @tc.name   : Button minFontScale和maxFontScale测试 - 不设置minFontScale，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0940', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0940 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin94')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_94'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0940_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0940_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0940_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0940 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0950
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1.5
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0950', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0950 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin95')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_95'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0950_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0950_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0950_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0950 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0960
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1.75
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0960', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0960 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin96')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_96'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0960_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0960_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0960_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0960 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0970
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0970', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0970 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin97')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_97'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0970_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0970_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0970_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0970 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0980
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为-1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0980', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0980 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin98')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_98'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0980_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0980_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0980_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0980 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0990
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为0
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0990', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0990 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin99')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_99'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0990_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0990_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0990_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0990 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1000
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为undefined
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1000', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1000 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_100'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1000_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1000_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1000_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1000 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1010
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为null
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1010 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin101')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_101'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1010_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1010_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1010_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1020
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1020 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin102')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_102'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1020_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1020_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1020_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1030
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为20
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1030 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin103')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_103'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1030_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1030_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1030_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1040
     * @tc.name   : Button minFontScale和maxFontScale测试 - 不设置minFontScale，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1040 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin104')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_104'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1040_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1040_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1040_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1050
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1050 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin105')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_105'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1050_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1050_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1050_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1060
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.7，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1060 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin106')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_106'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1060_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1060_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1060_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1070
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1070 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin107')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_107'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1070_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1070_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1070_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1080
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为-1，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1080 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin108')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_108'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1080_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1080_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1080_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1090
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为undefined，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1090 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin109')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_109'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1090_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1090_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1090_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1100
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为null，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1100 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_110'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1100_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1100_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1100_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1110
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1110 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin111')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_111'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1110_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1110_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1110_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1120
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1120 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin112')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_112'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1120_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1120_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1120_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1130
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为20，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1130 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin113')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_113'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1130_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1130_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1130_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1140
     * @tc.name   : Button minFontScale和maxFontScale测试 - 不设置minFontScale，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1140 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin114')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_114'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1140_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1140_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1140_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1150
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1.5
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1150 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin115')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_115'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1150_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1150_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1150_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1160
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1.75
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1160 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin116')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_116'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1160_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1160_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1160_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1170
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1170 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin117')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_117'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1170_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1170_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1170_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1180
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为-1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1180 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin118')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_118'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1180_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1180_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1180_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1190
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为0
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1190 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin119')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_119'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1190_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1190_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1190_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1200
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为undefined
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1200 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_120'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1200_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1200_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1200_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1210
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为null
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1210 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin121')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_121'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1210_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1210_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1210_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1220
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1220 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin122')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_122'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1220_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1220_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1220_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1230
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为20
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1230 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin123')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_123'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1230_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1230_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1230_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1240
     * @tc.name   : Button minFontScale和maxFontScale测试 - 不设置minFontScale，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1240 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin124')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_124'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1240_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1240_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1240_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1250
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1250 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin125')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_125'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1250_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1250_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1250_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1260
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.7，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1260 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin126')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_126'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1260_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1260_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1260_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1270
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1270 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin127')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_127'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1270_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1270_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1270_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1280
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为-1，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1280 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin128')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_128'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1280_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1280_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1280_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1290
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为undefined，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1290 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin129')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_129'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1290_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1290_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1290_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1300
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为null，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1300 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin130')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_130'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1300_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1300_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1300_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1310
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1310 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin131')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_131'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1310_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1310_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1310_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1320
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1320 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin132')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_132'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1320_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1320_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1320_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1330
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为20，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1330 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin133')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_133'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1330_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1330_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1330_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1340
     * @tc.name   : Button minFontScale和maxFontScale测试 - 不设置minFontScale，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1340 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin134')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_134'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1340_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1340_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1340_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1350
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1.5
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1350 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin135')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_135'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1350_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1350_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1350_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1360
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1.75
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1360 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin136')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_136'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1360_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1360_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1360_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1370
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1370 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin137')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_137'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1370_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1370_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1370_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1380
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为-1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1380 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin138')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_138'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1380_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1380_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1380_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1390
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为0
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1390 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin139')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_139'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1390_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1390_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1390_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1400
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为undefined
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1400 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin140')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_140'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1400_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1400_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1400_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1410
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为null
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1410 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin141')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_141'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1410_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1410_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1410_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1420
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1420 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin142')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_142'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1420_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1420_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1420_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1430
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为20
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1430 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin143')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_143'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1430_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1430_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1430_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1440
     * @tc.name   : Button minFontScale和maxFontScale测试 - 不设置minFontScale，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1440 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin144')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_144'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1440_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1440_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1440_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1450
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1450 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin145')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_145'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1450_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1450_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1450_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1460
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.7，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1460 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin146')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_146'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1460_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1460_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1460_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1470
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1470 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin147')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_147'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1470_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1470_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1470_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1480
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为-1，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1480 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin148')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_148'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1480_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1480_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1480_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1490
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为undefined，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1490 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin149')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_149'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1490_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1490_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1490_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1500
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为null，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1500 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin150')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_150'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1500_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1500_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1500_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1510
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1510 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin151')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_151'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1510_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1510_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1510_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1520
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1520 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin152')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_152'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1520_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1520_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1520_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1530
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为20，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1530 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin153')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_153'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1530_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1530_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1530_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1540
     * @tc.name   : Button minFontScale和maxFontScale测试 - 不设置minFontScale，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1540 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin154')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_154'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1540_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1540_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1540_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1550
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1.5
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1550 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin155')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_155'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1550_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1550_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1550_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1560
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1.75
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1560 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin156')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_156'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1560_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1560_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1560_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1560 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1570
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1570 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin157')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_157'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1570_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1570_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1570_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1580
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为-1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1580 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin158')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_158'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1580_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1580_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1580_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1590
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为0
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1590 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin159')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_159'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1590_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1590_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1590_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1600
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为undefined
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1600 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin160')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_160'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1600_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1600_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1600_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1610
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为null
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1610 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin161')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_161'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1610_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1610_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1610_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1610 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1620
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1620 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin162')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_162'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1620_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1620_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1620_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1620 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1630
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为20
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1630 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin163')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_163'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1630_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1630_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1630_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1630 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1650
     * @tc.name   : Button minFontScale和maxFontScale测试 - 不设置minFontScale，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1650 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin165')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_165'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1650_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1650_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1650_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1650 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1660
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为0.5，maxFontScale为3.2
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1660 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin166')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_166'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1660_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1660_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1660_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1670
     * @tc.name   : Button minFontScale和maxFontScale测试 - minFontScale为1，maxFontScale为1
     * @tc.desc   : Verify button maxandmin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1670', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1670 start.`);
      await uiAppearance.setFontScale(3.2);
      await Utils.sleep(500);
      Settings.createWindow('testability/pages/component/button/button/buttonMaxAndMin167')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      let changeSizeButton: Component = await driver.waitForComponent(ON.id('changeSizeButton_167'), 1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1670_175')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1670_200')
      await Utils.sleep(1000);
      await changeSizeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1670_320')
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1670 finish.`);
      done()
    })
  })
}
