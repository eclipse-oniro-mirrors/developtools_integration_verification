/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default function uIComponentPopupBoxSpecifications() {

  describe('uIComponentPopupBoxSpecifications', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0490
     * @tc.name   : Popup Appearing Simultaneously with Other Pop-ups - Custom Popup
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0490', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0490 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecifications/UIComponentPopupBoxSpecifications01')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecifications01_02'),1000);
      await button02.click()
      await driver.waitForIdle(500,2000)
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecifications01_01'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0500
     * @tc.name   : Popup Appearing Simultaneously with Other Pop-ups - Alert Dialog
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0500', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0500 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecifications/UIComponentPopupBoxSpecifications02')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecifications02_02'),1000);
      await button02.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await button02.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0510
     * @tc.name   : Popup Appearing Simultaneously with Other Pop-ups - Action Menu
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0510', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0510 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecifications/UIComponentPopupBoxSpecifications03')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecifications03_02'),1000);
      let text: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecifications03_01'),1000);
      await button02.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await text.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await text.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0520
     * @tc.name   : Popup Appearing Simultaneously with Other Pop-ups - Date Picker
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0520', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0520 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecifications/UIComponentPopupBoxSpecifications04')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecifications04_02'),1000);
      let text: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecifications04_01'),1000);
      await button02.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await text.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await text.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0530
     * @tc.name   : Popup Appearing Simultaneously with Other Pop-ups - Time Picker
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0530', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0530 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecifications/UIComponentPopupBoxSpecifications05')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecifications05_02'),1000);
      let text: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecifications05_01'),1000);
      await button02.click()
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await text.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await text.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0540
     * @tc.name   : Popup Appearing Simultaneously with Other Pop-ups - Text Picker
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0540', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0540 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecifications/UIComponentPopupBoxSpecifications06')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecifications06_02'),1000);
      let text: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecifications06_01'),1000);
      await button02.click()
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await text.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await text.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0550
     * @tc.name   : Popup Appearing Simultaneously with Other Pop-ups - Prompt
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0550', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0550 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecifications/UIComponentPopupBoxSpecifications07')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecifications07_02'),1000);
      let text: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecifications07_01'),1000);
      await button02.click()
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await text.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await text.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0560
     * @tc.name   : Popup Appearing Simultaneously with Other Pop-ups - PromptAction
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0560', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0560 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecifications/UIComponentPopupBoxSpecifications08')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecifications08_02'),1000);
      let text: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecifications08_01'),1000);
      await button02.click()
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await text.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await text.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0560 finish.`);
      done()
    })

  })
}