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

export default function setAutofocusTransferFocusview() {

  describe('setAutofocusTransferFocusview', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0010
     * @tc.name   : Verify that clicking the "pop" button on PageOne does not cause the TextInput on the Navigation page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0010 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation(navbar, navdestination)场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0010_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击textinput输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0010_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击pushPageOne按钮
      let pushBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0010_push'), 500)
      await pushBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击pop按钮回到原页面
      let popBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0010_pop'), 500)
      await popBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点在原页面输入框上，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0020
     * @tc.name   : Verify that clicking the "clear" button on PageOne does not cause the TextInput on the Navigation page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0020 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation(navbar, navdestination)场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0020_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击textinput输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0020_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击pushPageOne按钮
      let pushBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0020_push'), 500)
      await pushBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击clear按钮回到原页面
      let clearBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0020_clear'), 500)
      await clearBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点在原页面输入框上，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0030
     * @tc.name   : Verify that clicking the "pop" button on PageTwo does not cause the Button on the Navigation page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0030 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation(navbar, navdestination)场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0030_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击粉色button
      let pinkButton = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0030_pink_button'), 500)
      await pinkButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：切换pushpageOne,点击pushpagetwo
      let pushOneBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0030_push_one'), 500)
      await pushOneBtn.click()
      await driver.waitForIdle(1000, 2000)

      let pushTwoBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0030_push_two'), 500)
      await pushTwoBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击pop按钮回到原页面
      let popBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0030_pop'), 500)
      await popBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点在原页面粉色button上，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0040
     * @tc.name   : Verify that clicking the "clear" button on PageTwo does not cause the Button on the Navigation page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0040 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation(navbar, navdestination)场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0040_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击粉色button
      let pinkButton = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0040_pink_button'), 500)
      await pinkButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：切换pushpageOne,点击pushpagetwo
      let pushOneBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0040_push_one'), 500)
      await pushOneBtn.click()
      await driver.waitForIdle(1000, 2000)

      let pushTwoBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0040_push_two'), 500)
      await pushTwoBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击clear按钮回到原页面
      let clearBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0040_clear'), 500)
      await clearBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点在原页面粉色button上，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0050
     * @tc.name   : Verify that switching between PageOne and PageTwo and clicking the "pop" button does not cause the TextInput on the Navigation page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0050 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation(navbar, navdestination)场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0050_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击textinput输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0050_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：反复点击pushpageOne和pushpagetwo
      let pushOneBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0050_push_one'), 500)
      await pushOneBtn.click()
      await driver.waitForIdle(1500, 2000)

      let pushTwoBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0050_push_two'), 500)
      await pushTwoBtn.click()
      await driver.waitForIdle(1500, 2000)

      let pushOneFromTwo = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0050_push_one_from_two'), 500)
      await pushOneFromTwo.click()
      await driver.waitForIdle(1500, 2000)

      // 步骤5：点击pop按钮回到原页面
      let popBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0050_pop_one'), 500)
      await popBtn.click()
      await driver.waitForIdle(1500, 2000)

      // 截图验证：焦点在原页面输入框上，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0060
     * @tc.name   : Verify that switching between PageOne and PageTwo and clicking the "clear" button does not cause the TextInput on the Navigation page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0060 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation(navbar, navdestination)场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0060_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击textinput输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0060_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：反复点击pushpageOne和pushpagetwo
      let pushOneBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0060_push_one'), 500)
      await pushOneBtn.click()
      await driver.waitForIdle(1000, 2000)

      let pushTwoBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0060_push_two'), 500)
      await pushTwoBtn.click()
      await driver.waitForIdle(1000, 2000)

      let pushOneFromTwo = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0060_push_one_from_two'), 500)
      await pushOneFromTwo.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击clear按钮回到原页面
      let clearBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0060_clear_one'), 500)
      await clearBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点在原页面输入框上，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0070
     * @tc.name   : Verify that clicking the "pop" button on PageThree does not cause the TextInput on the Navigation page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0070 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation(navbar, navdestination)场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0070_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击textinput输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0070_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：反复点击pushpageThree
      let pushThreeBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0070_push_three'), 500)
      await pushThreeBtn.click()
      await driver.waitForIdle(1000, 2000)

      let pushThreeAgain = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0070_push_three_again'), 500)
      await pushThreeAgain.click()
      await driver.waitForIdle(1000, 2000)

      let pushThreeAgain2 = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0070_push_three_again'), 500)
      await pushThreeAgain2.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击pop按钮回到原页面
      let popBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0070_pop'), 500)
      await popBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点在原页面输入框上，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0080
     * @tc.name   : Verify that clicking the "clear" button on PageThree does not cause the TextInput on the Navigation page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0080 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation(navbar, navdestination)场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0080_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击textinput输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0080_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：反复点击pushpageThree
      let pushThreeBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0080_push_three'), 500)
      await pushThreeBtn.click()
      await driver.waitForIdle(1000, 2000)

      let pushThreeAgain = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0080_push_three_again'), 500)
      await pushThreeAgain.click()
      await driver.waitForIdle(1000, 2000)

      let pushThreeAgain2 = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0080_push_three_again'), 500)
      await pushThreeAgain2.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击clear按钮回到原页面
      let clearBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0080_clear'), 500)
      await clearBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点在原页面输入框上，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0090
     * @tc.name   : Verify that switching between PageOne and PageTwo and clicking the "pop" button does not cause the TextInput on PageOne to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0090 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation(navbar, navdestination)场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0090_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击pushpageOne
      let pushOneBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0090_push_one'), 500)
      await pushOneBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击pageOne页面输入框
      let pageOneTextInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0090_pageone_textinput'), 500)
      await pageOneTextInput.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：反复点击pushpageOne和pushpagetwo
      let pushTwoBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0090_push_two'), 500)
      await pushTwoBtn.click()
      await driver.waitForIdle(1000, 2000)

      let pushOneFromTwo = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0090_push_one_from_two'), 500)
      await pushOneFromTwo.click()
      await driver.waitForIdle(1000, 2000)

      let pushTwoAgain = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0090_push_two'), 500)
      await pushTwoAgain.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤6：点击pop按钮回到原pageOne页面
      let popBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0090_pop_two'), 500)
      await popBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点在pageOne页面textinput上，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0100
     * @tc.name   : Verify that switching between PageOne and PageTwo and clicking the "clear" button does not cause the TextInput on PageOne to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0100 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation(navbar, navdestination)场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0100_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击pushpageOne
      let pushOneBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0100_push_one'), 500)
      await pushOneBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击pageOne页面输入框
      let pageOneTextInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0100_pageone_textinput'), 500)
      await pageOneTextInput.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：反复点击pushpageOne和pushpagetwo
      let pushTwoBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0100_push_two'), 500)
      await pushTwoBtn.click()
      await driver.waitForIdle(1000, 2000)

      let pushOneFromTwo = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0100_push_one_from_two'), 500)
      await pushOneFromTwo.click()
      await driver.waitForIdle(1000, 2000)

      let pushTwoAgain = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0100_push_two'), 500)
      await pushTwoAgain.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤6：点击clear按钮回到原pageOne页面
      let clearBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0100_clear_two'), 500)
      await clearBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点在pageOne页面textinput上，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0110
     * @tc.name   : Verify that switching between PageOne and PageTwo and clicking the "pop" button causes the TextInput on PageOne to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0110 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation(navbar, navdestination)场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0110_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击pushpageOne
      let pushOneBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0110_push_one'), 500)
      await pushOneBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击pageOne页面输入框
      let pageOneTextInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0110_pageone_textinput'), 500)
      await pageOneTextInput.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：反复点击pushpageOne和pushpagetwo
      let pushTwoBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0110_push_two'), 500)
      await pushTwoBtn.click()
      await driver.waitForIdle(1000, 2000)

      let pushOneFromTwo = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0110_push_one_from_two'), 500)
      await pushOneFromTwo.click()
      await driver.waitForIdle(1000, 2000)

      let pushTwoAgain = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0110_push_two'), 500)
      await pushTwoAgain.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤6：点击pop按钮回到Navigation页面
      let popToNavBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0110_pop_to_nav'), 500)
      await popToNavBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：pageOne页面textinput焦点失焦，焦点回到管理栈栈顶
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0120
     * @tc.name   : Verify that switching between PageOne and PageTwo and clicking the "clear" button causes the TextInput on PageOne to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0120 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation(navbar, navdestination)场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0120_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击pushpageOne
      let pushOneBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0120_push_one'), 500)
      await pushOneBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击pageOne页面输入框
      let pageOneTextInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0120_pageone_textinput'), 500)
      await pageOneTextInput.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：反复点击pushpageOne和pushpagetwo
      let pushTwoBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0120_push_two'), 500)
      await pushTwoBtn.click()
      await driver.waitForIdle(1000, 2000)

      let pushOneFromTwo = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0120_push_one_from_two'), 500)
      await pushOneFromTwo.click()
      await driver.waitForIdle(1000, 2000)

      let pushTwoAgain = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0120_push_two'), 500)
      await pushTwoAgain.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤6：点击clear按钮回到Navigation页面
      let clearBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0120_clear_two'), 500)
      await clearBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：pageOne页面textinput焦点失焦，焦点回到管理栈栈顶
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0130
     * @tc.name   : Verify that clicking the "replacePathPageThree" button on PageThree causes the TextInput on PageThree to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0130 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0130')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation(navbar, navdestination)场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0130_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击replacePathPageThree进入pageThree页面
      let replaceThreeNav = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0130_replace_three_nav'), 500)
      await replaceThreeNav.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击pageThree页面输入框
      let pageThreeTextInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0130_pagethree_textinput'), 500)
      await pageThreeTextInput.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击replacePathPageThree
      let replaceThree = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0130_replace_three'), 500)
      await replaceThree.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：pageThree页面textinput焦点失焦，焦点回到管理栈栈顶
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0130 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0140
     * @tc.name   : Verify that clicking the "pop" button on PageThree causes the TextInput on PageThree to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0140 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0140')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation(navbar, navdestination)场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0140_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击replacePathPageThree进入pageThree页面
      let replaceThree = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0140_replace_three'), 500)
      await replaceThree.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击pageThree页面输入框
      let pageThreeTextInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0140_pagethree_textinput'), 500)
      await pageThreeTextInput.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击pop
      let popBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0140_pop'), 500)
      await popBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：pageThree页面输入框焦点失焦，焦点回到管理栈栈顶
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0150
     * @tc.name   : Verify that clicking the "clear" button on PageThree causes the TextInput on PageThree to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0150 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0150')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation(navbar, navdestination)场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0150_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击replacePathPageThree进入pageThree页面
      let replaceThree = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0150_replace_three'), 500)
      await replaceThree.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击pageThree页面输入框
      let pageThreeTextInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0150_pagethree_textinput'), 500)
      await pageThreeTextInput.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击clear
      let clearBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0150_clear'), 500)
      await clearBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：pageThree页面输入框焦点失焦，焦点回到管理栈栈顶
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0150 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0160
     * @tc.name   : Verify that clicking the menu option on the Navigation page does not cause the TextInput on the Navigation page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0160 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0160')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation(navbar, navdestination)场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0160_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0160_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击页面右上角更多，弹出标题
      let moreBtn = await driver.waitForComponent(ON.text('更多'), 500)
      if (moreBtn) {
        await moreBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 步骤5：点击任一Navbar
      let navbar1 = await driver.waitForComponent(ON.text('Navbar1'), 500)
      if (navbar1) {
        await navbar1.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证：焦点在原页面输入框上，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0160 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0170
     * @tc.name   : Verify that clicking the "PageB" button on Navigation page does not cause the Button on the Navigation page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0170 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0170')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation(navbar, navdestination)场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0170_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击粉色的Button
      let pinkButton = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0170_pink_button'), 500)
      await pinkButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击PageB
      let pageBBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0170_pageb'), 500)
      await pageBBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：侧滑返回原页面
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点在原页面粉色button上，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0170 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0180
     * @tc.name   : Verify that clicking the image component on pageTransition page does not cause the Button on pageTransition page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0180 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0180')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击pageTransition路由场景测试按钮
      let transitionTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0180_transition_test'), 500)
      await transitionTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮1
      let button1 = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0180_button1'), 500)
      await button1.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击桌面图片
      let image = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0180_image'), 500)
      await image.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击跳转后的桌面图片
      let imageSecond = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0180_image_second'), 500)
      if (imageSecond) {
        await imageSecond.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证：焦点在原页面Button_1上，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0180 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0190
     * @tc.name   : Verify that clicking the "showNext" button on swiper page causes the test button on swiper page to gain focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0190 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0190')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击swiper场景测试按钮
      let swiperTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0190_swiper_test'), 500)
      await swiperTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮test
      let testBtn1 = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0190_test_btn_1'), 500)
      await testBtn1.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击showNext按钮
      let showNextBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0190_show_next_1'), 500)
      await showNextBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：页面进行跳转，原页面焦点失焦，新页面test按钮获取焦点
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0190 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0200
     * @tc.name   : Verify that clicking the "showPrevious" button on swiper page causes the test button on swiper page to gain focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0200 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0200')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击swiper场景测试按钮
      let swiperTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0200_swiper_test'), 500)
      await swiperTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮test
      let testBtn2 = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0200_test_btn_2'), 500)
      await testBtn2.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击showPrevious按钮
      let showPreviousBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0200_show_previous'), 500)
      await showPreviousBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：页面进行跳转，原页面焦点失焦，新页面test按钮获取焦点
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0200 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0220
     * @tc.name   : Verify that clicking the "show menu" button on Menu page does not cause the TextInput on Menu page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0220 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0220')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Menu场景测试按钮
      let menuTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0220_menu_test'), 500)
      await menuTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0220_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)
      await driver.pressBack()
      await driver.waitForIdle(500,1000)

      // 步骤4：点击"show menu"按钮，点击任意选项
      let showMenuBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0220_show_menu'), 500)
      await showMenuBtn.click()
      await driver.waitForIdle(1000, 2000)

      let menuItem1 = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0220_menu_item1'), 500)
      if (menuItem1) {
        await menuItem1.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证：出现menu弹窗，焦点在原输入框，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0220 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0230
     * @tc.name   : Verify that clicking the "popup" button on Popup page does not cause the TextInput on Popup page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0230 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0230')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Popup场景测试按钮
      let popupTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0230_popup_test'), 500)
      await popupTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0230_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)
      await driver.pressBack()
      await driver.waitForIdle(500,1000)

      // 步骤4：点击"popup"按钮
      let popupBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0230_popup_btn'), 500)
      await popupBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：出现popup弹窗，焦点在原输入框，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0230 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0240
     * @tc.name   : Verify that clicking the "PopupOptions" button on Popup page does not cause the TextInput on Popup page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0240 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0240')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Popup场景测试按钮
      let popupTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0240_popup_test'), 500)
      await popupTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0240_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)
      await driver.pressBack()
      await driver.waitForIdle(500,1000)

      // 步骤4：点击"PopupOptions"按钮
      let popupOptionsBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0240_popup_options_btn'), 500)
      await popupOptionsBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：出现PopupOptions弹窗，焦点在原输入框，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0240 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0250
     * @tc.name   : Verify that clicking the "CustomPopupOptions" button on Popup page does not cause the TextInput on Popup page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0250 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0250')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Popup场景测试按钮
      let popupTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0250_popup_test'), 500)
      await popupTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0250_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)
      await driver.pressBack()
      await driver.waitForIdle(500,1000)

      // 步骤4：点击"CustomPopupOptions"按钮
      let customPopupBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0250_custom_popup_btn'), 500)
      await customPopupBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：出现CustomPopupOptions弹窗，焦点在原输入框，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0250 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0260
     * @tc.name   : Verify that clicking the "confirm" button of PopupButtonOptions on Popup page does not cause the TextInput on Popup page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0260 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0260')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Popup场景测试按钮
      let popupTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0260_popup_test'), 500)
      await popupTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0260_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)
      await driver.pressBack()
      await driver.waitForIdle(500,1000)

      // 步骤4：点击"PopupButtonOptions"按钮弹出Popup，点击confirm按钮
      let popupBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0260_popup_btn'), 500)
      await popupBtn.click()
      await driver.waitForIdle(1000, 2000)

      let confirmBtn = await driver.waitForComponent(ON.text('confirm'), 500)
      if (confirmBtn) {
        await confirmBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证：焦点在原输入框，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0260 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0270
     * @tc.name   : Verify that clicking the "cancel" button of PopupButtonOptions on Popup page does not cause the TextInput on Popup page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0270 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0270')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Popup场景测试按钮
      let popupTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0270_popup_test'), 500)
      await popupTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0270_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)
      await driver.pressBack()
      await driver.waitForIdle(500,1000)

      // 步骤4：点击"PopupButtonOptions"按钮弹出Popup，点击cancel按钮
      let popupBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0270_popup_btn'), 500)
      await popupBtn.click()
      await driver.waitForIdle(1000, 2000)

      let cancelBtn = await driver.waitForComponent(ON.text('cancel'), 500)
      if (cancelBtn) {
        await cancelBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证：焦点在原输入框，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0270 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0280
     * @tc.name   : Verify that clicking the "transition modal1" button on ModalPage does not cause the TextInput on ModalPage to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0280 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0280')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击ModalPage场景测试按钮
      let modalTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0280_modal_test'), 500)
      await modalTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0280_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)
      await driver.pressBack()
      await driver.waitForIdle(500,1000)

      // 步骤4：点击"transition modal1"按钮
      let modalBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0280_modal_btn'), 500)
      await modalBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：跳转到modal1页面，焦点在原输入框，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0280 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0290
     * @tc.name   : Verify that clicking the "close modal 1" button on ModalPage does not cause the TextInput on ModalPage to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0290 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0290')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击ModalPage场景测试按钮
      let modalTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0290_modal_test'), 500)
      await modalTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0290_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)
      await driver.pressBack()
      await driver.waitForIdle(500,1000)

      // 步骤4：点击"transition modal 1"按钮
      let modalBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0290_modal_btn'), 500)
      await modalBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击"close modal 1"按钮关闭modal
      let closeModalBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0290_close_modal'), 500)
      await closeModalBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：跳转到原页面，焦点在原输入框，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0290 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0300
     * @tc.name   : Verify that switching between transition modal 1 and transition modal 2 pages does not cause the TextInput on ModalPage to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0300 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0300')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击ModalPage场景测试按钮
      let modalTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0300_modal_test'), 500)
      await modalTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0300_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)
      await driver.pressBack()
      await driver.waitForIdle(500,1000)

      // 步骤4：点击"transition modal 1"按钮
      let modal1Btn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0300_modal1_btn'), 500)
      await modal1Btn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：反复点击close modal 1、transition modal 2、close modal 2
      let closeModal1Btn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0300_close_modal1'), 500)
      await closeModal1Btn.click()
      await driver.waitForIdle(1000, 2000)

      let modal2Btn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0300_modal2_btn'), 500)
      await modal2Btn.click()
      await driver.waitForIdle(1000, 2000)

      let closeModal2Btn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0300_close_modal2'), 500)
      await closeModal2Btn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：跳转到各个页面，焦点在原输入框，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0300 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0310
     * @tc.name   : Verify that clicking the "close modal 1" button on transition modal 1 page causes the TextInput on transition modal 1 page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0310 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0310')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击ModalPage场景测试按钮
      let modalTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0310_modal_test'), 500)
      await modalTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"transition modal 1"按钮
      let modal1Btn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0310_modal1_btn'), 500)
      await modal1Btn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击modal1页面输入框
      let modal1TextInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0310_modal1_textinput'), 500)
      await modal1TextInput.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击"close modal 1"按钮关闭modal
      let closeModal1Btn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0310_close_modal1'), 500)
      await closeModal1Btn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：跳转到modal页面，输入框焦点失焦，modal页面管理栈栈顶的根容器获焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0310 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0320
     * @tc.name   : Verify that clicking the "close modal 2" button on transition modal 2 page does not cause the TextInput on transition modal 1 page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0320 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0320')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击ModalPage场景测试按钮
      let modalTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0320_modal_test'), 500)
      await modalTestBtn.click()
      await driver.waitForIdle(1500, 2000)

      // 步骤3：点击"transition modal 1"按钮
      let modal1Btn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0320_modal1_btn'), 500)
      await modal1Btn.click()
      await driver.waitForIdle(1500, 2000)

      // 步骤4：点击modal1页面输入框
      let modal1TextInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0320_modal1_textinput'), 500)
      await modal1TextInput.click()
      await driver.waitForIdle(1500, 2000)

      // 步骤5：反复点击"transition modal 2"按钮，"close modal 2"按钮
      let modal2Btn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0320_modal2_btn'), 2000)
      await modal2Btn.click()
      await driver.waitForIdle(2000, 3000)

      let closeModal2Btn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0320_close_modal2'), 2000)
      await closeModal2Btn.click()
      await driver.waitForIdle(2000, 3000)

      // 截图验证：跳转到modal 1/2页面，焦点在原输入框，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0320 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0330
     * @tc.name   : Verify that clicking the "Confirm button" on ActionSheet does not cause the TextInput on sheetPage to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0330 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0330')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击sheetPage场景测试按钮
      let sheetTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0330_sheet_test'), 500)
      await sheetTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0330_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)
      await driver.pressBack()
      await driver.waitForIdle(500,1000)

      // 步骤4：点击"Click to Show ActionSheet"按钮
      let showSheetBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0330_show_sheet_btn'), 500)
      await showSheetBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击"Confirm button"按钮
      let confirmBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0330_confirm_btn'), 500)
      await confirmBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：回到原页面，焦点在原输入框，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0330 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0340
     * @tc.name   : Verify that opening and closing the second Dialog does not cause the TextInput on Dialog page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0340 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0340')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Dialog场景测试按钮
      let dialogTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0340_dialog_test'), 500)
      await dialogTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击输入框
      let textInput = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0340_textinput'), 500)
      await textInput.click()
      await driver.waitForIdle(1000, 2000)
      await driver.pressBack()
      await driver.waitForIdle(500,1000)

      // 步骤4：点击"Click me"按钮打开第一个弹窗
      let openDialogBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0340_open_dialog'), 500)
      await openDialogBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击"点我打开第二个弹窗"按钮
      let openSecondDialogBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0340_open_second_dialog'), 500)
      await openSecondDialogBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤6：点击"点我关闭第二个弹窗"按钮
      let closeSecondDialogBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0340_close_second_dialog'), 500)
      await closeSecondDialogBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤7：点击空白处关闭第一个弹窗
      await driver.click(500, 500)
      await driver.waitForIdle(1000, 2000)

      // 截图验证：回到原页面，焦点在原输入框，未失焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0340 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0350
     * @tc.name   : Verify that clicking the "pop" button on pushpageOne page does not cause the Navigation page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0350 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0350')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0350_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"pushpageOne"按钮
      let pushBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0350_push'), 500)
      await pushBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击pop按钮
      let popBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0350_pop'), 500)
      await popBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点回到初始页面管理栈栈顶
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0350 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0360
     * @tc.name   : Verify that clicking the "clear" button on pushpageOne page does not cause the Navigation page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0360 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0360')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0360_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"pushpageOne"按钮
      let pushBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0360_push'), 500)
      await pushBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击clear按钮
      let clearBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0360_clear'), 500)
      await clearBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点回到初始页面管理栈栈顶
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0360 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0370
     * @tc.name   : Verify that clicking the "pop" button on pageThree page does not cause the Navigation page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0370 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0370')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0370_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"replacePageThree"按钮
      let replaceBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0370_replace'), 500)
      await replaceBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击pop按钮
      let popBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0370_pop'), 500)
      await popBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：回到原页面，焦点在defaultFocus上
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0370 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0380
     * @tc.name   : Verify that clicking the "clear" button on pageThree page does not cause the Navigation page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0380 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0380')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Navigation场景测试按钮
      let navTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0380_nav_test'), 500)
      await navTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"replacePageThree"按钮
      let replaceBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0380_replace'), 500)
      await replaceBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击clear按钮
      let clearBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0380_clear'), 500)
      await clearBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点在原来的defaultFocus上
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0380 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0390
     * @tc.name   : Verify that clicking the "click me" button on Dialog page does not cause the Dialog page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0390 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0390')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Dialog场景测试按钮
      let dialogTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0390_dialog_test'), 500)
      await dialogTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"click me"按钮打开弹窗
      let openDialogBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0390_open_dialog'), 500)
      await openDialogBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击空白处关闭弹窗
      await driver.click(100, 100)
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点在初始页面defaultFocus
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0390 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0400
     * @tc.name   : Verify that clicking the "跳转" button on defaultFocus page does not cause the defaultFocus page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0400 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0400')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击defaultFocus场景测试按钮
      let focusTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0400_focus_test'), 500)
      await focusTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"跳转"按钮
      let jumpBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0400_jump'), 500)
      await jumpBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击返回按钮
      let backBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0400_back'), 500)
      await backBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点回到原页面栈顶
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0400 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0410
     * @tc.name   : Verify that clicking the "Dialog" button on defaultFocus page does not cause the defaultFocus page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0410 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0410')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击defaultFocus场景测试按钮
      let focusTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0410_focus_test'), 500)
      await focusTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"Dialog"按钮
      let dialogBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0410_dialog'), 500)
      await dialogBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击空白处关闭弹窗
      await driver.click(100, 100)
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点回到初始页面栈顶
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0410 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0420
     * @tc.name   : Verify that clicking the "Dialog2" button on defaultFocus page does not cause the defaultFocus page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0420 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0420')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击defaultFocus场景测试按钮
      let focusTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0420_focus_test'), 500)
      await focusTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"Dialog2"按钮，跳转到pageTwo并弹出弹窗
      let dialog2Btn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0420_dialog2'), 500)
      await dialog2Btn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击弹窗内容
      let dialogContentBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0420_dialog_content'), 500)
      await dialogContentBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点回到初始页面栈顶
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0420 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0430
     * @tc.name   : Verify that clicking the "文本+勾选弹出框" button on defaultFocus page does not cause the defaultFocus page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0430 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0430')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击defaultFocus场景测试按钮
      let focusTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0430_focus_test'), 500)
      await focusTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"文本+勾选弹出框"按钮
      let checkboxDialogBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0430_checkbox_dialog'), 500)
      await checkboxDialogBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击弹窗内容选项
      let option1 = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0430_option1'), 500)
      await option1.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点回到初始页面栈顶
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0430 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0440
     * @tc.name   : Verify that clicking the "跳转" and "dialog" button on defaultFocus page does not cause the defaultFocus page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0440 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0440')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击defaultFocus场景测试按钮
      let focusTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0440_focus_test'), 500)
      await focusTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"跳转"按钮，页面跳转到pageOne
      let jumpBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0440_jump'), 500)
      await jumpBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击"dialog"按钮
      let dialogBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0440_dialog'), 500)
      await dialogBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击空白处关闭弹窗
      await driver.click(100, 100)
      await driver.waitForIdle(1000, 2000)

      // 截图验证：pageOne页面defaultFocus失焦，焦点回到栈顶
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0440 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0450
     * @tc.name   : Verify that clicking the "dialog2" button on defaultFocus page does not cause the defaultFocus page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0450 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0450')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击defaultFocus场景测试按钮
      let focusTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0450_focus_test'), 500)
      await focusTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"跳转"按钮
      let jumpBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0450_jump'), 500)
      await jumpBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击"dialog2"按钮
      let dialog2Btn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0450_dialog2'), 500)
      await dialog2Btn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击弹窗内容按钮
      let dialogContentBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0450_dialog_content'), 500)
      await dialogContentBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：pageOne页面defaultFocus失焦，焦点回到栈顶
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0450 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0460
     * @tc.name   : Verify that clicking the "文本+勾选弹出框" button on defaultFocus page does not cause the defaultFocus page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0460 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0460')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击defaultFocus场景测试按钮
      let focusTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0460_focus_test'), 500)
      await focusTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"跳转"按钮
      let jumpBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0460_jump'), 500)
      await jumpBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击"文本+勾选弹出框"按钮
      let checkboxDialogBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0460_checkbox_dialog'), 500)
      await checkboxDialogBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：点击弹窗内容选项
      let option1 = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0460_option1'), 500)
      await option1.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：pageOne页面defaultFocus失焦，焦点回到栈顶
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0460 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0470
     * @tc.name   : Verify that clicking the "show next" and "show previous" buttons on swiper page does not cause the swiper page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0470 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0470')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击swiper场景测试按钮
      let swiperTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0470_swiper_test'), 500)
      await swiperTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"show next"按钮
      let showNextBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0470_show_next'), 500)
      await showNextBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击"show previous"按钮
      let showPreviousBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0470_show_previous'), 500)
      await showPreviousBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：页面切换，焦点在defaultFocus上
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0470 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0490
     * @tc.name   : Verify that clicking the "show menu" button on Menu page does not cause the Menu page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0490 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0490')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Menu场景测试按钮
      let menuTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0490_menu_test'), 500)
      await menuTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"show menu"按钮
      let showMenuBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0490_show_menu'), 500)
      await showMenuBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击标题内容后返回
      let menuItem1 = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0490_menu_item1'), 500)
      await menuItem1.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：回到原页面，焦点在defaultFocus上
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0490 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0500
     * @tc.name   : Verify that clicking the "Popup" button on Popup page does not cause the Popup page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0500 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0500')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Popup场景测试按钮
      let popupTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0500_popup_test'), 500)
      await popupTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"Popup"按钮
      let popupBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0500_popup_btn'), 500)
      await popupBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击空白处关闭Popup
      await driver.click(100, 100)
      await driver.waitForIdle(1000, 2000)

      // 截图验证：回到原页面，焦点在defaultFocus上
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0500 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0510
     * @tc.name   : Verify that clicking the "PopupOptions" button on Popup page does not cause the Popup page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0510 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0510')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Popup场景测试按钮
      let popupTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0510_popup_test'), 500)
      await popupTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"PopupOptions"按钮
      let popupOptionsBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0510_popup_options_btn'), 500)
      await popupOptionsBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击空白处关闭Popup
      await driver.click(100, 100)
      await driver.waitForIdle(1000, 2000)

      // 截图验证：回到原页面，焦点在defaultFocus上
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0510 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0520
     * @tc.name   : Verify that clicking the "CustomPopupOptions" button on Popup page does not cause the Popup page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0520 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0520')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Popup场景测试按钮
      let popupTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0520_popup_test'), 500)
      await popupTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"CustomPopupOptions"按钮
      let customPopupBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0520_custom_popup_btn'), 500)
      await customPopupBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击空白处关闭Popup
      await driver.click(100, 100)
      await driver.waitForIdle(1000, 2000)

      // 截图验证：回到原页面，焦点在defaultFocus上
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0520 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0530
     * @tc.name   : Verify that clicking the "transition modal 1" button on modal page does not cause the modal 1 page to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0530 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0530')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击modal场景测试按钮
      let modalTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0530_modal_test'), 500)
      await modalTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"transition modal 1"按钮
      let modal1Btn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0530_modal1_btn'), 500)
      await modal1Btn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：切换页面到modal 1，焦点在modal 1页面defaultFocus上
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0530 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0550
     * @tc.name   : Verify that clicking the "Confirm button" on Sheetpage does not cause the Sheetpage to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0550 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0550')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Sheetpage场景测试按钮
      let sheetTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0550_sheet_test'), 500)
      await sheetTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"Click to show actionSheet"按钮
      let showSheetBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0550_show_sheet_btn'), 500)
      await showSheetBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击"Confirm button"按钮
      let confirmBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0550_confirm_btn'), 500)
      await confirmBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：回到原页面，焦点在defaultFocus上
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0550 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0560
     * @tc.name   : Verify that clicking the "Confirm button" on ModalPage with abnormal setAutoFocusTransfer value does not cause TextInput to lose focus.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0560 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0560')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击Sheetpage场景测试按钮
      let sheetTestBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0560_sheet_test'), 500)
      await sheetTestBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击"Click to show actionSheet"按钮
      let showSheetBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0560_show_sheet_btn'), 500)
      await showSheetBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：点击"Confirm button"按钮
      let confirmBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0560_confirm_btn'), 500)
      await confirmBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：焦点在原页面defaultFocus上
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0560 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0570
     * @tc.name   : Verify that setAutoFocusTransfer with abnormal value (null/undefined) behaves same as true.
     * @tc.desc   : Verify commonattr setautofocustransfer focusview interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0570 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/action_event/SetAutofocusTransferFocusview/SetAutofocusTransferFocusview0570')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击异常值场景测试按钮
      let testBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0570_test'), 500)
      await testBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：测试Navigation场景 - 点击pushPageOne
      let pushBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0570_push'), 500)
      await pushBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 点击pop返回
      let popBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0570_pop'), 500)
      await popBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 测试Popup场景 - 点击show Popup
      let showPopupBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0570_show_popup'), 500)
      await showPopupBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 关闭Popup
      let closePopupBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0570_close_popup'), 500)
      if (closePopupBtn) {
        await closePopupBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 测试Sheet场景 - 点击show Sheet
      let showSheetBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0570_show_sheet'), 500)
      await showSheetBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 点击Confirm关闭Sheet
      let confirmBtn = await driver.waitForComponent(ON.id('setautofocustransfer_focusview_0570_confirm'), 500)
      await confirmBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证：测试结果与值为true结果相同
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0570 finish.`);
      done()
    })


  })
}