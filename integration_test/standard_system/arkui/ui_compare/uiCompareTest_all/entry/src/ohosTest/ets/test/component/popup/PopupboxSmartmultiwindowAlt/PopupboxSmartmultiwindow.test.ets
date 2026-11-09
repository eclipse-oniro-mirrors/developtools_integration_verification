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

export default function popupboxSmartmultiwindow() {

  describe('popupboxSmartmultiwindow', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0170
     * @tc.name   : On a bar-phone (slab device), perform floating-window operations: for the CustomDialog component, when KeyboardAvoidMode is set to default, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0170 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow0170')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行悬浮窗操作 - 页面打开后自动弹出CustomDialog
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮调起对应的Dialog组件（验证手动打开）
      // 先关闭自动打开的Dialog
      let closeBtn = await driver.waitForComponent(ON.id('customdialog_smartmultiwindow_0170_close'), 500)
      if (closeBtn) {
        await closeBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 手动点击按钮打开Dialog
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_0170_open'), 500)
      await openBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、子窗大小和主窗大小保持一致
      // 2、蒙层覆盖整个子窗
      // 3、组件布局和对齐完全基于子窗进行，根据窗口自适应比例缩放
      // 4、使用默认规则避让安全区和键盘
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0170 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0190
     * @tc.name   : On a bar-phone (slab device), perform split-screen operations: for the showDialog component, non-UIExtension, when ShowInSubWindow is true and KeyboardAvoidMode is set to default, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0190 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow0190')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行左右分屏操作 - 页面打开后自动弹出showDialog
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮调起对应的Dialog组件（验证手动打开）
      // 先关闭自动打开的Dialog
      let confirmBtn = await driver.waitForComponent(ON.text('确定'), 500)
      if (confirmBtn) {
        await confirmBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 手动点击按钮打开Dialog
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_0190_open'), 500)
      await openBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、子窗大小为全屏，主窗大小为应用窗口
      // 2、蒙层覆盖整个主窗
      // 3、组件布局和对齐完全基于子窗进行
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0190 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0290
     * @tc.name   : On a bar-phone (slab device), perform split-screen operations: for the bindContextMenu component with MenuPreviewMode set to image, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0290 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow0290')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行上下分屏操作
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮弹出菜单（长按图片触发上下文菜单）
      let imageComponent = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_0290_image'), 500)
      await imageComponent.longClick()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、子窗大小和主窗大小保持一致
      // 2、组件布局和对齐完全基于子窗进行
      // 3、组件根据窗口高度自适应，超长变为滚动模式
      // 4、菜单如无位置布局则覆盖在预览容器之上窗口居中显示
      // 5、使用默认规则避让安全区和键盘
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0290 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0300
     * @tc.name   : On a bar-phone (slab device), perform floating-window operations: for the sys_topmost component, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0300 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow0300')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行拉起悬浮窗操作 - 页面打开后自动弹出Toast
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮拉起对应的Toast组件（验证手动打开）
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_0300_open'), 3000)
      if (openBtn) {
        await openBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、窗大小和主窗大小保持一致
      // 2、组件布局和对齐完全基于子窗进行
      // 3、上下分屏比例小于1:1较大窗口依然底部对齐展示，较小窗口居中展示
      // 4、使用默认规则避让安全区和键盘
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0300 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0560
     * @tc.name   : On a bar-phone (slab device), perform split-screen operations: for the CustomDialog component, when KeyboardAvoidMode is set to default, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0560 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow0560')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行上下分屏操作 - 页面打开后自动弹出CustomDialog
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮调起对应的Dialog组件（验证手动打开）
      // 先关闭自动打开的Dialog
      let closeBtn = await driver.waitForComponent(ON.id('customdialog_smartmultiwindow_0560_close'), 500)
      if (closeBtn) {
        await closeBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 手动点击按钮打开Dialog
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_0560_open'), 500)
      await openBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、子窗大小和主窗大小保持一致
      // 2、蒙层覆盖整个子窗
      // 3、组件布局和对齐完全基于子窗进行
      // 4、使用默认规则避让安全区和键盘
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0560 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0570
     * @tc.name   : On a bar-phone (slab device), perform split-screen operations: for the openCustomDialog component, non-UIExtension, when ShowInSubWindow is true, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0570 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow0570')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行左右分屏操作 - 页面打开后自动弹出openCustomDialog
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮调起对应的Dialog组件（验证手动打开）
      // 先关闭自动打开的Dialog
      let closeBtn = await driver.waitForComponent(ON.id('opencustomdialog_smartmultiwindow_0570_close'), 3000)
      if (closeBtn) {
        await closeBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 手动点击按钮打开Dialog
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_0570_open'), 3000)
      if (openBtn) {
        await openBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、子窗大小和主窗大小保持一致
      // 2、蒙层覆盖整个子窗
      // 3、组件布局和对齐完全基于子窗进行
      // 4、不避让软键盘
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0570 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0660
     * @tc.name   : On a bar-phone (slab device), perform split-screen operations: for the showActionMenu component, non-UIExtension, when ShowInSubWindow is true, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0660 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow0660')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行左右分屏操作 - 页面打开后自动弹出showActionMenu
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮调起对应的Dialog组件（验证手动打开）
      // 先关闭自动打开的ActionMenu
      let cancelBtn = await driver.waitForComponent(ON.text('取消'), 500)
      if (cancelBtn) {
        await cancelBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 手动点击按钮打开ActionMenu
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_0660_open'), 500)
      await openBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、子窗大小为全屏，主窗大小为应用窗口
      // 2、蒙层覆盖整个主窗
      // 3、组件布局和对齐完全基于子窗进行
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0660 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0830
     * @tc.name   : On a bar-phone (slab device), perform split-screen operations: for the topmost component, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0830', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0830 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow0830')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行上下分屏操作 - 页面打开后自动弹出Toast
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮拉起对应的Toast组件（验证手动打开）
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_0830_open'), 3000)
      if (openBtn) {
        await openBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、窗大小和主窗大小保持一致
      // 2、组件布局和对齐完全基于子窗进行
      // 3、上下分屏比例小于1:1较大窗口依然底部对齐展示，较小窗口居中展示
      // 4、使用默认规则避让安全区和键盘
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0830 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0970
     * @tc.name   : On a bar-phone (slab device), perform split-screen operations: for the showActionMenu component, UIExtension, when ShowInSubWindow is false, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0970', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0970 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow0970')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行左右分屏操作 - 页面打开后自动弹出showActionMenu
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮调起对应的Dialog组件（验证手动打开）
      // 先关闭自动打开的ActionMenu
      let cancelBtn = await driver.waitForComponent(ON.text('取消'), 500)
      if (cancelBtn) {
        await cancelBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 手动点击按钮打开ActionMenu
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_0970_open'), 500)
      await openBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、蒙层覆盖整个UIExtension窗口
      // 2、组件布局和对齐完全基于UIExtension窗口进行
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0970 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1010
     * @tc.name   : On a bar-phone (slab device), perform split-screen operations: for the sys_topmost component, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1010 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow1010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行上下分屏操作 - 页面打开后自动弹出Toast
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮拉起对应的Toast组件（验证手动打开）
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_1010_open'), 3000)
      if (openBtn) {
        await openBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、窗大小和主窗大小保持一致
      // 2、组件布局和对齐完全基于子窗进行
      // 3、上下分屏比例小于1:1较大窗口依然底部对齐展示，较小窗口居中展示
      // 4、使用默认规则避让安全区和键盘
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1080
     * @tc.name   : On a bar-phone (slab device), perform split-screen operations: for the openCustomDialog component, UIExtension, when ShowInSubWindow is true, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1080 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow1080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行左右分屏操作 - 页面打开后自动弹出openCustomDialog
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮调起对应的Dialog组件（验证手动打开）
      // 先点击蒙层关闭自动打开的Dialog
      await driver.click(50, 50)
      await driver.waitForIdle(1000, 2000)

      // 手动点击按钮打开Dialog
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_1080_open'), 3000)
      if (openBtn) {
        await openBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、蒙层覆盖整个应用窗口
      // 2、组件布局和对齐完全基于应用窗口进行
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1250
     * @tc.name   : On a bar-phone (slab device), perform split-screen operations: for the ActionSheet component, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1250 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow1250')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行上下分屏操作 - 页面打开后自动弹出ActionSheet
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮调起对应的Dialog组件（验证手动打开）
      // 先关闭自动打开的ActionSheet
      let cancelBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_1250_cancel'), 500)
      if (cancelBtn) {
        await cancelBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 手动点击按钮打开ActionSheet
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_1250_open'), 500)
      await openBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、子窗大小和主窗大小保持一致
      // 2、蒙层覆盖整个子窗
      // 3、组件布局和对齐完全基于子窗进行
      // 4、使用默认规则避让安全区和键盘
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1250 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1260
     * @tc.name   : On a bar-phone (slab device), perform floating-window operations: for the default component, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1260 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow1260')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行拉起悬浮窗操作 - 页面打开后自动弹出Toast
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮拉起对应的Toast组件（验证手动打开）
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_1260_open'), 500)
      await openBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、窗大小和主窗大小保持一致
      // 2、组件布局和对齐完全基于子窗进行
      // 3、上下分屏比例小于1:1较大窗口依然底部对齐展示，较小窗口居中展示
      // 4、使用默认规则避让安全区和键盘
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1260 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1280
     * @tc.name   : On a bar-phone (slab device), perform floating-window operations: for the ActionSheet component, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1280 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow1280')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行上下分屏操作 - 页面打开后自动弹出ActionSheet
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮调起对应的Dialog组件（验证手动打开）
      // 先关闭自动打开的ActionSheet
      let cancelBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_1280_cancel'), 500)
      if (cancelBtn) {
        await cancelBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 手动点击按钮打开ActionSheet
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_1280_open'), 500)
      await openBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、子窗大小和主窗大小保持一致
      // 2、蒙层覆盖整个子窗
      // 3、组件布局和对齐完全基于子窗进行，根据窗口自适应比例缩放
      // 4、使用默认规则避让安全区和键盘
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1280 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1290
     * @tc.name   : On a bar-phone (slab device), perform split-screen operations: for the openCustomDialog component, UIExtension, when ShowInSubWindow is false, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1290 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow1290')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行左右分屏操作 - 页面打开后自动弹出openCustomDialog
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮调起对应的Dialog组件（验证手动打开）
      // 先点击蒙层关闭自动打开的Dialog
      await driver.click(50, 50)
      await driver.waitForIdle(1000, 2000)

      // 手动点击按钮打开Dialog
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_1290_open'), 500)
      await openBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、蒙层覆盖整个UIExtension窗口
      // 2、组件布局和对齐完全基于UIExtension窗口进行
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1290 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1390
     * @tc.name   : On a bar-phone (slab device), perform split-screen operations: for the default component, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1390 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow1390')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行上下分屏操作 - 页面打开后自动弹出Toast
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮拉起对应的Toast组件（验证手动打开）
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_1390_open'), 500)
      await openBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、窗大小和主窗大小保持一致
      // 2、组件布局和对齐完全基于子窗进行
      // 3、上下分屏比例小于1:1较大窗口依然底部对齐展示，较小窗口居中展示
      // 4、使用默认规则避让安全区和键盘
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1390 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1450
     * @tc.name   : On a bar-phone (slab device), perform split-screen operations: for the bindContextmenu component with MenuPreviewMode set to none, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1450 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow1450')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行上下分屏操作
      await driver.waitForIdle(1000, 2000)

      // 步骤3：长按按钮弹出菜单
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_1450_open'), 500)
      await openBtn.longClick()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、子窗大小和主窗大小保持一致
      // 2、组件布局和对齐完全基于子窗进行
      // 3、组件根据窗口高度自适应，超长变为滚动模式
      // 4、菜单如无位置布局则覆盖在预览容器之上窗口居中显示
      // 5、使用默认规则避让安全区和键盘
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1450 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1500
     * @tc.name   : On a bar-phone (slab device), perform floating-window operations: for the topmost component, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1500 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow1500')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行拉起悬浮窗操作 - 页面打开后自动弹出Toast
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮拉起对应的Toast组件（验证手动打开）
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_1500_open'), 3000)
      if (openBtn) {
        await openBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、窗大小和主窗大小保持一致
      // 2、组件布局和对齐完全基于子窗进行
      // 3、上下分屏比例小于1:1较大窗口依然底部对齐展示，较小窗口居中展示
      // 4、使用默认规则避让安全区和键盘
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1500 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1550
     * @tc.name   : On a bar-phone (slab device), perform split-screen operations: for the showDialog component, UIExtension, when ShowInSubWindow is true, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1550 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow1550')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行左右分屏操作 - 页面打开后自动弹出showDialog
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮调起对应的Dialog组件（验证手动打开）
      // 先关闭自动打开的Dialog
      let cancelBtn = await driver.waitForComponent(ON.text('取消'), 500)
      if (cancelBtn) {
        await cancelBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 手动点击按钮打开Dialog
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_1550_open'), 500)
      await openBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、蒙层覆盖整个应用窗口
      // 2、组件布局和对齐完全基于应用窗口进行
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1550 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1810
     * @tc.name   : On a bar-phone (slab device), perform split-screen operations: for the showDialog component, non-UIExtension, when ShowInSubWindow is false, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1810', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1810 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow1810')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行左右分屏操作 - 页面打开后自动弹出showDialog
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮调起对应的Dialog组件（验证手动打开）
      // 先关闭自动打开的Dialog
      let cancelBtn = await driver.waitForComponent(ON.text('取消'), 500)
      if (cancelBtn) {
        await cancelBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 手动点击按钮打开Dialog
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_1810_open'), 500)
      await openBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、子窗大小为全屏，主窗大小为应用窗口
      // 2、蒙层覆盖整个主窗
      // 3、组件布局和对齐完全基于主窗进行
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1810 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1870
     * @tc.name   : On a bar-phone (slab device), perform floating-window operations: for the bindmenu component with ShowInSubWindow set to false, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1870', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1870 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow1870')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行拉起悬浮窗操作
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮弹出菜单
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_1870_open'), 500)
      await openBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、子窗大小和主窗大小保持一致
      // 2、蒙层覆盖整个子窗
      // 3、组件布局和对齐完全基于子窗进行
      // 4、组件根据窗口高度自适应，超长变为滚动模式
      // 5、菜单如无位置布局则覆盖在预览容器之上窗口居中显示
      // 6、使用默认规则避让安全区和键盘
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1870 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1920
     * @tc.name   : On a bar-phone (slab device), perform split-screen operations: for the CustomDialog component, when KeyboardAvoidMode is set to none, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1920', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1920 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow1920')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行上下分屏操作 - 页面打开后自动弹出CustomDialog
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮调起对应的Dialog组件（验证手动打开）
      // 先关闭自动打开的Dialog
      let closeBtn = await driver.waitForComponent(ON.id('customdialog_smartmultiwindow_1920_close'), 500)
      if (closeBtn) {
        await closeBtn.click()
        await driver.waitForIdle(1000, 2000)
      }

      // 手动点击按钮打开Dialog
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_1920_open'), 500)
      await openBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、子窗大小和主窗大小保持一致
      // 2、蒙层覆盖整个子窗
      // 3、组件布局和对齐完全基于子窗进行
      // 4、不避让软键盘
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1920 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1960
     * @tc.name   : On a bar-phone (slab device), perform split-screen operations: for the openCustomDialog component, non-UIExtension, when ShowInSubWindow is false, observe the overlay effect, component layout, and alignment status.
     * @tc.desc   : Verify popupbox smartmultiwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1960', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1960 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxSmartmultiwindow/PopupboxSmartmultiwindow1960')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进行左右分屏操作 - 页面打开后自动弹出openCustomDialog
      await driver.waitForIdle(1000, 2000)

      // 步骤3：点击按钮调起对应的Dialog组件（验证手动打开）
      // 先点击蒙层关闭自动打开的Dialog
      await driver.click(50, 50)
      await driver.waitForIdle(1000, 2000)

      // 手动点击按钮打开Dialog
      let openBtn = await driver.waitForComponent(ON.id('popupbox_smartmultiwindow_1960_open'), 500)
      await openBtn.click()
      await driver.waitForIdle(1000, 2000)

      // 步骤4：观察蒙层效果，组件布局和对齐状态
      // 预期结果：
      // 1、子窗大小和主窗大小保持一致
      // 2、蒙层覆盖整个子窗
      // 3、组件布局和对齐完全基于子窗进行
      // 4、不避让软键盘
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1960 finish.`);
      done()
    })


  })
}