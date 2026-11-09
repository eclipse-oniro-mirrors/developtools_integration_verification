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

export default function overlaymanagerLevel() {

  describe('overlaymanagerLevel', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0010
     * @tc.name   : Verify the feature of overlay node's new non-rendering capability
     * @tc.desc   : Verify popupbox overlaymanager level interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0010 start.`);
      // 步骤1：编译overlayManager这个工程，打开测试页面
      Settings.createWindow('testability/pages/component/popup/OverlaymanagerLevel/OverlaymanagerLevel0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击组合测试
      let combinationTestBtn = await driver.waitForComponent(ON.id('button_combination_test_0010'), 2000)
      await combinationTestBtn.click()
      await Utils.sleep(500)

      // 步骤2：点击任意层级（选择层级1）
      let levelBtn = await driver.waitForComponent(ON.id('button_level_1_0010'), 2000)
      await levelBtn.click()
      await Utils.sleep(500)

      // 步骤3：左滑返回上一个页面（模拟返回操作）
      await driver.swipe(100, 500, 800, 500, 500)
      await Utils.sleep(500)

      // 步骤4：点击get current option
      let getCurrentOptionBtn = await driver.waitForComponent(ON.id('button_get_current_option_0010'), 2000)
      await getCurrentOptionBtn.click()
      await Utils.sleep(500)

      // 预期结果：可以看到renderRootOverlay为true
      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0020
     * @tc.name   : Verify overlay popup and callback display normally when level is set to -5
     * @tc.desc   : Verify popupbox overlaymanager level interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0020 start.`);
      // 步骤1：编译toastx这个工程，打开测试页面
      Settings.createWindow('testability/pages/component/popup/OverlaymanagerLevel/OverlaymanagerLevel0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤3：点击-5
      let levelBtn = await driver.waitForComponent(ON.id('button_level_minus5_0020'), 2000)
      await levelBtn.click()
      await Utils.sleep(500)

      // 步骤3：点击top&bottom
      let topBottomBtn = await driver.waitForComponent(ON.id('button_top_bottom_0020'), 2000)
      await topBottomBtn.click()
      await Utils.sleep(500)

      // 预期结果：overlay弹窗正常弹出，toporder:-5, bottomorder:-100000
      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0030
     * @tc.name   : Verify overlay popup and callback display normally when level is set to 0.1111
     * @tc.desc   : Verify popupbox overlaymanager level interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0030 start.`);
      // 步骤1：编译toastx这个工程，打开测试页面
      Settings.createWindow('testability/pages/component/popup/OverlaymanagerLevel/OverlaymanagerLevel0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤3：点击0.111
      let levelBtn = await driver.waitForComponent(ON.id('button_level_0111_0030'), 2000)
      await levelBtn.click()
      await Utils.sleep(500)

      // 步骤3：点击top&bottom
      let topBottomBtn = await driver.waitForComponent(ON.id('button_top_bottom_0030'), 2000)
      await topBottomBtn.click()
      await Utils.sleep(500)

      // 预期结果：overlay弹窗正常弹出，toporder:0.111, bottomorder:-100000
      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0040
     * @tc.name   : Verify overlay popup and callback display normally when level is set to 100001
     * @tc.desc   : Verify popupbox overlaymanager level interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0040 start.`);
      // 步骤1：编译toastx这个工程，打开测试页面
      Settings.createWindow('testability/pages/component/popup/OverlaymanagerLevel/OverlaymanagerLevel0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤3：点击100001
      let levelBtn = await driver.waitForComponent(ON.id('button_level_100001_0040'), 2000)
      await levelBtn.click()
      await Utils.sleep(500)

      // 步骤3：点击top&bottom
      let topBottomBtn = await driver.waitForComponent(ON.id('button_top_bottom_0040'), 2000)
      await topBottomBtn.click()
      await Utils.sleep(500)

      // 预期结果：overlay弹窗正常弹出，toporder:100000, bottomorder:-100000
      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0050
     * @tc.name   : Verify overlay popup and callback display normally when level is set to undefined
     * @tc.desc   : Verify popupbox overlaymanager level interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0050 start.`);
      // 步骤1：编译toastx这个工程，打开测试页面
      Settings.createWindow('testability/pages/component/popup/OverlaymanagerLevel/OverlaymanagerLevel0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤3：点击undefined
      let levelBtn = await driver.waitForComponent(ON.id('button_level_undefined_0050'), 2000)
      await levelBtn.click()
      await Utils.sleep(500)

      // 步骤3：点击top&bottom
      let topBottomBtn = await driver.waitForComponent(ON.id('button_top_bottom_0050'), 2000)
      await topBottomBtn.click()
      await Utils.sleep(500)

      // 预期结果：overlay弹窗正常弹出，toporder:0, bottomorder:-100000
      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0070
     * @tc.name   : Verify overlay popup will not cover Modal UIExtension
     * @tc.desc   : Verify popupbox overlaymanager level interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0070 start.`);
      // 步骤1：编译toastx这个工程，打开测试页面
      Settings.createWindow('testability/pages/component/popup/OverlaymanagerLevel/OverlaymanagerLevel0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤3：点击任意层级按钮
      let levelBtn = await driver.waitForComponent(ON.id('button_any_level_0070'), 2000)
      await levelBtn.click()
      await Utils.sleep(500)

      // 步骤3：点击reqpermissions
      let reqPermBtn = await driver.waitForComponent(ON.id('button_reqpermissions_0070'), 2000)
      await reqPermBtn.click()
      await Utils.sleep(500)

      // 预期结果：不会覆盖在Modal UIExtension之上
      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0090
     * @tc.name   : Verify overlayManager supports level management and displays normally on atomic services
     * @tc.desc   : Verify popupbox overlaymanager level interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0090 start.`);
      // 步骤1：编译atomicDemo这个工程，打开测试页面
      Settings.createWindow('testability/pages/component/popup/OverlaymanagerLevel/OverlaymanagerLevel0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤3：点击不同的层级（选择层级5）
      let levelBtn = await driver.waitForComponent(ON.id('button_level_5_0090'), 2000)
      await levelBtn.click()
      await Utils.sleep(500)

      // 步骤3：点击top&bottom
      let topBottomBtn = await driver.waitForComponent(ON.id('button_top_bottom_0090'), 2000)
      await topBottomBtn.click()
      await Utils.sleep(500)

      // 预期结果：日志里面会按照层级的最上层和最下层，正确显示top和bottom的层级
      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0100
     * @tc.name   : Verify overlay popup with x/y offset will not cover keyboard
     * @tc.desc   : Verify popupbox overlaymanager level interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0100 start.`);
      // 步骤1：编译toastx这个工程，打开测试页面
      Settings.createWindow('testability/pages/component/popup/OverlaymanagerLevel/OverlaymanagerLevel0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤3：点击undefined右上角
      let levelBtn = await driver.waitForComponent(ON.id('button_undefined_topright_0100'), 2000)
      await levelBtn.click()
      await Utils.sleep(500)

      // 预期结果：不会覆盖在键盘之上
      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0110
     * @tc.name   : Verify overlay popup can be removed normally when level is set to 100001
     * @tc.desc   : Verify popupbox overlaymanager level interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0110 start.`);
      // 步骤1：编译toastx这个工程，打开测试页面
      Settings.createWindow('testability/pages/component/popup/OverlaymanagerLevel/OverlaymanagerLevel0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 先弹出100001的弹窗
      let levelBtn = await driver.waitForComponent(ON.id('button_level_100001_0110'), 2000)
      await levelBtn.click()
      await Utils.sleep(500)

      // 步骤3：点击remove
      let removeBtn = await driver.waitForComponent(ON.id('button_remove_0110'), 2000)
      await removeBtn.click()
      await Utils.sleep(500)

      // 预期结果：overlay弹窗正常移除，toporder:0.111, bottomorder:-100000
      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0120
     * @tc.name   : Verify overlay popup and callback display normally when level is set to -100001
     * @tc.desc   : Verify popupbox overlaymanager level interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0120 start.`);
      // 步骤1：编译toastx这个工程，打开测试页面
      Settings.createWindow('testability/pages/component/popup/OverlaymanagerLevel/OverlaymanagerLevel0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤3：点击-100001
      let levelBtn = await driver.waitForComponent(ON.id('button_level_minus100001_0120'), 2000)
      await levelBtn.click()
      await Utils.sleep(500)

      // 步骤3：点击top&bottom
      let topBottomBtn = await driver.waitForComponent(ON.id('button_top_bottom_0120'), 2000)
      await topBottomBtn.click()
      await Utils.sleep(500)

      // 预期结果：overlay弹窗正常弹出，toporder:-100000, bottomorder:-100000
      // 截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_OVERLAYMANAGER_LEVEL_0120 finish.`);
      done()
    })


  })
}