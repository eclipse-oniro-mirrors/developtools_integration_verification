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

export default function popupboxPromptInterface() {

  describe('popupboxPromptInterface', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_0030
     * @tc.name   : showActionMenu buttons parameter not passed
     * @tc.desc   : Verify popupbox prompt interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_0030 start.`);
      // 步骤1：打开页面，选择UIContext
      Settings.createWindow('testability/pages/component/popup/PopupboxPromptInterface/PopupboxPromptInterface0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：buttons参数不传入
      // 步骤3：运行代码 - 预期编译报错
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_0060
     * @tc.name   : showActionMenu color parameter not passed
     * @tc.desc   : Verify popupbox prompt interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_0060 start.`);
      // 步骤1：创建demo页
      Settings.createWindow('testability/pages/component/popup/PopupboxPromptInterface/PopupboxPromptInterface0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：运行程序
      // 步骤3：查看对话框 - 预期编译报错
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_0090
     * @tc.name   : showActionMenu text parameter not passed
     * @tc.desc   : Verify popupbox prompt interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_0090 start.`);
      // 步骤1：创建demo页
      Settings.createWindow('testability/pages/component/popup/PopupboxPromptInterface/PopupboxPromptInterface0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：运行程序
      // 步骤3：查看对话框 - 预期编译报错
      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_1500
     * @tc.name   : Toast visual display in light mode conforms to UX specification
     * @tc.desc   : Verify popupbox prompt interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_1500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_1500 start.`);
      // 步骤1：参照gitee上toast接口参数，示例1的代码
      Settings.createWindow('testability/pages/component/popup/PopupboxPromptInterface/PopupboxPromptInterface1500')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：浅色模式下查看toast显示
      let showToastButton = await driver.waitForComponent(ON.id('PopupboxPromptInterface1500_001'), 500)
      await showToastButton.click()
      await Utils.sleep(1000)
      // 步骤3：截图验证toast视觉显示与设计图保持一致，符合UX规范
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_1500 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_1600
     * @tc.name   : Toast visual display in dark mode conforms to UX specification
     * @tc.desc   : Verify popupbox prompt interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_1600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_1600 start.`);
      // 步骤1：参照gitee上toast接口参数，示例1的代码
      Settings.createWindow('testability/pages/component/popup/PopupboxPromptInterface/PopupboxPromptInterface1600')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：深色模式下查看toast显示
      let showToastButton = await driver.waitForComponent(ON.id('PopupboxPromptInterface1600_001'), 500)
      await showToastButton.click()
      await Utils.sleep(1000)
      // 步骤3：截图验证toast视觉显示与设计图保持一致，符合UX规范
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_INTERFACE_1600 finish.`);
      done()
    })

  })
}