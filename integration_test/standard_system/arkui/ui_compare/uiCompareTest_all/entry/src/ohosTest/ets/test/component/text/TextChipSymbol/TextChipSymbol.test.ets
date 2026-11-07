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
import { Driver, ON, Component, MatchPattern } from '@kit.TestKit';

export default function textChipSymbol() {

  describe('textChipSymbol', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0010
     * @tc.name   : Text chip symbol
     * @tc.desc   : Verify text chip symbol interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0010 start.`);
      try {
        Settings.createWindow('testability/pages/component/text/TextChipSymbol/TextChipSymbol0010')
        let driver:Driver = Driver.create();
        await driver.waitForIdle(3000,5000)
        await Utils.sleep(1000)
        windowSnap.snapShot()
        // 3、点击【fontSize】动态按钮切换
        const fontSizeButton = await driver.findComponent(ON.id('fontSizeButton'));
        for (let i = 0; i < 11; i++) {
          await fontSizeButton.click();
          await Utils.sleep(200);
          windowSnap.snapShot()
        }
        // 4、点击"改变激活状态"
        await Utils.sleep(500);
        const changeStateButton = await driver.findComponent(ON.id('changeStateButton'));
        await changeStateButton.click();
        await Utils.sleep(500);
        windowSnap.snapShot()
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0010 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0020
     * @tc.name   : Text chip symbol
     * @tc.desc   : Verify text chip symbol interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0020 start.`);
      try {
        Settings.createWindow('testability/pages/component/text/TextChipSymbol/TextChipSymbol0020')
        let driver:Driver = Driver.create();
        await driver.waitForIdle(3000,5000)
        await Utils.sleep(1000)
        windowSnap.snapShot()
        // 3、点击【fontColor】动态按钮切换
        const fontColorButton = await driver.findComponent(ON.id('fontColorButton'));
        for (let i = 0; i < 8; i++) {
          await fontColorButton.click();
          await Utils.sleep(200);
          windowSnap.snapShot()
        }
        // 4、点击"改变激活状态"
        await Utils.sleep(500);
        const changeStateButton = await driver.findComponent(ON.id('changeStateButton'));
        await changeStateButton.click();
        await Utils.sleep(500);
        windowSnap.snapShot()
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0020 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0040
     * @tc.name   : Text chip symbol
     * @tc.desc   : Verify text chip symbol interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0040 start.`);
      try {
        Settings.createWindow('testability/pages/component/text/TextChipSymbol/TextChipSymbol0040')
        let driver:Driver = Driver.create();
        await driver.waitForIdle(2000,4000)
        await Utils.sleep(500)
        windowSnap.snapShot()
        // 4、点击【fontColor1】动态按钮切换
        const fontColor1Button = await driver.findComponent(ON.id('fontColor1Button'));
        for (let i = 0; i < 8; i++) {
          await fontColor1Button.click();
          await Utils.sleep(150);
        }
        windowSnap.snapShot()
        // 5、点击【fontColor2】动态按钮切换
        await Utils.sleep(300);
        const fontColor2Button = await driver.findComponent(ON.id('fontColor2Button'));
        for (let i = 0; i < 8; i++) {
          await fontColor2Button.click();
          await Utils.sleep(150);
        }
        windowSnap.snapShot()
        // 6、点击"改变激活状态"
        await Utils.sleep(300);
        const changeStateButton = await driver.findComponent(ON.id('changeStateButton'));
        await changeStateButton.click();
        await Utils.sleep(300);
        windowSnap.snapShot()
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0040 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0050
     * @tc.name   : Text chip symbol
     * @tc.desc   : Verify text chip symbol interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0050 start.`);
      try {
        Settings.createWindow('testability/pages/component/text/TextChipSymbol/TextChipSymbol0050')
        let driver:Driver = Driver.create();
        await driver.waitForIdle(2000,4000)
        await Utils.sleep(500)
        windowSnap.snapShot()
        // 3、点击【切换图标】动态按钮切换 (normal状态)
        const switchSymbolButton = await driver.findComponent(ON.id('switchSymbolButton'));
        for (let i = 0; i < 5; i++) {
          await switchSymbolButton.click();
          await Utils.sleep(200);
          windowSnap.snapShot()
        }
        // 4、点击"改变激活状态"
        await Utils.sleep(300);
        const changeStateButton = await driver.findComponent(ON.id('changeStateButton'));
        await changeStateButton.click();
        await Utils.sleep(300);
        windowSnap.snapShot()
        // 5、点击【切换图标】动态按钮切换 (activated状态)
        for (let i = 0; i < 5; i++) {
          await switchSymbolButton.click();
          await Utils.sleep(200);
          windowSnap.snapShot()
        }
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0050 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0210
     * @tc.name   : Text chip symbol
     * @tc.desc   : Verify text chip symbol interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0210 start.`);
      try {
        Settings.createWindow('testability/pages/component/text/TextChipSymbol/TextChipSymbol0210')
        let driver:Driver = Driver.create();
        await driver.waitForIdle(2000,4000)
        await Utils.sleep(500)
        // 1、初始状态截图 (normal状态)
        windowSnap.snapShot()
        // 2、点击"改变激活状态"
        await Utils.sleep(300);
        const changeStateButton = await driver.findComponent(ON.id('changeStateButton'));
        await changeStateButton.click();
        await Utils.sleep(300);
        // 3、activated状态截图
        windowSnap.snapShot()
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0210 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0220
     * @tc.name   : Text chip symbol
     * @tc.desc   : Verify text chip symbol interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0220 start.`);
      try {
        Settings.createWindow('testability/pages/component/text/TextChipSymbol/TextChipSymbol0220')
        let driver:Driver = Driver.create();
        await driver.waitForIdle(1500,3000) // 减少等待时间
        await Utils.sleep(800) // 初始等待
        // 1、初始状态截图 (normal状态)
        windowSnap.snapShot()
        // 2、观察初始状态
        await Utils.sleep(1500); // 观察时间
        // 3、点击"改变激活状态"观察动效
        const changeStateButton = await driver.findComponent(ON.id('changeStateButton'));
        await changeStateButton.click();
        await Utils.sleep(1200); // 动效观察时间
        // 4、activated状态截图
        windowSnap.snapShot()
        // 5、观察activated状态
        await Utils.sleep(1500); // 观察时间
        // 6、再次点击"改变激活状态"观察动效
        await changeStateButton.click();
        await Utils.sleep(1200); // 动效观察时间
        // 7、normal状态截图
        windowSnap.snapShot()
        // 8、最后观察时间
        await Utils.sleep(1500); // 最后观察时间
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0220 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0230
     * @tc.name   : Text chip symbol
     * @tc.desc   : Verify text chip symbol interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0230 start.`);
      try {
        Settings.createWindow('testability/pages/component/text/TextChipSymbol/TextChipSymbol0230')
        let driver:Driver = Driver.create();
        await driver.waitForIdle(1500,3000) // 增加等待确保页面加载
        // 1、初始状态截图
        windowSnap.snapShot()
        await Utils.sleep(800); // 观察初始状态
        // 4、点击【fontColor1】动态按钮切换
        const fontColor1Button = await driver.findComponent(ON.id('fontColor1Button'));
        for (let i = 0; i < 8; i++) {
          await fontColor1Button.click();
          await Utils.sleep(120); // 适中的点击间隔
        }
        windowSnap.snapShot()
        await Utils.sleep(600); // 观察fontColor1完成
        // 5、点击【fontColor2】动态按钮切换
        const fontColor2Button = await driver.findComponent(ON.id('fontColor2Button'));
        for (let i = 0; i < 8; i++) {
          await fontColor2Button.click();
          await Utils.sleep(120); // 适中的点击间隔
        }
        windowSnap.snapShot()
        await Utils.sleep(600); // 观察fontColor2完成
        // 6、点击"改变激活状态"
        const changeStateButton = await driver.findComponent(ON.id('changeStateButton'));
        await changeStateButton.click();
        await Utils.sleep(1000); // 观察状态切换
        windowSnap.snapShot()
        await Utils.sleep(800); // 最后观察
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0230 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0240
     * @tc.name   : Text chip symbol
     * @tc.desc   : Verify text chip symbol interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0240 start.`);
      try {
        Settings.createWindow('testability/pages/component/text/TextChipSymbol/TextChipSymbol0240')
        let driver:Driver = Driver.create();
        await driver.waitForIdle(1500,3000)
        // 1、初始状态截图
        windowSnap.snapShot()
        await Utils.sleep(800);
        // 4、点击【fontColor1】动态按钮切换
        const fontColor1Button = await driver.findComponent(ON.id('fontColor1Button'));
        for (let i = 0; i < 8; i++) {
          await fontColor1Button.click();
          await Utils.sleep(120);
        }
        windowSnap.snapShot()
        await Utils.sleep(600);
        // 5、点击【fontColor2】动态按钮切换
        const fontColor2Button = await driver.findComponent(ON.id('fontColor2Button'));
        for (let i = 0; i < 8; i++) {
          await fontColor2Button.click();
          await Utils.sleep(120);
        }
        windowSnap.snapShot()
        await Utils.sleep(600);
        // 6、点击"改变激活状态"
        const changeStateButton = await driver.findComponent(ON.id('changeStateButton'));
        await changeStateButton.click();
        await Utils.sleep(1000);
        windowSnap.snapShot()
        await Utils.sleep(800);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_SYMBOL_0240 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

  })
}