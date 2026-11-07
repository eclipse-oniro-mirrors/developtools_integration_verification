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

export default function popupboxPromptScenarios() {

  describe('popupboxPromptScenarios', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0020
     * @tc.name   : No button popup scenario (WGR) - promptAction popup layer test
     * @tc.desc   : Verify popupbox prompt scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0020 start.`);
      // 步骤1：创建无按钮弹窗promptAction弹窗层测
      Settings.createWindow('testability/pages/component/popup/PopupboxPromptScenarios/PopupboxPromptScenarios0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：showInSubWindow参数设置为true
      // 步骤3：编译hap并安装运行
      // 步骤4：WGR该hap的图层（设为悬浮画面）
      // 步骤5：点击hap弹窗按钮，点击button的点击，此时弹窗图层可以穿透
      let showDialogButton = await driver.waitForComponent(ON.id('PopupboxPromptScenarios0020_001'), 500)
      await showDialogButton.click()
      await Utils.sleep(1000)
      // 步骤6：截图验证 - 预期点击hap的点击消失
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0030
     * @tc.name   : No button popup scenario (WGR) - promptAction popup layer test
     * @tc.desc   : Verify popupbox prompt scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0030 start.`);
      // 步骤1：创建无按钮弹窗promptAction弹窗层测
      Settings.createWindow('testability/pages/component/popup/PopupboxPromptScenarios/PopupboxPromptScenarios0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：showInSubWindow参数设置为true
      // 步骤3：编译hap并安装运行
      // 步骤4：WGR该hap的图层（设为悬浮画面）
      // 步骤5：点击hap弹窗按钮，点击button的点击，此时弹窗图层可以穿透
      let showDialogButton = await driver.waitForComponent(ON.id('PopupboxPromptScenarios0030_001'), 500)
      await showDialogButton.click()
      await Utils.sleep(1000)
      // 步骤6：截图验证 - 预期点击hap的点击消失
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0040
     * @tc.name   : No button popup scenario (WGR) - prompt popup layer test
     * @tc.desc   : Verify popupbox prompt scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0040 start.`);
      // 步骤1：创建无按钮弹窗prompt弹窗层测
      Settings.createWindow('testability/pages/component/popup/PopupboxPromptScenarios/PopupboxPromptScenarios0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：showInSubWindow参数设置为true
      // 步骤3：编译hap并安装运行
      // 步骤4：WGR该hap的图层（设为悬浮画面）
      // 步骤5：点击hap弹窗按钮，点击button的点击，此时弹窗图层可以穿透
      let showDialogButton = await driver.waitForComponent(ON.id('PopupboxPromptScenarios0040_001'), 500)
      await showDialogButton.click()
      await Utils.sleep(1000)
      // 步骤6：截图验证 - 预期点击hap的点击消失
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0050
     * @tc.name   : No button popup scenario (WGR) - prompt popup layer test
     * @tc.desc   : Verify popupbox prompt scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0050 start.`);
      // 步骤1：创建无按钮弹窗prompt弹窗层测
      Settings.createWindow('testability/pages/component/popup/PopupboxPromptScenarios/PopupboxPromptScenarios0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：showInSubWindow参数设置为true
      // 步骤3：编译hap并安装运行
      // 步骤4：WGR该hap的图层（设为悬浮画面）
      // 步骤5：点击hap弹窗按钮，点击button的点击，此时弹窗图层可以穿透
      let showDialogButton = await driver.waitForComponent(ON.id('PopupboxPromptScenarios0050_001'), 500)
      await showDialogButton.click()
      await Utils.sleep(1000)
      // 步骤6：截图验证 - 预期点击hap的点击消失
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0060
     * @tc.name   : With button popup scenario (WGR) - promptAction popup layer test
     * @tc.desc   : Verify popupbox prompt scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0060 start.`);
      // 步骤1：创建有按钮弹窗promptAction弹窗层测
      Settings.createWindow('testability/pages/component/popup/PopupboxPromptScenarios/PopupboxPromptScenarios0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：showInSubWindow参数设置为true
      // 步骤3：编译hap并安装运行
      // 步骤4：WGR该hap的图层（设为悬浮画面）
      // 步骤5：点击hap弹窗按钮，点击button的点击，此时弹窗图层可以穿透
      let showDialogButton = await driver.waitForComponent(ON.id('PopupboxPromptScenarios0060_001'), 500)
      await showDialogButton.click()
      await Utils.sleep(1000)
      // 步骤6：截图验证 - 预期图层能获焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0070
     * @tc.name   : With button popup scenario (WGR) - promptAction popup layer test
     * @tc.desc   : Verify popupbox prompt scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0070 start.`);
      // 步骤1：创建有按钮弹窗promptAction弹窗层测
      Settings.createWindow('testability/pages/component/popup/PopupboxPromptScenarios/PopupboxPromptScenarios0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：showInSubWindow参数设置为true
      // 步骤3：编译hap并安装运行
      // 步骤4：WGR该hap的图层（设为悬浮画面）
      // 步骤5：点击hap弹窗按钮，点击button的点击，此时弹窗图层可以穿透
      let showDialogButton = await driver.waitForComponent(ON.id('PopupboxPromptScenarios0070_001'), 500)
      await showDialogButton.click()
      await Utils.sleep(1000)
      // 步骤6：截图验证 - 预期图层能获焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0080
     * @tc.name   : With button popup scenario (WGR) - prompt popup layer test
     * @tc.desc   : Verify popupbox prompt scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0080 start.`);
      // 步骤1：创建有按钮弹窗prompt弹窗层测
      Settings.createWindow('testability/pages/component/popup/PopupboxPromptScenarios/PopupboxPromptScenarios0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：showInSubWindow参数设置为true
      // 步骤3：编译hap并安装运行
      // 步骤4：WGR该hap的图层（设为悬浮画面）
      // 步骤5：点击hap弹窗按钮，点击button的点击，此时弹窗图层可以穿透
      let showDialogButton = await driver.waitForComponent(ON.id('PopupboxPromptScenarios0080_001'), 500)
      await showDialogButton.click()
      await Utils.sleep(1000)
      // 步骤6：截图验证 - 预期图层能获焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0090
     * @tc.name   : With button popup scenario (WGR) - prompt popup layer test
     * @tc.desc   : Verify popupbox prompt scenarios interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0090 start.`);
      // 步骤1：创建有按钮弹窗prompt弹窗层测
      Settings.createWindow('testability/pages/component/popup/PopupboxPromptScenarios/PopupboxPromptScenarios0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：showInSubWindow参数设置为true
      // 步骤3：编译hap并安装运行
      // 步骤4：WGR该hap的图层（设为悬浮画面）
      // 步骤5：点击hap弹窗按钮，点击button的点击，此时弹窗图层可以穿透
      let showDialogButton = await driver.waitForComponent(ON.id('PopupboxPromptScenarios0090_001'), 500)
      await showDialogButton.click()
      await Utils.sleep(1000)
      // 步骤6：截图验证 - 预期图层能获焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_SCENARIOS_0090 finish.`);
      done()
    })

  })
}