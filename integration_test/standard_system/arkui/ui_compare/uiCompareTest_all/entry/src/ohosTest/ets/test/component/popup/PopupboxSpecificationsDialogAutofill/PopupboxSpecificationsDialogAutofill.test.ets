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

export default function popupboxSpecificationsDialogAutofill() {

  describe('popupboxSpecificationsDialogAutofill', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0060
     * @tc.name   : Verify Normal input mode popup does not auto-fill
     * @tc.desc   : Verify popupbox specifications dialog autofill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0060 start.`);
      // 步骤1：编译hap并运行执行
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsDialogAutofill/PopupboxSpecificationsDialogAutofill0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击输入框，观察输入法是否弹出输入保存的内容提示
      let inputField = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0060_001'), 500)
      await inputField.click()
      await Utils.sleep(1000)
      // 步骤3：输入后校验，输入框看是否是原先保存过的数据
      // 预期结果：不能实现自动填充
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0070
     * @tc.name   : Verify NUMBER_DECIMAL input mode popup does not auto-save
     * @tc.desc   : Verify popupbox specifications dialog autofill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0070 start.`);
      // 步骤1：编译hap并运行执行
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsDialogAutofill/PopupboxSpecificationsDialogAutofill0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：输入NUMBER_DECIMAL输入模式下，输入框输入支持的内容
      let inputField = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0070_001'), 500)
      await inputField.click()
      await Utils.sleep(1000)
      // 步骤3：关闭dialog并重新打开
      // 步骤4：查看输入内容 - 预期不能实现自动保存
      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0080
     * @tc.name   : Verify NUMBER_DECIMAL input mode popup does not auto-fill
     * @tc.desc   : Verify popupbox specifications dialog autofill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0080 start.`);
      // 步骤1：编译hap并运行执行
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsDialogAutofill/PopupboxSpecificationsDialogAutofill0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击输入框，观察输入法是否弹出输入保存的内容提示
      let inputField = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0080_001'), 500)
      await inputField.click()
      await Utils.sleep(1000)
      // 步骤3：输入后校验，输入框看是否是原先保存过的数据
      // 预期结果：不能实现自动填充
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0090
     * @tc.name   : Verify NUMBER_PASSWORD input mode popup does not auto-save
     * @tc.desc   : Verify popupbox specifications dialog autofill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0090 start.`);
      // 步骤1：编译hap并运行执行
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsDialogAutofill/PopupboxSpecificationsDialogAutofill0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：输入NUMBER_PASSWORD输入模式下，输入框输入支持的内容
      let inputField = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0090_001'), 500)
      await inputField.click()
      await Utils.sleep(1000)
      // 步骤3：关闭dialog并重新打开
      // 步骤4：查看输入内容 - 预期不能实现自动保存
      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0100
     * @tc.name   : Verify NUMBER_PASSWORD input mode popup does not auto-fill
     * @tc.desc   : Verify popupbox specifications dialog autofill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0100 start.`);
      // 步骤1：编译hap并运行执行
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsDialogAutofill/PopupboxSpecificationsDialogAutofill0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击输入框，观察输入法是否弹出输入保存的内容提示
      let inputField = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0100_001'), 500)
      await inputField.click()
      await Utils.sleep(1000)
      // 步骤3：输入后校验，输入框看是否是原先保存过的数据
      // 预期结果：不能实现自动填充
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0110
     * @tc.name   : Verify Number input mode popup does not auto-save
     * @tc.desc   : Verify popupbox specifications dialog autofill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0110 start.`);
      // 步骤1：编译hap并运行执行
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsDialogAutofill/PopupboxSpecificationsDialogAutofill0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：输入Number输入模式下，输入框输入支持的内容
      let inputField = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0110_001'), 500)
      await inputField.click()
      await Utils.sleep(1000)
      // 步骤3：关闭dialog并重新打开
      // 步骤4：查看输入内容 - 预期不能实现自动保存
      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0120
     * @tc.name   : Verify Number input mode popup does not auto-fill
     * @tc.desc   : Verify popupbox specifications dialog autofill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0120 start.`);
      // 步骤1：编译hap并运行执行
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsDialogAutofill/PopupboxSpecificationsDialogAutofill0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击输入框，观察输入法是否弹出输入保存的内容提示
      let inputField = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0120_001'), 500)
      await inputField.click()
      await Utils.sleep(1000)
      // 步骤3：输入后校验，输入框看是否是原先保存过的数据
      // 预期结果：不能实现自动填充
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0130
     * @tc.name   : Verify Password input mode popup can auto-save
     * @tc.desc   : Verify popupbox specifications dialog autofill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0130 start.`);
      // 步骤1：编译hap并运行执行
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsDialogAutofill/PopupboxSpecificationsDialogAutofill0130')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：输入Password输入模式下，输入框输入支持的内容
      let inputField = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0130_001'), 500)
      await inputField.click()
      await Utils.sleep(1000)
      // 步骤3：关闭dialog并重新打开
      // 步骤4：查看输入内容 - 预期能够实现自动保存
      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0130 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0140
     * @tc.name   : Verify Password input mode popup can auto-fill
     * @tc.desc   : Verify popupbox specifications dialog autofill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0140 start.`);
      // 步骤1：编译hap并运行执行
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsDialogAutofill/PopupboxSpecificationsDialogAutofill0140')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击输入框，观察输入法是否弹出输入保存的内容提示
      let inputField = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0140_001'), 500)
      await inputField.click()
      await Utils.sleep(1000)
      // 步骤3：输入后校验，输入框看是否是原先保存过的数据
      // 预期结果：能够实现自动填充，且输入框是原先保存过的数据
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0150
     * @tc.name   : Verify PhoneNumber input mode popup does not auto-save
     * @tc.desc   : Verify popupbox specifications dialog autofill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0150 start.`);
      // 步骤1：编译hap并运行执行
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsDialogAutofill/PopupboxSpecificationsDialogAutofill0150')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：输入PhoneNumber输入模式下，输入框输入支持的内容
      let inputField = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0150_001'), 500)
      await inputField.click()
      await Utils.sleep(1000)
      // 步骤3：关闭dialog并重新打开
      // 步骤4：查看输入内容 - 预期不能实现自动保存
      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0150 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0160
     * @tc.name   : Verify PhoneNumber input mode popup does not auto-fill
     * @tc.desc   : Verify popupbox specifications dialog autofill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0160 start.`);
      // 步骤1：编译hap并运行执行
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsDialogAutofill/PopupboxSpecificationsDialogAutofill0160')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击输入框，观察输入法是否弹出输入保存的内容提示
      let inputField = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0160_001'), 500)
      await inputField.click()
      await Utils.sleep(1000)
      // 步骤3：输入后校验，输入框看是否是原先保存过的数据
      // 预期结果：不能实现自动填充
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0160 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0170
     * @tc.name   : Verify URL input mode popup does not auto-save
     * @tc.desc   : Verify popupbox specifications dialog autofill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0170 start.`);
      // 步骤1：编译hap并运行执行
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsDialogAutofill/PopupboxSpecificationsDialogAutofill0170')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：输入URL输入模式下，输入框输入支持的内容
      let inputField = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0170_001'), 500)
      await inputField.click()
      await Utils.sleep(1000)
      // 步骤3：关闭dialog并重新打开
      // 步骤4：查看输入内容 - 预期不能实现自动保存
      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0170 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0180
     * @tc.name   : Verify URL input mode popup does not auto-fill
     * @tc.desc   : Verify popupbox specifications dialog autofill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0180 start.`);
      // 步骤1：编译hap并运行执行
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsDialogAutofill/PopupboxSpecificationsDialogAutofill0180')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击输入框，观察输入法是否弹出输入保存的内容提示
      let inputField = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0180_001'), 500)
      await inputField.click()
      await Utils.sleep(1000)
      // 步骤3：输入后校验，输入框看是否是原先保存过的数据
      // 预期结果：不能实现自动填充
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0180 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0190
     * @tc.name   : Verify USER_NAME input mode popup can auto-save
     * @tc.desc   : Verify popupbox specifications dialog autofill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0190 start.`);
      // 步骤1：编译hap并运行执行
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsDialogAutofill/PopupboxSpecificationsDialogAutofill0190')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：输入USER_NAME输入模式下，输入框输入支持的内容
      let inputField = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0190_001'), 500)
      await inputField.click()
      await Utils.sleep(1000)
      // 步骤3：关闭dialog并重新打开
      // 步骤4：查看输入内容 - 预期能够实现自动保存
      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0190 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0200
     * @tc.name   : Verify USER_NAME input mode popup can auto-fill
     * @tc.desc   : Verify popupbox specifications dialog autofill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0200 start.`);
      // 步骤1：编译hap并运行执行
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsDialogAutofill/PopupboxSpecificationsDialogAutofill0200')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击输入框，观察输入法是否弹出输入保存的内容提示
      let inputField = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0200_001'), 500)
      await inputField.click()
      await Utils.sleep(1000)
      // 步骤3：输入后校验，输入框看是否是原先保存过的数据
      // 预期结果：能够实现自动填充，且输入框是原先保存过的数据
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0200 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0210
     * @tc.name   : Verify popup can configure keyboard
     * @tc.desc   : Verify popupbox specifications dialog autofill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0210 start.`);
      // 步骤1：打开dialog输入框
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsDialogAutofill/PopupboxSpecificationsDialogAutofill0210')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：弹出输入法，观察输入法和弹窗的交互
      let inputField = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0210_001'), 500)
      await inputField.click()
      await Utils.sleep(1000)
      // 预期结果：弹窗可以配置键盘
      // 步骤3：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0210 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0220
     * @tc.name   : Verify popup saved content matches input field content
     * @tc.desc   : Verify popupbox specifications dialog autofill interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0220 start.`);
      // 步骤1：编译hap并运行执行
      Settings.createWindow('testability/pages/component/popup/PopupboxSpecificationsDialogAutofill/PopupboxSpecificationsDialogAutofill0220')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：重复打开多个dialog
      // 步骤3：在多个输入框dialog中输入内容
      let inputField1 = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0220_001'), 2000)
      await inputField1.click()
      await Utils.sleep(1000)
      // 关闭输入法
      await driver.pressBack()
      await Utils.sleep(1000)
      // 步骤4：在打开的dialog中输入不同的内容
      let inputField2 = await driver.waitForComponent(ON.id('PopupboxSpecificationsDialogAutofill0220_002'), 2000)
      await inputField2.click()
      await Utils.sleep(1000)
      // 关闭输入法
      await driver.pressBack()
      await Utils.sleep(1000)
      // 步骤5：关闭一些dialog，并重新打开输入，查看是自动保存和自动填充的内容
      // 预期结果：能够实现自动保存和自动填充，且输入框是匹配输入框的内容
      // 步骤6：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_DIALOG_AUTOFILL_0220 finish.`);
      done()
    })

  })
}