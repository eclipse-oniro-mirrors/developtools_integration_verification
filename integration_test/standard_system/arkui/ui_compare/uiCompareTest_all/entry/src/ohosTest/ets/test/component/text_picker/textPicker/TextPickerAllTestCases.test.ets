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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';
import { Driver, ON, Component } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function textPickerAllTestCases() {
  describe('textPickerAllTestCases', () => {
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
     * @tc.number : TestCase_07f07b14baf24fafa7a4743b3b6d6c3b
     * @tc.name   : string[]
     * @tc.desc   : Verify the interface under test: string[].
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_07f07b14baf24fafa7a4743b3b6d6c3b', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase01');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_07f07b14baf24fafa7a4743b3b6d6c3b: 开始查找TextPicker组件 (textPicker_01)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_01'), 1000);
        console.info('TEST_07f07b14baf24fafa7a4743b3b6d6c3b: 成功找到TextPicker组件');

        console.info('TEST_07f07b14baf24fafa7a4743b3b6d6c3b: 开始向下滑动TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_07f07b14baf24fafa7a4743b3b6d6c3b: TextPicker向下滑动完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_07f07b14baf24fafa7a4743b3b6d6c3b');
        await Utils.sleep(1000);

        console.info('TEST_07f07b14baf24fafa7a4743b3b6d6c3b: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_07f07b14baf24fafa7a4743b3b6d6c3b: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_07f07b14baf24fafa7a4743b3b6d6c3b: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_14b87831670c4785be8ba178c20729bd
     * @tc.name   : 多列TextPicker向下抛滑测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_14b87831670c4785be8ba178c20729bd', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase02');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_14b87831670c4785be8ba178c20729bd: 开始查找TextPicker组件 (textPicker_02)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_02'), 1000);
        console.info('TEST_14b87831670c4785be8ba178c20729bd: 成功找到TextPicker组件');

        console.info('TEST_14b87831670c4785be8ba178c20729bd: 开始向下抛滑TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.1;
        await driver.swipe(centerX, startY, centerX, endY, 500);
        console.info('TEST_14b87831670c4785be8ba178c20729bd: TextPicker向下抛滑完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_14b87831670c4785be8ba178c20729bd');
        await Utils.sleep(1000);

        console.info('TEST_14b87831670c4785be8ba178c20729bd: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_14b87831670c4785be8ba178c20729bd: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_14b87831670c4785be8ba178c20729bd: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_17c8e9a5845645029f5c7b91379c3fa9
     * @tc.name   : TextCascadePickerRangeContent[]
     * @tc.desc   : Verify the interface under test: TextCascadePickerRangeContent[].
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_17c8e9a5845645029f5c7b91379c3fa9', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase03');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_17c8e9a5845645029f5c7b91379c3fa9: 开始查找TextPicker组件 (textPicker_03)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_03'), 1000);
        console.info('TEST_17c8e9a5845645029f5c7b91379c3fa9: 成功找到TextPicker组件');

        console.info('TEST_17c8e9a5845645029f5c7b91379c3fa9: 开始点击TextPicker');
        await textPicker.click();
        console.info('TEST_17c8e9a5845645029f5c7b91379c3fa9: TextPicker点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_17c8e9a5845645029f5c7b91379c3fa9');
        await Utils.sleep(1000);

        console.info('TEST_17c8e9a5845645029f5c7b91379c3fa9: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_17c8e9a5845645029f5c7b91379c3fa9: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_17c8e9a5845645029f5c7b91379c3fa9: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_1ea6aaaa59164ca09f779055a5f552bf
     * @tc.name   : string[][]
     * @tc.desc   : Verify the interface under test: string[][].
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_1ea6aaaa59164ca09f779055a5f552bf', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase04');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_1ea6aaaa59164ca09f779055a5f552bf: 开始查找TextPicker组件 (textPicker_04)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_04'), 1000);
        console.info('TEST_1ea6aaaa59164ca09f779055a5f552bf: 成功找到TextPicker组件');

        console.info('TEST_1ea6aaaa59164ca09f779055a5f552bf: 开始向下滑动TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_1ea6aaaa59164ca09f779055a5f552bf: TextPicker向下滑动完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_1ea6aaaa59164ca09f779055a5f552bf');
        await Utils.sleep(1000);

        console.info('TEST_1ea6aaaa59164ca09f779055a5f552bf: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_1ea6aaaa59164ca09f779055a5f552bf: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_1ea6aaaa59164ca09f779055a5f552bf: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_215db3475396420780b9468f6b5ff0b2
     * @tc.name   : 多列TextPicker向上滑动测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_215db3475396420780b9468f6b5ff0b2', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase05');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_215db3475396420780b9468f6b5ff0b2: 开始查找TextPicker组件 (textPicker_05)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_05'), 1000);
        console.info('TEST_215db3475396420780b9468f6b5ff0b2: 成功找到TextPicker组件');

        console.info('TEST_215db3475396420780b9468f6b5ff0b2: 开始向上滑动TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.2;
        let endY = rect.top + height * 0.8;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_215db3475396420780b9468f6b5ff0b2: TextPicker向上滑动完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_215db3475396420780b9468f6b5ff0b2');
        await Utils.sleep(1000);

        console.info('TEST_215db3475396420780b9468f6b5ff0b2: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_215db3475396420780b9468f6b5ff0b2: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_215db3475396420780b9468f6b5ff0b2: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_22ac5a840300445d9e6492a72c6edbe5
     * @tc.name   : 单列TextPicker向下滑动测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_22ac5a840300445d9e6492a72c6edbe5', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase06');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_22ac5a840300445d9e6492a72c6edbe5: 开始查找TextPicker组件 (textPicker_06)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_06'), 1000);
        console.info('TEST_22ac5a840300445d9e6492a72c6edbe5: 成功找到TextPicker组件');

        console.info('TEST_22ac5a840300445d9e6492a72c6edbe5: 开始向下滑动TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_22ac5a840300445d9e6492a72c6edbe5: TextPicker向下滑动完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_22ac5a840300445d9e6492a72c6edbe5');
        await Utils.sleep(1000);

        console.info('TEST_22ac5a840300445d9e6492a72c6edbe5: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_22ac5a840300445d9e6492a72c6edbe5: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_22ac5a840300445d9e6492a72c6edbe5: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_22fa9676bd734062a2f6ee37f58849ea
     * @tc.name   : Resource
     * @tc.desc   : Verify the interface under test: Resource.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_22fa9676bd734062a2f6ee37f58849ea', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase07');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_22fa9676bd734062a2f6ee37f58849ea: 开始查找TextPicker组件 (textPicker_07)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_07'), 1000);
        console.info('TEST_22fa9676bd734062a2f6ee37f58849ea: 成功找到TextPicker组件');

        console.info('TEST_22fa9676bd734062a2f6ee37f58849ea: 开始向上抛滑TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.2;
        let endY = rect.top + height * 0.9;
        await driver.swipe(centerX, startY, centerX, endY, 500);
        console.info('TEST_22fa9676bd734062a2f6ee37f58849ea: TextPicker向上抛滑完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_22fa9676bd734062a2f6ee37f58849ea');
        await Utils.sleep(1000);

        console.info('TEST_22fa9676bd734062a2f6ee37f58849ea: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_22fa9676bd734062a2f6ee37f58849ea: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_22fa9676bd734062a2f6ee37f58849ea: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_25f6417f4ecb434daad92b418b28252d
     * @tc.name   : 多列TextPicker向上滑动测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_25f6417f4ecb434daad92b418b28252d', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase08');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_25f6417f4ecb434daad92b418b28252d: 开始查找TextPicker组件 (textPicker_08)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_08'), 1000);
        console.info('TEST_25f6417f4ecb434daad92b418b28252d: 成功找到TextPicker组件');

        console.info('TEST_25f6417f4ecb434daad92b418b28252d: 开始向上滑动TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.2;
        let endY = rect.top + height * 0.8;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_25f6417f4ecb434daad92b418b28252d: TextPicker向上滑动完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_25f6417f4ecb434daad92b418b28252d');
        await Utils.sleep(1000);

        console.info('TEST_25f6417f4ecb434daad92b418b28252d: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_25f6417f4ecb434daad92b418b28252d: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_25f6417f4ecb434daad92b418b28252d: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_2c8e0c798bf64a19a7390ba337103614
     * @tc.name   : 多列TextPicker更改选中项观察焦点显示测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_2c8e0c798bf64a19a7390ba337103614', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase09');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_2c8e0c798bf64a19a7390ba337103614: 开始查找TextPicker组件 (textPicker_09)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_09'), 1000);
        console.info('TEST_2c8e0c798bf64a19a7390ba337103614: 成功找到TextPicker组件');

        console.info('TEST_2c8e0c798bf64a19a7390ba337103614: 开始点击TextPicker更改选中项');
        await textPicker.click();
        console.info('TEST_2c8e0c798bf64a19a7390ba337103614: TextPicker点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_2c8e0c798bf64a19a7390ba337103614');
        await Utils.sleep(1000);

        console.info('TEST_2c8e0c798bf64a19a7390ba337103614: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_2c8e0c798bf64a19a7390ba337103614: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_2c8e0c798bf64a19a7390ba337103614: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_30039cfa9bbb4c32a4cfe2b27deb5016
     * @tc.name   : 单列TextPicker向上滑动测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_30039cfa9bbb4c32a4cfe2b27deb5016', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase10');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_30039cfa9bbb4c32a4cfe2b27deb5016: 开始查找TextPicker组件 (textPicker_10)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_10'), 1000);
        console.info('TEST_30039cfa9bbb4c32a4cfe2b27deb5016: 成功找到TextPicker组件');

        console.info('TEST_30039cfa9bbb4c32a4cfe2b27deb5016: 开始向上滑动TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.2;
        let endY = rect.top + height * 0.8;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_30039cfa9bbb4c32a4cfe2b27deb5016: TextPicker向上滑动完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_30039cfa9bbb4c32a4cfe2b27deb5016');
        await Utils.sleep(1000);

        console.info('TEST_30039cfa9bbb4c32a4cfe2b27deb5016: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_30039cfa9bbb4c32a4cfe2b27deb5016: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_30039cfa9bbb4c32a4cfe2b27deb5016: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_3432d74b60784c37a3bbd9e7827161e7
     * @tc.name   : string[]
     * @tc.desc   : Verify the interface under test: string[].
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_3432d74b60784c37a3bbd9e7827161e7', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase11');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_3432d74b60784c37a3bbd9e7827161e7: 开始查找TextPicker组件 (textPicker_11)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_11'), 1000);
        console.info('TEST_3432d74b60784c37a3bbd9e7827161e7: 成功找到TextPicker组件');

        console.info('TEST_3432d74b60784c37a3bbd9e7827161e7: 开始点击TextPicker');
        await textPicker.click();
        console.info('TEST_3432d74b60784c37a3bbd9e7827161e7: TextPicker点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_3432d74b60784c37a3bbd9e7827161e7');
        await Utils.sleep(1000);

        console.info('TEST_3432d74b60784c37a3bbd9e7827161e7: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_3432d74b60784c37a3bbd9e7827161e7: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_3432d74b60784c37a3bbd9e7827161e7: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_40339f966de94ef98a5caa6c45385505
     * @tc.name   : 单列TextPicker更改选中项观察焦点显示测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_40339f966de94ef98a5caa6c45385505', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase12');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_40339f966de94ef98a5caa6c45385505: 开始查找TextPicker组件 (textPicker_12)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_12'), 1000);
        console.info('TEST_40339f966de94ef98a5caa6c45385505: 成功找到TextPicker组件');

        console.info('TEST_40339f966de94ef98a5caa6c45385505: 开始点击TextPicker更改选中项');
        await textPicker.click();
        console.info('TEST_40339f966de94ef98a5caa6c45385505: TextPicker点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_40339f966de94ef98a5caa6c45385505');
        await Utils.sleep(1000);

        console.info('TEST_40339f966de94ef98a5caa6c45385505: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_40339f966de94ef98a5caa6c45385505: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_40339f966de94ef98a5caa6c45385505: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_4244b55f14754080985d09058c9f475b
     * @tc.name   : 单列TextPicker更改选中项观察焦点显示测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_4244b55f14754080985d09058c9f475b', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase13');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_4244b55f14754080985d09058c9f475b: 开始查找TextPicker组件 (textPicker_13)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_13'), 1000);
        console.info('TEST_4244b55f14754080985d09058c9f475b: 成功找到TextPicker组件');

        console.info('TEST_4244b55f14754080985d09058c9f475b: 开始点击TextPicker更改选中项');
        await textPicker.click();
        console.info('TEST_4244b55f14754080985d09058c9f475b: TextPicker点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_4244b55f14754080985d09058c9f475b');
        await Utils.sleep(1000);

        console.info('TEST_4244b55f14754080985d09058c9f475b: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_4244b55f14754080985d09058c9f475b: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_4244b55f14754080985d09058c9f475b: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_45a89390e1fa4eda86efda313e14becd
     * @tc.name   : string[][]
     * @tc.desc   : Verify the interface under test: string[][].
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_45a89390e1fa4eda86efda313e14becd', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase14');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_45a89390e1fa4eda86efda313e14becd: 开始查找TextPicker组件 (textPicker_14)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_14'), 1000);
        console.info('TEST_45a89390e1fa4eda86efda313e14becd: 成功找到TextPicker组件');

        console.info('TEST_45a89390e1fa4eda86efda313e14becd: 开始向上抛滑TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.2;
        let endY = rect.top + height * 0.9;
        await driver.swipe(centerX, startY, centerX, endY, 500);
        console.info('TEST_45a89390e1fa4eda86efda313e14becd: TextPicker向上抛滑完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_45a89390e1fa4eda86efda313e14becd');
        await Utils.sleep(1000);

        console.info('TEST_45a89390e1fa4eda86efda313e14becd: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_45a89390e1fa4eda86efda313e14becd: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_45a89390e1fa4eda86efda313e14becd: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_4668573ef865430fb5f52a7f204e3d3d
     * @tc.name   : 多列TextPicker点击下面备选项测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_4668573ef865430fb5f52a7f204e3d3d', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase15');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_4668573ef865430fb5f52a7f204e3d3d: 开始查找TextPicker组件 (textPicker_15)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_15'), 1000);
        console.info('TEST_4668573ef865430fb5f52a7f204e3d3d: 成功找到TextPicker组件');

        console.info('TEST_4668573ef865430fb5f52a7f204e3d3d: 开始点击TextPicker');
        await textPicker.click();
        console.info('TEST_4668573ef865430fb5f52a7f204e3d3d: TextPicker点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_4668573ef865430fb5f52a7f204e3d3d');
        await Utils.sleep(1000);

        console.info('TEST_4668573ef865430fb5f52a7f204e3d3d: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_4668573ef865430fb5f52a7f204e3d3d: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_4668573ef865430fb5f52a7f204e3d3d: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_47f5cf97c3834fda9cfc71b13bce5b35
     * @tc.name   : Resource
     * @tc.desc   : Verify the interface under test: Resource.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_47f5cf97c3834fda9cfc71b13bce5b35', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase16');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_47f5cf97c3834fda9cfc71b13bce5b35: 开始查找TextPicker组件 (textPicker_16)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_16'), 1000);
        console.info('TEST_47f5cf97c3834fda9cfc71b13bce5b35: 成功找到TextPicker组件');

        console.info('TEST_47f5cf97c3834fda9cfc71b13bce5b35: 开始点击TextPicker');
        await textPicker.click();
        console.info('TEST_47f5cf97c3834fda9cfc71b13bce5b35: TextPicker点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_47f5cf97c3834fda9cfc71b13bce5b35');
        await Utils.sleep(1000);

        console.info('TEST_47f5cf97c3834fda9cfc71b13bce5b35: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_47f5cf97c3834fda9cfc71b13bce5b35: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_47f5cf97c3834fda9cfc71b13bce5b35: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_4b69a29e043d49f2826d78cdfa38c301
     * @tc.name   : TextPickerRangeContent[]
     * @tc.desc   : Verify the interface under test: TextPickerRangeContent[].
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_4b69a29e043d49f2826d78cdfa38c301', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase17');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_4b69a29e043d49f2826d78cdfa38c301: 开始查找TextPicker组件 (textPicker_17)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_17'), 1000);
        console.info('TEST_4b69a29e043d49f2826d78cdfa38c301: 成功找到TextPicker组件');

        console.info('TEST_4b69a29e043d49f2826d78cdfa38c301: 开始向上拖动TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.6;
        let endY = rect.top + height * 0.4;
        await driver.swipe(centerX, startY, centerX, endY, 800);
        console.info('TEST_4b69a29e043d49f2826d78cdfa38c301: 向上拖动完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_4b69a29e043d49f2826d78cdfa38c301: 开始向下拖动TextPicker');
        await driver.swipe(centerX, endY, centerX, startY, 800);
        console.info('TEST_4b69a29e043d49f2826d78cdfa38c301: 向下拖动完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_4b69a29e043d49f2826d78cdfa38c301');
        await Utils.sleep(1000);

        console.info('TEST_4b69a29e043d49f2826d78cdfa38c301: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_4b69a29e043d49f2826d78cdfa38c301: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_4b69a29e043d49f2826d78cdfa38c301: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_4f35499a5da34892a348f699a3e53544
     * @tc.name   : 多列TextPicker向上抛滑测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_4f35499a5da34892a348f699a3e53544', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase18');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_4f35499a5da34892a348f699a3e53544: 开始查找TextPicker组件 (textPicker_18)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_18'), 1000);
        console.info('TEST_4f35499a5da34892a348f699a3e53544: 成功找到TextPicker组件');

        console.info('TEST_4f35499a5da34892a348f699a3e53544: 开始向上抛滑TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.2;
        let endY = rect.top + height * 0.9;
        await driver.swipe(centerX, startY, centerX, endY, 500);
        console.info('TEST_4f35499a5da34892a348f699a3e53544: TextPicker向上抛滑完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_4f35499a5da34892a348f699a3e53544');
        await Utils.sleep(1000);

        console.info('TEST_4f35499a5da34892a348f699a3e53544: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_4f35499a5da34892a348f699a3e53544: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_4f35499a5da34892a348f699a3e53544: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_5f255cbe232a4f89bcc64eb7b9bfd7ae
     * @tc.name   : TextCascadePickerRangeContent[]
     * @tc.desc   : Verify the interface under test: TextCascadePickerRangeContent[].
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_5f255cbe232a4f89bcc64eb7b9bfd7ae', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase19');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_5f255cbe232a4f89bcc64eb7b9bfd7ae: 开始查找TextPicker组件 (textPicker_19)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_19'), 1000);
        console.info('TEST_5f255cbe232a4f89bcc64eb7b9bfd7ae: 成功找到TextPicker组件');

        console.info('TEST_5f255cbe232a4f89bcc64eb7b9bfd7ae: 开始向下抛滑TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.1;
        await driver.swipe(centerX, startY, centerX, endY, 500);
        console.info('TEST_5f255cbe232a4f89bcc64eb7b9bfd7ae: TextPicker向下抛滑完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_5f255cbe232a4f89bcc64eb7b9bfd7ae');
        await Utils.sleep(1000);

        console.info('TEST_5f255cbe232a4f89bcc64eb7b9bfd7ae: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_5f255cbe232a4f89bcc64eb7b9bfd7ae: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_5f255cbe232a4f89bcc64eb7b9bfd7ae: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_6798a737e3c44b3ca369132b6d5539a9
     * @tc.name   : string[]
     * @tc.desc   : Verify the interface under test: string[].
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_6798a737e3c44b3ca369132b6d5539a9', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase20');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_6798a737e3c44b3ca369132b6d5539a9: 开始查找TextPicker组件 (textPicker_20)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_20'), 1000);
        console.info('TEST_6798a737e3c44b3ca369132b6d5539a9: 成功找到TextPicker组件');

        console.info('TEST_6798a737e3c44b3ca369132b6d5539a9: 开始点击TextPicker');
        await textPicker.click();
        console.info('TEST_6798a737e3c44b3ca369132b6d5539a9: TextPicker点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_6798a737e3c44b3ca369132b6d5539a9');
        await Utils.sleep(1000);

        console.info('TEST_6798a737e3c44b3ca369132b6d5539a9: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_6798a737e3c44b3ca369132b6d5539a9: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_6798a737e3c44b3ca369132b6d5539a9: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_6e921880c23546b790a4030d143e1cf6
     * @tc.name   : 多列TextPicker点击下面备选项测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_6e921880c23546b790a4030d143e1cf6', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase21');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_6e921880c23546b790a4030d143e1cf6: 开始查找TextPicker组件 (textPicker_21)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_21'), 1000);
        console.info('TEST_6e921880c23546b790a4030d143e1cf6: 成功找到TextPicker组件');

        console.info('TEST_6e921880c23546b790a4030d143e1cf6: 开始点击TextPicker');
        await textPicker.click();
        console.info('TEST_6e921880c23546b790a4030d143e1cf6: TextPicker点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_6e921880c23546b790a4030d143e1cf6');
        await Utils.sleep(1000);

        console.info('TEST_6e921880c23546b790a4030d143e1cf6: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_6e921880c23546b790a4030d143e1cf6: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_6e921880c23546b790a4030d143e1cf6: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_7ff6b29516ae44718a7b2edfe4dc6827
     * @tc.name   : 多列TextPicker向下滑动测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_7ff6b29516ae44718a7b2edfe4dc6827', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase22');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_7ff6b29516ae44718a7b2edfe4dc6827: 开始查找TextPicker组件 (textPicker_22)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_22'), 1000);
        console.info('TEST_7ff6b29516ae44718a7b2edfe4dc6827: 成功找到TextPicker组件');

        console.info('TEST_7ff6b29516ae44718a7b2edfe4dc6827: 开始向下滑动TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_7ff6b29516ae44718a7b2edfe4dc6827: TextPicker向下滑动完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_7ff6b29516ae44718a7b2edfe4dc6827');
        await Utils.sleep(1000);

        console.info('TEST_7ff6b29516ae44718a7b2edfe4dc6827: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_7ff6b29516ae44718a7b2edfe4dc6827: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_7ff6b29516ae44718a7b2edfe4dc6827: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_88aeda28742e415091f54af6df16ac76
     * @tc.name   : 单列TextPicker向上滑动测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_88aeda28742e415091f54af6df16ac76', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase23');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_88aeda28742e415091f54af6df16ac76: 开始查找TextPicker组件 (textPicker_23)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_23'), 1000);
        console.info('TEST_88aeda28742e415091f54af6df16ac76: 成功找到TextPicker组件');

        console.info('TEST_88aeda28742e415091f54af6df16ac76: 开始向上滑动TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.2;
        let endY = rect.top + height * 0.8;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_88aeda28742e415091f54af6df16ac76: TextPicker向上滑动完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_88aeda28742e415091f54af6df16ac76');
        await Utils.sleep(1000);

        console.info('TEST_88aeda28742e415091f54af6df16ac76: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_88aeda28742e415091f54af6df16ac76: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_88aeda28742e415091f54af6df16ac76: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_8951b19265b844d2938cb2e418db6ee2
     * @tc.name   : 单列TextPicker点击下面备选项测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_8951b19265b844d2938cb2e418db6ee2', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase24');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_8951b19265b844d2938cb2e418db6ee2: 开始查找TextPicker组件 (textPicker_24)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_24'), 1000);
        console.info('TEST_8951b19265b844d2938cb2e418db6ee2: 成功找到TextPicker组件');

        console.info('TEST_8951b19265b844d2938cb2e418db6ee2: 开始点击TextPicker');
        await textPicker.click();
        console.info('TEST_8951b19265b844d2938cb2e418db6ee2: TextPicker点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_8951b19265b844d2938cb2e418db6ee2');
        await Utils.sleep(1000);

        console.info('TEST_8951b19265b844d2938cb2e418db6ee2: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_8951b19265b844d2938cb2e418db6ee2: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_8951b19265b844d2938cb2e418db6ee2: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_8e8138a0d4e3456a821d13e44e0ad056
     * @tc.name   : 单列TextPicker向上滑动测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_8e8138a0d4e3456a821d13e44e0ad056', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase25');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_8e8138a0d4e3456a821d13e44e0ad056: 开始查找TextPicker组件 (textPicker_25)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_25'), 1000);
        console.info('TEST_8e8138a0d4e3456a821d13e44e0ad056: 成功找到TextPicker组件');

        console.info('TEST_8e8138a0d4e3456a821d13e44e0ad056: 开始向上滑动TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.2;
        let endY = rect.top + height * 0.8;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_8e8138a0d4e3456a821d13e44e0ad056: TextPicker向上滑动完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_8e8138a0d4e3456a821d13e44e0ad056');
        await Utils.sleep(1000);

        console.info('TEST_8e8138a0d4e3456a821d13e44e0ad056: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_8e8138a0d4e3456a821d13e44e0ad056: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_8e8138a0d4e3456a821d13e44e0ad056: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_8f5e401394864f4c81b5ae368a2d9e28
     * @tc.name   : 单列TextPicker更改选中项观察焦点显示测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_8f5e401394864f4c81b5ae368a2d9e28', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase26');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_8f5e401394864f4c81b5ae368a2d9e28: 开始查找TextPicker组件 (textPicker_26)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_26'), 1000);
        console.info('TEST_8f5e401394864f4c81b5ae368a2d9e28: 成功找到TextPicker组件');

        console.info('TEST_8f5e401394864f4c81b5ae368a2d9e28: 开始点击TextPicker更改选中项');
        await textPicker.click();
        console.info('TEST_8f5e401394864f4c81b5ae368a2d9e28: TextPicker点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_8f5e401394864f4c81b5ae368a2d9e28');
        await Utils.sleep(1000);

        console.info('TEST_8f5e401394864f4c81b5ae368a2d9e28: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_8f5e401394864f4c81b5ae368a2d9e28: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_8f5e401394864f4c81b5ae368a2d9e28: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_968fc329c6ca42349f5f34703516c729
     * @tc.name   : 单列TextPicker向上/向下拖动测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_968fc329c6ca42349f5f34703516c729', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase27');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_968fc329c6ca42349f5f34703516c729: 开始查找TextPicker组件 (textPicker_27)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_27'), 1000);
        console.info('TEST_968fc329c6ca42349f5f34703516c729: 成功找到TextPicker组件');

        console.info('TEST_968fc329c6ca42349f5f34703516c729: 开始向上拖动TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.6;
        let endY = rect.top + height * 0.4;
        await driver.swipe(centerX, startY, centerX, endY, 800);
        console.info('TEST_968fc329c6ca42349f5f34703516c729: 向上拖动完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_968fc329c6ca42349f5f34703516c729: 开始向下拖动TextPicker');
        await driver.swipe(centerX, endY, centerX, startY, 800);
        console.info('TEST_968fc329c6ca42349f5f34703516c729: 向下拖动完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_968fc329c6ca42349f5f34703516c729');
        await Utils.sleep(1000);

        console.info('TEST_968fc329c6ca42349f5f34703516c729: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_968fc329c6ca42349f5f34703516c729: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_968fc329c6ca42349f5f34703516c729: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_9b0865fde4944a4bb7132ede4f0ee734
     * @tc.name   : 多列TextPicker更改选中项观察焦点显示测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_9b0865fde4944a4bb7132ede4f0ee734', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase28');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_9b0865fde4944a4bb7132ede4f0ee734: 开始查找TextPicker组件 (textPicker_28)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_28'), 1000);
        console.info('TEST_9b0865fde4944a4bb7132ede4f0ee734: 成功找到TextPicker组件');

        console.info('TEST_9b0865fde4944a4bb7132ede4f0ee734: 开始点击TextPicker更改选中项');
        await textPicker.click();
        console.info('TEST_9b0865fde4944a4bb7132ede4f0ee734: TextPicker点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_9b0865fde4944a4bb7132ede4f0ee734');
        await Utils.sleep(1000);

        console.info('TEST_9b0865fde4944a4bb7132ede4f0ee734: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_9b0865fde4944a4bb7132ede4f0ee734: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_9b0865fde4944a4bb7132ede4f0ee734: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_9eb33ab9b98f4e6abbd0496d3c11a5a1
     * @tc.name   : 多列TextPicker向上/向下拖动测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_9eb33ab9b98f4e6abbd0496d3c11a5a1', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase29');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_9eb33ab9b98f4e6abbd0496d3c11a5a1: 开始查找TextPicker组件 (textPicker_29)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_29'), 1000);
        console.info('TEST_9eb33ab9b98f4e6abbd0496d3c11a5a1: 成功找到TextPicker组件');

        console.info('TEST_9eb33ab9b98f4e6abbd0496d3c11a5a1: 开始向上拖动TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.6;
        let endY = rect.top + height * 0.4;
        await driver.swipe(centerX, startY, centerX, endY, 800);
        console.info('TEST_9eb33ab9b98f4e6abbd0496d3c11a5a1: 向上拖动完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_9eb33ab9b98f4e6abbd0496d3c11a5a1: 开始向下拖动TextPicker');
        await driver.swipe(centerX, endY, centerX, startY, 800);
        console.info('TEST_9eb33ab9b98f4e6abbd0496d3c11a5a1: 向下拖动完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_9eb33ab9b98f4e6abbd0496d3c11a5a1');
        await Utils.sleep(1000);

        console.info('TEST_9eb33ab9b98f4e6abbd0496d3c11a5a1: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_9eb33ab9b98f4e6abbd0496d3c11a5a1: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_9eb33ab9b98f4e6abbd0496d3c11a5a1: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_adff3a7f152d40a1bf832657464cdd97
     * @tc.name   : 单列TextPicker向下抛滑测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_adff3a7f152d40a1bf832657464cdd97', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase30');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_adff3a7f152d40a1bf832657464cdd97: 开始查找TextPicker组件 (textPicker_30)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_30'), 1000);
        console.info('TEST_adff3a7f152d40a1bf832657464cdd97: 成功找到TextPicker组件');

        console.info('TEST_adff3a7f152d40a1bf832657464cdd97: 开始向下抛滑TextPicker');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.1;
        await driver.swipe(centerX, startY, centerX, endY, 500);
        console.info('TEST_adff3a7f152d40a1bf832657464cdd97: TextPicker向下抛滑完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_adff3a7f152d40a1bf832657464cdd97');
        await Utils.sleep(1000);

        console.info('TEST_adff3a7f152d40a1bf832657464cdd97: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_adff3a7f152d40a1bf832657464cdd97: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_adff3a7f152d40a1bf832657464cdd97: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_b299e39bc22540c1bbc92a18daacde52
     * @tc.name   : 多列TextPicker多指操作同时滑动多列测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_b299e39bc22540c1bbc92a18daacde52', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase31');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_b299e39bc22540c1bbc92a18daacde52: 开始查找TextPicker组件 (textPicker_31)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_31'), 1000);
        console.info('TEST_b299e39bc22540c1bbc92a18daacde52: 成功找到TextPicker组件');

        console.info('TEST_b299e39bc22540c1bbc92a18daacde52: 开始多指操作同时滑动多列');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_b299e39bc22540c1bbc92a18daacde52: 多指操作同时滑动多列完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_b299e39bc22540c1bbc92a18daacde52');
        await Utils.sleep(1000);

        console.info('TEST_b299e39bc22540c1bbc92a18daacde52: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_b299e39bc22540c1bbc92a18daacde52: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_b299e39bc22540c1bbc92a18daacde52: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_b7b3eff086254580aad762d1412f167f
     * @tc.name   : 单列TextPicker向上/向下拖动测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_b7b3eff086254580aad762d1412f167f', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase32');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_b7b3eff086254580aad762d1412f167f: 开始查找TextPicker组件 (textPicker_32)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_32'), 1000);
        console.info('TEST_b7b3eff086254580aad762d1412f167f: 成功找到TextPicker组件');

        console.info('TEST_b7b3eff086254580aad762d1412f167f: 开始向上拖动');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_b7b3eff086254580aad762d1412f167f: 向上拖动完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_b7b3eff086254580aad762d1412f167f: 开始向下拖动');
        await driver.swipe(centerX, endY, centerX, startY, 1000);
        console.info('TEST_b7b3eff086254580aad762d1412f167f: 向下拖动完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_b7b3eff086254580aad762d1412f167f');
        await Utils.sleep(1000);

        console.info('TEST_b7b3eff086254580aad762d1412f167f: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_b7b3eff086254580aad762d1412f167f: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_b7b3eff086254580aad762d1412f167f: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_bac8776d9aa94f7087bf2e13350da157
     * @tc.name   : TextCascadePickerRangeContent[]
     * @tc.desc   : Verify the interface under test: TextCascadePickerRangeContent[].
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_bac8776d9aa94f7087bf2e13350da157', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase33');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_bac8776d9aa94f7087bf2e13350da157: 开始查找TextPicker组件 (textPicker_33)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_33'), 1000);
        console.info('TEST_bac8776d9aa94f7087bf2e13350da157: 成功找到TextPicker组件');

        console.info('TEST_bac8776d9aa94f7087bf2e13350da157: 开始多指操作同时滑动多列');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_bac8776d9aa94f7087bf2e13350da157: 多指操作同时滑动多列完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_bac8776d9aa94f7087bf2e13350da157');
        await Utils.sleep(1000);

        console.info('TEST_bac8776d9aa94f7087bf2e13350da157: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_bac8776d9aa94f7087bf2e13350da157: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_bac8776d9aa94f7087bf2e13350da157: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_bb7b577d6e3f42d1aea1beccef3ae6aa
     * @tc.name   : 多列TextPicker向上/向下拖动测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_bb7b577d6e3f42d1aea1beccef3ae6aa', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase34');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_bb7b577d6e3f42d1aea1beccef3ae6aa: 开始查找TextPicker组件 (textPicker_34)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_34'), 1000);
        console.info('TEST_bb7b577d6e3f42d1aea1beccef3ae6aa: 成功找到TextPicker组件');

        console.info('TEST_bb7b577d6e3f42d1aea1beccef3ae6aa: 开始向上拖动');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_bb7b577d6e3f42d1aea1beccef3ae6aa: 向上拖动完成');
        await driver.waitForIdle(1000, 2000);

        console.info('TEST_bb7b577d6e3f42d1aea1beccef3ae6aa: 开始向下拖动');
        await driver.swipe(centerX, endY, centerX, startY, 1000);
        console.info('TEST_bb7b577d6e3f42d1aea1beccef3ae6aa: 向下拖动完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_bb7b577d6e3f42d1aea1beccef3ae6aa');
        await Utils.sleep(1000);

        console.info('TEST_bb7b577d6e3f42d1aea1beccef3ae6aa: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_bb7b577d6e3f42d1aea1beccef3ae6aa: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_bb7b577d6e3f42d1aea1beccef3ae6aa: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_bc806ed771454bd6ae5fa168ee7968fc
     * @tc.name   : 单列TextPicker向上抛滑测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_bc806ed771454bd6ae5fa168ee7968fc', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase35');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_bc806ed771454bd6ae5fa168ee7968fc: 开始查找TextPicker组件 (textPicker_35)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_35'), 1000);
        console.info('TEST_bc806ed771454bd6ae5fa168ee7968fc: 成功找到TextPicker组件');

        console.info('TEST_bc806ed771454bd6ae5fa168ee7968fc: 开始向上抛滑');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 500);
        console.info('TEST_bc806ed771454bd6ae5fa168ee7968fc: 向上抛滑完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_bc806ed771454bd6ae5fa168ee7968fc');
        await Utils.sleep(1000);

        console.info('TEST_bc806ed771454bd6ae5fa168ee7968fc: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_bc806ed771454bd6ae5fa168ee7968fc: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_bc806ed771454bd6ae5fa168ee7968fc: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_c01c175a018347d298ded2bbaa2d0348
     * @tc.name   : 单列TextPicker向上抛滑测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_c01c175a018347d298ded2bbaa2d0348', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase36');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_c01c175a018347d298ded2bbaa2d0348: 开始查找TextPicker组件 (textPicker_36)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_36'), 1000);
        console.info('TEST_c01c175a018347d298ded2bbaa2d0348: 成功找到TextPicker组件');

        console.info('TEST_c01c175a018347d298ded2bbaa2d0348: 开始向上抛滑');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 500);
        console.info('TEST_c01c175a018347d298ded2bbaa2d0348: 向上抛滑完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_c01c175a018347d298ded2bbaa2d0348');
        await Utils.sleep(1000);

        console.info('TEST_c01c175a018347d298ded2bbaa2d0348: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_c01c175a018347d298ded2bbaa2d0348: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_c01c175a018347d298ded2bbaa2d0348: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_c4dea52734874179b91657dfcadc88ff
     * @tc.name   : 多列TextPicker点击上面备选项测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_c4dea52734874179b91657dfcadc88ff', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase37');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_c4dea52734874179b91657dfcadc88ff: 开始查找TextPicker组件 (textPicker_37)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_37'), 1000);
        console.info('TEST_c4dea52734874179b91657dfcadc88ff: 成功找到TextPicker组件');

        console.info('TEST_c4dea52734874179b91657dfcadc88ff: 开始点击TextPicker');
        await textPicker.click();
        console.info('TEST_c4dea52734874179b91657dfcadc88ff: TextPicker点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_c4dea52734874179b91657dfcadc88ff');
        await Utils.sleep(1000);

        console.info('TEST_c4dea52734874179b91657dfcadc88ff: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_c4dea52734874179b91657dfcadc88ff: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_c4dea52734874179b91657dfcadc88ff: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_c64edd5197f34871948a2e906c3c0dc8
     * @tc.name   : 单列TextPicker向下滑动测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_c64edd5197f34871948a2e906c3c0dc8', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase38');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_c64edd5197f34871948a2e906c3c0dc8: 开始查找TextPicker组件 (textPicker_38)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_38'), 1000);
        console.info('TEST_c64edd5197f34871948a2e906c3c0dc8: 成功找到TextPicker组件');

        console.info('TEST_c64edd5197f34871948a2e906c3c0dc8: 开始向下滑动');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 1000);
        console.info('TEST_c64edd5197f34871948a2e906c3c0dc8: 向下滑动完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_c64edd5197f34871948a2e906c3c0dc8');
        await Utils.sleep(1000);

        console.info('TEST_c64edd5197f34871948a2e906c3c0dc8: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_c64edd5197f34871948a2e906c3c0dc8: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_c64edd5197f34871948a2e906c3c0dc8: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_c6ef566c80ff4adab2548e723f44b8be
     * @tc.name   : 多列TextPicker向下抛滑测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_c6ef566c80ff4adab2548e723f44b8be', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase39');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_c6ef566c80ff4adab2548e723f44b8be: 开始查找TextPicker组件 (textPicker_39)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_39'), 1000);
        console.info('TEST_c6ef566c80ff4adab2548e723f44b8be: 成功找到TextPicker组件');

        console.info('TEST_c6ef566c80ff4adab2548e723f44b8be: 开始向下抛滑');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 500);
        console.info('TEST_c6ef566c80ff4adab2548e723f44b8be: 向下抛滑完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_c6ef566c80ff4adab2548e723f44b8be');
        await Utils.sleep(1000);

        console.info('TEST_c6ef566c80ff4adab2548e723f44b8be: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_c6ef566c80ff4adab2548e723f44b8be: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_c6ef566c80ff4adab2548e723f44b8be: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_cf66f56aac5b470b9a487312c914b36b
     * @tc.name   : 单列TextPicker点击上面备选项测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_cf66f56aac5b470b9a487312c914b36b', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase40');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_cf66f56aac5b470b9a487312c914b36b: 开始查找TextPicker组件 (textPicker_40)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_40'), 1000);
        console.info('TEST_cf66f56aac5b470b9a487312c914b36b: 成功找到TextPicker组件');

        console.info('TEST_cf66f56aac5b470b9a487312c914b36b: 开始点击TextPicker');
        await textPicker.click();
        console.info('TEST_cf66f56aac5b470b9a487312c914b36b: TextPicker点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_cf66f56aac5b470b9a487312c914b36b');
        await Utils.sleep(1000);

        console.info('TEST_cf66f56aac5b470b9a487312c914b36b: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_cf66f56aac5b470b9a487312c914b36b: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_cf66f56aac5b470b9a487312c914b36b: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_d0cf236fa8224bb4b73ffea51564af48
     * @tc.name   : Resource
     * @tc.desc   : Verify the interface under test: Resource.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_d0cf236fa8224bb4b73ffea51564af48', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase41');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_d0cf236fa8224bb4b73ffea51564af48: 开始查找TextPicker组件 (textPicker_41)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_41'), 1000);
        console.info('TEST_d0cf236fa8224bb4b73ffea51564af48: 成功找到TextPicker组件');

        console.info('TEST_d0cf236fa8224bb4b73ffea51564af48: 开始向下抛滑');
        let rect = await textPicker.getBounds();
        let centerX = rect.left + (rect.right - rect.left) / 2;
        let height = rect.bottom - rect.top;
        let startY = rect.top + height * 0.8;
        let endY = rect.top + height * 0.2;
        await driver.swipe(centerX, startY, centerX, endY, 500);
        console.info('TEST_d0cf236fa8224bb4b73ffea51564af48: 向下抛滑完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_d0cf236fa8224bb4b73ffea51564af48');
        await Utils.sleep(1000);

        console.info('TEST_d0cf236fa8224bb4b73ffea51564af48: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_d0cf236fa8224bb4b73ffea51564af48: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_d0cf236fa8224bb4b73ffea51564af48: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : TestCase_this case
     * @tc.name   : 单列TextPicker点击下面备选项测试
     * @tc.desc   : Verify TextPicker UI interaction and expected visual result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('TestCase_this case', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPickerTestCase42');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_this case: 开始查找TextPicker组件 (textPicker_42)');
        let textPicker: Component = await driver.waitForComponent(ON.id('textPicker_42'), 1000);
        console.info('TEST_this case: 成功找到TextPicker组件');

        console.info('TEST_this case: 开始点击TextPicker');
        await textPicker.click();
        console.info('TEST_this case: TextPicker点击完成');
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot('TestCase_this case');
        await Utils.sleep(1000);

        console.info('TEST_this case: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_this case: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_this case: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

  });
}