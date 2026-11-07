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

export default function popupboxSpecification() {

  describe('popupboxSpecification', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0010
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0010 start.`);
      // 步骤1-3：页面初始化，创建无按钮弹窗popup，有蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0010')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出不带button的弹框
      let popup_button_0010 = await driver.waitForComponent(ON.id('popup_button_0010'), 500)
      await popup_button_0010.click()
      await Utils.sleep(1000)
      
      // 预期结果：测试hap的弹框不消失（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0020
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0020 start.`);
      // 步骤1-3：页面初始化，创建无按钮弹窗popup，无蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0020')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出不带button的弹框
      let popup_button_0020 = await driver.waitForComponent(ON.id('popup_button_0020'), 500)
      await popup_button_0020.click()
      await Utils.sleep(1000)
      
      // 预期结果：测试hap的弹框不消失（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0030
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0030 start.`);
      // 步骤1-3：页面初始化，创建有按钮弹窗popup，有蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0030')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出带button的弹框
      let popup_button_0030 = await driver.waitForComponent(ON.id('popup_button_0030'), 500)
      await popup_button_0030.click()
      await Utils.sleep(1000)
      
      // 预期结果：图库能获焦（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0040
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0040 start.`);
      // 步骤1-3：页面初始化，创建有按钮弹窗popup，无蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0040')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出带button的弹框
      let popup_button_0040 = await driver.waitForComponent(ON.id('popup_button_0040'), 500)
      await popup_button_0040.click()
      await Utils.sleep(1000)
      
      // 预期结果：图库能获焦（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0050
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0050 start.`);
      // 步骤1-3：页面初始化，创建无按钮警告弹窗，有蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0050')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出不带button的警告弹框
      let popup_button_0050 = await driver.waitForComponent(ON.id('popup_button_0050'), 500)
      await popup_button_0050.click()
      await Utils.sleep(1000)
      
      // 预期结果：测试hap的弹框不消失（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0060
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0060 start.`);
      // 步骤1-3：页面初始化，创建无按钮警告弹窗，无蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0060')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出不带button的警告弹框
      let popup_button_0060 = await driver.waitForComponent(ON.id('popup_button_0060'), 500)
      await popup_button_0060.click()
      await Utils.sleep(1000)
      
      // 预期结果：测试hap的弹框不消失（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0070
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0070 start.`);
      // 步骤1-3：页面初始化，创建有按钮警告弹窗，有蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0070')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出带button的警告弹框
      let popup_button_0070 = await driver.waitForComponent(ON.id('popup_button_0070'), 500)
      await popup_button_0070.click()
      await Utils.sleep(1000)
      
      // 预期结果：图库能获焦（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0080
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0080 start.`);
      // 步骤1-3：页面初始化，创建有按钮警告弹窗，无蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0080')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出带button的警告弹框
      let popup_button_0080 = await driver.waitForComponent(ON.id('popup_button_0080'), 500)
      await popup_button_0080.click()
      await Utils.sleep(1000)
      
      // 预期结果：图库能获焦（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0090
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0090 start.`);
      // 步骤1-3：页面初始化，创建无按钮列表选择弹窗，有蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0090')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出不带button的列表选择弹框
      let popup_button_0090 = await driver.waitForComponent(ON.id('popup_button_0090'), 500)
      await popup_button_0090.click()
      await Utils.sleep(1000)
      
      // 预期结果：测试hap的弹框不消失（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0100
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0100 start.`);
      // 步骤1-3：页面初始化，创建无按钮列表选择弹窗，无蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0100')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出不带button的列表选择弹框
      let popup_button_0100 = await driver.waitForComponent(ON.id('popup_button_0100'), 500)
      await popup_button_0100.click()
      await Utils.sleep(1000)
      
      // 预期结果：测试hap的弹框不消失（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0110
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0110 start.`);
      // 步骤1-3：页面初始化，创建有按钮列表选择弹窗，有蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0110')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出带button的列表选择弹框
      let popup_button_0110 = await driver.waitForComponent(ON.id('popup_button_0110'), 500)
      await popup_button_0110.click()
      await Utils.sleep(1000)
      
      // 预期结果：图库能获焦（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0120
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0120 start.`);
      // 步骤1-3：页面初始化，创建有按钮列表选择弹窗，无蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0120')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出带button的列表选择弹框
      let popup_button_0120 = await driver.waitForComponent(ON.id('popup_button_0120'), 500)
      await popup_button_0120.click()
      await Utils.sleep(1000)
      
      // 预期结果：图库能获焦（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0250
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0250 start.`);
      // 步骤1-3：页面初始化，创建无按钮prompt弹窗，有蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0250')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出不带button的prompt弹框
      let popup_button_0250 = await driver.waitForComponent(ON.id('popup_button_0250'), 500)
      await popup_button_0250.click()
      await Utils.sleep(1000)
      
      // 预期结果：测试hap的弹框不消失（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0250 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0260
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0260 start.`);
      // 步骤1-3：页面初始化，创建无按钮prompt弹窗，无蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0260')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出不带button的prompt弹框
      let popup_button_0260 = await driver.waitForComponent(ON.id('popup_button_0260'), 500)
      await popup_button_0260.click()
      await Utils.sleep(1000)
      
      // 预期结果：测试hap的弹框不消失（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0260 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0270
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0270 start.`);
      // 步骤1-3：页面初始化，创建有按钮prompt弹窗，有蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0270')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出带button的prompt弹框
      let popup_button_0270 = await driver.waitForComponent(ON.id('popup_button_0270'), 500)
      await popup_button_0270.click()
      await Utils.sleep(1000)
      
      // 预期结果：图库能获焦（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0270 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0280
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0280 start.`);
      // 步骤1-3：页面初始化，创建有按钮prompt弹窗，无蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0280')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出带button的prompt弹框
      let popup_button_0280 = await driver.waitForComponent(ON.id('popup_button_0280'), 500)
      await popup_button_0280.click()
      await Utils.sleep(1000)
      
      // 预期结果：图库能获焦（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0280 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0290
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0290 start.`);
      // 步骤1-3：页面初始化，创建无按钮promptAction弹窗，有蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0290')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出不带button的promptAction弹框
      let popup_button_0290 = await driver.waitForComponent(ON.id('popup_button_0290'), 500)
      await popup_button_0290.click()
      await Utils.sleep(1000)
      
      // 预期结果：测试hap的弹框不消失（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0290 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0300
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0300 start.`);
      // 步骤1-3：页面初始化，创建无按钮promptAction弹窗，无蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0300')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出不带button的promptAction弹框
      let popup_button_0300 = await driver.waitForComponent(ON.id('popup_button_0300'), 500)
      await popup_button_0300.click()
      await Utils.sleep(1000)
      
      // 预期结果：测试hap的弹框不消失（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0300 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0310
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0310 start.`);
      // 步骤1-3：页面初始化，创建有按钮promptAction弹窗，有蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0310')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出带button的promptAction弹框
      let popup_button_0310 = await driver.waitForComponent(ON.id('popup_button_0310'), 500)
      await popup_button_0310.click()
      await Utils.sleep(1000)
      
      // 预期结果：图库能获焦（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0310 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0320
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0320 start.`);
      // 步骤1-3：页面初始化，创建有按钮promptAction弹窗，无蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0320')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出带button的promptAction弹框
      let popup_button_0320 = await driver.waitForComponent(ON.id('popup_button_0320'), 500)
      await popup_button_0320.click()
      await Utils.sleep(1000)
      
      // 预期结果：图库能获焦（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0320 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0330
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0330 start.`);
      // 步骤1-3：页面初始化，创建无按钮自定义弹窗，有蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0330')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出不带button的自定义弹框
      let popup_button_0330 = await driver.waitForComponent(ON.id('popup_button_0330'), 500)
      await popup_button_0330.click()
      await Utils.sleep(1000)
      
      // 预期结果：测试hap的弹框不消失（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0330 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0340
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0340 start.`);
      // 步骤1-3：页面初始化，创建无按钮自定义弹窗，无蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0340')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出不带button的自定义弹框
      let popup_button_0340 = await driver.waitForComponent(ON.id('popup_button_0340'), 500)
      await popup_button_0340.click()
      await Utils.sleep(1000)
      
      // 预期结果：测试hap的弹框不消失（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0340 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0350
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0350 start.`);
      // 步骤1-3：页面初始化，创建有按钮自定义弹窗，有蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0350')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出带button的自定义弹框
      let popup_button_0350 = await driver.waitForComponent(ON.id('popup_button_0350'), 500)
      await popup_button_0350.click()
      await Utils.sleep(1000)
      
      // 预期结果：图库能获焦（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0350 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0360
     * @tc.name   : Popupbox specifications
     * @tc.desc   : Verify popupbox specifications interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0360 start.`);
      // 步骤1-3：页面初始化，创建有按钮自定义弹窗，无蒙层，showInSubWindow属性设置为true
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecification/PopupboxSpecification0360')
      let driver = await Driver.create()
      await driver.waitForIdle(500,2000)
      
      // 步骤4-5：点击按钮弹出带button的自定义弹框
      let popup_button_0360 = await driver.waitForComponent(ON.id('popup_button_0360'), 500)
      await popup_button_0360.click()
      await Utils.sleep(1000)
      
      // 预期结果：图库能获焦（此时需要手动点击图库自由窗口进行验证）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0360 finish.`);
      done()
    })


  })
}