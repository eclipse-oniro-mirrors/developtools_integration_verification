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

export default function zindexMenubar() {

  describe('zindexMenubar', () => {
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
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0010
     * @tc.name   : When showInSubWindow is set to false and placement is set to BottomEnd, verify that the AlertDialog component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0010', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0010 start.`);
      // 步骤1：打开页面，设置showInSubWindow为false，设置placement为BottomEnd，打开alertDialog弹框后,观察alertDialog弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出AlertDialog，等待弹窗显示
      await driver.waitForIdle(1000,2000)

      // 步骤2：打开alertDialog弹框后,点由menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0010_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000,2000)

      // 步骤3：打开alertDialog弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000,2000)

      // 步骤4：打开alertDialog弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开AlertDialog
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0010_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000,2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000,2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000,2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000,2000)

      // 步骤5：打开alertDialog弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击alertDialog弹框
      // 重新打开AlertDialog
      await openButton.click()
      await driver.waitForIdle(1000,2000)
      // 点击AlertDialog的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.text('确定'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000,2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0090
     * @tc.name   : When showInSubWindow is set to false, verify that the TimePickerDialog component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0090', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0090 start.`);
      // 步骤1：打开页面，设置showInSubWindow为false，设置placement为BottomEnd，打开TimePickerDialog弹框后,观察TimePickerDialog弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出TimePickerDialog，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开TimePickerDialog弹框后,点由menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0090_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开TimePickerDialog弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开TimePickerDialog弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开TimePickerDialog
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0090_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开TimePickerDialog弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击TimePickerDialog弹框
      // 重新打开TimePickerDialog
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击TimePickerDialog的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.text('确定'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0100
     * @tc.name   : When showInSubWindow is set to false, verify that the ActionMenu component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0100', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0100 start.`);
      // 步骤1：打开页面，设置showInSubWindow为false，创建并显示ActionMenu后,观察ActionMenu弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出ActionMenu，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开ActionMenu弹框后,点由menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0100_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开ActionMenu弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开ActionMenu弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开ActionMenu
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0100_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开ActionMenu弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击ActionMenu弹框
      // 重新打开ActionMenu
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击ActionMenu的选项按钮验证点击事件响应
      let optionButton = await driver.waitForComponent(ON.text('选项一'), 500)
      if (optionButton) {
        await optionButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0110
     * @tc.name   : When showInSubWindow is set to false, verify that the dialog component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0110', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0110 start.`);
      // 步骤1：打开页面，设置showInSubWindow为false，创建并显示dialog后,观察dialog弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出dialog，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开dialog弹框后,点由menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0110_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开dialog弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开dialog弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开dialog
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0110_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开dialog弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击dialog弹框
      // 重新打开dialog
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击dialog的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.text('确定'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0120
     * @tc.name   : When showInSubWindow is set to true and placement is set to TopStart, verify that the AlertDialog component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0120', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0120 start.`);
      // 步骤1：打开页面，设置showInSubWindow为true，设置placement为TopStart，打开alertDialog弹框后,观察alertDialog弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出AlertDialog，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开alertDialog弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开alertDialog弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开AlertDialog
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0120_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开alertDialog弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击alertDialog弹框
      // 重新打开AlertDialog
      await openButton.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0130
     * @tc.name   : When showInSubWindow is set to true and placement is set to TopStart, verify that the CustomDialog component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0130', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0130 start.`);
      // 步骤1：打开页面，设置showInSubWindow为true，设置placement为TopStart，打开CustomDialog弹框后,观察CustomDialog弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0130')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出CustomDialog，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开CustomDialog弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开CustomDialog弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开CustomDialog
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0130_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开CustomDialog弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击CustomDialog弹框
      // 重新打开CustomDialog
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击CustomDialog的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.id('zindex_menubar_0130_confirm'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0130 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0140
     * @tc.name   : When showInSubWindow is set to true and placement is set to TopStart, verify that the OpenCustomDialog component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0140', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0140 start.`);
      // 步骤1：打开页面，设置showInSubWindow为true，设置placement为TopStart，打开OpenCustomDialog弹框后,观察OpenCustomDialog弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0140')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出OpenCustomDialog，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开OpenCustomDialog弹框后,点由menuBar上面的图标按钮
      // 由于弹框覆盖了menuBar上面的图标按钮，导致按钮没法响应
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0140_menubar'), 500)
      if (menuBarButton) {
        await menuBarButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 步骤3：打开OpenCustomDialog弹框后,侧滑返回
      // 模拟侧滑返回操作，验证OpenCustomDialog弹框正常消失
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开OpenCustomDialog弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开OpenCustomDialog
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0140_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开OpenCustomDialog弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击OpenCustomDialog弹框
      // 点击OpenCustomDialog的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.id('zindex_menubar_0140_confirm'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0150
     * @tc.name   : When showInSubWindow is set to true and placement is set to TopStart, verify that the dialog component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0150', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0150 start.`);
      // 步骤1：打开页面，设置showInSubWindow为true，placement设置为TopStart，创建并显示dialog后,观察dialog弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0150')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出dialog，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开dialog弹框后,点由menuBar上面的图标按钮
      // 由于弹框覆盖了menuBar上面的图标按钮，导致按钮没法响应
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0150_menubar'), 500)
      if (menuBarButton) {
        await menuBarButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 步骤3：打开dialog弹框后,侧滑返回
      // 模拟侧滑返回操作，验证dialog弹框正常消失
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开dialog弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开dialog
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0150_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开dialog弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击dialog弹框
      // 点击dialog的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.text('确定'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0150 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0160
     * @tc.name   : When showInSubWindow is set to true, verify that the ActionSheet component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0160', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0160 start.`);
      // 步骤1：打开页面，设置showInSubWindow为true，打开ActionSheet弹框后,观察ActionSheet弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0160')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出ActionSheet，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开ActionSheet弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开ActionSheet弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开ActionSheet
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0160_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开ActionSheet弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击ActionSheet弹框
      // 重新打开ActionSheet
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击ActionSheet的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.text('确定'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0160 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0170
     * @tc.name   : When showInSubWindow is set to true, verify that the CalendarPickerDialog component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0170', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0170 start.`);
      // 步骤1：打开页面，设置showInSubWindow为true，打开CalendarPickerDialog弹框后,观察CalendarPickerDialog弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0170')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出CalendarPickerDialog，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开CalendarPickerDialog弹框后,点由menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0170_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开CalendarPickerDialog弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开CalendarPickerDialog弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开CalendarPickerDialog
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0170_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开CalendarPickerDialog弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击CalendarPickerDialog弹框
      // 重新打开CalendarPickerDialog
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击CalendarPickerDialog的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.text('确定'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0170 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0180
     * @tc.name   : When showInSubWindow is set to true, verify that the DatePickerDialog component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0180', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0180 start.`);
      // 步骤1：打开页面，设置showInSubWindow为true，打开DatePickerDialog弹框后,观察DatePickerDialog弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0180')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出DatePickerDialog，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开DatePickerDialog弹框后,点由menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0180_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开DatePickerDialog弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开DatePickerDialog弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开DatePickerDialog
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0180_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开DatePickerDialog弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击DatePickerDialog弹框
      // 重新打开DatePickerDialog
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击DatePickerDialog的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.text('确定'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0180 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0190
     * @tc.name   : When showInSubWindow is set to true, verify that the Popup component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0190', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0190 start.`);
      // 步骤1：打开页面，设置showInSubWindow为true，打开Popup弹框后,观察Popup弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0190')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出Popup，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开Popup弹框后,侧滑返回
      // 模拟侧滑返回操作，验证Popup弹框正常消失
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开Popup弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开Popup
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0190_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开Popup弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击Popup弹框
      // 重新打开Popup
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击Popup的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.text('确定'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0190 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0200
     * @tc.name   : When showInSubWindow is set to true, verify that the TextPickerDialog component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0200', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0200 start.`);
      // 步骤1：打开页面，设置showInSubWindow为true，打开TextPickerDialog弹框后,观察TextPickerDialog弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0200')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出TextPickerDialog，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开TextPickerDialog弹框后,点由menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0200_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开TextPickerDialog弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开TextPickerDialog弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开TextPickerDialog
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0200_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开TextPickerDialog弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击TextPickerDialog弹框
      // 重新打开TextPickerDialog
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击TextPickerDialog的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.text('确定'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0200 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0210
     * @tc.name   : When showInSubWindow is set to true, verify that the TimePickerDialog component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0210', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0210 start.`);
      // 步骤1：打开页面，设置showInSubWindow为true，打开TimePickerDialog弹框后,观察TimePickerDialog弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0210')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出TimePickerDialog，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开TimePickerDialog弹框后,点由menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0210_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开TimePickerDialog弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开TimePickerDialog弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开TimePickerDialog
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0210_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开TimePickerDialog弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击TimePickerDialog弹框
      // 重新打开TimePickerDialog
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击TimePickerDialog的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.text('确定'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0210 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0220
     * @tc.name   : When showInSubWindow is set to true, verify that the ActionMenu component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0220', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0220 start.`);
      // 步骤1：打开页面，设置showInSubWindow为true，创建并显示ActionMenu后,观察ActionMenu弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0220')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出ActionMenu，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开ActionMenu弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开ActionMenu弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开ActionMenu
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0220_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开ActionMenu弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击ActionMenu弹框
      // 重新打开ActionMenu
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击ActionMenu的选项按钮验证点击事件响应
      let optionButton = await driver.waitForComponent(ON.text('选项一'), 500)
      if (optionButton) {
        await optionButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0220 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0230
     * @tc.name   : Verify that bindContextMenu's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0230', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0230 start.`);
      // 步骤1：打开页面，添加bindContextMenu
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0230')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：长按bindContextMenu调起菜单
      let contextArea = await driver.waitForComponent(ON.id('zindex_menubar_0230_context'), 2000)
      if (contextArea) {
        await contextArea.longClick()
        await driver.waitForIdle(1000, 2000)

        // 步骤3：点击menuBar上面的图标按钮
        let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0230_menubar'), 2000)
        if (menuBarButton) {
          await menuBarButton.click()
          await driver.waitForIdle(1000, 2000)
        }

        // 步骤4：再次长按调起菜单，观察现象
        contextArea = await driver.waitForComponent(ON.id('zindex_menubar_0230_context'), 2000)
        if (contextArea) {
          await contextArea.longClick()
          await driver.waitForIdle(1000, 2000)

          // 点击菜单选项验证点击事件响应
          let menuOption = await driver.waitForComponent(ON.text('菜单选项一'), 2000)
          if (menuOption) {
            await menuOption.click()
            await driver.waitForIdle(1000, 2000)
          }
        }
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0230 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0240
     * @tc.name   : Verify that bindMenu's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0240', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0240 start.`);
      // 步骤1：打开页面，添加bindMenu
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0240')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击bindMenu调起菜单
      let menuButton = await driver.waitForComponent(ON.id('zindex_menubar_0240_menu'), 500)
      await menuButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击bindMenu调起菜单，然后点击右上角的MenuBar
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0240_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察现象，验证调起菜单的时候可以点击到右上角的MenuBar，菜单会避让点击MenuBar而调起的appbar服务面板
      // 再次点击调起菜单
      await menuButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击菜单选项验证点击事件响应
      let menuOption = await driver.waitForComponent(ON.text('菜单选项一'), 500)
      if (menuOption) {
        await menuOption.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0240 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0250
     * @tc.name   : Verify that bindsheet component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0250', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0250 start.`);
      // 步骤1：打开页面，打开bindsheet弹框后,观察bindsheet弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0250')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出bindsheet，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开bindsheet弹框后,点由menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0250_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开bindsheet弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开bindsheet弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开bindsheet
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0250_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开bindsheet弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击bindsheet弹框
      // 重新打开bindsheet
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击bindsheet的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.id('zindex_menubar_0250_confirm'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0250 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0260
     * @tc.name   : Verify Z-order when bindsheet triggers customDialog then SubCustomDialog.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0260', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0260 start.`);
      // 步骤1：打开bindsheet弹框后,调起customDialog，再在customDialog调起SubCustomDialog,观察SubCustomDialog弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0260')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出bindsheet，等待弹窗显示
      await driver.waitForIdle(1000, 2000)
      // 点击打开CustomDialog按钮
      let openCustomButton = await driver.waitForComponent(ON.id('zindex_menubar_0260_open_custom'), 500)
      await openCustomButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击打开SubCustomDialog按钮
      let openSubButton = await driver.waitForComponent(ON.id('zindex_menubar_0260_open_sub'), 500)
      await openSubButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开SubCustomDialog弹框后,点由menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0260_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开SubCustomDialog弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开SubCustomDialog弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开bindsheet
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0260_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 重新打开CustomDialog
      openCustomButton = await driver.waitForComponent(ON.id('zindex_menubar_0260_open_custom'), 500)
      await openCustomButton.click()
      await driver.waitForIdle(1000, 2000)
      // 重新打开SubCustomDialog
      openSubButton = await driver.waitForComponent(ON.id('zindex_menubar_0260_open_sub'), 500)
      await openSubButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开SubCustomDialog弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击SubCustomDialog弹框
      // 重新打开bindsheet
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 重新打开CustomDialog
      openCustomButton = await driver.waitForComponent(ON.id('zindex_menubar_0260_open_custom'), 500)
      await openCustomButton.click()
      await driver.waitForIdle(1000, 2000)
      // 重新打开SubCustomDialog
      openSubButton = await driver.waitForComponent(ON.id('zindex_menubar_0260_open_sub'), 500)
      await openSubButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击SubCustomDialog的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.id('zindex_menubar_0260_sub_confirm'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0260 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0270
     * @tc.name   : Verify that UIContext ActionSheet component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0270', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0270 start.`);
      // 步骤1：UIcontext拉起ActionSheet弹框后,观察ActionSheet弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0270')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出ActionSheet，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开ActionSheet弹框后,点由menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0270_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开ActionSheet弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开ActionSheet弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开ActionSheet
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0270_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开ActionSheet弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击ActionSheet弹框
      // 重新打开ActionSheet
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击ActionSheet的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.text('确定'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0270 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0280
     * @tc.name   : Verify that UIContext AlertDialog component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0280', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0280 start.`);
      // 步骤1：UIcontext拉起alertDialog弹框后,观察alertDialog弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0280')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出AlertDialog，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开alertDialog弹框后,点由menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0280_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开alertDialog弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开alertDialog弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开AlertDialog
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0280_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开alertDialog弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击alertDialog弹框
      // 重新打开AlertDialog
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击AlertDialog的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.text('确定'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0280 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0290
     * @tc.name   : Verify that UIContext BindSheet component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0290', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0290 start.`);
      // 步骤1：UIcontext拉起bindsheet弹框后,观察bindsheet弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0290')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出BindSheet，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开bindsheet弹框后,点由menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0290_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开bindsheet弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开bindsheet弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开BindSheet
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0290_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开bindsheet弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击bindsheet弹框
      // 重新打开BindSheet
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击BindSheet的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.id('zindex_menubar_0290_confirm'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0290 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0300
     * @tc.name   : Verify that UIContext OverlayManager component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0300', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0300 start.`);
      // 步骤1：UIcontext拉起OverlayManager弹框后,观察OverlayManager弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0300')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出OverlayManager，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开OverlayManager弹框后,点由menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0300_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开OverlayManager弹框后,侧滑返回
      // 模拟侧滑返回操作，OverlayManager不消失
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开OverlayManager弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回，面板消失
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回，OverlayManager不消失
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 点击OverlayManager的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.id('zindex_menubar_0300_confirm'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0300 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0310
     * @tc.name   : Verify that UIContext PromptAction component's Z-order is below the menuBar.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0310', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0310 start.`);
      // 步骤1：UIcontext拉起PromptAction弹框后,观察PromptAction弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0310')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出PromptAction，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开PromptAction弹框后,点由menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0310_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开PromptAction弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开PromptAction弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开PromptAction
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0310_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开PromptAction弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击PromptAction弹框
      // 重新打开PromptAction
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击PromptAction的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.text('确定'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0310 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0320
     * @tc.name   : Verify Z-order when appbar service page is triggered first, then dialog.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0320', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0320 start.`);
      // 步骤1：通过setTimeout设置先调起appbar服务页面，再调起customDialog弹窗,观察customDialog的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0320')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后先触发menuBar再弹出CustomDialog，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开customDialog后,点击menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0320_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开customDialog后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开customDialog后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开CustomDialog
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0320_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开customDialog后,点击menubar的功能图标拉起面板,手动把面板拉下,点击customDialog
      // 重新打开CustomDialog
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击CustomDialog的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.id('zindex_menubar_0320_confirm'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0320 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0330
     * @tc.name   : Verify Z-order when triggering multiple different types of dialogs simultaneously.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0330', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0330 start.`);
      // 步骤1：配置一个button，点击button调起bindMenu/bindPopup/showToast/dialog等弹框,观察弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0330')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出多个弹框，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开弹框后,点击menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0330_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开多个弹框
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0330_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击弹框
      // 重新打开多个弹框
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击Dialog的确定按钮验证点击事件响应
      let confirmButton = await driver.waitForComponent(ON.text('确定'), 500)
      if (confirmButton) {
        await confirmButton.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0330 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0340
     * @tc.name   : Verify that toast's Z-order is below menuBar in normal mode.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0340', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0340 start.`);
      // 步骤1：创建并显示toast后,观察toast的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0340')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出Toast，等待显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开toast后,点由menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0340_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开toast后,侧滑返回
      // 重新显示Toast
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0340_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开toast后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新显示Toast
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开toast后,点击menubar的功能图标拉起面板,手动把面板拉下,点击toast
      // 重新显示Toast
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击toast区域，验证是否透传到下面的menubar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0340 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0350
     * @tc.name   : Verify that toast's Z-order is below menuBar in TopMost mode.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0350', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0350 start.`);
      // 步骤1：创建并显示toast后,观察toast的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0350')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出TopMost模式的Toast，等待显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开toast后,点由menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0350_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开toast后,侧滑返回
      // 重新显示Toast
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0350_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开toast后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新显示Toast
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击menuBar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开toast后,点击menubar的功能图标拉起面板,手动把面板拉下,点击toast
      // 重新显示Toast
      await openButton.click()
      await driver.waitForIdle(1000, 2000)
      // 点击toast区域，验证是否透传到下面的menubar按钮
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0350 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0360
     * @tc.name   : Verify Z-order when switching between portrait and landscape modes.
     * @tc.desc   : Verify attributes zindex menubar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0360', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0360 start.`);
      // 步骤1：多次横竖屏切换，依次打开各种弹框后,观察各种弹框的背景颜色、大小、位置
      Settings.createWindow('testability/pages/component/popup/ZindexMenubar/ZindexMenubar0360')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 页面打开后自动弹出多个弹框，等待弹窗显示
      await driver.waitForIdle(1000, 2000)

      // 步骤2：打开各种弹框后,点击menuBar上面的图标按钮
      let menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0360_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤3：打开各种弹框后,侧滑返回
      // 模拟侧滑返回操作
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：打开各种弹框后,点击menuBar的功能图标拉起面板,连续两次侧滑返回
      // 重新打开各种弹框
      let openButton = await driver.waitForComponent(ON.id('zindex_menubar_0360_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)

      // 再次横竖屏切换
      await driver.setDisplayRotation(1) // 切换到横屏
      await driver.waitForIdle(1000, 2000)

      // 点击menuBar按钮
      menuBarButton = await driver.waitForComponent(ON.id('zindex_menubar_0360_menubar'), 500)
      await menuBarButton.click()
      await driver.waitForIdle(1000, 2000)
      // 第一次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)
      // 第二次侧滑返回
      await driver.pressBack()
      await driver.waitForIdle(1000, 2000)

      // 切换回竖屏
      await driver.setDisplayRotation(0)
      await driver.waitForIdle(1000, 2000)

      // 步骤5：打开各种弹框后,点击menubar的功能图标拉起面板,手动把面板拉下,点击各种弹框
      // 重新打开各种弹框
      openButton = await driver.waitForComponent(ON.id('zindex_menubar_0360_open'), 500)
      await openButton.click()
      await driver.waitForIdle(1000, 2000)

      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0360 finish.`);
      done()
    })


  })
}