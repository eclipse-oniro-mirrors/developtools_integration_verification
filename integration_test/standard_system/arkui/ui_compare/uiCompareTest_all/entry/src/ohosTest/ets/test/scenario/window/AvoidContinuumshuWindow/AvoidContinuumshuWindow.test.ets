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

export default function avoidContinuumshuWindow() {

  describe('avoidContinuumshuWindow', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0010
     * @tc.name   : Popupbox avoid continuumshuwindow
     * @tc.desc   : Verify popupbox avoid continuumshuwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0010 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/window/AvoidContinuumshuWindow/AvoidContinuumshuWindow0010')
      let driver = await Driver.create()
      await Utils.sleep(1000)
      
      // 步骤1：点击button按钮
      let avoid_continuumshu_button_0010 = await driver.waitForComponent(ON.id('avoid_continuumshu_button_0010'), 500)
      await avoid_continuumshu_button_0010.click()
      await driver.waitForIdle(1000,3000)
      
      // 步骤2：连续点击蒙层处关闭菜单
      // 第一次点击蒙层
      await driver.click(100, 100) // 点击左上角蒙层区域
      await driver.waitForIdle(1000,3000)
      
      // 再次点击按钮弹出菜单
      await avoid_continuumshu_button_0010.click()
      await driver.waitForIdle(1000,3000)
      
      // 第二次点击蒙层
      await driver.click(300, 100) // 点击不同位置的蒙层区域
      await driver.waitForIdle(1000,3000)

      // 再次点击按钮弹出菜单
      await avoid_continuumshu_button_0010.click()
      await driver.waitForIdle(1000,3000)
      
      // 预期结果2：子窗都正常关闭，进行最终截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0020
     * @tc.name   : Popupbox avoid continuumshuwindow
     * @tc.desc   : Verify popupbox avoid continuumshuwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0020 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/window/AvoidContinuumshuWindow/AvoidContinuumshuWindow0020')
      let driver = await Driver.create()
      await Utils.sleep(1000)
      
      // 步骤1：点击button按钮
      let avoid_continuumshu_popup_button_0020 = await driver.waitForComponent(ON.id('avoid_continuumshu_popup_button_0020'), 500)
      await avoid_continuumshu_popup_button_0020.click()
      await driver.waitForIdle(1000,3000)
      
      // 步骤2：连续点击蒙层处关闭popup
      // 第一次点击蒙层
      await driver.click(100, 100) // 点击左上角蒙层区域
      await driver.waitForIdle(1000,3000)
      
      // 再次点击按钮弹出popup
      await avoid_continuumshu_popup_button_0020.click()
      await driver.waitForIdle(1000,3000)

      // 第二次点击蒙层
      await driver.click(300, 100) // 点击不同位置的蒙层区域
      await driver.waitForIdle(1000,3000)

      // 再次点击按钮弹出popup
      await avoid_continuumshu_popup_button_0020.click()
      await driver.waitForIdle(1000,3000)
      
      // 预期结果2：子窗都正常关闭，进行最终截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0030
     * @tc.name   : Popupbox avoid continuumshuwindow
     * @tc.desc   : Verify popupbox avoid continuumshuwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0030 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/window/AvoidContinuumshuWindow/AvoidContinuumshuWindow0030')
      let driver = await Driver.create()
      await Utils.sleep(1000)
      
      // 步骤1：点击button按钮
      let avoid_continuumshu_alertdialog_button_0030 = await driver.waitForComponent(ON.id('avoid_continuumshu_alertdialog_button_0030'), 500)
      await avoid_continuumshu_alertdialog_button_0030.click()
      await driver.waitForIdle(1000,3000)
      
      // 步骤2：连续点击蒙层处关闭alertdialog
      // 第一次点击蒙层
      await driver.click(100, 100) // 点击左上角蒙层区域
      await driver.waitForIdle(1000,3000)
      
      // 再次点击按钮弹出alertdialog
      await avoid_continuumshu_alertdialog_button_0030.click()
      await driver.waitForIdle(1000,3000)

      // 第二次点击蒙层
      await driver.click(300, 100) // 点击不同位置的蒙层区域
      await driver.waitForIdle(1000,3000)

      // 再次点击按钮弹出alertdialog
      await avoid_continuumshu_alertdialog_button_0030.click()
      await driver.waitForIdle(1000,3000)
      
      // 预期结果2：子窗都正常关闭，进行最终截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0040
     * @tc.name   : Popupbox avoid continuumshuwindow
     * @tc.desc   : Verify popupbox avoid continuumshuwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0040 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/window/AvoidContinuumshuWindow/AvoidContinuumshuWindow0040')
      let driver = await Driver.create()
      await Utils.sleep(1000)
      
      // 步骤1：点击button按钮
      let avoid_continuumshu_actionsheet_button_0040 = await driver.waitForComponent(ON.id('avoid_continuumshu_actionsheet_button_0040'), 3000)
      await avoid_continuumshu_actionsheet_button_0040.click()
      await driver.waitForIdle(1000,3000)
      
      // 步骤2：连续点击蒙层处关闭actionsheet
      // 第一次点击蒙层
      await driver.click(100, 100) // 点击左上角蒙层区域
      await driver.waitForIdle(1000,3000)
      
      // 再次点击按钮弹出actionsheet
      let button2 = await driver.waitForComponent(ON.id('avoid_continuumshu_actionsheet_button_0040'), 1000)
      await button2.click()
      await driver.waitForIdle(1000,3000)
      
      // 第二次点击蒙层
      await driver.click(300, 100) // 点击不同位置的蒙层区域
      await driver.waitForIdle(1000,3000)
      
      // 再次点击按钮弹出actionsheet
      let button3 = await driver.waitForComponent(ON.id('avoid_continuumshu_actionsheet_button_0040'), 1000)
      await button3.click()
      await driver.waitForIdle(1000,3000)
      
      // 第三次点击蒙层
      await driver.click(500, 100) // 点击另一个位置的蒙层区域
      await driver.waitForIdle(1000,3000)
      
      // 预期结果2：子窗都正常关闭，进行最终截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0050
     * @tc.name   : Popupbox avoid continuumshuwindow
     * @tc.desc   : Verify popupbox avoid continuumshuwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0050 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/window/AvoidContinuumshuWindow/AvoidContinuumshuWindow0050')
      let driver = await Driver.create()
      await Utils.sleep(1000)
      
      // 步骤1：点击button按钮
      let avoid_continuumshu_customdialog_button_0050 = await driver.waitForComponent(ON.id('avoid_continuumshu_customdialog_button_0050'), 500)
      await avoid_continuumshu_customdialog_button_0050.click()
      await driver.waitForIdle(1000,3000)
      
      // 步骤2：连续点击蒙层处关闭customdialog
      // 第一次点击蒙层
      await driver.click(100, 100) // 点击左上角蒙层区域
      await driver.waitForIdle(1000,3000)
      
      // 再次点击按钮弹出customdialog
      await avoid_continuumshu_customdialog_button_0050.click()
      await driver.waitForIdle(1000,3000)

      
      // 预期结果2：子窗都正常关闭，进行最终截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0060
     * @tc.name   : Popupbox avoid continuumshuwindow
     * @tc.desc   : Verify popupbox avoid continuumshuwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0060 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/window/AvoidContinuumshuWindow/AvoidContinuumshuWindow0060')
      let driver = await Driver.create()
      await Utils.sleep(1000)
      
      // 步骤1：点击button按钮
      let avoid_continuumshu_promptaction_button_0060 = await driver.waitForComponent(ON.id('avoid_continuumshu_promptaction_button_0060'), 500)
      await avoid_continuumshu_promptaction_button_0060.click()
      await driver.waitForIdle(1000,3000)
      
      // 步骤2：连续点击蒙层处关闭promptaction dialog
      // 第一次点击蒙层
      await driver.click(100, 100) // 点击左上角蒙层区域
      await driver.waitForIdle(1000,3000)
      
      // 再次点击按钮弹出prompaction dialog
      await avoid_continuumshu_promptaction_button_0060.click()
      await driver.waitForIdle(1000,3000)
      
      // 第二次点击蒙层
      await driver.click(300, 100) // 点击不同位置的蒙层区域
      await driver.waitForIdle(1000,3000)
      
      // 再次点击按钮弹出prompaction dialog
      await avoid_continuumshu_promptaction_button_0060.click()
      await driver.waitForIdle(1000,3000)
      
      // 预期结果2：子窗都正常关闭，进行最终截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0070
     * @tc.name   : Popupbox avoid continuumshuwindow
     * @tc.desc   : Verify popupbox avoid continuumshuwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0070 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/window/AvoidContinuumshuWindow/AvoidContinuumshuWindow0070')
      let driver = await Driver.create()
      await Utils.sleep(1000)
      
      // 步骤1：点击button按钮
      let avoid_continuumshu_actionmenu_button_0070 = await driver.waitForComponent(ON.id('avoid_continuumshu_actionmenu_button_0070'), 500)
      await avoid_continuumshu_actionmenu_button_0070.click()
      await driver.waitForIdle(1000,3000)
      
      // 步骤2：连续点击蒙层处关闭prompaction actionmenu
      // 第一次点击蒙层
      await driver.click(100, 100) // 点击左上角蒙层区域
      await driver.waitForIdle(1000,3000)
      
      // 再次点击按钮弹出prompaction actionmenu
      await avoid_continuumshu_actionmenu_button_0070.click()
      await driver.waitForIdle(1000,3000)
      
      // 第二次点击蒙层
      await driver.click(300, 100) // 点击不同位置的蒙层区域
      await driver.waitForIdle(1000,3000)
      
      // 再次点击按钮弹出prompaction actionmenu
      await avoid_continuumshu_actionmenu_button_0070.click()
      await driver.waitForIdle(1000,3000)
      
      // 预期结果2：子窗都正常关闭，进行最终截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0080
     * @tc.name   : Popupbox avoid continuumshuwindow
     * @tc.desc   : Verify popupbox avoid continuumshuwindow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0080 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/window/AvoidContinuumshuWindow/AvoidContinuumshuWindow0080')
      let driver = await Driver.create()
      await Utils.sleep(1000)
      
      // 步骤1：点击button按钮
      let avoid_continuumshu_opencustomdialog_button_0080 = await driver.waitForComponent(ON.id('avoid_continuumshu_opencustomdialog_button_0080'), 2000)
      await avoid_continuumshu_opencustomdialog_button_0080.click()
      await driver.waitForIdle(1000,3000)
      
      // 步骤2：连续点击弹窗内按钮关闭prompaction opencustomdialog
      // 第一次点击弹窗内的"取消"按钮
      let cancel_button = await driver.waitForComponent(ON.id('avoid_continuumshu_opencustomdialog_button_0080_001'), 2000)
      await cancel_button.click()
      await driver.waitForIdle(1000,3000)

      // 再次点击主按钮弹出prompaction opencustomdialog
      avoid_continuumshu_opencustomdialog_button_0080 = await driver.waitForComponent(ON.id('avoid_continuumshu_opencustomdialog_button_0080'), 2000)
      await avoid_continuumshu_opencustomdialog_button_0080.click()
      await driver.waitForIdle(1000,3000)
      
      // 预期结果2：子窗都正常关闭，进行最终截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_CONTINUUMSHUWINDOW_0080 finish.`);
      done()
    })


  })
}