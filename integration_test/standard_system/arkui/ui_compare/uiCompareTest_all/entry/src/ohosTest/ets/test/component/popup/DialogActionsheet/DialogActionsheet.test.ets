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

export default function dialogActionsheet() {

  describe('dialogActionsheet', () => {
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
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0010
     * @tc.name   : Component function special components dialog actionsheet
     * @tc.desc   : Verify component function special components dialog actionsheet interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0010 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogActionsheet/DialogActionsheet0010')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找按钮组件
      let show_actionsheet_no_message_0010 = await driver.waitForComponent(ON.id('show_actionsheet_no_message_0010'), 500)
      
      // 步骤3：ActionSheet.show()中不配置message参数
      // 注意：此步骤在页面代码中已经实现，点击按钮会调用不包含message参数的ActionSheet.show()
      await show_actionsheet_no_message_0010.click()
      await Utils.sleep(500)
      
      // 步骤4：验证编译报错（预期结果：编译报错）
      // 由于message参数是必填的，代码编译时应该会报错
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0010 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0020
     * @tc.name   : Component function special components dialog actionsheet
     * @tc.desc   : Verify component function special components dialog actionsheet interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0020 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogActionsheet/DialogActionsheet0020')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：查找按钮组件
      let show_actionsheet_no_sheets_0020 = await driver.waitForComponent(ON.id('show_actionsheet_no_sheets_0020'), 500)

      // 步骤3：ActionSheet.show()中不配置message参数
      // 注意：此步骤在页面代码中已经实现，点击按钮会调用不包含message参数的ActionSheet.show()
      await show_actionsheet_no_sheets_0020.click()
      await Utils.sleep(500)

      // 步骤4：验证编译报错（预期结果：编译报错）
      // 由于message参数是必填的，代码编译时应该会报错
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0020 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0030
     * @tc.name   : Component function special components dialog actionsheet
     * @tc.desc   : Verify component function special components dialog actionsheet interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0030 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogActionsheet/DialogActionsheet0030')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：查找按钮组件
      let show_actionsheet_abnormal_title_0030 = await driver.waitForComponent(ON.id('show_actionsheet_abnormal_title_0030'), 500)

      // 步骤3：ActionSheet.show()中不配置message参数
      // 注意：此步骤在页面代码中已经实现，点击按钮会调用不包含message参数的ActionSheet.show()
      await show_actionsheet_abnormal_title_0030.click()
      await Utils.sleep(500)

      // 步骤4：验证编译报错（预期结果：编译报错）
      // 由于message参数是必填的，代码编译时应该会报错
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0030 finish.`);
      done()
    })




    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0040
     * @tc.name   : Component function special components dialog actionsheet
     * @tc.desc   : Verify component function special components dialog actionsheet interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0040 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogActionsheet/DialogActionsheet0040')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找按钮组件
      let show_actionsheet_wrong_message_type_0040 = await driver.waitForComponent(ON.id('show_actionsheet_wrong_message_type_0040'), 500)
      
      // 步骤3：message设置为数字类型12345678910
      // 注意：此步骤在页面代码中已经实现，点击按钮会调用message设置为数字类型的ActionSheet.show()
      await show_actionsheet_wrong_message_type_0040.click()
      await Utils.sleep(500)
      
      // 步骤4：验证编译报错（预期结果：编译报错）
      // 由于message应该是字符串类型，设置为数字类型应该会编译报错
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0040 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0050
     * @tc.name   : Component function special components dialog actionsheet
     * @tc.desc   : Verify component function special components dialog actionsheet interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0050 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogActionsheet/DialogActionsheet0050')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找按钮组件
      let show_actionsheet_abnormal_subtitle_0050 = await driver.waitForComponent(ON.id('show_actionsheet_abnormal_subtitle_0050'), 500)
      
      // 步骤3：subtitle设置为异常值123456@#&
      // 注意：此步骤在页面代码中已经实现，点击按钮会调用subtitle设置为异常值的ActionSheet.show()
      await show_actionsheet_abnormal_subtitle_0050.click()
      await Utils.sleep(500)
      
      // 步骤4：验证编译报错（预期结果：编译报错）
      // 由于subtitle应该是字符串类型，设置为异常值应该会编译报错
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0050 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0060
     * @tc.name   : Component function special components dialog actionsheet
     * @tc.desc   : Verify component function special components dialog actionsheet interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0060 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/DialogActionsheet/DialogActionsheet0060')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：点击showInSubWindow_false按钮，进入页面，再点击页面中的按钮
      let show_actionsheet_subwindow_false_0060 = await driver.waitForComponent(ON.id('show_actionsheet_subwindow_false_0060'), 500)
      await show_actionsheet_subwindow_false_0060.click()
      await Utils.sleep(1000)
      
      // 步骤3：验证列表选择弹窗不可以在子窗口显示（预期结果：列表选择弹窗不可以在子窗口显示）
      // showInSubWindow设置为false，弹窗应该在主窗口中显示而不是子窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0060 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0070
     * @tc.name   : Component function special components dialog actionsheet
     * @tc.desc   : Verify component function special components dialog actionsheet interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0070 start.`);
      // 步骤1：安装hap包，进入demo（页面初始化）
      Settings.createWindow('testability/pages/component/popup/DialogActionsheet/DialogActionsheet0070')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：点击showInSubWindow_true按钮，进入页面，再点击页面中的按钮
      let show_actionsheet_subwindow_true_0070 = await driver.waitForComponent(ON.id('show_actionsheet_subwindow_true_0070'), 500)
      await show_actionsheet_subwindow_true_0070.click()
      await Utils.sleep(1000)
      
      // 步骤3：验证列表选择弹窗可以在子窗口显示（预期结果：列表选择弹窗可以在子窗口显示）
      // showInSubWindow设置为true，弹窗应该在子窗口中显示
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0070 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0080
     * @tc.name   : Component function special components dialog actionsheet
     * @tc.desc   : Verify component function special components dialog actionsheet interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0080 start.`);
      // 步骤1：ActionSheet.show()中不配置非必填参数（页面初始化）
      // 步骤2：运行此ets页面，查看是否报错（编译不报错）
      Settings.createWindow('testability/pages/component/popup/DialogActionsheet/DialogActionsheet0080')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤3：进入demo，点击非必填参数验证的按钮进入页面，点击页面中的按钮
      let show_actionsheet_optional_params_0080 = await driver.waitForComponent(ON.id('show_actionsheet_optional_params_0080'), 500)
      await show_actionsheet_optional_params_0080.click()
      await Utils.sleep(1000)
      
      // 验证预期结果：弹出弹窗，显示弹窗标题title、弹窗内容message，列表项sheets，弹窗默认有蒙层、垂直底部对齐
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0080 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0600
     * @tc.name   : Component function special components dialog actionsheet
     * @tc.desc   : Verify component function special components dialog actionsheet interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0600 start.`);
      // 步骤1：编译gitee上actionSheet组件资料里示例1的代码（页面初始化）
      Settings.createWindow('testability/pages/component/popup/DialogActionsheet/DialogActionsheet0600')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：深色模式下查看列表选择弹窗显示
      let show_actionsheet_dark_mode_0600 = await driver.waitForComponent(ON.id('show_actionsheet_dark_mode_0600'), 500)
      await show_actionsheet_dark_mode_0600.click()
      await Utils.sleep(1000)
      
      // 验证预期结果：actionSheet的视觉显示与基线图保持一致，符合UX规范
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0600 finish.`);
      done()
    })


    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0700
     * @tc.name   : Component function special components dialog actionsheet
     * @tc.desc   : Verify component function special components dialog actionsheet interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0700 start.`);
      // 步骤1：编译gitee上actionSheet组件资料里示例1的代码（页面初始化）
      Settings.createWindow('testability/pages/component/popup/DialogActionsheet/DialogActionsheet0700')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：浅色模式下查看列表选择弹窗显示
      let show_actionsheet_light_mode_0700 = await driver.waitForComponent(ON.id('show_actionsheet_light_mode_0700'), 500)
      await show_actionsheet_light_mode_0700.click()
      await Utils.sleep(1000)
      
      // 验证预期结果：actionSheet的视觉显示与基线图保持一致，符合UX规范
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_ACTIONSHEET_0700 finish.`);
      done()
    })


  })
}