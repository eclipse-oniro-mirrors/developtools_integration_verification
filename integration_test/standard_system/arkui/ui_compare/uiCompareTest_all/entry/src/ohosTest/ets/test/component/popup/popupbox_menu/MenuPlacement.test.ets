/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';
import { Driver, ON, Component } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function menuPlacementTest() {
  describe('menuPlacementTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
      }
      Settings.windowClass.destroyWindow((err: BusinessError) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`);
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      });
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0720
     * @tc.name   : Menu placement BottomRight with width 48vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0720', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement01');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0720: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_01'), 1000);
        console.info('TEST_0720: 成功找到Button组件');

        console.info('TEST_0720: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0720: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0720');
        await Utils.sleep(1000);

        console.info('TEST_0720: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0720: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0720: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0500
     * @tc.name   : Menu placement Right without width
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0500', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement02');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0500: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_02'), 1000);
        console.info('TEST_0500: 成功找到Button组件');

        console.info('TEST_0500: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0500: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0500');
        await Utils.sleep(1000);

        console.info('TEST_0500: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0500: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0500: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0750
     * @tc.name   : Menu placement RightTop with width 100vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0750', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement03');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0750: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_03'), 1000);
        console.info('TEST_0750: 成功找到Button组件');

        console.info('TEST_0750: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0750: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0750');
        await Utils.sleep(1000);

        console.info('TEST_0750: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0750: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0750: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0600
     * @tc.name   : Menu placement TopLeft with width 48vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0600', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement04');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0600: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_04'), 1000);
        console.info('TEST_0600: 成功找到Button组件');

        console.info('TEST_0600: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0600: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0600');
        await Utils.sleep(1000);

        console.info('TEST_0600: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0600: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0600: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0550
     * @tc.name   : Menu placement Bottom with width 100vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0550', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement05');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0550: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_05'), 1000);
        console.info('TEST_0550: 成功找到Button组件');

        console.info('TEST_0550: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0550: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0550');
        await Utils.sleep(1000);

        console.info('TEST_0550: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0550: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0550: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0480
     * @tc.name   : Menu placement Right with width 48vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0480', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement06');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0480: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_06'), 1000);
        console.info('TEST_0480: 成功找到Button组件');

        console.info('TEST_0480: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0480: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0480');
        await Utils.sleep(1000);

        console.info('TEST_0480: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0480: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0480: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0470
     * @tc.name   : Menu placement Right with width 100vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0470', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement07');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0470: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_07'), 1000);
        console.info('TEST_0470: 成功找到Button组件');

        console.info('TEST_0470: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0470: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0470');
        await Utils.sleep(1000);

        console.info('TEST_0470: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0470: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0470: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0760
     * @tc.name   : Menu placement RightTop with width 48vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0760', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement08');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0760: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_08'), 1000);
        console.info('TEST_0760: 成功找到Button组件');

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0760');
        await Utils.sleep(1000);

        console.info('TEST_0760: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0760: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0760: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1770
     * @tc.name   : Menu with submenu placement BottomLeft
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1770', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement09');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1770: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_09'), 1000);
        console.info('TEST_1770: 成功找到Button组件');

        console.info('TEST_1770: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_1770: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1770');
        await Utils.sleep(1000);

        console.info('TEST_1770: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1770: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1770: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0610
     * @tc.name   : Menu placement TopLeft with width 64vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0610', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement10');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0610: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_10'), 1000);
        console.info('TEST_0610: 成功找到Button组件');

        console.info('TEST_0610: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0610: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0610');
        await Utils.sleep(1000);

        console.info('TEST_0610: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0610: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0610: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0810
     * @tc.name   : Menu placement RightBottom with width 64vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0810', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement11');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0810: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_11'), 1000);
        console.info('TEST_0810: 成功找到Button组件');

        console.info('TEST_0810: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0810: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0810');
        await Utils.sleep(1000);

        console.info('TEST_0810: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0810: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0810: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0670
     * @tc.name   : Menu placement BottomLeft with width 100vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0670', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement12');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0670: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_12'), 1000);
        console.info('TEST_0670: 成功找到Button组件');

        console.info('TEST_0670: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0670: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0670');
        await Utils.sleep(1000);

        console.info('TEST_0670: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0670: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0670: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0690
     * @tc.name   : Menu placement BottomLeft with width 64vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0690', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement13');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0690: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_13'), 1000);
        console.info('TEST_0690: 成功找到Button组件');

        console.info('TEST_0690: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0690: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0690');
        await Utils.sleep(1000);

        console.info('TEST_0690: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0690: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0690: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0580
     * @tc.name   : Menu placement Bottom without width
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0580', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement14');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0580: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_14'), 1000);
        console.info('TEST_0580: 成功找到Button组件');

        console.info('TEST_0580: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0580: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0580');
        await Utils.sleep(1000);

        console.info('TEST_0580: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0580: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0580: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0780
     * @tc.name   : Menu placement RightTop without width
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0780', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement15');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0780: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_15'), 1000);
        console.info('TEST_0780: 成功找到Button组件');

        console.info('TEST_0780: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0780: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0780');
        await Utils.sleep(1000);

        console.info('TEST_0780: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0780: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0780: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0850
     * @tc.name   : Menu placement Bottom without placement setting
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0850', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement16');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0850: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_16'), 1000);
        console.info('TEST_0850: 成功找到Button组件');

        console.info('TEST_0850: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0850: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0850');
        await Utils.sleep(1000);

        console.info('TEST_0850: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0850: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0850: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0820
     * @tc.name   : Menu placement RightBottom without width
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0820', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement17');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0820: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_17'), 1000);
        console.info('TEST_0820: 成功找到Button组件');

        console.info('TEST_0820: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0820: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0820');
        await Utils.sleep(1000);

        console.info('TEST_0820: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0820: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0820: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1750
     * @tc.name   : Menu with submenu placement BottomLeft (LongPress)
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1750', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement18');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1750: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_18'), 1000);
        console.info('TEST_1750: 成功找到Button组件');

        console.info('TEST_1750: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_1750: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1750');
        await Utils.sleep(1000);

        console.info('TEST_1750: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1750: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1750: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1780
     * @tc.name   : Menu with submenu placement BottomLeft (RightClick)
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1780', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement19');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1780: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_19'), 1000);
        console.info('TEST_1780: 成功找到Button组件');

        console.info('TEST_1780: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_1780: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1780');
        await Utils.sleep(1000);

        console.info('TEST_1780: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1780: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1780: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0620
     * @tc.name   : Menu placement TopLeft without width
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0620', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement20');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0620: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_20'), 1000);
        console.info('TEST_0620: 成功找到Button组件');

        console.info('TEST_0620: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0620: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0620');
        await Utils.sleep(1000);

        console.info('TEST_0620: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0620: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0620: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0660
     * @tc.name   : Menu placement TopRight without width
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0660', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement21');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0660: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_21'), 1000);
        console.info('TEST_0660: 成功找到Button组件');

        console.info('TEST_0660: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0660: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0660');
        await Utils.sleep(1000);

        console.info('TEST_0660: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0660: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0660: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0520
     * @tc.name   : Menu placement Top with width 48vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0520', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement22');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0520: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_22'), 1000);
        console.info('TEST_0520: 成功找到Button组件');

        console.info('TEST_0520: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0520: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0520');
        await Utils.sleep(1000);

        console.info('TEST_0520: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0520: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0520: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0680
     * @tc.name   : Menu placement BottomLeft with width 48vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0680', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement23');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0680: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_23'), 1000);
        console.info('TEST_0680: 成功找到Button组件');

        console.info('TEST_0680: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0680: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0680');
        await Utils.sleep(1000);

        console.info('TEST_0680: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0680: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0680: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0640
     * @tc.name   : Menu placement TopRight with width 100vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0640', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement24');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0640: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_24'), 1000);
        console.info('TEST_0640: 成功找到Button组件');

        console.info('TEST_0640: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0640: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0640');
        await Utils.sleep(1000);

        console.info('TEST_0640: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0640: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0640: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0770
     * @tc.name   : Menu placement RightTop with width 64vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0770', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement25');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0770: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_25'), 1000);
        console.info('TEST_0770: 成功找到Button组件');

        console.info('TEST_0770: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0770: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0770');
        await Utils.sleep(1000);

        console.info('TEST_0770: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0770: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0770: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0650
     * @tc.name   : Menu placement TopRight with width 64vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0650', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement26');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0650: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_26'), 1000);
        console.info('TEST_0650: 成功找到Button组件');

        console.info('TEST_0650: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0650: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0650');
        await Utils.sleep(1000);

        console.info('TEST_0650: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0650: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0650: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0740
     * @tc.name   : Menu placement BottomRight without width
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0740', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement27');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0740: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_27'), 1000);
        console.info('TEST_0740: 成功找到Button组件');

        console.info('TEST_0740: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0740: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0740');
        await Utils.sleep(1000);

        console.info('TEST_0740: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0740: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0740: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0710
     * @tc.name   : Menu placement BottomRight with width 100vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0710', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement28');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0710: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_28'), 1000);
        console.info('TEST_0710: 成功找到Button组件');

        console.info('TEST_0710: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0710: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0710');
        await Utils.sleep(1000);

        console.info('TEST_0710: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0710: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0710: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1790
     * @tc.name   : Menu with submenu placement BottomLeft (RightClick)
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1790', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement29');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1790: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_29'), 1000);
        console.info('TEST_1790: 成功找到Button组件');

        console.info('TEST_1790: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_1790: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1790');
        await Utils.sleep(1000);

        console.info('TEST_1790: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1790: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1790: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1740
     * @tc.name   : Menu with submenu placement BottomLeft (LongPress)
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1740', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement30');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1740: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_30'), 1000);
        console.info('TEST_1740: 成功找到Button组件');

        console.info('TEST_1740: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_1740: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1740');
        await Utils.sleep(1000);

        console.info('TEST_1740: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1740: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1740: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0730
     * @tc.name   : Menu placement BottomRight with width 64vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0730', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement31');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0730: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_31'), 1000);
        console.info('TEST_0730: 成功找到Button组件');

        console.info('TEST_0730: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0730: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0730');
        await Utils.sleep(1000);

        console.info('TEST_0730: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0730: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0730: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0700
     * @tc.name   : Menu placement BottomLeft without width
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0700', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement32');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0700: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_32'), 1000);
        console.info('TEST_0700: 成功找到Button组件');

        console.info('TEST_0700: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0700: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0700');
        await Utils.sleep(1000);

        console.info('TEST_0700: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0700: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0700: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0830
     * @tc.name   : Menu placement RightBottom with width 100vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0830', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement33');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0830: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_33'), 1000);
        console.info('TEST_0830: 成功找到Button组件');

        console.info('TEST_0830: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0830: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0830');
        await Utils.sleep(1000);

        console.info('TEST_0830: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0830: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0830: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0570
     * @tc.name   : Menu placement Bottom with width 64vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0570', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement34');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0570: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_34'), 1000);
        console.info('TEST_0570: 成功找到Button组件');

        console.info('TEST_0570: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0570: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0570');
        await Utils.sleep(1000);

        console.info('TEST_0570: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0570: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0570: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0590
     * @tc.name   : Menu placement TopLeft with width 100vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0590', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement35');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0590: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_35'), 1000);
        console.info('TEST_0590: 成功找到Button组件');

        console.info('TEST_0590: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0590: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0590');
        await Utils.sleep(1000);

        console.info('TEST_0590: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0590: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0590: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0530
     * @tc.name   : Menu placement Top with width 64vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0530', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement36');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0530: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_36'), 1000);
        console.info('TEST_0530: 成功找到Button组件');

        console.info('TEST_0530: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0530: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0530');
        await Utils.sleep(1000);

        console.info('TEST_0530: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0530: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0530: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0540
     * @tc.name   : Menu placement Top without width
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0540', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement37');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0540: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_37'), 1000);
        console.info('TEST_0540: 成功找到Button组件');

        console.info('TEST_0540: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0540: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0540');
        await Utils.sleep(1000);

        console.info('TEST_0540: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0540: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0540: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0840
     * @tc.name   : Menu placement RightBottom with width 48vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0840', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement38');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0840: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_38'), 1000);
        console.info('TEST_0840: 成功找到Button组件');

        console.info('TEST_0840: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0840: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0840');
        await Utils.sleep(1000);

        console.info('TEST_0840: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0840: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0840: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0790
     * @tc.name   : Menu placement RightBottom with width 100vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0790', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement39');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0790: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_39'), 1000);
        console.info('TEST_0790: 成功找到Button组件');

        console.info('TEST_0790: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0790: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0790');
        await Utils.sleep(1000);

        console.info('TEST_0790: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0790: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0790: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1760
     * @tc.name   : Menu with submenu placement BottomLeft (LongPress)
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1760', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement40');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1760: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_40'), 1000);
        console.info('TEST_1760: 成功找到Button组件');

        console.info('TEST_1760: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_1760: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_1760');
        await Utils.sleep(1000);

        console.info('TEST_1760: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1760: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1760: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0860
     * @tc.name   : Menu placement BottomRight with width 100vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0860', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement41');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0860: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_41'), 1000);
        console.info('TEST_0860: 成功找到Button组件');

        console.info('TEST_0860: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0860: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0860');
        await Utils.sleep(1000);

        console.info('TEST_0860: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0860: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0860: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0560
     * @tc.name   : Menu placement Bottom with width 100vp
     * @tc.desc   : Verify popupbox menu widthandplacementconformux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0560', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuPlacement42');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0560: 开始查找Button组件');
        let buttonComponent: Component = await driver.waitForComponent(ON.id('button_42'), 1000);
        console.info('TEST_0560: 成功找到Button组件');

        console.info('TEST_0560: 开始点击Button组件');
        await buttonComponent.click();
        console.info('TEST_0560: Button组件点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_WIDTHANDPLACEMENTCONFORMUX_0560');
        await Utils.sleep(1000);

        console.info('TEST_0560: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0560: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0560: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });
  });
}