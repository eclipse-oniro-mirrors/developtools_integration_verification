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
import { BusinessError } from '@kit.BasicServicesKit'

export default function toastAvoidTest () {

  describe('toastAvoidTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err:BusinessError) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1010
     * @tc.name   : Toast alignment Top with bottom 80, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1010', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid01');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1010: 开始查找Toast按钮 (toastButton_01)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_01'), 1000);
        console.info('TEST_1010: 成功找到Toast按钮');

        console.info('TEST_1010: 开始查找键盘输入框 (keyboardButton_01)');
        let keyboardInput: Component = await driver.waitForComponent(ON.id('keyboardButton_01'), 1000);
        console.info('TEST_1010: 成功找到键盘输入框');

        console.info('TEST_1010: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1010: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1010: 开始点击键盘输入框');
        await keyboardInput.click();
        console.info('TEST_1010: 键盘输入框点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1010');
        await Utils.sleep(1000);

        console.info('TEST_1010: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1010: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1010: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1050
     * @tc.name   : Toast alignment BottomEnd with bottom 80, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1050', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid02');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1050: 开始查找Toast按钮 (toastButton_02)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_02'), 1000);
        console.info('TEST_1050: 成功找到Toast按钮');

        console.info('TEST_1050: 开始查找键盘输入框 (keyboardButton_02)');
        let keyboardInput: Component = await driver.waitForComponent(ON.id('keyboardButton_02'), 1000);
        console.info('TEST_1050: 成功找到键盘输入框');

        console.info('TEST_1050: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1050: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1050: 开始点击键盘输入框');
        await keyboardInput.click();
        console.info('TEST_1050: 键盘输入框点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1050');
        await Utils.sleep(1000);

        console.info('TEST_1050: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1050: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1050: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1020
     * @tc.name   : Toast bottom value adjustment, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1020', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid03');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1020: 开始查找Toast按钮 (toastButton_03)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_03'), 1000);
        console.info('TEST_1020: 成功找到Toast按钮');

        console.info('TEST_1020: 开始查找键盘输入框 (keyboardButton_03)');
        let keyboardInput: Component = await driver.waitForComponent(ON.id('keyboardButton_03'), 1000);
        console.info('TEST_1020: 成功找到键盘输入框');

        console.info('TEST_1020: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1020: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1020: 开始点击键盘输入框');
        await keyboardInput.click();
        console.info('TEST_1020: 键盘输入框点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1020');
        await Utils.sleep(1000);

        console.info('TEST_1020: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1020: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1020: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1070
     * @tc.name   : Toast alignment Bottom with bottom 80, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1070', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid04');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1070: 开始查找Toast按钮 (toastButton_04)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_04'), 1000);
        console.info('TEST_1070: 成功找到Toast按钮');

        console.info('TEST_1070: 开始查找键盘输入框 (keyboardButton_04)');
        let keyboardInput: Component = await driver.waitForComponent(ON.id('keyboardButton_04'), 1000);
        console.info('TEST_1070: 成功找到键盘输入框');

        console.info('TEST_1070: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1070: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1070: 开始点击键盘输入框');
        await keyboardInput.click();
        console.info('TEST_1070: 键盘输入框点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1070');
        await Utils.sleep(1000);

        console.info('TEST_1070: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1070: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1070: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1120
     * @tc.name   : Toast alignment TopStart with bottom 80, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1120', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid05');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1120: 开始查找Toast按钮 (toastButton_05)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_05'), 1000);
        console.info('TEST_1120: 成功找到Toast按钮');

        console.info('TEST_1120: 开始查找键盘按钮 (keyboardButton_05)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_05'), 1000);
        console.info('TEST_1120: 成功找到键盘按钮');

        console.info('TEST_1120: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1120: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1120: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1120: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1120');
        await Utils.sleep(1000);

        console.info('TEST_1120: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1120: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1120: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1100
     * @tc.name   : Toast alignment Center with bottom 80, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1100', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid06');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1100: 开始查找Toast按钮 (toastButton_06)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_06'), 1000);
        console.info('TEST_1100: 成功找到Toast按钮');

        console.info('TEST_1100: 开始查找键盘按钮 (keyboardButton_06)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_06'), 1000);
        console.info('TEST_1100: 成功找到键盘按钮');

        console.info('TEST_1100: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1100: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1100: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1100: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1100');
        await Utils.sleep(1000);

        console.info('TEST_1100: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1100: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1100: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1040
     * @tc.name   : Toast default mode light/dark theme test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1040', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid07');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1040: 开始查找Toast按钮 (toastButton_07)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_07'), 1000);
        console.info('TEST_1040: 成功找到Toast按钮');

        console.info('TEST_1040: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1040: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1040');
        await Utils.sleep(1000);

        console.info('TEST_1040: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1040: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1040: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1130
     * @tc.name   : Toast alignment Top with bottom 80, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1130', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid08');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1130: 开始查找Toast按钮 (toastButton_08)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_08'), 1000);
        console.info('TEST_1130: 成功找到Toast按钮');

        console.info('TEST_1130: 开始查找键盘按钮 (keyboardButton_08)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_08'), 1000);
        console.info('TEST_1130: 成功找到键盘按钮');

        console.info('TEST_1130: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1130: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1130: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1130: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1130');
        await Utils.sleep(1000);

        console.info('TEST_1130: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1130: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1130: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1030
     * @tc.name   : Toast bottom value adjustment, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1030', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid09');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1030: 开始查找Toast按钮 (toastButton_09)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_09'), 1000);
        console.info('TEST_1030: 成功找到Toast按钮');

        console.info('TEST_1030: 开始查找键盘按钮 (keyboardButton_09)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_09'), 1000);
        console.info('TEST_1030: 成功找到键盘按钮');

        console.info('TEST_1030: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1030: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1030: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1030: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1030');
        await Utils.sleep(1000);

        console.info('TEST_1030: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1030: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1030: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1060
     * @tc.name   : Toast alignment BottomStart with bottom 80, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1060', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid10');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1060: 开始查找Toast按钮 (toastButton_10)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_10'), 1000);
        console.info('TEST_1060: 成功找到Toast按钮');

        console.info('TEST_1060: 开始查找键盘按钮 (keyboardButton_10)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_10'), 1000);
        console.info('TEST_1060: 成功找到键盘按钮');

        console.info('TEST_1060: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1060: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1060: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1060: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1060');
        await Utils.sleep(1000);

        console.info('TEST_1060: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1060: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1060: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1110
     * @tc.name   : Toast alignment TopEnd with bottom 80, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1110', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid11');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1110: 开始查找Toast按钮 (toastButton_11)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_11'), 1000);
        console.info('TEST_1110: 成功找到Toast按钮');

        console.info('TEST_1110: 开始查找键盘按钮 (keyboardButton_11)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_11'), 1000);
        console.info('TEST_1110: 成功找到键盘按钮');

        console.info('TEST_1110: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1110: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1110: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1110: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1110');
        await Utils.sleep(1000);

        console.info('TEST_1110: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1110: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1110: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1160
     * @tc.name   : Toast alignment BottomEnd with bottom 80, screen rotation test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1160', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid12');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1160: 开始查找Toast按钮 (toastButton_12)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_12'), 1000);
        console.info('TEST_1160: 成功找到Toast按钮');

        console.info('TEST_1160: 开始查找键盘按钮 (keyboardButton_12)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_12'), 1000);
        console.info('TEST_1160: 成功找到键盘按钮');

        console.info('TEST_1160: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1160: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1160: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1160: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1160');
        await Utils.sleep(1000);

        console.info('TEST_1160: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1160: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1160: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1090
     * @tc.name   : Toast alignment CenterStart with bottom 80, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1090', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid13');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1090: 开始查找Toast按钮 (toastButton_13)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_13'), 1000);
        console.info('TEST_1090: 成功找到Toast按钮');

        console.info('TEST_1090: 开始查找键盘按钮 (keyboardButton_13)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_13'), 1000);
        console.info('TEST_1090: 成功找到键盘按钮');

        console.info('TEST_1090: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1090: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1090: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1090: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1090');
        await Utils.sleep(1000);

        console.info('TEST_1090: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1090: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1090: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1080
     * @tc.name   : Toast alignment CenterEnd with bottom 80, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1080', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid14');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1080: 开始查找Toast按钮 (toastButton_14)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_14'), 1000);
        console.info('TEST_1080: 成功找到Toast按钮');

        console.info('TEST_1080: 开始查找键盘按钮 (keyboardButton_14)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_14'), 1000);
        console.info('TEST_1080: 成功找到键盘按钮');

        console.info('TEST_1080: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1080: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1080: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1080: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1080');
        await Utils.sleep(1000);

        console.info('TEST_1080: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1080: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1080: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1150
     * @tc.name   : Toast systemTopMost mode light/dark theme test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1150', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid15');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1150: 开始查找Toast按钮 (toastButton_15)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_15'), 1000);
        console.info('TEST_1150: 成功找到Toast按钮');

        console.info('TEST_1150: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1150: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1150');
        await Utils.sleep(1000);

        console.info('TEST_1150: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1150: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1150: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1140
     * @tc.name   : Toast alignment Bottom with bottom 80, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1140', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid16');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1140: 开始查找Toast按钮 (toastButton_16)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_16'), 1000);
        console.info('TEST_1140: 成功找到Toast按钮');

        console.info('TEST_1140: 开始查找键盘按钮 (keyboardButton_16)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_16'), 1000);
        console.info('TEST_1140: 成功找到键盘按钮');

        console.info('TEST_1140: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1140: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1140: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1140: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1140');
        await Utils.sleep(1000);

        console.info('TEST_1140: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1140: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1140: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1170
     * @tc.name   : Toast alignment BottomEnd with bottom 80, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1170', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid17');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1170: 开始查找Toast按钮 (toastButton_17)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_17'), 1000);
        console.info('TEST_1170: 成功找到Toast按钮');

        console.info('TEST_1170: 开始查找键盘按钮 (keyboardButton_17)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_17'), 1000);
        console.info('TEST_1170: 成功找到键盘按钮');

        console.info('TEST_1170: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1170: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1170: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1170: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1170');
        await Utils.sleep(1000);

        console.info('TEST_1170: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1170: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1170: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1180
     * @tc.name   : Toast alignment BottomStart with bottom 80, delayed popup test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1180', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid18');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1180: 开始查找Toast按钮 (toastButton_18)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_18'), 1000);
        console.info('TEST_1180: 成功找到Toast按钮');

        console.info('TEST_1180: 开始查找键盘按钮 (keyboardButton_18)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_18'), 1000);
        console.info('TEST_1180: 成功找到键盘按钮');

        console.info('TEST_1180: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1180: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1180: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1180: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1180');
        await Utils.sleep(1000);

        console.info('TEST_1180: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1180: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1180: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1190
     * @tc.name   : Toast alignment BottomStart with bottom 80, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1190', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid19');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1190: 开始查找Toast按钮 (toastButton_19)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_19'), 1000);
        console.info('TEST_1190: 成功找到Toast按钮');

        console.info('TEST_1190: 开始查找键盘按钮 (keyboardButton_19)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_19'), 1000);
        console.info('TEST_1190: 成功找到键盘按钮');

        console.info('TEST_1190: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1190: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1190: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1190: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1190');
        await Utils.sleep(1000);

        console.info('TEST_1190: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1190: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1190: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1200
     * @tc.name   : Toast alignment Bottom with bottom 80, keyboard first then toast test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1200', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid20');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1200: 开始查找Toast按钮 (toastButton_20)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_20'), 1000);
        console.info('TEST_1200: 成功找到Toast按钮');

        console.info('TEST_1200: 开始查找键盘按钮 (keyboardButton_20)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_20'), 1000);
        console.info('TEST_1200: 成功找到键盘按钮');

        console.info('TEST_1200: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1200: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1200: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1200: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1200');
        await Utils.sleep(1000);

        console.info('TEST_1200: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1200: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1200: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1210
     * @tc.name   : Toast alignment Bottom with bottom 80, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1210', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid21');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1210: 开始查找Toast按钮 (toastButton_21)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_21'), 1000);
        console.info('TEST_1210: 成功找到Toast按钮');

        console.info('TEST_1210: 开始查找键盘按钮 (keyboardButton_21)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_21'), 1000);
        console.info('TEST_1210: 成功找到键盘按钮');

        console.info('TEST_1210: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1210: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1210: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1210: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1210');
        await Utils.sleep(1000);

        console.info('TEST_1210: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1210: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1210: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1220
     * @tc.name   : Toast alignment End with bottom 80, position unchanged test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1220', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid22');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1220: 开始查找Toast按钮 (toastButton_22)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_22'), 1000);
        console.info('TEST_1220: 成功找到Toast按钮');

        console.info('TEST_1220: 开始查找键盘按钮 (keyboardButton_22)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_22'), 1000);
        console.info('TEST_1220: 成功找到键盘按钮');

        console.info('TEST_1220: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1220: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1220: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1220: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1220');
        await Utils.sleep(1000);

        console.info('TEST_1220: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1220: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1220: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1230
     * @tc.name   : Toast alignment Start with bottom 80, position unchanged test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1230', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid23');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1230: 开始查找Toast按钮 (toastButton_23)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_23'), 1000);
        console.info('TEST_1230: 成功找到Toast按钮');

        console.info('TEST_1230: 开始查找键盘按钮 (keyboardButton_23)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_23'), 1000);
        console.info('TEST_1230: 成功找到键盘按钮');

        console.info('TEST_1230: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1230: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1230: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1230: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1230');
        await Utils.sleep(1000);

        console.info('TEST_1230: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1230: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1230: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1240
     * @tc.name   : Toast alignment Center with bottom 80, position unchanged test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1240', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid24');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1240: 开始查找Toast按钮 (toastButton_24)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_24'), 1000);
        console.info('TEST_1240: 成功找到Toast按钮');

        console.info('TEST_1240: 开始查找键盘按钮 (keyboardButton_24)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_24'), 1000);
        console.info('TEST_1240: 成功找到键盘按钮');

        console.info('TEST_1240: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1240: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1240: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1240: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1240');
        await Utils.sleep(1000);

        console.info('TEST_1240: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1240: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1240: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1250
     * @tc.name   : Toast alignment TopEnd with bottom 80, position unchanged test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1250', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid25');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1250: 开始查找Toast按钮 (toastButton_25)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_25'), 1000);
        console.info('TEST_1250: 成功找到Toast按钮');

        console.info('TEST_1250: 开始查找键盘按钮 (keyboardButton_25)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_25'), 1000);
        console.info('TEST_1250: 成功找到键盘按钮');

        console.info('TEST_1250: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1250: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1250: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1250: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1250');
        await Utils.sleep(1000);

        console.info('TEST_1250: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1250: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1250: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1260
     * @tc.name   : Toast alignment TopStart with bottom 80, position unchanged test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1260', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid26');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1260: 开始查找Toast按钮 (toastButton_26)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_26'), 1000);
        console.info('TEST_1260: 成功找到Toast按钮');

        console.info('TEST_1260: 开始查找键盘按钮 (keyboardButton_26)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_26'), 1000);
        console.info('TEST_1260: 成功找到键盘按钮');

        console.info('TEST_1260: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1260: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1260: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1260: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1260');
        await Utils.sleep(1000);

        console.info('TEST_1260: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1260: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1260: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1270
     * @tc.name   : Toast alignment Top with bottom 80, position unchanged test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1270', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid27');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1270: 开始查找Toast按钮 (toastButton_27)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_27'), 1000);
        console.info('TEST_1270: 成功找到Toast按钮');

        console.info('TEST_1270: 开始查找键盘按钮 (keyboardButton_27)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_27'), 1000);
        console.info('TEST_1270: 成功找到键盘按钮');

        console.info('TEST_1270: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1270: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1270: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1270: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1270');
        await Utils.sleep(1000);

        console.info('TEST_1270: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1270: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1270: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1280
     * @tc.name   : Toast bottom value adjustment, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1280', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid28');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1280: 开始查找Toast按钮 (toastButton_28)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_28'), 1000);
        console.info('TEST_1280: 成功找到Toast按钮');

        console.info('TEST_1280: 开始查找键盘按钮 (keyboardButton_28)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_28'), 1000);
        console.info('TEST_1280: 成功找到键盘按钮');

        console.info('TEST_1280: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1280: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1280: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1280: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1280');
        await Utils.sleep(1000);

        console.info('TEST_1280: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1280: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1280: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1290
     * @tc.name   : Toast bottom value adjustment, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1290', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid29');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1290: 开始查找Toast按钮 (toastButton_29)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_29'), 1000);
        console.info('TEST_1290: 成功找到Toast按钮');

        console.info('TEST_1290: 开始查找键盘按钮 (keyboardButton_29)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_29'), 1000);
        console.info('TEST_1290: 成功找到键盘按钮');

        console.info('TEST_1290: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1290: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1290: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1290: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1290');
        await Utils.sleep(1000);

        console.info('TEST_1290: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1290: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1290: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1300
     * @tc.name   : Toast topMost mode light/dark theme test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1300', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid30');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1300: 开始查找Toast按钮 (toastButton_30)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_30'), 1000);
        console.info('TEST_1300: 成功找到Toast按钮');

        console.info('TEST_1300: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1300: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1300');
        await Utils.sleep(1000);

        console.info('TEST_1300: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1300: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1300: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1310
     * @tc.name   : Toast alignment BottomEnd with bottom 80, screen rotation test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1310', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid31');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1310: 开始查找Toast按钮 (toastButton_31)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_31'), 1000);
        console.info('TEST_1310: 成功找到Toast按钮');

        console.info('TEST_1310: 开始查找键盘按钮 (keyboardButton_31)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_31'), 1000);
        console.info('TEST_1310: 成功找到键盘按钮');

        console.info('TEST_1310: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1310: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1310: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1310: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1310');
        await Utils.sleep(1000);

        console.info('TEST_1310: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1310: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1310: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1320
     * @tc.name   : Toast default mode background/foreground switching test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1320', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid32');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1320: 开始查找Toast按钮 (toastButton_32)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_32'), 1000);
        console.info('TEST_1320: 成功找到Toast按钮');

        console.info('TEST_1320: 开始查找键盘按钮 (keyboardButton_32)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_32'), 1000);
        console.info('TEST_1320: 成功找到键盘按钮');

        console.info('TEST_1320: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1320: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1320: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1320: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1320');
        await Utils.sleep(1000);

        console.info('TEST_1320: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1320: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1320: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1330
     * @tc.name   : Toast default mode screen on/off test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1330', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid33');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1330: 开始查找Toast按钮 (toastButton_33)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_33'), 1000);
        console.info('TEST_1330: 成功找到Toast按钮');

        console.info('TEST_1330: 开始查找键盘按钮 (keyboardButton_33)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_33'), 1000);
        console.info('TEST_1330: 成功找到键盘按钮');

        console.info('TEST_1330: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1330: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1330: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1330: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1330');
        await Utils.sleep(1000);

        console.info('TEST_1330: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1330: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1330: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1340
     * @tc.name   : Toast topMost mode background/foreground switching test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1340', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid34');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1340: 开始查找Toast按钮 (toastButton_34)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_34'), 1000);
        console.info('TEST_1340: 成功找到Toast按钮');

        console.info('TEST_1340: 开始查找键盘按钮 (keyboardButton_34)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_34'), 1000);
        console.info('TEST_1340: 成功找到键盘按钮');

        console.info('TEST_1340: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1340: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1340: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1340: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1340');
        await Utils.sleep(1000);

        console.info('TEST_1340: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1340: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1340: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1350
     * @tc.name   : Toast topMost mode screen on/off test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1350', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid35');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1350: 开始查找Toast按钮 (toastButton_35)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_35'), 1000);
        console.info('TEST_1350: 成功找到Toast按钮');

        console.info('TEST_1350: 开始查找键盘按钮 (keyboardButton_35)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_35'), 1000);
        console.info('TEST_1350: 成功找到键盘按钮');

        console.info('TEST_1350: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1350: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1350: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1350: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1350');
        await Utils.sleep(1000);

        console.info('TEST_1350: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1350: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1350: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1360
     * @tc.name   : Toast frequent popup test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1360', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid36');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1360: 开始查找Toast按钮 (toastButton_36)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_36'), 1000);
        console.info('TEST_1360: 成功找到Toast按钮');

        console.info('TEST_1360: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1360: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1360');
        await Utils.sleep(1000);

        console.info('TEST_1360: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1360: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1360: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1370
     * @tc.name   : Toast default mode keyboard first then toast test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1370', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid37');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1370: 开始查找Toast按钮 (toastButton_37)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_37'), 1000);
        console.info('TEST_1370: 成功找到Toast按钮');

        console.info('TEST_1370: 开始查找键盘按钮 (keyboardButton_37)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_37'), 1000);
        console.info('TEST_1370: 成功找到键盘按钮');

        console.info('TEST_1370: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1370: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1370: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1370: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1370');
        await Utils.sleep(1000);

        console.info('TEST_1370: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1370: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1370: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1380
     * @tc.name   : Toast default mode keyboard first then toast test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1380', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid38');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1380: 开始查找Toast按钮 (toastButton_38)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_38'), 1000);
        console.info('TEST_1380: 成功找到Toast按钮');

        console.info('TEST_1380: 开始查找键盘按钮 (keyboardButton_38)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_38'), 1000);
        console.info('TEST_1380: 成功找到键盘按钮');

        console.info('TEST_1380: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1380: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1380: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1380: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1380');
        await Utils.sleep(1000);

        console.info('TEST_1380: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1380: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1380: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1390
     * @tc.name   : Toast default mode delayed popup test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1390', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid39');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1390: 开始查找Toast按钮 (toastButton_39)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_39'), 1000);
        console.info('TEST_1390: 成功找到Toast按钮');

        console.info('TEST_1390: 开始查找键盘按钮 (keyboardButton_39)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_39'), 1000);
        console.info('TEST_1390: 成功找到键盘按钮');

        console.info('TEST_1390: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1390: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1390: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1390: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1390');
        await Utils.sleep(1000);

        console.info('TEST_1390: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1390: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1390: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1400
     * @tc.name   : Toast topMost mode keyboard first then toast test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1400', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid40');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1400: 开始查找Toast按钮 (toastButton_40)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_40'), 1000);
        console.info('TEST_1400: 成功找到Toast按钮');

        console.info('TEST_1400: 开始查找键盘按钮 (keyboardButton_40)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_40'), 1000);
        console.info('TEST_1400: 成功找到键盘按钮');

        console.info('TEST_1400: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1400: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1400: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1400: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1400');
        await Utils.sleep(1000);

        console.info('TEST_1400: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1400: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1400: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1410
     * @tc.name   : Toast topMost mode keyboard first then toast test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1410', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid41');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1410: 开始查找Toast按钮 (toastButton_41)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_41'), 1000);
        console.info('TEST_1410: 成功找到Toast按钮');

        console.info('TEST_1410: 开始查找键盘按钮 (keyboardButton_41)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_41'), 1000);
        console.info('TEST_1410: 成功找到键盘按钮');

        console.info('TEST_1410: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1410: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1410: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1410: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1410');
        await Utils.sleep(1000);

        console.info('TEST_1410: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1410: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1410: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1420
     * @tc.name   : Toast topMost mode delayed popup test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1420', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid42');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1420: 开始查找Toast按钮 (toastButton_42)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_42'), 1000);
        console.info('TEST_1420: 成功找到Toast按钮');

        console.info('TEST_1420: 开始查找键盘按钮 (keyboardButton_42)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_42'), 1000);
        console.info('TEST_1420: 成功找到键盘按钮');

        console.info('TEST_1420: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1420: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1420: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1420: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1420');
        await Utils.sleep(1000);

        console.info('TEST_1420: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1420: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1420: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1430
     * @tc.name   : Toast privacy mode test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1430', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid43');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1430: 开始查找Toast按钮 (toastButton_43)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_43'), 1000);
        console.info('TEST_1430: 成功找到Toast按钮');

        console.info('TEST_1430: 开始查找键盘按钮 (keyboardButton_43)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_43'), 1000);
        console.info('TEST_1430: 成功找到键盘按钮');

        console.info('TEST_1430: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1430: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1430: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1430: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1430');
        await Utils.sleep(1000);

        console.info('TEST_1430: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1430: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1430: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1440
     * @tc.name   : Toast topMost privacy mode test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1440', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid44');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1440: 开始查找Toast按钮 (toastButton_44)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_44'), 1000);
        console.info('TEST_1440: 成功找到Toast按钮');

        console.info('TEST_1440: 开始查找键盘按钮 (keyboardButton_44)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_44'), 1000);
        console.info('TEST_1440: 成功找到键盘按钮');

        console.info('TEST_1440: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1440: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1440: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1440: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1440');
        await Utils.sleep(1000);

        console.info('TEST_1440: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1440: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1440: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0900
     * @tc.name   : Toast alignment BottomEnd with bottom 80, screen rotation test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0900', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid45');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0900: 开始查找Toast按钮 (toastButton_45)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_45'), 1000);
        console.info('TEST_0900: 成功找到Toast按钮');

        console.info('TEST_0900: 开始查找键盘按钮 (keyboardButton_45)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_45'), 1000);
        console.info('TEST_0900: 成功找到键盘按钮');

        console.info('TEST_0900: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_0900: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0900: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_0900: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0900');
        await Utils.sleep(1000);

        console.info('TEST_0900: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0900: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0900: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0910
     * @tc.name   : Toast alignment BottomEnd with bottom 80, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0910', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid46');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0910: 开始查找Toast按钮 (toastButton_46)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_46'), 1000);
        console.info('TEST_0910: 成功找到Toast按钮');

        console.info('TEST_0910: 开始查找键盘按钮 (keyboardButton_46)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_46'), 1000);
        console.info('TEST_0910: 成功找到键盘按钮');

        console.info('TEST_0910: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_0910: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0910: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_0910: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0910');
        await Utils.sleep(1000);

        console.info('TEST_0910: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0910: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0910: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0920
     * @tc.name   : Toast alignment BottomStart with bottom 80, delayed popup test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0920', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid47');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0920: 开始查找Toast按钮 (toastButton_47)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_47'), 1000);
        console.info('TEST_0920: 成功找到Toast按钮');

        console.info('TEST_0920: 开始查找键盘按钮 (keyboardButton_47)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_47'), 1000);
        console.info('TEST_0920: 成功找到键盘按钮');

        console.info('TEST_0920: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_0920: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0920: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_0920: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0920');
        await Utils.sleep(1000);

        console.info('TEST_0920: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0920: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0920: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0930
     * @tc.name   : Toast alignment BottomStart with bottom 80, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0930', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid48');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0930: 开始查找Toast按钮 (toastButton_48)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_48'), 1000);
        console.info('TEST_0930: 成功找到Toast按钮');

        console.info('TEST_0930: 开始查找键盘按钮 (keyboardButton_48)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_48'), 1000);
        console.info('TEST_0930: 成功找到键盘按钮');

        console.info('TEST_0930: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_0930: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0930: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_0930: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0930');
        await Utils.sleep(1000);

        console.info('TEST_0930: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0930: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0930: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0940
     * @tc.name   : Toast alignment Bottom with bottom 80, keyboard first then toast test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0940', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid49');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0940: 开始查找Toast按钮 (toastButton_49)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_49'), 1000);
        console.info('TEST_0940: 成功找到Toast按钮');

        console.info('TEST_0940: 开始查找键盘按钮 (keyboardButton_49)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_49'), 1000);
        console.info('TEST_0940: 成功找到键盘按钮');

        console.info('TEST_0940: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_0940: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0940: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_0940: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0940');
        await Utils.sleep(1000);

        console.info('TEST_0940: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0940: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0940: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0950
     * @tc.name   : Toast alignment Bottom with bottom 80, keyboard avoidance test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0950', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid50');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0950: 开始查找Toast按钮 (toastButton_50)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_50'), 1000);
        console.info('TEST_0950: 成功找到Toast按钮');

        console.info('TEST_0950: 开始查找键盘按钮 (keyboardButton_50)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_50'), 1000);
        console.info('TEST_0950: 成功找到键盘按钮');

        console.info('TEST_0950: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_0950: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0950: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_0950: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0950');
        await Utils.sleep(1000);

        console.info('TEST_0950: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0950: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0950: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0960
     * @tc.name   : Toast alignment End with bottom 80, position unchanged test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0960', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid51');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0960: 开始查找Toast按钮 (toastButton_51)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_51'), 1000);
        console.info('TEST_0960: 成功找到Toast按钮');

        console.info('TEST_0960: 开始查找键盘按钮 (keyboardButton_51)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_51'), 1000);
        console.info('TEST_0960: 成功找到键盘按钮');

        console.info('TEST_0960: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_0960: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0960: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_0960: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0960');
        await Utils.sleep(1000);

        console.info('TEST_0960: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0960: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0960: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0970
     * @tc.name   : Toast alignment Start with bottom 80, position unchanged test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0970', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid52');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0970: 开始查找Toast按钮 (toastButton_52)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_52'), 1000);
        console.info('TEST_0970: 成功找到Toast按钮');

        console.info('TEST_0970: 开始查找键盘按钮 (keyboardButton_52)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_52'), 1000);
        console.info('TEST_0970: 成功找到键盘按钮');

        console.info('TEST_0970: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_0970: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0970: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_0970: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0970');
        await Utils.sleep(1000);

        console.info('TEST_0970: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0970: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0970: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0980
     * @tc.name   : Toast alignment Center with bottom 80, position unchanged test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0980', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid53');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0980: 开始查找Toast按钮 (toastButton_53)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_53'), 1000);
        console.info('TEST_0980: 成功找到Toast按钮');

        console.info('TEST_0980: 开始查找键盘按钮 (keyboardButton_53)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_53'), 1000);
        console.info('TEST_0980: 成功找到键盘按钮');

        console.info('TEST_0980: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_0980: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0980: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_0980: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0980');
        await Utils.sleep(1000);

        console.info('TEST_0980: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0980: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0980: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0990
     * @tc.name   : Toast alignment TopEnd with bottom 80, position unchanged test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0990', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid54');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0990: 开始查找Toast按钮 (toastButton_54)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_54'), 1000);
        console.info('TEST_0990: 成功找到Toast按钮');

        console.info('TEST_0990: 开始查找键盘按钮 (keyboardButton_54)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_54'), 1000);
        console.info('TEST_0990: 成功找到键盘按钮');

        console.info('TEST_0990: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_0990: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0990: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_0990: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0990');
        await Utils.sleep(1000);

        console.info('TEST_0990: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0990: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0990: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1000
     * @tc.name   : Toast alignment TopStart with bottom 80, position unchanged test
     * @tc.desc   : Verify popupbox prompt toastavoid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1000', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/toast_promptAction/toastAvoid55');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1000: 开始查找Toast按钮 (toastButton_55)');
        let toastButton: Component = await driver.waitForComponent(ON.id('toastButton_55'), 1000);
        console.info('TEST_1000: 成功找到Toast按钮');

        console.info('TEST_1000: 开始查找键盘按钮 (keyboardButton_55)');
        let keyboardButton: Component = await driver.waitForComponent(ON.id('keyboardButton_55'), 1000);
        console.info('TEST_1000: 成功找到键盘按钮');

        console.info('TEST_1000: 开始点击Toast按钮');
        await toastButton.click();
        console.info('TEST_1000: Toast按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_1000: 开始点击键盘按钮');
        await keyboardButton.click();
        console.info('TEST_1000: 键盘按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1000');
        await Utils.sleep(1000);

        console.info('TEST_1000: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1000: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1000: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

  })
}