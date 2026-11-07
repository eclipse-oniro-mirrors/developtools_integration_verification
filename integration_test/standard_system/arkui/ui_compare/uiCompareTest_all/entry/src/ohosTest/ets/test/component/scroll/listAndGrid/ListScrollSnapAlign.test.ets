/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default function listScrollSnapAlignTest() {
  describe('listScrollSnapAlignTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0630
     * @tc.name   : List组件ScrollSnapAlign.END测试
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0630', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollSnapAlign01');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0630: 开始查找List组件 (scrollSnapList_01)');
        let list: Component = await driver.waitForComponent(ON.id('scrollSnapList_01'), 1000);
        console.info('TEST_0630: 成功找到List组件');

        console.info('TEST_0630: 开始查找滑动测试按钮 (swipeTestButton_01)');
        let swipeButton: Component = await driver.waitForComponent(ON.id('swipeTestButton_01'), 1000);
        console.info('TEST_0630: 成功找到滑动测试按钮，开始点击');
        await swipeButton.click();
        console.info('TEST_0630: 滑动测试按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0630: 开始执行向下滑动操作');
        let rect = await list.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_0630: 向下滑动操作完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0630');
        await Utils.sleep(1000);

        console.info('TEST_0630: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0630: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0630: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0330
     * @tc.name   : List组件ScrollSnapAlign.NONE测试
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0330', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollSnapAlign02');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0330: 开始查找List组件 (scrollSnapList_02)');
        let list: Component = await driver.waitForComponent(ON.id('scrollSnapList_02'), 1000);
        console.info('TEST_0330: 成功找到List组件');

        console.info('TEST_0330: 开始查找滑动测试按钮 (swipeTestButton_02)');
        let swipeButton: Component = await driver.waitForComponent(ON.id('swipeTestButton_02'), 1000);
        console.info('TEST_0330: 成功找到滑动测试按钮，开始点击');
        await swipeButton.click();
        console.info('TEST_0330: 滑动测试按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0330: 开始执行向下滑动操作');
        let rect = await list.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_0330: 向下滑动操作完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0330');
        await Utils.sleep(1000);

        console.info('TEST_0330: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0330: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0330: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0310
     * @tc.name   : List组件ScrollSnapAlign.CENTER测试
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0310', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollSnapAlign03');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0310: 开始查找List组件 (scrollSnapList_03)');
        let list: Component = await driver.waitForComponent(ON.id('scrollSnapList_03'), 1000);
        console.info('TEST_0310: 成功找到List组件');

        console.info('TEST_0310: 开始查找滑动测试按钮 (swipeTestButton_03)');
        let swipeButton: Component = await driver.waitForComponent(ON.id('swipeTestButton_03'), 1000);
        console.info('TEST_0310: 成功找到滑动测试按钮，开始点击');
        await swipeButton.click();
        console.info('TEST_0310: 滑动测试按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0310: 开始执行向下滑动操作');
        let rect = await list.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_0310: 向下滑动操作完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0310');
        await Utils.sleep(1000);

        console.info('TEST_0310: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0310: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0310: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0620
     * @tc.name   : List组件ScrollSnapAlign.CENTER测试
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0620', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollSnapAlign04');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0620: 开始查找List组件 (scrollSnapList_04)');
        let list: Component = await driver.waitForComponent(ON.id('scrollSnapList_04'), 1000);
        console.info('TEST_0620: 成功找到List组件');

        console.info('TEST_0620: 开始查找滑动测试按钮 (swipeTestButton_04)');
        let swipeButton: Component = await driver.waitForComponent(ON.id('swipeTestButton_04'), 1000);
        console.info('TEST_0620: 成功找到滑动测试按钮，开始点击');
        await swipeButton.click();
        console.info('TEST_0620: 滑动测试按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0620: 开始执行向下滑动操作');
        let rect = await list.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_0620: 向下滑动操作完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0620');
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0640
     * @tc.name   : List组件ScrollSnapAlign.NONE测试
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0640', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollSnapAlign05');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0640: 开始查找List组件 (scrollSnapList_05)');
        let list: Component = await driver.waitForComponent(ON.id('scrollSnapList_05'), 1000);
        console.info('TEST_0640: 成功找到List组件');

        console.info('TEST_0640: 开始查找滑动测试按钮 (swipeTestButton_05)');
        let swipeButton: Component = await driver.waitForComponent(ON.id('swipeTestButton_05'), 1000);
        console.info('TEST_0640: 成功找到滑动测试按钮，开始点击');
        await swipeButton.click();
        console.info('TEST_0640: 滑动测试按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0640: 开始执行向下滑动操作');
        let rect = await list.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_0640: 向下滑动操作完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0640');
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0650
     * @tc.name   : List组件ScrollSnapAlign.START测试
     * @tc.desc   : Verify listandgrid list align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0650', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollSnapAlign06');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0650: 开始查找List组件 (scrollSnapList_06)');
        let list: Component = await driver.waitForComponent(ON.id('scrollSnapList_06'), 1000);
        console.info('TEST_0650: 成功找到List组件');

        console.info('TEST_0650: 开始查找滑动测试按钮 (swipeTestButton_06)');
        let swipeButton: Component = await driver.waitForComponent(ON.id('swipeTestButton_06'), 1000);
        console.info('TEST_0650: 成功找到滑动测试按钮，开始点击');
        await swipeButton.click();
        console.info('TEST_0650: 滑动测试按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0650: 开始执行向下滑动操作');
        let rect = await list.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_0650: 向下滑动操作完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0650');
        await Utils.sleep(1000);

        console.info('TEST_0650: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0650: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0650: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });
  });
}