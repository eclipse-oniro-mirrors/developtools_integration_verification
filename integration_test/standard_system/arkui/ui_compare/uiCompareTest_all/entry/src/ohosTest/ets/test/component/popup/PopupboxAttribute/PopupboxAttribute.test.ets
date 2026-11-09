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

export default function popupboxAttribute() {

  describe('popupboxAttribute', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0120
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0120 start.`);
      // 步骤1：进入自定义弹窗界面，点击进入"CustomDialog"
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0120')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 查找"click me"按钮
      let button_popupbox_attribute_0120 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0120'), 500)

      // 步骤2：点击"click me"按钮，打开弹窗
      await button_popupbox_attribute_0120.click()
      await Utils.sleep(1000)
      // 步骤2：点击Close按钮关闭弹窗
      let closeButton = await driver.waitForComponent(ON.text('Close'), 500)
      await closeButton.click()
      await Utils.sleep(1000)

      // 截图2：弹窗关闭后，显示完整的回调顺序：onWillAppear -> onDidAppear -> onWillDisappear -> onDidDisappear
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0130
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0130 start.`);
      // 步骤1：进入自定义弹窗界面，选择"customDialog"
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0130')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击"click me"按钮，在IDE的log中查看函数回调的打印信息
      let button_popupbox_attribute_0130 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0130'), 500)
      await button_popupbox_attribute_0130.click()
      await Utils.sleep(1000)

      // 步骤4：点击"close"按钮，在IDE的log中查看函数回调的打印信息
      let closeButton = await driver.waitForComponent(ON.text('Close'), 500)
      await closeButton.click()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0140
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0140 start.`);
      // 步骤1：点击options不支持动态切换的属性进入测试页面
      // 步骤2：点击onWillDismiss不配置dismiss方法
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0140')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      let button_popupbox_attribute_0140 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0140'), 500)
      await button_popupbox_attribute_0140.click()
      await Utils.sleep(1000)

      // 步骤3：执行左滑/右滑/三键back/键盘ESC，在IDE的log中查看拦截弹窗关闭的原因
      // 模拟back键操作，弹窗不关闭，返回reason=0（PRESS_BACK）
      let closeButton = await driver.waitForComponent(ON.text('Close'), 500)
      await closeButton.click()
      await Utils.sleep(1000)

      // 步骤4：点击蒙层，在IDE的log中查看拦截弹窗关闭的原因
      // 点击蒙层，弹窗不关闭，返回reason=1（TOUCH_OUTSIDE）
      await driver.click(50, 50)
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0150
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0150 start.`);
      // 步骤1：点击options不支持动态切换的属性进入测试页面
      // 步骤2：点击onWillDismiss不配置dismiss方法且关闭
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0150')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      let button_popupbox_attribute_0150 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0150'), 500)
      await button_popupbox_attribute_0150.click()
      await Utils.sleep(1000)

      // 步骤3：等待两秒弹窗关闭，在IDE的log中查看是否有执行弹窗关闭操作的原因
      let closeButton = await driver.waitForComponent(ON.id('button_close_custom_dialog_0150'), 500)
      await closeButton.click()
      await Utils.sleep(2000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0160
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0160 start.`);
      // 步骤1：进入自定义弹窗，选择"customDialog"
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0160')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击"click me"弹出弹窗
      let button_popupbox_attribute_0160 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0160'), 500)
      await button_popupbox_attribute_0160.click()
      await Utils.sleep(1000)

      // 步骤4：点击蒙层，在IDE的log中查看拦截日志
      // 由于autoCancel为false，点击蒙层不会关闭弹窗
      await driver.click(50, 50)
      await Utils.sleep(1000)

      // 步骤5：执行back操作，在IDE的log中查看拦截日志
      // 模拟back键操作关闭弹窗
      let closeButton = await driver.waitForComponent(ON.text('Close'), 500)
      await closeButton.click()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0170
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0170 start.`);
      // 步骤1：点击options不支持动态切换的属性进入测试页面
      // 步骤2：点击onWillDismiss配置dismiss方法
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0170')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：打开弹窗
      let button_popupbox_attribute_0170 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0170'), 500)
      await button_popupbox_attribute_0170.click()
      await Utils.sleep(1000)

      // 步骤4：执行左滑/右滑/三键back/键盘ESC，在IDE的log中查看拦截弹窗关闭的原因
      // 模拟back键操作关闭弹窗
      let closeButton = await driver.waitForComponent(ON.text('Close'), 500)
      await closeButton.click()
      await Utils.sleep(1000)

      // 重新打开弹窗以测试点击蒙层
      await button_popupbox_attribute_0170.click()
      await Utils.sleep(1000)

      // 步骤5：点击蒙层，在IDE的log中查看拦截弹窗关闭的原因
      // 点击蒙层关闭弹窗
      await driver.click(50, 50)
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0180
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0180 start.`);
      // 步骤1：点击自定义弹窗页面，进入CustomDialog页面
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0180')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击"click me"按钮，打开第一个弹窗
      let button_popupbox_attribute_0180 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0180'), 500)
      await button_popupbox_attribute_0180.click()
      await Utils.sleep(1000)

      // 步骤3：点击"打开第二个弹窗"按钮
      let button_open_second_dialog = await driver.waitForComponent(ON.id('button_open_second_dialog_0180'), 500)
      await button_open_second_dialog.click()
      await Utils.sleep(1000)

      // 步骤4：点击"关闭第二个弹窗"按钮
      let button_close_second_dialog = await driver.waitForComponent(ON.id('button_close_second_dialog_0180'), 500)
      await button_close_second_dialog.click()
      await Utils.sleep(1000)

      // 步骤5：点击"close"按钮，关闭第一个弹窗
      let button_close_first_dialog = await driver.waitForComponent(ON.id('button_close_first_dialog_0180'), 500)
      await button_close_first_dialog.click()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0190
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0190 start.`);
      // 步骤1：点击options不支持动态切换的属性进入测试页面
      // 步骤2：点击transition进入测试页面
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0190')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击asymmetric，观察弹窗显示动效
      let button_popupbox_attribute_0190 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0190'), 500)
      await button_popupbox_attribute_0190.click()
      await Utils.sleep(3000)

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      let closeButton = await driver.waitForComponent(ON.text('Close'), 500)
      await closeButton.click()
      await Utils.sleep(3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0200
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0200 start.`);
      // 步骤1：点击options不支持动态切换的属性进入测试页面
      // 步骤2：点击transition进入测试页面
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0200')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击IDENTITY，观察弹窗显示动效
      let button_popupbox_attribute_0200 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0200'), 500)
      await button_popupbox_attribute_0200.click()
      await Utils.sleep(1000)

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      let closeButton = await driver.waitForComponent(ON.text('Close'), 500)
      await closeButton.click()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0220
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0220 start.`);
      // 步骤1：点击options不支持动态切换的属性进入测试页面
      // 步骤2：点击transition进入测试页面
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0220')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击OPACITY，观察弹窗显示动效
      let button_popupbox_attribute_0220 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0220'), 500)
      await button_popupbox_attribute_0220.click()
      await Utils.sleep(3000)

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      let closeButton = await driver.waitForComponent(ON.text('Close'), 500)
      await closeButton.click()
      await Utils.sleep(3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0240
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0240 start.`);
      // 步骤1：点击options不支持动态切换的属性进入测试页面
      // 步骤2：点击transition进入测试页面
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0240')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击opacity_0.5，观察弹窗显示动效
      let button_popupbox_attribute_0240 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0240'), 500)
      await button_popupbox_attribute_0240.click()
      await Utils.sleep(3000)

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      let closeButton = await driver.waitForComponent(ON.text('Close'), 500)
      await closeButton.click()
      await Utils.sleep(3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0490
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0490 start.`);
      // 步骤1：进入自定义弹窗界面，选择customDialog
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0490')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：设备连上键盘，使用Tab键切换至"click me"按钮，观察焦点位置
      let button_popupbox_attribute_0490 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0490'), 500)
      // 步骤3：使用Enter键触发"click me"按钮
      await button_popupbox_attribute_0490.click()
      await Utils.sleep(1000)

      // 步骤4：使用Tab键切换至"打开第二个弹窗"按钮，观察焦点位置
      let button_open_dialog_b = await driver.waitForComponent(ON.id('button_open_dialog_b_0490'), 500)
      // 步骤5：使用Enter键触发"打开第二个弹窗"按钮
      await button_open_dialog_b.click()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0490 finish.`);
      done()
    })






    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0210
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0210 start.`);
      // 步骤1：点击options不支持动态切换的属性进入测试页面
      // 步骤2：点击transition进入测试页面
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0210')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击move，观察弹窗显示动效
      let button_popupbox_attribute_0210 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0210'), 500)
      await button_popupbox_attribute_0210.click()
      await Utils.sleep(3000)

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      // 点击Close按钮关闭弹窗
      let closeButton = await driver.waitForComponent(ON.text('Close'), 500)
      await closeButton.click()
      await Utils.sleep(3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0260
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0260 start.`);
      // 步骤1：点击options不支持动态切换的属性进入测试页面
      // 步骤2：点击transition进入测试页面
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0260')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击scale，观察弹窗显示动效
      let button_popupbox_attribute_0260 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0260'), 500)
      await button_popupbox_attribute_0260.click()
      await Utils.sleep(3000)

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      // 点击Close按钮关闭弹窗
      let closeButton = await driver.waitForComponent(ON.text('Close'), 500)
      await closeButton.click()
      await Utils.sleep(3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0230
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0230 start.`);
      // 步骤1：点击options不支持动态切换的属性进入测试页面
      // 步骤2：点击transition进入测试页面
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0230')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击opacity_-20，观察弹窗显示动效
      let button_popupbox_attribute_0230 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0230'), 500)
      await button_popupbox_attribute_0230.click()
      await Utils.sleep(3000)

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      // 点击Close按钮关闭弹窗
      let closeButton = await driver.waitForComponent(ON.text('Close'), 500)
      await closeButton.click()
      await Utils.sleep(3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0270
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0270 start.`);
      // 步骤1：点击options不支持动态切换的属性进入测试页面
      // 步骤2：点击transition进入测试页面
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0270')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击SLIDE，观察弹窗显示动效
      let button_popupbox_attribute_0270 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0270'), 500)
      await button_popupbox_attribute_0270.click()
      await Utils.sleep(3000)

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      // 点击Close按钮关闭弹窗
      let closeButton = await driver.waitForComponent(ON.text('Close'), 500)
      await closeButton.click()
      await Utils.sleep(3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0250
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0250 start.`);
      // 步骤1：点击options不支持动态切换的属性进入测试页面
      // 步骤2：点击transition进入测试页面
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0250')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击rotate，观察弹窗显示动效
      let button_open_popupbox_attribute_0250 = await driver.waitForComponent(ON.id('button_open_popupbox_attribute_0250'), 500)
      await button_open_popupbox_attribute_0250.click()
      await Utils.sleep(3000)

      // 测试Update按钮
      let button_update_popupbox_attribute_0250 = await driver.waitForComponent(ON.id('button_update_popupbox_attribute_0250'), 500)
      await button_update_popupbox_attribute_0250.click()
      await Utils.sleep(1000)

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      // 点击Close按钮关闭弹窗
      let button_close_popupbox_attribute_0250 = await driver.waitForComponent(ON.id('button_close_popupbox_attribute_0250'), 500)
      await button_close_popupbox_attribute_0250.click()
      await Utils.sleep(3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0280
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0280 start.`);
      // 步骤1：点击options不支持动态切换的属性进入测试页面
      // 步骤2：点击transition进入测试页面
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0280')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击SLIDE_SWITCH，观察弹窗显示动效
      let button_popupbox_attribute_0280 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0280'), 500)
      await button_popupbox_attribute_0280.click()
      await Utils.sleep(3000)

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      // 点击Close按钮关闭弹窗
      let closeButton = await driver.waitForComponent(ON.text('Close'), 500)
      await closeButton.click()
      await Utils.sleep(3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0290
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0290 start.`);
      // 步骤1：点击options不支持动态切换的属性进入测试页面
      // 步骤2：点击transition进入测试页面
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0290')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击translate({x:10,y:10})，观察弹窗显示动效
      let button_open_popupbox_attribute_0290 = await driver.waitForComponent(ON.id('button_open_popupbox_attribute_0290'), 500)
      await button_open_popupbox_attribute_0290.click()
      await Utils.sleep(3000)

      // 测试Update按钮
      let button_update_popupbox_attribute_0290 = await driver.waitForComponent(ON.id('button_update_popupbox_attribute_0290'), 500)
      await button_update_popupbox_attribute_0290.click()
      await Utils.sleep(1000)

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      // 点击Close按钮关闭弹窗
      let button_close_popupbox_attribute_0290 = await driver.waitForComponent(ON.id('button_close_popupbox_attribute_0290'), 500)
      await button_close_popupbox_attribute_0290.click()
      await Utils.sleep(3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0300
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0300 start.`);
      // 步骤1：点击options不支持动态切换的属性进入测试页面
      // 步骤2：点击transition进入测试页面
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0300')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击translate({x:10,y:10})，观察弹窗显示动效
      let button_popupbox_attribute_0300 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0300'), 500)
      await button_popupbox_attribute_0300.click()
      await Utils.sleep(3000)

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      // 点击Close按钮关闭弹窗
      let button_close_dialog = await driver.waitForComponent(ON.text('Close'), 500)
      await button_close_dialog.click()
      await Utils.sleep(3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0320
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0320 start.`);
      // 步骤1：点击options不支持动态切换的属性进入测试页面
      // 步骤2：点击transition进入测试页面
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0320')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击playMode，观察弹窗显示动效
      let button_popupbox_attribute_0320 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0320'), 500)
      await button_popupbox_attribute_0320.click()
      await Utils.sleep(3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0330
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0330 start.`);
      // 步骤1：点击"现有的弹窗规格"进入测试页面
      // 步骤2：点击验证A页面拉起UIcontext为B页面的弹窗，走焦正常
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0330')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：设备连上键盘，使用Tab键、Enter键打开弹窗
      let button_open_dialog_0330 = await driver.waitForComponent(ON.id('button_open_dialog_0330'), 500)
      await button_open_dialog_0330.click()
      await Utils.sleep(1000)

      // 步骤2：使用键盘关闭弹窗，观察焦点的走向
      let button_close_dialog_0330 = await driver.waitForComponent(ON.id('button_close_dialog_0330'), 500)
      await button_close_dialog_0330.click()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0340
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0340 start.`);
      // 步骤1：点击options不支持动态切换的属性进入测试页面
      // 步骤2：点击transition进入测试页面
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0340')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击combine，观察弹窗显示动效
      let button_popupbox_attribute_0340 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0340'), 500)
      await button_popupbox_attribute_0340.click()
      await Utils.sleep(3000)

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      // 点击Close按钮关闭弹窗
      let button_close_dialog = await driver.waitForComponent(ON.text('Close'), 500)
      await button_close_dialog.click()
      await Utils.sleep(3000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0410
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0410 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0410')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：设备连上键盘，使用Tab键、Enter键打开弹窗
      let button_open_dialog_0410 = await driver.waitForComponent(ON.id('button_open_dialog_0410'), 500)
      await button_open_dialog_0410.click()
      await Utils.sleep(1000)

      // 步骤2：使用键盘关闭弹窗，观察焦点的走向
      let button_close_dialog_0410 = await driver.waitForComponent(ON.id('button_close_dialog_0410'), 500)
      await button_close_dialog_0410.click()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0420
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0420 start.`);
      // 步骤1：进入自定义弹窗界面，选择customDialog
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0420')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击"click me"拉起弹窗
      let button_popupbox_attribute_0420 = await driver.waitForComponent(ON.id('button_popupbox_attribute_0420'), 500)
      await button_popupbox_attribute_0420.click()
      await Utils.sleep(1000)

      // 步骤3：点击输入框拉起键盘
      let text_input_0420 = await driver.waitForComponent(ON.id('text_input_0420'), 500)
      await text_input_0420.click()
      await Utils.sleep(1000)

      // 步骤4：在输入框中继续输入文字
      await text_input_0420.inputText('Test keyboard avoidance')
      await Utils.sleep(1000)

      // 步骤5：切换成横屏（注：实际测试时需要手动切换屏幕方向）
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0430
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0430 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0430')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击验证使用closeCustomDialog关闭未打开的弹窗，前端返回错误
      let button_close_unopened_dialog_0430 = await driver.waitForComponent(ON.id('button_close_unopened_dialog_0430'), 500)
      await button_close_unopened_dialog_0430.click()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0440
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0440 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0440')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击验证使用updateCustomDialog动态更新未打开弹窗的options自定义属性，前端返回错误
      let button_update_unopened_dialog_0440 = await driver.waitForComponent(ON.id('button_update_unopened_dialog_0440'), 500)
      await button_update_unopened_dialog_0440.click()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0460
     * @tc.name   : Popupbox attribute
     * @tc.desc   : Verify popupbox attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0460 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupboxAttribute/PopupboxAttribute0460')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 首先打开弹窗
      let button_open_dialog_first_0460 = await driver.waitForComponent(ON.id('button_open_dialog_first_0460'), 500)
      await button_open_dialog_first_0460.click()
      await Utils.sleep(1000)

      // 步骤1：点击验证同一个ComponentContent在已经弹出的情况下再次open，前端返回错误
      let button_open_dialog_again_0460 = await driver.waitForComponent(ON.id('button_open_dialog_again_0460'), 500)
      await button_open_dialog_again_0460.click()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ATTRIBUTE_0460 finish.`);
      done()
    })

  })
}