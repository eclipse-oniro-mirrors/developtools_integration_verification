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

export default function commonAttrTabfocus() {

  describe('commonAttrTabfocus', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0010
     * @tc.name   : When tabbing through the page, the component designated as the default focus within the focus group receives focus first.
     * @tc.desc   : Verify commonattr tabfocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0010', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0010 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrTabfocus/CommonAttrTabfocus0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤1：按tab键走焦
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)

      // 预期结果：1、"defaultFocus：true"按钮获焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0020
     * @tc.name   : When tabbing, the first component in the focus group receives focus.
     * @tc.desc   : Verify commonattr tabfocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0020 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrTabfocus/CommonAttrTabfocus0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤1：按tab键走焦到焦点组1中
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)

      // 预期结果：1、"btn1"按钮获焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0030
     * @tc.name   : When holding tab key to navigate focus to the end of the page, focus can cycle through.
     * @tc.desc   : Verify commonattr tabfocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0030 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrTabfocus/CommonAttrTabfocus0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤1：长按tab键走焦（模拟多次按tab键走焦到页面尽头并循环）
      await driver.triggerKey(2049) // Tab键走焦到焦点组1
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键走焦到焦点组2
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键走焦到焦点组3
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键循环走焦回焦点组1
      await Utils.sleep(500)

      // 预期结果：1、可在页面内进行循环走焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0040
     * @tc.name   : Focus group with PREVIOUS priority and non-focus group with PRIOR priority, hold tab key to navigate focus across groups and cycle within page.
     * @tc.desc   : Verify commonattr tabfocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0040 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrTabfocus/CommonAttrTabfocus0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤1：长按tab键走焦
      // 走焦顺序：FocusPriority.PREVIOUS -> btn4 -> FocusPriority.PRIOR -> btn7 -> 循环
      await driver.triggerKey(2049) // Tab键 -> FocusPriority.PREVIOUS获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> btn4获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> FocusPriority.PRIOR获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> btn7获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> FocusPriority.PREVIOUS获焦（循环）
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> btn4获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> btn5获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> FocusPriority.PRIOR获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> btn7获焦
      await Utils.sleep(500)

      // 预期结果：1、走焦顺序为：FocusPriority.PREVIOUS->btn4->FocusPriority.PRIOR->btn7->循环
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0050
     * @tc.name   : Focus groups with tabIndex, cross-group cycling, after clicking button, the previously focused button in focus group receives focus during cycling.
     * @tc.desc   : Verify commonattr tabfocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0050 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrTabfocus/CommonAttrTabfocus0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤1：长按tab键进行走焦
      // 走焦顺序：焦点组2的btn1 -> 焦点组1的btn1 -> 焦点组3的btn1 -> 焦点组2的btn1（循环）
      await driver.triggerKey(2049) // Tab键 -> 焦点组2 btn1获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> 焦点组1 btn1获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> 焦点组3 btn1获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> 焦点组2 btn1获焦（循环）
      await Utils.sleep(500)

      // 步骤2：点击焦点组3中末尾的"btn2"按钮，长按tab键进行循环走焦
      let btn2_group3 = await driver.findComponent(ON.id('commonattr_tabfocus_0050_group3_btn2'))
      await btn2_group3.click()
      await Utils.sleep(300)
      // 走焦顺序：焦点组3的btn2 -> 焦点组2的btn1 -> 焦点组1的btn1 -> 焦点组3的btn2（循环）
      await driver.triggerKey(2049) // Tab键 -> 焦点组2 btn1获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> 焦点组1 btn1获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> 焦点组3 btn2获焦（上一次获焦的按钮）
      await Utils.sleep(500)

      // 预期结果：走焦顺序正确，循环走焦时焦点组3获焦到btn2
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0060
     * @tc.name   : Tab key navigation in dialog popup.
     * @tc.desc   : Verify commonattr tabfocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0060 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrTabfocus/CommonAttrTabfocus0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤1：点击"ComponentDialog"按钮
      let openDialogBtn = await driver.findComponent(ON.id('commonattr_tabfocus_0060_open_dialog'))
      await openDialogBtn.click()
      await Utils.sleep(500)

      // 步骤2：按tab键走焦
      // 走焦顺序：btn1 -> TextInput -> close按钮
      await driver.triggerKey(2049) // Tab键 -> btn1获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> TextInput获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> close按钮获焦
      await Utils.sleep(500)

      // 预期结果：1、走焦顺序:"btn1"-> TextInput -> "close"按钮
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0070
     * @tc.name   : Tab key navigation in popup component.
     * @tc.desc   : Verify commonattr tabfocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0070 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrTabfocus/CommonAttrTabfocus0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤1：点击"ComponentPopupOption1"按钮
      let openPopupBtn = await driver.findComponent(ON.id('commonattr_tabfocus_0070_open_popup'))
      await openPopupBtn.click()
      await Utils.sleep(500)

      // 步骤2：按tab键走焦
      // 走焦顺序：btn1 -> btn4
      await driver.triggerKey(2049) // Tab键 -> popup btn1获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> btn4获焦
      await Utils.sleep(500)

      // 步骤3：点击btn3，按tab键走焦
      let btn3 = await driver.findComponent(ON.id('commonattr_tabfocus_0070_popup_btn3'))
      await btn3.click()
      await Utils.sleep(300)
      // 走焦顺序：btn3 -> btn4
      await driver.triggerKey(2049) // Tab键 -> btn4获焦
      await Utils.sleep(500)

      // 预期结果：2、走焦顺序:"btn1"-> "btn4"  3、走焦顺序："btn3" -> "btn4"
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0080
     * @tc.name   : Tab key navigation in half-modal sheet.
     * @tc.desc   : Verify commonattr tabfocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0080 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrTabfocus/CommonAttrTabfocus0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤1：点击"bindSheet"按钮
      let openSheetBtn = await driver.findComponent(ON.id('commonattr_tabfocus_0080_open_sheet'))
      await openSheetBtn.click()
      await Utils.sleep(500)

      // 步骤2：按tab键走焦
      // 走焦顺序：btn1 -> btn4 -> X（关闭按钮）
      await driver.triggerKey(2049) // Tab键 -> btn1获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> btn2获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> btn3获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> btn4获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> X（关闭按钮）获焦
      await Utils.sleep(500)

      // 预期结果：1、走焦顺序:"btn1"-> "btn4" -> X  2、走焦顺序："btn2" -> "btn4"-> X
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0090
     * @tc.name   : Use requestFocus to make component in focus group receive focus.
     * @tc.desc   : Verify commonattr tabfocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0090', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0090 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrTabfocus/CommonAttrTabfocus0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤1：点击"requestFocus_焦点组1 btn2"按钮，按tab键走焦
      let requestGroup1Btn2 = await driver.findComponent(ON.id('commonattr_tabfocus_0090_request_group1_btn2'))
      await requestGroup1Btn2.click()
      await Utils.sleep(500)
      // 预期结果：焦点组1中btn2按钮获焦
      await driver.triggerKey(2049) // Tab键走焦
      await Utils.sleep(300)

      // 步骤2：点击"requestFocus_焦点组2 btn2"按钮，按tab键走焦
      let requestGroup2Btn2 = await driver.findComponent(ON.id('commonattr_tabfocus_0090_request_group2_btn2'))
      await requestGroup2Btn2.click()
      await Utils.sleep(500)
      // 预期结果：焦点组2中btn2按钮获焦
      await driver.triggerKey(2049) // Tab键走焦
      await Utils.sleep(500)

      // 预期结果：1、焦点组1中btn2按钮获焦  2、焦点组2中btn2按钮获焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0100
     * @tc.name   : Cross-page focus navigation, navigation changes from split to stack mode, tab key focus navigation.
     * @tc.desc   : Verify commonattr tabfocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0100', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0100 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrTabfocus/CommonAttrTabfocus0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤1：点击"push pageOne"
      let pushPageOneBtn = await driver.findComponent(ON.id('commonattr_tabfocus_0100_push_pageone'))
      await pushPageOneBtn.click()
      await Utils.sleep(500)

      // 步骤2：按tab键走焦到"push pageOne"按钮上
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(300)

      // 步骤3：点击"stack模式"按钮
      let stackModeBtn = await driver.findComponent(ON.id('commonattr_tabfocus_0100_stack_mode'))
      await stackModeBtn.click()
      await Utils.sleep(500)

      // 步骤4：连续点击tab键走焦
      // 预期结果：焦点在pageOne页面循环走焦
      await driver.triggerKey(2049) // Tab键 -> btn1获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> btn2获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> btn3获焦
      await Utils.sleep(300)
      await driver.triggerKey(2049) // Tab键 -> 循环回btn1
      await Utils.sleep(500)

      // 预期结果：4.焦点在pageOne页面循环走焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0110
     * @tc.name   : Use arrow keys to navigate focus within focus group and between focus group and non-focus group.
     * @tc.desc   : Verify commonattr tabfocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0110', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0110 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrTabfocus/CommonAttrTabfocus0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤1：按tab键，然后按方向上键走焦
      // 焦点组6中走焦顺序：defaultFocus:true -> btn2 -> btn1
      await driver.triggerKey(2049) // Tab键 -> 焦点组6 defaultFocus:true获焦
      await Utils.sleep(300)
      await driver.triggerKey(2012) // 方向上键 -> btn2获焦
      await Utils.sleep(300)
      await driver.triggerKey(2012) // 方向上键 -> btn1获焦
      await Utils.sleep(300)

      // 步骤2：按方向上键焦点从焦点组6走焦到焦点组5
      // 焦点优先走焦到焦点组5中的"单栏"按钮上
      await driver.triggerKey(2012) // 方向上键 -> 焦点组5 单栏获焦
      await Utils.sleep(300)

      // 步骤3：按方向下键，走焦到焦点组6中
      // 走焦顺序：单栏->双栏->pushpageOne->btn1->btn2->defaultFocus:true
      await driver.triggerKey(2013) // 方向下键 -> 双栏获焦
      await Utils.sleep(300)
      await driver.triggerKey(2013) // 方向下键 -> pushpageOne获焦
      await Utils.sleep(300)
      await driver.triggerKey(2013) // 方向下键 -> 焦点组6 btn1获焦
      await Utils.sleep(300)
      await driver.triggerKey(2013) // 方向下键 -> btn2获焦
      await Utils.sleep(300)
      await driver.triggerKey(2013) // 方向下键 -> defaultFocus:true获焦
      await Utils.sleep(500)

      // 预期结果：走焦顺序正确
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0120
     * @tc.name   : Use arrow keys for non-first-time focus navigation between focus group and non-focus group.
     * @tc.desc   : Verify commonattr tabfocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0120', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0120 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrTabfocus/CommonAttrTabfocus0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤1：按tab键，然后按方向键走焦
      // 焦点组6中走焦顺序：defaultFocus:true -> btn2 -> btn1
      await driver.triggerKey(2049) // Tab键 -> 焦点组6 defaultFocus:true获焦
      await Utils.sleep(300)
      await driver.triggerKey(2012) // 方向上键 -> btn2获焦
      await Utils.sleep(300)
      await driver.triggerKey(2012) // 方向上键 -> btn1获焦
      await Utils.sleep(300)

      // 焦点从焦点组6走到焦点组5
      // 焦点优先走焦到焦点组5中的"单栏"按钮上
      await driver.triggerKey(2012) // 方向上键 -> 焦点组5 单栏获焦
      await Utils.sleep(300)

      // 非首次走焦：从焦点组5走焦到焦点组6，再走回焦点组5
      await driver.triggerKey(2013) // 方向下键 -> 双栏获焦
      await Utils.sleep(300)
      await driver.triggerKey(2013) // 方向下键 -> pushpageOne获焦
      await Utils.sleep(300)
      await driver.triggerKey(2013) // 方向下键 -> 焦点组6 btn1获焦
      await Utils.sleep(300)
      await driver.triggerKey(2012) // 方向上键 -> 焦点组5 pushpageOne获焦（非首次走焦）
      await Utils.sleep(300)
      await driver.triggerKey(2013) // 方向下键 -> 焦点组6 btn1获焦
      await Utils.sleep(300)
      await driver.triggerKey(2013) // 方向下键 -> btn2获焦
      await Utils.sleep(300)
      await driver.triggerKey(2013) // 方向下键 -> defaultFocus:true获焦
      await Utils.sleep(500)

      // 预期结果：焦点可在焦点组之间切换走焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0130
     * @tc.name   : After page navigation, use arrow keys for first-time focus navigation in new page.
     * @tc.desc   : Verify commonattr tabfocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0130', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0130 start.`);
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrTabfocus/CommonAttrTabfocus0130')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤1：点击"push pageOne"
      let pushPageOneBtn = await driver.findComponent(ON.id('commonattr_tabfocus_0130_push_pageone'))
      await pushPageOneBtn.click()
      await Utils.sleep(500)

      // 步骤2：按tab键，然后按方向键走焦
      // 焦点组6中走焦顺序：defaultFocus:true -> btn2 -> btn1
      await driver.triggerKey(2049) // Tab键 -> 焦点组6 defaultFocus:true获焦
      await Utils.sleep(300)
      await driver.triggerKey(2012) // 方向上键 -> btn2获焦
      await Utils.sleep(300)
      await driver.triggerKey(2012) // 方向上键 -> btn1获焦
      await Utils.sleep(300)

      // 焦点优先走焦到焦点组5中的"单栏"按钮上
      await driver.triggerKey(2012) // 方向上键 -> 焦点组5 pushpageOne获焦
      await Utils.sleep(300)
      await driver.triggerKey(2012) // 方向上键 -> 双栏获焦
      await Utils.sleep(300)
      await driver.triggerKey(2012) // 方向上键 -> 单栏获焦
      await Utils.sleep(300)

      // 焦点在页面组件上走焦正常
      await driver.triggerKey(2013) // 方向下键 -> 双栏获焦
      await Utils.sleep(300)
      await driver.triggerKey(2013) // 方向下键 -> pushpageOne获焦
      await Utils.sleep(300)
      await driver.triggerKey(2013) // 方向下键 -> 焦点组6 btn1获焦
      await Utils.sleep(500)

      // 预期结果：焦点在页面组件上走焦正常
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0130 finish.`);
      done()
    })

  })
}