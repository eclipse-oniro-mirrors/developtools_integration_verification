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

export default function customSelectinputmethodoptimization() {

  describe('customSelectinputmethodoptimization', () => {
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
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0010
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0010', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0010 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0010')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：查找并点击"click me"按钮拉起弹窗
      let clickMeButton = await driver.waitForComponent(ON.id('click_me_button_0010'), 500)
      await clickMeButton.click()
      await Utils.sleep(1000)
      
      // 步骤4：点击输入框拉起软键盘
      let textInput = await driver.waitForComponent(ON.id('text_input_custom_dialog_0010'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤6：点击输入法右上角的箭头按钮关闭输入法
      await driver.pressBack()
      await Utils.sleep(1000)

      
        // 步骤9：验证横屏状态下自定义弹窗不会避让输入法，进行截图
        await windowSnap.snapShot()
        await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0010 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0020
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0020 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0020')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0020'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_prompt_dialog_0020'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0020 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0030
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0030 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0030')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0030'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_custom_dialog_0030'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0030 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0040
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0040 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0040')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0040'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_uicontext_dialog_0040'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0040 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0050
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0050 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0050')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0050'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_custom_dialog_0050'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0050 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0060
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0060 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0060')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0060'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_uicontext_dialog_0060'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0060 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0080
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0080 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0080')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0080'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_custom_dialog_0080'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0080 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0090
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0090', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0090 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0090')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0090'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_custom_dialog_0090'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0090 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0110
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0110', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0110 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0110')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0110'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_uicontext_dialog_0110'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0110 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0120
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0120', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0120 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0120')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0120'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_prompt_dialog_0120'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0120 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0130
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0130', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0130 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0130')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0130'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_uicontext_dialog_0130'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0130 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0140
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0140', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0140 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0140')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0140'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_uicontext_dialog_0140'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0140 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0150
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0150', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0150 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0150')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0150'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_prompt_dialog_0150'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0150 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0160
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0160', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0160 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0160')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0160'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_uicontext_dialog_0160'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0160 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0170
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0170', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0170 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0170')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0170'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_prompt_dialog_0170'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0170 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0180
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0180', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0180 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0180')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0180'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_uicontext_dialog_0180'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0180 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0190
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0190', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0190 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0190')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0190'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_uicontext_dialog_0190'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0190 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0220
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0220', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0220 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0220')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0220'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_prompt_dialog_0220'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)

      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0220 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0230
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0230', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0230 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0230')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0230'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_prompt_dialog_0230'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0230 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0240
     * @tc.name   : Component function special components dialog custom selectinputmethodoptimization
     * @tc.desc   : Verify component function special components dialog custom selectinputmethodoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0240', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0240 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/select/CustomSelectinputmethodoptimization/CustomSelectinputmethodoptimization0240')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击"click customDialog"按钮
      let clickCustomDialogButton = await driver.waitForComponent(ON.id('click_custom_dialog_button_0240'), 500)
      await clickCustomDialogButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('text_input_prompt_dialog_0240'), 500)
      await textInput.click()
      await Utils.sleep(2000)
      
      // 步骤4：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 重复步骤2：点击输入框
      await textInput.click()
      await Utils.sleep(2000)
      
      // 重复步骤3：点击输入法右上角的箭头按钮
      await driver.pressBack()
      await Utils.sleep(1000)
      
      // 最后截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_CUSTOM_SELECTINPUTMETHODOPTIMIZATION_0240 finish.`);
      done()
    })


  })
}