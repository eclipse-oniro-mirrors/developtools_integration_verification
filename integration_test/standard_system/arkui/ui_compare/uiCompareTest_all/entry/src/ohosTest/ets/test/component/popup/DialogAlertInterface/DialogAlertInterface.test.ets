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

export default function dialogAlertInterface() {

  describe('dialogAlertInterface', () => {
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
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0010
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0010 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0010')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0010 = await driver.waitForComponent(ON.id('show_dialog_button_0010'), 500)
      await show_dialog_button_0010.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0080
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0080 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0080')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0080 = await driver.waitForComponent(ON.id('show_dialog_button_0080'), 500)
      await show_dialog_button_0080.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0080 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0090
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0090 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0090')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0090 = await driver.waitForComponent(ON.id('show_dialog_button_0090'), 500)
      await show_dialog_button_0090.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0090 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0100
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0100 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0100')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0100 = await driver.waitForComponent(ON.id('show_dialog_button_0100'), 500)
      await show_dialog_button_0100.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0100 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0120
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0120 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0120')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0120 = await driver.waitForComponent(ON.id('show_dialog_button_0120'), 500)
      await show_dialog_button_0120.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0120 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0140
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0140 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0140')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0140 = await driver.waitForComponent(ON.id('show_dialog_button_0140'), 500)
      await show_dialog_button_0140.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0140 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0160
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0160 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0160')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0160 = await driver.waitForComponent(ON.id('show_dialog_button_0160'), 500)
      await show_dialog_button_0160.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0160 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0180
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0180 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0180')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0180 = await driver.waitForComponent(ON.id('show_dialog_button_0180'), 500)
      await show_dialog_button_0180.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0180 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0190
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0190 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0190')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0190 = await driver.waitForComponent(ON.id('show_dialog_button_0190'), 500)
      await show_dialog_button_0190.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0190 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0200
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0200 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0200')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0200 = await driver.waitForComponent(ON.id('show_dialog_button_0200'), 500)
      await show_dialog_button_0200.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0200 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0250
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0250 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0250')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0250 = await driver.waitForComponent(ON.id('show_dialog_button_0250'), 500)
      await show_dialog_button_0250.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0250 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0260
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0260 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0260')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0260 = await driver.waitForComponent(ON.id('show_dialog_button_0260'), 500)
      await show_dialog_button_0260.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0260 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0300
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0300 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0300')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0300 = await driver.waitForComponent(ON.id('show_dialog_button_0300'), 500)
      await show_dialog_button_0300.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0300 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0310
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0310 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0310')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0310 = await driver.waitForComponent(ON.id('show_dialog_button_0310'), 500)
      await show_dialog_button_0310.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0310 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0340
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0340 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0340')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0340 = await driver.waitForComponent(ON.id('show_dialog_button_0340'), 500)
      await show_dialog_button_0340.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0340 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0390
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0390 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0390')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0390 = await driver.waitForComponent(ON.id('show_dialog_button_0390'), 500)
      await show_dialog_button_0390.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0390 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0530
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0530 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0530')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0530 = await driver.waitForComponent(ON.id('show_dialog_button_0530'), 500)
      await show_dialog_button_0530.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0530 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0550
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0550 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0550')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0550 = await driver.waitForComponent(ON.id('show_dialog_button_0550'), 500)
      await show_dialog_button_0550.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0550 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0570
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0570 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0570')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0570 = await driver.waitForComponent(ON.id('show_dialog_button_0570'), 500)
      await show_dialog_button_0570.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0570 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0590
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0590 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0590')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0590 = await driver.waitForComponent(ON.id('show_dialog_button_0590'), 500)
      await show_dialog_button_0590.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0590 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0610
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0610 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0610')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0610 = await driver.waitForComponent(ON.id('show_dialog_button_0610'), 500)
      await show_dialog_button_0610.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0610 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0660
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0660 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0660')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0660 = await driver.waitForComponent(ON.id('show_dialog_button_0660'), 500)
      await show_dialog_button_0660.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0660 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0710
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0710 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0710')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0710 = await driver.waitForComponent(ON.id('show_dialog_button_0710'), 500)
      await show_dialog_button_0710.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0710 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0740
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0740', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0740 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface0740')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog
      let show_dialog_button_0740 = await driver.waitForComponent(ON.id('show_dialog_button_0740'), 500)
      await show_dialog_button_0740.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_0740 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_1500
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_1500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_1500 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface1500')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog，验证浅色模式下的视觉显示
      let show_dialog_button_1500 = await driver.waitForComponent(ON.id('show_dialog_button_1500'), 500)
      await show_dialog_button_1500.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog在浅色模式下的视觉显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_1500 finish.`);
      done()
    })

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_1600
     * @tc.name   : Component function special components dialog alert interface
     * @tc.desc   : Verify component function special components dialog alert interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_1600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_1600 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogAlertInterface/DialogAlertInterface1600')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找并点击按钮显示AlertDialog，验证深色模式下的视觉显示
      let show_dialog_button_1600 = await driver.waitForComponent(ON.id('show_dialog_button_1600'), 500)
      await show_dialog_button_1600.click()
      await Utils.sleep(500)
      
      // 步骤3：验证AlertDialog在深色模式下的视觉显示并截图
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_Alert_INTERFACE_1600 finish.`);
      done()
    })




  })
}