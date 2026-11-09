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
import { BusinessError } from '@kit.BasicServicesKit'

export default function toastPromptActionTest () {

  describe('toastPromptActionTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0040
     * @tc.name   : Multiple Toast components with Default/Top_Most/SYSTEM_Top_Most showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0040 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);

      // 先查找所有按钮，确保页面完全加载
      let toast1Button: Component = await driver.waitForComponent(ON.id('toast1_button_04'), 1000);
      let toast2Button: Component = await driver.waitForComponent(ON.id('toast2_button_04'), 1000);

      // 依次启动多个Toast
      await toast1Button.click();
      await driver.waitForIdle(500,2000);
      console.log('toastPromptActionTest Toast1.click success')
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0040_01')
      await Utils.sleep(1000)

      await toast2Button.click();
      console.log('toastPromptActionTest Toast2.click success1')
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0040_02')
      await Utils.sleep(2500)

      await driver.waitForIdle(500,2000);
      let close1Button: Component = await driver.waitForComponent(ON.id('close1_button_04'), 1000);
      let close2Button: Component = await driver.waitForComponent(ON.id('close2_button_04'), 1000);

      // 依次关闭Toast
      await close2Button.click();
      console.log('toastPromptActionTest Close2.click success')
      await driver.waitForIdle(500,2000);

      await close1Button.click();
      console.log('toastPromptActionTest Close1.click success')
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0040_03')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0020
     * @tc.name   : Single Toast component with TOP_MOST showMode, continuous open/close
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0020 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);

      // 打开Toast
      let openButton1: Component = await driver.waitForComponent(ON.id('open_toast_button_02'), 1000);
      await openButton1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0020_01')
      await Utils.sleep(2500)

      await driver.waitForIdle(1500,2500);
      // 关闭Toast
      let closeButton1: Component = await driver.waitForComponent(ON.id('close_toast_button_02'), 1000);
      await closeButton1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0020_02')
      await Utils.sleep(1000)

      // 多次打开关闭
      // 打开Toast
      let openButton2: Component = await driver.waitForComponent(ON.id('open_toast_button_02'), 1000);
      await openButton2.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(2500);

      // 关闭Toast
      let closeButton2: Component = await driver.waitForComponent(ON.id('close_toast_button_02'), 1000);
      await closeButton2.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000);

      // 打开Toast
      let openButton3: Component = await driver.waitForComponent(ON.id('open_toast_button_02'), 1000);
      await openButton3.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(2500);

      // 关闭Toast
      let closeButton3: Component = await driver.waitForComponent(ON.id('close_toast_button_02'), 1000);
      await closeButton3.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000);

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0010
     * @tc.name   : Multiple Toast components with Default showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0010 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 依次启动多个Toast
      let toast1Button: Component = await driver.waitForComponent(ON.id('toast1_button_01'), 1000);
      await toast1Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0010_01')
      await Utils.sleep(1000)

      let toast2Button: Component = await driver.waitForComponent(ON.id('toast2_button_01'), 1000);
      await toast2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0010_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0090
     * @tc.name   : Multiple Toast components with Default/Top_Most/SYSTEM_Top_Most showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0090 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction09')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 依次启动多个Toast
      let toast1Button: Component = await driver.waitForComponent(ON.id('toast1_button_09'), 1000);
      await toast1Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0090_01')
      await Utils.sleep(1000)

      let toast2Button: Component = await driver.waitForComponent(ON.id('toast2_button_09'), 1000);
      await toast2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0090_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0070
     * @tc.name   : Single Toast component with TOP_MOST showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0070 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction07')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 打开Toast并截图验证
      let openButton: Component = await driver.waitForComponent(ON.id('open_toast_button_07'), 1000);
      await openButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0070_01')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0080
     * @tc.name   : Single Toast component with TOP_MOST showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0080 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction08')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 打开Toast并截图验证
      let openButton: Component = await driver.waitForComponent(ON.id('open_toast_button_08'), 1000);
      await openButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0080_01')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0060
     * @tc.name   : Single Toast component with Default showMode, continuous open/close
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0060 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 打开Toast
      let openButton: Component = await driver.waitForComponent(ON.id('open_toast_button_06'), 1000);
      await openButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0060_01')
      await Utils.sleep(1000)

      // 关闭Toast
      let closeButton: Component = await driver.waitForComponent(ON.id('close_toast_button_06'), 1000);
      await closeButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0060_02')
      await Utils.sleep(1000)

      // 连续多次操作
      for (let i = 0; i < 2; i++) {
        await openButton.click();
        await driver.waitForIdle(500,2000);
        await Utils.sleep(500);
        await closeButton.click();
        await driver.waitForIdle(500,2000);
        await Utils.sleep(500);
      }

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0100
     * @tc.name   : Single Toast component with SYSTEM_TOP_MOST showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0100 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction10')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);

      // 先查找所有按钮，确保页面完全加载
      let openButton: Component = await driver.waitForComponent(ON.id('open_toast_button_10'), 1000);
      let closeButton: Component = await driver.waitForComponent(ON.id('close_toast_button_10'), 1000);

      // 验证按钮是否可见
      await driver.assertComponentExist(ON.id('open_toast_button_10'));
      await driver.assertComponentExist(ON.id('close_toast_button_10'));

      // 打开Toast
      await openButton.click();
      console.log('toastPromptActionTest open_toast_button_10.click success')
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0100_01')
      await Utils.sleep(2500)

      // 重新查找关闭按钮，确保它仍然可用
      closeButton = await driver.waitForComponent(ON.id('close_toast_button_10'), 1000);

      // 关闭Toast
      await closeButton.click();
      console.log('close_toast_button_10 close_toast_button_10.click success')
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0100_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0050
     * @tc.name   : Multiple Toast components with Default/Top_Most/SYSTEM_Top_Most showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0050 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 依次启动多个Toast
      let toast1Button: Component = await driver.waitForComponent(ON.id('toast1_button_05'), 1000);
      await toast1Button.click();
      console.log('toastLog toast1_button_05 click success')
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0050_01')
      await Utils.sleep(1000)

      let toast2Button: Component = await driver.waitForComponent(ON.id('toast2_button_05'), 1000);
      await toast2Button.click();
      console.log('toastLog toast2_button_05 click success')
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0050_02')
      await Utils.sleep(2500)

      // 依次关闭Toast
      let close1Button: Component = await driver.waitForComponent(ON.id('close1_button_05'), 1000);
      await close1Button.click();
      console.log('toastLog close1_button_05 click success')
      await driver.waitForIdle(500,2000);
      await Utils.sleep(500);

      let close2Button: Component = await driver.waitForComponent(ON.id('close2_button_05'), 1000);
      await close2Button.click();
      console.log('toastLog close2_button_05 click success')
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0050_03')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0030
     * @tc.name   : Single Toast component with DEFAULT showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0030 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 打开Toast
      let openButton: Component = await driver.waitForComponent(ON.id('open_toast_button_03'), 1000);
      await openButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0030_01')
      await Utils.sleep(1000)

      // 关闭Toast
      let closeButton: Component = await driver.waitForComponent(ON.id('close_toast_button_03'), 1000);
      await closeButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0030_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0120
     * @tc.name   : Multiple Toast components with Top_Most showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0120 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction12')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 依次启动多个Toast
      let toast1Button: Component = await driver.waitForComponent(ON.id('toast1_button_12'), 1000);
      await toast1Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0120_01')
      await Utils.sleep(2500)

      let toast2Button: Component = await driver.waitForComponent(ON.id('toast2_button_12'), 1000);
      await toast2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0120_02')
      await Utils.sleep(2500)

      // 依次关闭Toast
      let close1Button: Component = await driver.waitForComponent(ON.id('close1_button_12'), 1000);
      await close1Button.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(500);

      let close2Button: Component = await driver.waitForComponent(ON.id('close2_button_12'), 1000);
      await close2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0120_03')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0110
     * @tc.name   : Multiple Toast components with Default showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0110 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction11')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 依次启动多个Toast
      let toast1Button: Component = await driver.waitForComponent(ON.id('toast1_button_11'), 1000);
      await toast1Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0110_01')
      await Utils.sleep(1000)

      let toast2Button: Component = await driver.waitForComponent(ON.id('toast2_button_11'), 1000);
      await toast2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0110_02')
      await Utils.sleep(1000)

      // 依次关闭Toast
      let close1Button: Component = await driver.waitForComponent(ON.id('close1_button_11'), 1000);
      await close1Button.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(500);

      let close2Button: Component = await driver.waitForComponent(ON.id('close2_button_11'), 1000);
      await close2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0110_03')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0160
     * @tc.name   : Single Toast component with SYSTEM_TOP_MOST showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0160 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction16')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 打开Toast并截图验证
      let openButton: Component = await driver.waitForComponent(ON.id('open_toast_button_16'), 1000);
      await openButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0160_01')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0140
     * @tc.name   : Single Toast component with Default showMode, continuous open/close
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0140 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction14')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 打开Toast
      let openButton1: Component = await driver.waitForComponent(ON.id('open_toast_button_14'), 1000);
      await openButton1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0140_01')
      await Utils.sleep(1000)

      // 关闭Toast
      let closeButton1: Component = await driver.waitForComponent(ON.id('close_toast_button_14'), 1000);
      await closeButton1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0140_02')
      await Utils.sleep(1000)

      // 多次打开关闭
      // 打开Toast
      let openButton2: Component = await driver.waitForComponent(ON.id('open_toast_button_14'), 1000);
      await openButton2.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000);

      // 关闭Toast
      let closeButton2: Component = await driver.waitForComponent(ON.id('close_toast_button_14'), 1000);
      await closeButton2.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000);

      // 打开Toast
      let openButton3: Component = await driver.waitForComponent(ON.id('open_toast_button_14'), 1000);
      await openButton3.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000);

      // 关闭Toast
      let closeButton3: Component = await driver.waitForComponent(ON.id('close_toast_button_14'), 1000);
      await closeButton3.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000);

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0150
     * @tc.name   : Multiple Toast components with Top_Most showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0150 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction15')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 依次启动多个Toast
      let toast1Button: Component = await driver.waitForComponent(ON.id('toast1_button_15'), 1000);
      await toast1Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0150_01')
      await Utils.sleep(2500)

      let toast2Button: Component = await driver.waitForComponent(ON.id('toast2_button_15'), 1000);
      await toast2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0150_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0130
     * @tc.name   : Single Toast component with TOP_MOST showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0130 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction13')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 打开Toast
      let openButton: Component = await driver.waitForComponent(ON.id('open_toast_button_13'), 1000);
      await openButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0130_01')
      await Utils.sleep(2500)

      // 关闭Toast
      let closeButton: Component = await driver.waitForComponent(ON.id('close_toast_button_13'), 1000);
      await closeButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0130_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0170
     * @tc.name   : Single Toast component with SYSTEM_TOP_MOST showMode, continuous open/close
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0170 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction17')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 打开Toast
      let openButton1: Component = await driver.waitForComponent(ON.id('open_toast_button_17'), 1000);
      await openButton1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0170_01')
      await Utils.sleep(2500)

      // 关闭Toast
      let closeButton1: Component = await driver.waitForComponent(ON.id('close_toast_button_17'), 1000);
      await closeButton1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0170_02')
      await Utils.sleep(1000)

      // 多次打开关闭
      // 打开Toast
      let openButton2: Component = await driver.waitForComponent(ON.id('open_toast_button_17'), 1000);
      await openButton2.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(2500)

      // 关闭Toast
      let closeButton2: Component = await driver.waitForComponent(ON.id('close_toast_button_17'), 1000);
      await closeButton2.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000)

      // 打开Toast
      let openButton3: Component = await driver.waitForComponent(ON.id('open_toast_button_17'), 1000);
      await openButton3.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(2500)

      // 关闭Toast
      let closeButton3: Component = await driver.waitForComponent(ON.id('close_toast_button_17'), 1000);
      await closeButton3.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0180
     * @tc.name   : Multiple Toast components with SYSTEM_Top_Most showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0180 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction18')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 依次启动多个Toast
      let toast1Button: Component = await driver.waitForComponent(ON.id('toast1_button_18'), 1000);
      await toast1Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0180_01')
      await Utils.sleep(2500)

      let toast2Button: Component = await driver.waitForComponent(ON.id('toast2_button_18'), 1000);
      await toast2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0180_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0200
     * @tc.name   : Multiple Toast components with SYSTEM_Top_Most showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0200 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction20')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 依次启动多个Toast
      let toast1Button: Component = await driver.waitForComponent(ON.id('toast1_button_20'), 1000);
      await toast1Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0200_01')
      await Utils.sleep(2500)

      let toast2Button: Component = await driver.waitForComponent(ON.id('toast2_button_20'), 1000);
      await toast2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0200_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0190
     * @tc.name   : Multiple Toast components with Default showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0190 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction19')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 依次启动多个Toast
      let toast1Button: Component = await driver.waitForComponent(ON.id('toast1_button_19'), 1000);
      await toast1Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0190_01')
      await Utils.sleep(1000)

      let toast2Button: Component = await driver.waitForComponent(ON.id('toast2_button_19'), 1000);
      await toast2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0190_02')
      await Utils.sleep(2500)

      // 依次关闭Toast
      let close1Button: Component = await driver.waitForComponent(ON.id('close1_button_19'), 1000);
      await close1Button.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(500);

      let close2Button: Component = await driver.waitForComponent(ON.id('close2_button_19'), 1000);
      await close2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0190_03')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0210
     * @tc.name   : Multiple Toast components with Default showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0210 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction21')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 依次启动多个Toast
      let toast1Button: Component = await driver.waitForComponent(ON.id('toast1_button_21'), 1000);
      await toast1Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0210_01')
      await Utils.sleep(1000)

      let toast2Button: Component = await driver.waitForComponent(ON.id('toast2_button_21'), 1000);
      await toast2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0210_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0250
     * @tc.name   : Single Toast component with Default showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0250 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction25')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 打开Toast并截图验证
      let openButton: Component = await driver.waitForComponent(ON.id('open_toast_button_25'), 1000);
      await openButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0250_01')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0240
     * @tc.name   : Multiple Toast components with Default/Top_Most/SYSTEM_Top_Most showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0240 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction24')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 依次启动多个Toast
      let toast1Button: Component = await driver.waitForComponent(ON.id('toast1_button_24'), 1000);
      await toast1Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0240_01')
      await Utils.sleep(1000)

      let toast2Button: Component = await driver.waitForComponent(ON.id('toast2_button_24'), 1000);
      await toast2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0240_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0230
     * @tc.name   : Single Toast component with DEFAULT showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0230 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction23')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 打开Toast
      let openButton: Component = await driver.waitForComponent(ON.id('open_toast_button_23'), 1000);
      await openButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0230_01')
      await Utils.sleep(1000)

      // 关闭Toast
      let closeButton: Component = await driver.waitForComponent(ON.id('close_toast_button_23'), 1000);
      await closeButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0230_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0270
     * @tc.name   : Multiple Toast components with Top_Most showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0270 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction27')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 依次启动多个Toast
      let toast1Button: Component = await driver.waitForComponent(ON.id('toast1_button_27'), 1000);
      await toast1Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0270_01')
      await Utils.sleep(2500)

      let toast2Button: Component = await driver.waitForComponent(ON.id('toast2_button_27'), 1000);
      await toast2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0270_02')
      await Utils.sleep(2500)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0300
     * @tc.name   : Single Toast component with TOP_MOST showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0300 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction30')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 打开Toast
      let openButton: Component = await driver.waitForComponent(ON.id('open_toast_button_30'), 1000);
      await openButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0300_01')
      await Utils.sleep(2500)

      // 关闭Toast
      let closeButton: Component = await driver.waitForComponent(ON.id('close_toast_button_30'), 1000);
      await closeButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0300_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0310
     * @tc.name   : Single Toast component with Default showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0310 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction31')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 打开Toast并截图验证
      let openButton: Component = await driver.waitForComponent(ON.id('open_toast_button_31'), 1000);
      await openButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0310_01')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0220
     * @tc.name   : Single Toast component with SYSTEM_TOP_MOST showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0220 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction22')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 打开Toast并截图验证
      let openButton: Component = await driver.waitForComponent(ON.id('open_toast_button_22'), 1000);
      await openButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0220_01')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0260
     * @tc.name   : Single Toast component with SYSTEM_TOP_MOST showMode, continuous open/close
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0260 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction26')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 打开Toast
      let openButton1: Component = await driver.waitForComponent(ON.id('open_toast_button_26'), 1000);
      await openButton1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0260_01')
      await Utils.sleep(2500)

      // 关闭Toast
      let closeButton1: Component = await driver.waitForComponent(ON.id('close_toast_button_26'), 1000);
      await closeButton1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0260_02')
      await Utils.sleep(1000)

      // 多次打开关闭
      // 打开Toast
      let openButton2: Component = await driver.waitForComponent(ON.id('open_toast_button_26'), 1000);
      await openButton2.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(2500)

      // 关闭Toast
      let closeButton2: Component = await driver.waitForComponent(ON.id('close_toast_button_26'), 1000);
      await closeButton2.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000)

      // 打开Toast
      let openButton3: Component = await driver.waitForComponent(ON.id('open_toast_button_26'), 1000);
      await openButton3.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(2500)

      // 关闭Toast
      let closeButton3: Component = await driver.waitForComponent(ON.id('close_toast_button_26'), 1000);
      await closeButton3.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0290
     * @tc.name   : Multiple Toast components with SYSTEM_Top_Most showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0290 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction29')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 依次启动多个Toast
      let toast1Button: Component = await driver.waitForComponent(ON.id('toast1_button_29'), 1000);
      await toast1Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0290_01')
      await Utils.sleep(2500)

      let toast2Button: Component = await driver.waitForComponent(ON.id('toast2_button_29'), 1000);
      await toast2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0290_02')
      await Utils.sleep(2500)

      // 依次关闭Toast
      let close1Button: Component = await driver.waitForComponent(ON.id('close1_button_29'), 1000);
      await close1Button.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(500);

      let close2Button: Component = await driver.waitForComponent(ON.id('close2_button_29'), 1000);
      await close2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0290_03')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0320
     * @tc.name   : Multiple Toast components with Top_Most showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0320 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction32')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 依次启动多个Toast
      let toast1Button: Component = await driver.waitForComponent(ON.id('toast1_button_32'), 1000);
      await toast1Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0320_01')
      await Utils.sleep(2500)

      let toast2Button: Component = await driver.waitForComponent(ON.id('toast2_button_32'), 1000);
      await toast2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0320_02')
      await Utils.sleep(2500)

      // 依次关闭Toast
      let close1Button: Component = await driver.waitForComponent(ON.id('close1_button_32'), 1000);
      await close1Button.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(500);

      let close2Button: Component = await driver.waitForComponent(ON.id('close2_button_32'), 1000);
      await close2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0320_03')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0280
     * @tc.name   : Multiple Toast components with SYSTEM_Top_Most showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0280 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction28')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 依次启动多个Toast
      let toast1Button: Component = await driver.waitForComponent(ON.id('toast1_button_28'), 1000);
      await toast1Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0280_01')
      await Utils.sleep(2500)

      let toast2Button: Component = await driver.waitForComponent(ON.id('toast2_button_28'), 1000);
      await toast2Button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0280_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0330
     * @tc.name   : Single Toast component with TOP_MOST showMode, continuous open/close
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0330 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction33')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 打开Toast
      let openButton1: Component = await driver.waitForComponent(ON.id('open_toast_button_33'), 1000);
      await openButton1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0330_01')
      await Utils.sleep(2500)

      // 关闭Toast
      let closeButton1: Component = await driver.waitForComponent(ON.id('close_toast_button_33'), 1000);
      await closeButton1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0330_02')
      await Utils.sleep(1000)

      // 多次打开关闭
      // 打开Toast
      let openButton2: Component = await driver.waitForComponent(ON.id('open_toast_button_33'), 1000);
      await openButton2.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(2500);

      // 关闭Toast
      let closeButton2: Component = await driver.waitForComponent(ON.id('close_toast_button_33'), 1000);
      await closeButton2.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000);

      // 打开Toast
      let openButton3: Component = await driver.waitForComponent(ON.id('open_toast_button_33'), 1000);
      await openButton3.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(2500);

      // 关闭Toast
      let closeButton3: Component = await driver.waitForComponent(ON.id('close_toast_button_33'), 1000);
      await closeButton3.click();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000);

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0340
     * @tc.name   : Single Toast component with SYSTEM_TOP_MOST showMode
     * @tc.desc   : Verify popupbox prompt promptaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0340 start.`);
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastPromptAction34')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      await Utils.sleep(1000);

      // 打开Toast
      let openButton: Component = await driver.waitForComponent(ON.id('open_toast_button_34'), 1000);
      await openButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0340_01')
      await Utils.sleep(2500)

      // 关闭Toast
      let closeButton: Component = await driver.waitForComponent(ON.id('close_toast_button_34'), 1000);
      await closeButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0340_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_PROMPTACTION_0340 finish.`);
      done()
    })

  })
}