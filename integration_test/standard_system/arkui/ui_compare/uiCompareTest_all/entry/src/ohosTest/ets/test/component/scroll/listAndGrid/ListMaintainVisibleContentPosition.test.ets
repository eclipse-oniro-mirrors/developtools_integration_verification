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

export default function listMaintainVisibleContentPositionTest() {
  describe('listMaintainVisibleContentPositionTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MAINTAINVISIBLECONTENTPOSITION_0070
     * @tc.name   : List组件maintainVisibleContentPosition设置为true，设置cachedcount测试
     * @tc.desc   : Verify listandgrid list maintainvisiblecontentposition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MAINTAINVISIBLECONTENTPOSITION_0070', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listMaintainVisibleContentPosition01');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0070: 开始查找List组件 (maintainList_01)');
        let list: Component = await driver.waitForComponent(ON.id('maintainList_01'), 1000);
        console.info('TEST_0070: 成功找到List组件');

        console.info('TEST_0070: 开始点击新增上方按钮');
        let addTopButton: Component = await driver.waitForComponent(ON.id('addTopButton_01'), 1000);
        await addTopButton.click();
        console.info('TEST_0070: 新增上方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0070: 开始点击删除上方按钮');
        let deleteTopButton: Component = await driver.waitForComponent(ON.id('deleteTopButton_01'), 1000);
        await deleteTopButton.click();
        console.info('TEST_0070: 删除上方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0070: 开始点击新增下方按钮');
        let addBottomButton: Component = await driver.waitForComponent(ON.id('addBottomButton_01'), 1000);
        await addBottomButton.click();
        console.info('TEST_0070: 新增下方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0070: 开始点击删除下方按钮');
        let deleteBottomButton: Component = await driver.waitForComponent(ON.id('deleteBottomButton_01'), 1000);
        await deleteBottomButton.click();
        console.info('TEST_0070: 删除下方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MAINTAINVISIBLECONTENTPOSITION_0070');
        await Utils.sleep(1000);

        console.info('TEST_0070: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0070: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0070: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MAINTAINVISIBLECONTENTPOSITION_0020
     * @tc.name   : List组件maintainVisibleContentPosition设置为undefined测试
     * @tc.desc   : Verify listandgrid list maintainvisiblecontentposition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MAINTAINVISIBLECONTENTPOSITION_0020', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listMaintainVisibleContentPosition02');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0020: 开始查找List组件 (maintainList_02)');
        let list: Component = await driver.waitForComponent(ON.id('maintainList_02'), 1000);
        console.info('TEST_0020: 成功找到List组件');

        console.info('TEST_0020: 开始点击新增上方按钮');
        let addTopButton: Component = await driver.waitForComponent(ON.id('addTopButton_02'), 1000);
        await addTopButton.click();
        console.info('TEST_0020: 新增上方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0020: 开始点击删除上方按钮');
        let deleteTopButton: Component = await driver.waitForComponent(ON.id('deleteTopButton_02'), 1000);
        await deleteTopButton.click();
        console.info('TEST_0020: 删除上方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0020: 开始点击新增下方按钮');
        let addBottomButton: Component = await driver.waitForComponent(ON.id('addBottomButton_02'), 1000);
        await addBottomButton.click();
        console.info('TEST_0020: 新增下方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0020: 开始点击删除下方按钮');
        let deleteBottomButton: Component = await driver.waitForComponent(ON.id('deleteBottomButton_02'), 1000);
        await deleteBottomButton.click();
        console.info('TEST_0020: 删除下方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MAINTAINVISIBLECONTENTPOSITION_0020');
        await Utils.sleep(1000);

        console.info('TEST_0020: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0020: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0020: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MAINTAINVISIBLECONTENTPOSITION_0060
     * @tc.name   : List组件maintainVisibleContentPosition设置为true，设置cachedcount测试
     * @tc.desc   : Verify listandgrid list maintainvisiblecontentposition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MAINTAINVISIBLECONTENTPOSITION_0060', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listMaintainVisibleContentPosition03');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0060: 开始查找List组件 (maintainList_03)');
        let list: Component = await driver.waitForComponent(ON.id('maintainList_03'), 1000);
        console.info('TEST_0060: 成功找到List组件');

        console.info('TEST_0060: 开始点击新增上方按钮');
        let addTopButton: Component = await driver.waitForComponent(ON.id('addTopButton_03'), 1000);
        await addTopButton.click();
        console.info('TEST_0060: 新增上方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0060: 开始点击删除上方按钮');
        let deleteTopButton: Component = await driver.waitForComponent(ON.id('deleteTopButton_03'), 1000);
        await deleteTopButton.click();
        console.info('TEST_0060: 删除上方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0060: 开始点击新增下方按钮');
        let addBottomButton: Component = await driver.waitForComponent(ON.id('addBottomButton_03'), 1000);
        await addBottomButton.click();
        console.info('TEST_0060: 新增下方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0060: 开始点击删除下方按钮');
        let deleteBottomButton: Component = await driver.waitForComponent(ON.id('deleteBottomButton_03'), 1000);
        await deleteBottomButton.click();
        console.info('TEST_0060: 删除下方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MAINTAINVISIBLECONTENTPOSITION_0060');
        await Utils.sleep(1000);

        console.info('TEST_0060: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0060: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0060: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MAINTAINVISIBLECONTENTPOSITION_0210
     * @tc.name   : List组件maintainVisibleContentPosition设置为true，显示区域上方增删数据测试
     * @tc.desc   : Verify listandgrid list maintainvisiblecontentposition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MAINTAINVISIBLECONTENTPOSITION_0210', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listMaintainVisibleContentPosition04');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0210: 开始查找List组件 (maintainList_04)');
        let list: Component = await driver.waitForComponent(ON.id('maintainList_04'), 1000);
        console.info('TEST_0210: 成功找到List组件');

        console.info('TEST_0210: 开始点击新增上方按钮');
        let addTopButton: Component = await driver.waitForComponent(ON.id('addTopButton_04'), 1000);
        await addTopButton.click();
        console.info('TEST_0210: 新增上方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0210: 开始点击删除上方按钮');
        let deleteTopButton: Component = await driver.waitForComponent(ON.id('deleteTopButton_04'), 1000);
        await deleteTopButton.click();
        console.info('TEST_0210: 删除上方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0210: 开始点击新增下方按钮');
        let addBottomButton: Component = await driver.waitForComponent(ON.id('addBottomButton_04'), 1000);
        await addBottomButton.click();
        console.info('TEST_0210: 新增下方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0210: 开始点击删除下方按钮');
        let deleteBottomButton: Component = await driver.waitForComponent(ON.id('deleteBottomButton_04'), 1000);
        await deleteBottomButton.click();
        console.info('TEST_0210: 删除下方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MAINTAINVISIBLECONTENTPOSITION_0210');
        await Utils.sleep(1000);

        console.info('TEST_0210: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0210: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0210: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MAINTAINVISIBLECONTENTPOSITION_0260
     * @tc.name   : List组件maintainVisibleContentPosition设置为true，显示区域上方增删item，item内信息包括表情包，照片，视频，文字，增删的时候滑动页面测试
     * @tc.desc   : Verify listandgrid list maintainvisiblecontentposition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MAINTAINVISIBLECONTENTPOSITION_0260', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listMaintainVisibleContentPosition05');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0260: 开始查找List组件 (maintainList_05)');
        let list: Component = await driver.waitForComponent(ON.id('maintainList_05'), 1000);
        console.info('TEST_0260: 成功找到List组件');

        console.info('TEST_0260: 开始点击新增上方按钮');
        let addTopButton: Component = await driver.waitForComponent(ON.id('addTopButton_05'), 1000);
        await addTopButton.click();
        console.info('TEST_0260: 新增上方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0260: 开始滑动List');
        let rect = await list.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_0260: List滑动完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0260: 开始点击删除上方按钮');
        let deleteTopButton: Component = await driver.waitForComponent(ON.id('deleteTopButton_05'), 1000);
        await deleteTopButton.click();
        console.info('TEST_0260: 删除上方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0260: 开始点击新增下方按钮');
        let addBottomButton: Component = await driver.waitForComponent(ON.id('addBottomButton_05'), 1000);
        await addBottomButton.click();
        console.info('TEST_0260: 新增下方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_0260: 开始点击删除下方按钮');
        let deleteBottomButton: Component = await driver.waitForComponent(ON.id('deleteBottomButton_05'), 1000);
        await deleteBottomButton.click();
        console.info('TEST_0260: 删除下方按钮点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MAINTAINVISIBLECONTENTPOSITION_0260');
        await Utils.sleep(1000);

        console.info('TEST_0260: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0260: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0260: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });
  });
}