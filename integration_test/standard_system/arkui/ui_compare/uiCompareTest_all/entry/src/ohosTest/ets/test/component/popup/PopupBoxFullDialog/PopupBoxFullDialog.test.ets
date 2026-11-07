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

export default function popupBoxFullDialog() {

  describe('popupBoxFullDialog', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0250
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0250 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0250')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1-2：进入测试页面（已通过createWindow完成）
      
      // 步骤3：点击Open按钮，观察弹窗显示动效
      let button_open_fulldialog_0250 = await driver.waitForComponent(ON.id('button_open_fulldialog_0250'), 500)
      await button_open_fulldialog_0250.click()
      await Utils.sleep(3000) // 等待动画完成（5000ms动画 + 1000ms缓冲）

      // 步骤4：点击蒙层关闭弹窗，观察弹窗消失动效
      // 点击屏幕中心位置（弹窗外部）来触发autoCancel
      await driver.click(50, 50)
      await Utils.sleep(3000) // 等待消失动画完成

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0250 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0340
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0340 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0340')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1-2：进入测试页面（已通过createWindow完成）
      
      // 步骤3：点击Open按钮，观察弹窗显示动效（既有旋转又有透明度变化）
      let button_open_fulldialog_0340 = await driver.waitForComponent(ON.id('button_open_fulldialog_0340'), 500)
      await button_open_fulldialog_0340.click()
      await Utils.sleep(3000) // 等待动画完成

      // 步骤4：点击蒙层关闭弹窗，观察弹窗消失动效（既有旋转又有透明度变化）
      await driver.click(50, 50)
      await Utils.sleep(3000) // 等待消失动画完成

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0340 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0230
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0230 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0230')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1-2：进入测试页面（已通过createWindow完成）
      
      // 步骤3：点击Open按钮，观察弹窗显示动效（应与不配置transition的弹窗效果一致）
      let button_open_fulldialog_0230 = await driver.waitForComponent(ON.id('button_open_fulldialog_0230'), 500)
      await button_open_fulldialog_0230.click()
      await Utils.sleep(3000) // 等待动画完成

      // 步骤4：点击蒙层关闭弹窗，观察弹窗消失动效（应与不配置transition的弹窗效果一致）
      await driver.click(50, 50)
      await Utils.sleep(3000) // 等待消失动画完成

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0230 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0330
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0330 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0330')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1-2：进入测试页面（已通过createWindow完成）
      
      // 步骤3：使用Tab键切换到打开弹窗按钮，使用Enter键打开弹窗
      let button_open_dialog_fulldialog_0330 = await driver.waitForComponent(ON.id('button_open_dialog_fulldialog_0330'), 500)
      await button_open_dialog_fulldialog_0330.click()
      await Utils.sleep(1000) // 等待弹窗打开并获焦

      // 步骤4：使用键盘关闭弹窗（点击关闭按钮），观察焦点走向
      let button_close_dialog_fulldialog_0330 = await driver.waitForComponent(ON.id('button_close_dialog_fulldialog_0330'), 500)
      await button_close_dialog_fulldialog_0330.click()
      await Utils.sleep(1000) // 等待弹窗关闭，焦点返回到打开按钮

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0330 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0300
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0300 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0300')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1-2：进入测试页面（已通过createWindow完成）
      
      // 步骤3：点击Open按钮，观察弹窗显示动效（弹窗向左上方平移10个单位）
      let button_open_fulldialog_0300 = await driver.waitForComponent(ON.id('button_open_fulldialog_0300'), 500)
      await button_open_fulldialog_0300.click()
      await Utils.sleep(3000) // 等待动画完成

      // 步骤4：点击蒙层关闭弹窗，观察弹窗消失动效（弹窗向右下方平移10个单位）
      await driver.click(50, 50)
      await Utils.sleep(3000) // 等待消失动画完成

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0300 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0320
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0320 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0320')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1-2：进入测试页面（已通过createWindow完成）
      
      // 步骤3：点击Open按钮，观察弹窗显示动效（反向播放）
      let button_open_fulldialog_0320 = await driver.waitForComponent(ON.id('button_open_fulldialog_0320'), 500)
      await button_open_fulldialog_0320.click()
      await Utils.sleep(3000) // 等待动画完成

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0320 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0410
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0410 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0410')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：使用Tab键、Enter键打开弹窗
      let button_open_dialog_fulldialog_0410 = await driver.waitForComponent(ON.id('button_open_dialog_fulldialog_0410'), 500)
      await button_open_dialog_fulldialog_0410.click()
      await Utils.sleep(1000) // 等待弹窗打开并获焦

      // 步骤2：使用键盘关闭弹窗，观察焦点走向
      let button_close_dialog_fulldialog_0410 = await driver.waitForComponent(ON.id('button_close_dialog_fulldialog_0410'), 500)
      await button_close_dialog_fulldialog_0410.click()
      await Utils.sleep(1000) // 等待弹窗关闭，焦点返回到打开按钮

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0410 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0290
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0290 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0290')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1-2：进入测试页面（已通过createWindow完成）
      
      // 步骤3：点击Open按钮，观察弹窗显示动效（弹窗向左上方平移10个单位）
      let button_open_fulldialog_0290 = await driver.waitForComponent(ON.id('button_open_fulldialog_0290'), 500)
      await button_open_fulldialog_0290.click()
      await Utils.sleep(3000) // 等待动画完成

      // 步骤4：点击蒙层关闭弹窗，观察弹窗消失动效（弹窗向右下方平移10个单位）
      await driver.click(50, 50)
      await Utils.sleep(3000) // 等待消失动画完成

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0290 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0420
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0420 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0420')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击Open打开弹窗
      let button_open_fulldialog_0420 = await driver.waitForComponent(ON.id('button_open_fulldialog_0420'), 500)
      await button_open_fulldialog_0420.click()

      // 步骤3：在输入框中输入文字
      let text_area_fulldialog_0420 = await driver.waitForComponent(ON.id('text_area_fulldialog_0420'), 500)
      await text_area_fulldialog_0420.click()
      await Utils.sleep(500)
      await text_area_fulldialog_0420.inputText('Test keyboard avoidance')

      // 步骤5：在输入框中继续输入文字
      await text_area_fulldialog_0420.inputText(' - Dialog height increased')

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0420 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0460
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0460 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0460')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 首先打开弹窗
      let button_open_dialog_first_fulldialog_0460 = await driver.waitForComponent(ON.id('button_open_dialog_first_fulldialog_0460'), 500)
      await button_open_dialog_first_fulldialog_0460.click()
      await Utils.sleep(1000)

      // 步骤1：点击验证同一个ComponentContent在已经弹出的情况下再次open，前端返回错误
      let button_open_dialog_again_fulldialog_0460 = await driver.waitForComponent(ON.id('button_open_dialog_again_fulldialog_0460'), 500)
      await button_open_dialog_again_fulldialog_0460.click()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0460 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0440
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0440 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0440')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击验证使用updateCustomDialog动态更新未打开弹窗的options自定义属性，前端返回错误，查看IDE中的log是否打印出错误信息
      let button_update_unopened_dialog_fulldialog_0440 = await driver.waitForComponent(ON.id('button_update_unopened_dialog_fulldialog_0440'), 500)
      await button_update_unopened_dialog_fulldialog_0440.click()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0440 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0430
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0430 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0430')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击验证使用closeCustomDialog关闭未打开的弹窗，前端返回错误
      let button_close_unopened_dialog_fulldialog_0430 = await driver.waitForComponent(ON.id('button_close_unopened_dialog_fulldialog_0430'), 500)
      await button_close_unopened_dialog_fulldialog_0430.click()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0430 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0490
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0490 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0490')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：使用Tab键、Enter键打开弹窗A，观察焦点位置
      let button_open_dialog_a_fulldialog_0490 = await driver.waitForComponent(ON.id('button_open_dialog_a_fulldialog_0490'), 500)
      await button_open_dialog_a_fulldialog_0490.click()
      await Utils.sleep(1000) // 弹窗A打开瞬间获焦

      // 步骤4：使用Tab、Enter键触发OpenB按钮，观察焦点位置
      let button_open_dialog_b_fulldialog_0490 = await driver.waitForComponent(ON.id('button_open_dialog_b_fulldialog_0490'), 500)
      await button_open_dialog_b_fulldialog_0490.click()
      await Utils.sleep(1000) // 弹窗B打开瞬间获焦

      // 步骤5：使用Tab、Enter键触发CloseA按钮，观察焦点位置
      let button_close_dialog_a_fulldialog_0490 = await driver.waitForComponent(ON.id('button_close_dialog_a_fulldialog_0490'), 500)
      await button_close_dialog_a_fulldialog_0490.click()
      await Utils.sleep(1000) // 弹窗A关闭，焦点在弹窗B的CloseA按钮上

      // 步骤6：使用Tab、Enter键触发CloseB按钮，观察焦点位置
      let button_close_dialog_b_fulldialog_0490 = await driver.waitForComponent(ON.id('button_close_dialog_b_fulldialog_0490'), 500)
      await button_close_dialog_b_fulldialog_0490.click()
      await Utils.sleep(1000) // 焦点返回在主页面上的OpenA按钮

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0490 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0190
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0190 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0190')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1-2：进入测试页面（已通过createWindow完成）
      
      // 步骤3：点击Open按钮，观察弹窗显示动效（scale缩放效果）
      let button_open_fulldialog_0190 = await driver.waitForComponent(ON.id('button_open_fulldialog_0190'), 500)
      await button_open_fulldialog_0190.click()
      await Utils.sleep(3000) // 等待动画完成

      // 步骤4：点击蒙层关闭弹窗，观察弹窗消失动效（opacity透明度效果）
      await driver.click(50, 50)
      await Utils.sleep(3000) // 等待消失动画完成

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0190 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0120
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0120 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0120')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击Open按钮，打开弹窗
      let button_open_fulldialog_0120 = await driver.waitForComponent(ON.id('button_open_fulldialog_0120'), 500)
      await button_open_fulldialog_0120.click()
      await Utils.sleep(1000) // 等待onWillAppear和onDidAppear回调

      // 点击Close按钮关闭弹窗（也可以通过左滑/右滑/点击蒙层）
      let button_close_dialog_in_component_fulldialog_0120 = await driver.waitForComponent(ON.id('button_close_dialog_in_component_fulldialog_0120'), 500)
      await button_close_dialog_in_component_fulldialog_0120.click()
      await Utils.sleep(1000) // 等待onWillDisappear和onDidDisappear回调

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0140
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0140 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0140')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击Open按钮，打开弹窗
      let button_open_fulldialog_0140 = await driver.waitForComponent(ON.id('button_open_fulldialog_0140'), 500)
      await button_open_fulldialog_0140.click()
      await Utils.sleep(1000)

      // 步骤3：执行左滑/右滑/三键back/键盘ESC（模拟按ESC键）
      // 这里使用模拟的方式，实际测试时可以使用物理按键
      await driver.triggerKey(2000) // ESC键或Back键
      await Utils.sleep(1000) // 弹窗不关闭，log中返回reason结果为 0（PRESS_BACK）

      // 步骤4：点击蒙层（点击弹窗外部区域）
      await driver.click(50, 50)
      await Utils.sleep(1000) // 弹窗不关闭，log中返回reason结果为 1（TOUCH_OUTSIDE）

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0180
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0180 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0180')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击Open1按钮，打开弹窗1
      let button_open1_fulldialog_0180 = await driver.waitForComponent(ON.id('button_open1_fulldialog_0180'), 500)
      await button_open1_fulldialog_0180.click()
      await Utils.sleep(1000) // 等待onWillAppear1和onDidAppear1回调

      // 步骤4：点击弹窗内的Close Dialog 1按钮，关闭弹窗1
      let button_close_dialog1_in_component_fulldialog_0180 = await driver.waitForComponent(ON.id('button_close_dialog1_in_component_fulldialog_0180'), 500)
      await button_close_dialog1_in_component_fulldialog_0180.click()
      await Utils.sleep(1000) // 等待onWillDisappear1和onDidDisappear1回调

      // 步骤5：点击Open2按钮，打开弹窗2
      let button_open2_fulldialog_0180 = await driver.waitForComponent(ON.id('button_open2_fulldialog_0180'), 500)
      await button_open2_fulldialog_0180.click()
      await Utils.sleep(1000) // 等待onWillAppear2和onDidAppear2回调

      // 步骤6：点击弹窗内的Close Dialog 2按钮，关闭弹窗2
      let button_close_dialog2_in_component_fulldialog_0180 = await driver.waitForComponent(ON.id('button_close_dialog2_in_component_fulldialog_0180'), 500)
      await button_close_dialog2_in_component_fulldialog_0180.click()
      await Utils.sleep(1000) // 等待onWillDisappear2和onDidDisappear2回调

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0180 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0160
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0160 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0160')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击Open按钮，打开弹窗
      let button_open_fulldialog_0160 = await driver.waitForComponent(ON.id('button_open_fulldialog_0160'), 500)
      await button_open_fulldialog_0160.click()
      await Utils.sleep(1000)

      // 步骤3：点击蒙层（由于autoCancel为false，点击蒙层不会关闭弹窗）
      await driver.click(50, 50)
      await Utils.sleep(1000) // 弹窗不关闭，log中不会返回reason结果

      // 步骤4：执行左滑/右滑/三键back/键盘ESC（模拟按ESC键或Back键）
      await driver.triggerKey(2000) // ESC键或Back键
      await Utils.sleep(1000) // 弹窗关闭，页面中返回reason结果为 0（PRESS_BACK）

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0160 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0130
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0130 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0130')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击Open按钮，打开弹窗
      let button_open_fulldialog_0130 = await driver.waitForComponent(ON.id('button_open_fulldialog_0130'), 500)
      await button_open_fulldialog_0130.click()
      await Utils.sleep(1000) // 等待onWillAppear和onDidAppear回调

      // 步骤4：点击弹窗内的Close Dialog按钮，关闭弹窗
      let button_close_dialog_in_component_fulldialog_0130 = await driver.waitForComponent(ON.id('button_close_dialog_in_component_fulldialog_0130'), 500)
      await button_close_dialog_in_component_fulldialog_0130.click()
      await Utils.sleep(1000) // 等待onWillDisappear和onDidDisappear回调

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0130 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0170
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0170 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0170')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击Open按钮，打开弹窗
      let button_open_fulldialog_0170 = await driver.waitForComponent(ON.id('button_open_fulldialog_0170'), 500)
      await button_open_fulldialog_0170.click()
      await Utils.sleep(1000)

      // 步骤3：执行左滑/右滑/三键back/键盘ESC（模拟按ESC键或Back键）
      await driver.triggerKey(2000) // ESC键或Back键
      await Utils.sleep(1000) // 弹窗关闭，log中返回reason结果为 0（PRESS_BACK）

      // 重新打开弹窗以测试点击蒙层
      await button_open_fulldialog_0170.click()
      await Utils.sleep(1000)

      // 步骤4：点击蒙层（点击弹窗外部区域）
      await driver.click(50, 50)
      await Utils.sleep(1000) // 弹窗关闭，log中返回reason结果为 1（TOUCH_OUTSIDE）

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0170 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0150
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0150 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0150')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击Open按钮，打开弹窗
      let button_open_fulldialog_0150 = await driver.waitForComponent(ON.id('button_open_fulldialog_0150'), 500)
      await button_open_fulldialog_0150.click()
      await Utils.sleep(1000)

      // 点击弹窗内的自动关闭按钮
      let button_auto_close_fulldialog_0150 = await driver.waitForComponent(ON.id('button_auto_close_fulldialog_0150'), 500)
      await button_auto_close_fulldialog_0150.click()

      // 步骤3：等待两秒弹窗关闭
      await Utils.sleep(2500) // 等待弹窗关闭（2秒延迟 + 0.5秒缓冲）

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0150 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0200
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0200 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0200')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击Open按钮，观察弹窗显示动效
      let button_open_fulldialog_0200 = await driver.waitForComponent(ON.id('button_open_fulldialog_0200'), 500)
      await button_open_fulldialog_0200.click()
      await Utils.sleep(2000) // 观察显示动画（IDENTITY无转场效果，和默认动效一致）

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      await driver.click(50, 50) // 点击蒙层关闭弹窗
      await Utils.sleep(2000) // 观察消失动画（IDENTITY无转场效果，和默认动效一致）

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0200 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0210
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0210 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0210')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击Open按钮，观察弹窗显示动效
      let button_open_fulldialog_0210 = await driver.waitForComponent(ON.id('button_open_fulldialog_0210'), 500)
      await button_open_fulldialog_0210.click()
      await Utils.sleep(3000) // 等待显示动画完成（5000ms + 500ms缓冲）

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      await driver.click(50, 50) // 点击蒙层关闭弹窗
      await Utils.sleep(3000) // 等待消失动画完成（5000ms + 500ms缓冲）

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0210 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0220
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0220 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0220')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击Open按钮，观察弹窗显示动效
      let button_open_fulldialog_0220 = await driver.waitForComponent(ON.id('button_open_fulldialog_0220'), 500)
      await button_open_fulldialog_0220.click()
      await Utils.sleep(3000) // 等待显示动画完成（5000ms + 500ms缓冲）

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      await driver.click(50, 50) // 点击蒙层关闭弹窗
      await Utils.sleep(3000) // 等待消失动画完成（5000ms + 500ms缓冲）

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0220 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0240
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0240 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0240')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击Open按钮，观察弹窗显示动效
      let button_open_fulldialog_0240 = await driver.waitForComponent(ON.id('button_open_fulldialog_0240'), 500)
      await button_open_fulldialog_0240.click()
      await Utils.sleep(3000) // 等待显示动画完成（5000ms + 500ms缓冲）

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      await driver.click(50, 50) // 点击蒙层关闭弹窗
      await Utils.sleep(3000) // 等待消失动画完成（5000ms + 500ms缓冲）

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0240 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0260
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0260 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0260')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击Open按钮，观察弹窗显示动效
      let button_open_fulldialog_0260 = await driver.waitForComponent(ON.id('button_open_fulldialog_0260'), 500)
      await button_open_fulldialog_0260.click()
      await Utils.sleep(3000) // 等待显示动画完成（5000ms + 500ms缓冲）

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      await driver.click(50, 50) // 点击蒙层关闭弹窗
      await Utils.sleep(3000) // 等待消失动画完成（5000ms + 500ms缓冲）

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0260 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0280
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0280 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0280')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击Open按钮，观察弹窗显示动效
      let button_open_fulldialog_0280 = await driver.waitForComponent(ON.id('button_open_fulldialog_0280'), 500)
      await button_open_fulldialog_0280.click()
      await Utils.sleep(3000) // 等待显示动画完成（5000ms + 500ms缓冲）

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      await driver.click(50, 50) // 点击蒙层关闭弹窗
      await Utils.sleep(3000) // 等待消失动画完成（5000ms + 500ms缓冲）

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0280 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0270
     * @tc.name   : Popupbox fulldialog
     * @tc.desc   : Verify popupbox fulldialog interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0270 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxFullDialog/PopupBoxFullDialog0270')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤3：点击Open按钮，观察弹窗显示动效
      let button_open_fulldialog_0270 = await driver.waitForComponent(ON.id('button_open_fulldialog_0270'), 500)
      await button_open_fulldialog_0270.click()
      await Utils.sleep(3000) // 等待显示动画完成（5000ms + 500ms缓冲）

      // 步骤4：执行左滑/右滑/三键back/键盘ESC/点击蒙层，观察弹窗消失动效
      await driver.click(50, 50) // 点击蒙层关闭弹窗
      await Utils.sleep(3000) // 等待消失动画完成（5000ms + 500ms缓冲）

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FULLDIALOG_0270 finish.`);
      done()
    })


  })
}