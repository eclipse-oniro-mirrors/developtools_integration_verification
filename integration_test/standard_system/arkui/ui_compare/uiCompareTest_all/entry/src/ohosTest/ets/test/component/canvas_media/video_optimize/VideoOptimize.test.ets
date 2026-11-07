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

export default function videoOptimizeTest() {
  describe('videoOptimizeTest', () => {
    beforeAll(() => {
      console.info('videoOptimizeTest beforeAll');
    });

    beforeEach(() => {
      console.info('videoOptimizeTest beforeEach');
    });

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

    afterAll(() => {
      console.info('videoOptimizeTest afterAll');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0010
     * @tc.name   : Video组件重置AVPlayer和自动播放测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0010', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize01');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、重置AVPlayer
        console.info('TEST_0010: 开始查找重置AVPlayer按钮 (resetButton_01)');
        let resetButton: Component = await driver.waitForComponent(ON.id('resetButton_01'), 1000);
        console.info('TEST_0010: 成功找到重置AVPlayer按钮，开始点击');
        await resetButton.click();
        console.info('TEST_0010: 重置AVPlayer按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 2、打开自动播放
        console.info('TEST_0010: 开始查找打开自动播放按钮 (autoPlayButton_01)');
        let autoPlayButton: Component = await driver.waitForComponent(ON.id('autoPlayButton_01'), 1000);
        console.info('TEST_0010: 成功找到打开自动播放按钮，开始点击');
        await autoPlayButton.click();
        console.info('TEST_0010: 打开自动播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0010: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0010');
        await Utils.sleep(1000);
        
        console.info('TEST_0010: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0010: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0010: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0020
     * @tc.name   : Video组件重置AVPlayer和自动播放测试(三Video)
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0020', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize02');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、重置AVPlayer
        console.info('TEST_0020: 开始查找重置AVPlayer按钮 (resetButton_02)');
        let resetButton: Component = await driver.waitForComponent(ON.id('resetButton_02'), 1000);
        console.info('TEST_0020: 成功找到重置AVPlayer按钮，开始点击');
        await resetButton.click();
        console.info('TEST_0020: 重置AVPlayer按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 2、打开自动播放
        console.info('TEST_0020: 开始查找打开自动播放按钮 (autoPlayButton_02)');
        let autoPlayButton: Component = await driver.waitForComponent(ON.id('autoPlayButton_02'), 1000);
        console.info('TEST_0020: 成功找到打开自动播放按钮，开始点击');
        await autoPlayButton.click();
        console.info('TEST_0020: 打开自动播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0020: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0020');
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0030
     * @tc.name   : Video组件停止播放、重置AVPlayer和自动播放测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0030', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize03');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、停止播放
        console.info('TEST_0030: 开始查找停止播放按钮 (stopButton_03)');
        let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_03'), 1000);
        console.info('TEST_0030: 成功找到停止播放按钮，开始点击');
        await stopButton.click();
        console.info('TEST_0030: 停止播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 2、重置AVPlayer
        console.info('TEST_0030: 开始查找重置AVPlayer按钮 (resetButton_03)');
        let resetButton: Component = await driver.waitForComponent(ON.id('resetButton_03'), 1000);
        console.info('TEST_0030: 成功找到重置AVPlayer按钮，开始点击');
        await resetButton.click();
        console.info('TEST_0030: 重置AVPlayer按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 3、打开自动播放
        console.info('TEST_0030: 开始查找打开自动播放按钮 (autoPlayButton_03)');
        let autoPlayButton: Component = await driver.waitForComponent(ON.id('autoPlayButton_03'), 1000);
        console.info('TEST_0030: 成功找到打开自动播放按钮，开始点击');
        await autoPlayButton.click();
        console.info('TEST_0030: 打开自动播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0030: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0030');
        await Utils.sleep(1000);
        
        console.info('TEST_0030: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0030: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0030: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0040
     * @tc.name   : Video组件停止播放、重置AVPlayer和自动播放测试(三Video)
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0040', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize04');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、停止播放
        console.info('TEST_0040: 开始查找停止播放按钮 (stopButton_04)');
        let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_04'), 1000);
        console.info('TEST_0040: 成功找到停止播放按钮，开始点击');
        await stopButton.click();
        console.info('TEST_0040: 停止播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 2、重置AVPlayer
        console.info('TEST_0040: 开始查找重置AVPlayer按钮 (resetButton_04)');
        let resetButton: Component = await driver.waitForComponent(ON.id('resetButton_04'), 1000);
        console.info('TEST_0040: 成功找到重置AVPlayer按钮，开始点击');
        await resetButton.click();
        console.info('TEST_0040: 重置AVPlayer按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 3、打开自动播放
        console.info('TEST_0040: 开始查找打开自动播放按钮 (autoPlayButton_04)');
        let autoPlayButton: Component = await driver.waitForComponent(ON.id('autoPlayButton_04'), 1000);
        console.info('TEST_0040: 成功找到打开自动播放按钮，开始点击');
        await autoPlayButton.click();
        console.info('TEST_0040: 打开自动播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0040: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0040');
        await Utils.sleep(1000);
        
        console.info('TEST_0040: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0040: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0040: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0050
     * @tc.name   : Video组件onStop事件测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0050', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize05');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、停止播放
        console.info('TEST_0050: 开始查找停止播放按钮 (stopButton_05)');
        let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_05'), 1000);
        console.info('TEST_0050: 成功找到停止播放按钮，开始点击');
        await stopButton.click();
        console.info('TEST_0050: 停止播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0050: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0050');
        await Utils.sleep(1000);
        
        console.info('TEST_0050: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0050: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0050: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0060
     * @tc.name   : Video组件onStop事件测试(三Video)
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0060', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize06');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、停止播放
        console.info('TEST_0060: 开始查找停止播放按钮 (stopButton_06)');
        let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_06'), 1000);
        console.info('TEST_0060: 成功找到停止播放按钮，开始点击');
        await stopButton.click();
        console.info('TEST_0060: 停止播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0060: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0060');
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0080
     * @tc.name   : Video组件跳转进度位置测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0080', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize08');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、跳转到第10s
        console.info('TEST_0080: 开始查找跳转进度按钮 (seekButton_08)');
        let jumpButton: Component = await driver.waitForComponent(ON.id('seekButton_08'), 1000);
        console.info('TEST_0080: 成功找到跳转进度按钮，开始点击');
        await jumpButton.click();
        console.info('TEST_0080: 跳转进度按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0080: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0080');
        await Utils.sleep(1000);
        
        console.info('TEST_0080: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0080: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0080: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0090
     * @tc.name   : Video组件onPrepared事件测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0090', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize09');
      await driver.waitForIdle(500, 2000);
      
      try {
        console.info('TEST_0090: 开始执行onPrepared事件测试');
        
        console.info('TEST_0090: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0090');
        await Utils.sleep(1000);
        
        console.info('TEST_0090: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0090: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0090: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0100
     * @tc.name   : Video组件开始播放和onPrepared事件测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0100', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize10');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、开始播放
        console.info('TEST_0100: 开始查找开始播放按钮 (startButton_10)');
        let startButton: Component = await driver.waitForComponent(ON.id('startButton_10'), 1000);
        console.info('TEST_0100: 成功找到开始播放按钮，开始点击');
        await startButton.click();
        console.info('TEST_0100: 开始播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0100: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0100');
        await Utils.sleep(1000);
        
        console.info('TEST_0100: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0100: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0100: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0110
     * @tc.name   : Video组件停止播放后滑出滑进屏幕测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0110', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize11');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、停止播放
        console.info('TEST_0110: 开始查找停止播放按钮 (stopButton_11)');
        let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_11'), 1000);
        console.info('TEST_0110: 成功找到停止播放按钮，开始点击');
        await stopButton.click();
        console.info('TEST_0110: 停止播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0110: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0110');
        await Utils.sleep(1000);
        
        console.info('TEST_0110: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0110: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0110: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0120
     * @tc.name   : Video组件滑进屏幕onPrepared事件测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0120', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize12');
      await driver.waitForIdle(500, 2000);
      
      try {
        console.info('TEST_0120: 开始执行滑进屏幕onPrepared事件测试');
        
        console.info('TEST_0120: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0120');
        await Utils.sleep(1000);
        
        console.info('TEST_0120: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0120: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0120: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0130
     * @tc.name   : Video组件隐藏状态onPrepared事件测试(三Video)
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0130', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize13');
      await driver.waitForIdle(500, 2000);
      
      try {
        console.info('TEST_0130: 开始执行隐藏状态onPrepared事件测试(三Video)');
        
        console.info('TEST_0130: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0130');
        await Utils.sleep(1000);
        
        console.info('TEST_0130: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0130: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0130: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0140
     * @tc.name   : Video组件停止播放后显示测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0140', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize14');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、停止播放
        console.info('TEST_0140: 开始查找停止播放按钮 (stopButton_14)');
        let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_14'), 1000);
        console.info('TEST_0140: 成功找到停止播放按钮，开始点击');
        await stopButton.click();
        console.info('TEST_0140: 停止播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 2、显示Video
        console.info('TEST_0140: 开始查找显示Video按钮 (showButton_14)');
        let showButton: Component = await driver.waitForComponent(ON.id('showButton_14'), 1000);
        console.info('TEST_0140: 成功找到显示Video按钮，开始点击');
        await showButton.click();
        console.info('TEST_0140: 显示Video按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0140: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0140');
        await Utils.sleep(1000);
        
        console.info('TEST_0140: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0140: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0140: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0150
     * @tc.name   : Video组件隐藏状态onPrepared事件测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0150', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize15');
      await driver.waitForIdle(500, 2000);
      
      try {
        console.info('TEST_0150: 开始执行隐藏状态onPrepared事件测试');
        
        console.info('TEST_0150: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0150');
        await Utils.sleep(1000);
        
        console.info('TEST_0150: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0150: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0150: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0160
     * @tc.name   : Video组件切换视频源测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0160', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize16');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、切换成视频源video4
        console.info('TEST_0160: 开始查找切换视频源按钮 (switchButton_16)');
        let switchButton: Component = await driver.waitForComponent(ON.id('switchButton_16'), 1000);
        console.info('TEST_0160: 成功找到切换视频源按钮，开始点击');
        await switchButton.click();
        console.info('TEST_0160: 切换视频源按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0160: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0160');
        await Utils.sleep(1000);
        
        console.info('TEST_0160: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0160: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0160: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0170
     * @tc.name   : Video组件开始播放后切换视频源测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0170', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize17');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、开始播放
        console.info('TEST_0170: 开始查找开始播放按钮 (startButton_17)');
        let startButton: Component = await driver.waitForComponent(ON.id('startButton_17'), 1000);
        console.info('TEST_0170: 成功找到开始播放按钮，开始点击');
        await startButton.click();
        console.info('TEST_0170: 开始播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 2、切换成视频源video4
        console.info('TEST_0170: 开始查找切换视频源按钮 (switchButton_17)');
        let switchButton: Component = await driver.waitForComponent(ON.id('switchButton_17'), 1000);
        console.info('TEST_0170: 成功找到切换视频源按钮，开始点击');
        await switchButton.click();
        console.info('TEST_0170: 切换视频源按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0170: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0170');
        await Utils.sleep(1000);
        
        console.info('TEST_0170: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0170: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0170: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0180
     * @tc.name   : Video组件停止播放后切换视频源测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0180', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize18');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、停止播放
        console.info('TEST_0180: 开始查找停止播放按钮 (stopButton_18)');
        let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_18'), 1000);
        console.info('TEST_0180: 成功找到停止播放按钮，开始点击');
        await stopButton.click();
        console.info('TEST_0180: 停止播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 2、切换成视频源video4
        console.info('TEST_0180: 开始查找切换视频源按钮 (switchButton_18)');
        let switchButton: Component = await driver.waitForComponent(ON.id('switchButton_18'), 1000);
        console.info('TEST_0180: 成功找到切换视频源按钮，开始点击');
        await switchButton.click();
        console.info('TEST_0180: 切换视频源按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0180: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0180');
        await Utils.sleep(1000);
        
        console.info('TEST_0180: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0180: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0180: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0190
     * @tc.name   : Video组件切换视频源测试(三Video)
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0190', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize19');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、切换成视频源video4
        console.info('TEST_0190: 开始查找切换视频源按钮 (switchButton_19)');
        let switchButton: Component = await driver.waitForComponent(ON.id('switchButton_19'), 1000);
        console.info('TEST_0190: 成功找到切换视频源按钮，开始点击');
        await switchButton.click();
        console.info('TEST_0190: 切换视频源按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0190: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0190');
        await Utils.sleep(1000);
        
        console.info('TEST_0190: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0190: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0190: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0200
     * @tc.name   : Video组件开始播放、重置AVPlayer和自动播放测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0200', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize20');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、开始播放
        console.info('TEST_0200: 开始查找开始播放按钮 (startButton_20)');
        let startButton: Component = await driver.waitForComponent(ON.id('startButton_20'), 1000);
        console.info('TEST_0200: 成功找到开始播放按钮，开始点击');
        await startButton.click();
        console.info('TEST_0200: 开始播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 2、重置AVPlayer
        console.info('TEST_0200: 开始查找重置AVPlayer按钮 (resetButton_20)');
        let resetButton: Component = await driver.waitForComponent(ON.id('resetButton_20'), 1000);
        console.info('TEST_0200: 成功找到重置AVPlayer按钮，开始点击');
        await resetButton.click();
        console.info('TEST_0200: 重置AVPlayer按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 3、打开自动播放
        console.info('TEST_0200: 开始查找打开自动播放按钮 (autoPlayButton_20)');
        let autoPlayButton: Component = await driver.waitForComponent(ON.id('autoPlayButton_20'), 1000);
        console.info('TEST_0200: 成功找到打开自动播放按钮，开始点击');
        await autoPlayButton.click();
        console.info('TEST_0200: 打开自动播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0200: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0200');
        await Utils.sleep(1000);
        
        console.info('TEST_0200: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0200: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0200: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0210
     * @tc.name   : Video组件开始播放、重置AVPlayer和自动播放测试(三Video)
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0210', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize21');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、开始播放
        console.info('TEST_0210: 开始查找开始播放按钮 (startButton_21)');
        let startButton: Component = await driver.waitForComponent(ON.id('startButton_21'), 1000);
        console.info('TEST_0210: 成功找到开始播放按钮，开始点击');
        await startButton.click();
        console.info('TEST_0210: 开始播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 2、重置AVPlayer
        console.info('TEST_0210: 开始查找重置AVPlayer按钮 (resetButton_21)');
        let resetButton: Component = await driver.waitForComponent(ON.id('resetButton_21'), 1000);
        console.info('TEST_0210: 成功找到重置AVPlayer按钮，开始点击');
        await resetButton.click();
        console.info('TEST_0210: 重置AVPlayer按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 3、打开自动播放
        console.info('TEST_0210: 开始查找打开自动播放按钮 (autoPlayButton_21)');
        let autoPlayButton: Component = await driver.waitForComponent(ON.id('autoPlayButton_21'), 1000);
        console.info('TEST_0210: 成功找到打开自动播放按钮，开始点击');
        await autoPlayButton.click();
        console.info('TEST_0210: 打开自动播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0210: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0210');
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0220
     * @tc.name   : Video组件开始播放、停止播放、重置AVPlayer和自动播放测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0220', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize22');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、开始播放
        console.info('TEST_0220: 开始查找开始播放按钮 (startButton_22)');
        let startButton: Component = await driver.waitForComponent(ON.id('startButton_22'), 1000);
        console.info('TEST_0220: 成功找到开始播放按钮，开始点击');
        await startButton.click();
        console.info('TEST_0220: 开始播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 2、停止播放
        console.info('TEST_0220: 开始查找停止播放按钮 (stopButton_22)');
        let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_22'), 1000);
        console.info('TEST_0220: 成功找到停止播放按钮，开始点击');
        await stopButton.click();
        console.info('TEST_0220: 停止播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 3、重置AVPlayer
        console.info('TEST_0220: 开始查找重置AVPlayer按钮 (resetButton_22)');
        let resetButton: Component = await driver.waitForComponent(ON.id('resetButton_22'), 1000);
        console.info('TEST_0220: 成功找到重置AVPlayer按钮，开始点击');
        await resetButton.click();
        console.info('TEST_0220: 重置AVPlayer按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 4、打开自动播放
        console.info('TEST_0220: 开始查找打开自动播放按钮 (autoPlayButton_22)');
        let autoPlayButton: Component = await driver.waitForComponent(ON.id('autoPlayButton_22'), 1000);
        console.info('TEST_0220: 成功找到打开自动播放按钮，开始点击');
        await autoPlayButton.click();
        console.info('TEST_0220: 打开自动播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0220: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0220');
        await Utils.sleep(1000);
        
        console.info('TEST_0220: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0220: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0220: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0230
     * @tc.name   : Video组件开始播放、停止播放、重置AVPlayer和自动播放测试(三Video)
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0230', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize23');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、开始播放
        console.info('TEST_0230: 开始查找开始播放按钮 (startButton_23)');
        let startButton: Component = await driver.waitForComponent(ON.id('startButton_23'), 1000);
        console.info('TEST_0230: 成功找到开始播放按钮，开始点击');
        await startButton.click();
        console.info('TEST_0230: 开始播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 2、停止播放
        console.info('TEST_0230: 开始查找停止播放按钮 (stopButton_23)');
        let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_23'), 1000);
        console.info('TEST_0230: 成功找到停止播放按钮，开始点击');
        await stopButton.click();
        console.info('TEST_0230: 停止播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 3、重置AVPlayer
        console.info('TEST_0230: 开始查找重置AVPlayer按钮 (resetButton_23)');
        let resetButton: Component = await driver.waitForComponent(ON.id('resetButton_23'), 1000);
        console.info('TEST_0230: 成功找到重置AVPlayer按钮，开始点击');
        await resetButton.click();
        console.info('TEST_0230: 重置AVPlayer按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 4、打开自动播放
        console.info('TEST_0230: 开始查找打开自动播放按钮 (autoPlayButton_23)');
        let autoPlayButton: Component = await driver.waitForComponent(ON.id('autoPlayButton_23'), 1000);
        console.info('TEST_0230: 成功找到打开自动播放按钮，开始点击');
        await autoPlayButton.click();
        console.info('TEST_0230: 打开自动播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0230: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0230');
        await Utils.sleep(1000);
        
        console.info('TEST_0230: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0230: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0230: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0240
     * @tc.name   : Video组件停止播放后跳转进度位置测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0240', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize24');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、停止播放
        console.info('TEST_0240: 开始查找停止播放按钮 (stopButton_24)');
        let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_24'), 1000);
        console.info('TEST_0240: 成功找到停止播放按钮，开始点击');
        await stopButton.click();
        console.info('TEST_0240: 停止播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 2、跳转到第10s
        console.info('TEST_0240: 开始查找跳转进度按钮 (seekButton_24)');
        let jumpButton: Component = await driver.waitForComponent(ON.id('seekButton_24'), 1000);
        console.info('TEST_0240: 成功找到跳转进度按钮，开始点击');
        await jumpButton.click();
        console.info('TEST_0240: 跳转进度按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0240: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0240');
        await Utils.sleep(1000);
        
        console.info('TEST_0240: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0240: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0240: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0250
     * @tc.name   : Video组件开始播放、停止播放后切换视频源测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0250', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize25');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、开始播放
        console.info('TEST_0250: 开始查找开始播放按钮 (startButton_25)');
        let startButton: Component = await driver.waitForComponent(ON.id('startButton_25'), 1000);
        console.info('TEST_0250: 成功找到开始播放按钮，开始点击');
        await startButton.click();
        console.info('TEST_0250: 开始播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 2、停止播放
        console.info('TEST_0250: 开始查找停止播放按钮 (stopButton_25)');
        let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_25'), 1000);
        console.info('TEST_0250: 成功找到停止播放按钮，开始点击');
        await stopButton.click();
        console.info('TEST_0250: 停止播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 3、切换成视频源video4
        console.info('TEST_0250: 开始查找切换视频源按钮 (switchButton_25)');
        let switchButton: Component = await driver.waitForComponent(ON.id('switchButton_25'), 1000);
        console.info('TEST_0250: 成功找到切换视频源按钮，开始点击');
        await switchButton.click();
        console.info('TEST_0250: 切换视频源按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0250: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0250');
        await Utils.sleep(1000);
        
        console.info('TEST_0250: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0250: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0250: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0260
     * @tc.name   : Video组件跳转进度位置后开始播放测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0260', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize26');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 1、跳转到第10s
        console.info('TEST_0260: 开始查找跳转进度按钮 (seekButton_26)');
        let jumpButton: Component = await driver.waitForComponent(ON.id('seekButton_26'), 1000);
        console.info('TEST_0260: 成功找到跳转进度按钮，开始点击');
        await jumpButton.click();
        console.info('TEST_0260: 跳转进度按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        // 2、开始播放
        console.info('TEST_0260: 开始查找开始播放按钮 (startButton_26)');
        let startButton: Component = await driver.waitForComponent(ON.id('startButton_26'), 1000);
        console.info('TEST_0260: 成功找到开始播放按钮，开始点击');
        await startButton.click();
        console.info('TEST_0260: 开始播放按钮点击完成');
        await driver.waitForIdle(500, 2000);
        
        console.info('TEST_0260: 所有操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0260');
        await Utils.sleep(1000);
        
        console.info('TEST_0260: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0260: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0260: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0270
     * @tc.name   : Video组件重置AVPlayer和自动播放重复测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0270', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize27');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 重复5次操作
        for (let i = 0; i < 5; i++) {
          console.info(`TEST_0270: 开始第${i + 1}次重复操作`);
          
          // 1、重置AVPlayer
          console.info(`TEST_0270: 第${i + 1}次 - 开始查找重置AVPlayer按钮 (resetButton_27)`);
          let resetButton: Component = await driver.waitForComponent(ON.id('resetButton_27'), 1000);
          console.info(`TEST_0270: 第${i + 1}次 - 成功找到重置AVPlayer按钮，开始点击`);
          await resetButton.click();
          console.info(`TEST_0270: 第${i + 1}次 - 重置AVPlayer按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          // 2、打开自动播放
          console.info(`TEST_0270: 第${i + 1}次 - 开始查找打开自动播放按钮 (enableAutoPlayButton_27)`);
          let autoPlayButton: Component = await driver.waitForComponent(ON.id('enableAutoPlayButton_27'), 1000);
          console.info(`TEST_0270: 第${i + 1}次 - 成功找到打开自动播放按钮，开始点击`);
          await autoPlayButton.click();
          console.info(`TEST_0270: 第${i + 1}次 - 打开自动播放按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          // 3、关闭自动播放
          console.info(`TEST_0270: 第${i + 1}次 - 开始查找关闭自动播放按钮 (disableAutoPlayButton_27)`);
          let closeAutoPlayButton: Component = await driver.waitForComponent(ON.id('disableAutoPlayButton_27'), 1000);
          console.info(`TEST_0270: 第${i + 1}次 - 成功找到关闭自动播放按钮，开始点击`);
          await closeAutoPlayButton.click();
          console.info(`TEST_0270: 第${i + 1}次 - 关闭自动播放按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          console.info(`TEST_0270: 第${i + 1}次重复操作完成`);
        }
        
        console.info('TEST_0270: 所有重复操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0270');
        await Utils.sleep(1000);
        
        console.info('TEST_0270: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0270: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0270: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0280
     * @tc.name   : Video组件重置AVPlayer和自动播放重复测试(三Video)
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0280', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize28');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 重复5次操作
        for (let i = 0; i < 5; i++) {
          console.info(`TEST_0280: 开始第${i + 1}次重复操作`);
          
          // 1、重置AVPlayer
          console.info(`TEST_0280: 第${i + 1}次 - 开始查找重置AVPlayer按钮 (resetButton_28)`);
          let resetButton: Component = await driver.waitForComponent(ON.id('resetButton_28'), 1000);
          console.info(`TEST_0280: 第${i + 1}次 - 成功找到重置AVPlayer按钮，开始点击`);
          await resetButton.click();
          console.info(`TEST_0280: 第${i + 1}次 - 重置AVPlayer按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          // 2、打开自动播放
          console.info(`TEST_0280: 第${i + 1}次 - 开始查找打开自动播放按钮 (enableAutoPlayButton_28)`);
          let autoPlayButton: Component = await driver.waitForComponent(ON.id('enableAutoPlayButton_28'), 1000);
          console.info(`TEST_0280: 第${i + 1}次 - 成功找到打开自动播放按钮，开始点击`);
          await autoPlayButton.click();
          console.info(`TEST_0280: 第${i + 1}次 - 打开自动播放按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          // 3、关闭自动播放
          console.info(`TEST_0280: 第${i + 1}次 - 开始查找关闭自动播放按钮 (disableAutoPlayButton_28)`);
          let closeAutoPlayButton: Component = await driver.waitForComponent(ON.id('disableAutoPlayButton_28'), 1000);
          console.info(`TEST_0280: 第${i + 1}次 - 成功找到关闭自动播放按钮，开始点击`);
          await closeAutoPlayButton.click();
          console.info(`TEST_0280: 第${i + 1}次 - 关闭自动播放按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          // 4、停止播放
          console.info(`TEST_0280: 第${i + 1}次 - 开始查找停止播放按钮 (stopButton_28)`);
          let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_28'), 1000);
          console.info(`TEST_0280: 第${i + 1}次 - 成功找到停止播放按钮，开始点击`);
          await stopButton.click();
          console.info(`TEST_0280: 第${i + 1}次 - 停止播放按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          console.info(`TEST_0280: 第${i + 1}次重复操作完成`);
        }
        
        console.info('TEST_0280: 所有重复操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0280');
        await Utils.sleep(1000);
        
        console.info('TEST_0280: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0280: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0280: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0290
     * @tc.name   : Video组件onStop事件重复测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0290', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize29');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 重复5次停止播放操作
        for (let i = 0; i < 5; i++) {
          console.info(`TEST_0290: 开始第${i + 1}次停止播放操作`);
          console.info(`TEST_0290: 第${i + 1}次 - 开始查找停止播放按钮 (stopButton_29)`);
          let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_29'), 1000);
          console.info(`TEST_0290: 第${i + 1}次 - 成功找到停止播放按钮，开始点击`);
          await stopButton.click();
          console.info(`TEST_0290: 第${i + 1}次 - 停止播放按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          console.info(`TEST_0290: 第${i + 1}次停止播放操作完成`);
        }
        
        console.info('TEST_0290: 所有重复操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0290');
        await Utils.sleep(1000);
        
        console.info('TEST_0290: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0290: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0290: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0300
     * @tc.name   : Video组件onStop事件重复测试(三Video)
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0300', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize30');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 重复5次停止播放操作
        for (let i = 0; i < 5; i++) {
          console.info(`TEST_0300: 开始第${i + 1}次停止播放操作`);
          console.info(`TEST_0300: 第${i + 1}次 - 开始查找停止播放按钮 (stopButton_30)`);
          let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_30'), 1000);
          console.info(`TEST_0300: 第${i + 1}次 - 成功找到停止播放按钮，开始点击`);
          await stopButton.click();
          console.info(`TEST_0300: 第${i + 1}次 - 停止播放按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          console.info(`TEST_0300: 第${i + 1}次停止播放操作完成`);
        }
        
        console.info('TEST_0300: 所有重复操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0300');
        await Utils.sleep(1000);
        
        console.info('TEST_0300: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0300: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0300: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0310
     * @tc.name   : Video组件跳转进度位置和重置AVPlayer重复测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0310', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize31');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 重复5次操作
        for (let i = 0; i < 5; i++) {
          console.info(`TEST_0310: 开始第${i + 1}次重复操作`);
          
          // 1、跳转到第10s
          console.info(`TEST_0310: 第${i + 1}次 - 开始查找跳转进度按钮 (seekButton_31)`);
          let jumpButton: Component = await driver.waitForComponent(ON.id('seekButton_31'), 1000);
          console.info(`TEST_0310: 第${i + 1}次 - 成功找到跳转进度按钮，开始点击`);
          await jumpButton.click();
          console.info(`TEST_0310: 第${i + 1}次 - 跳转进度按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          // 2、重置AVPlayer
          console.info(`TEST_0310: 第${i + 1}次 - 开始查找重置AVPlayer按钮 (resetButton_31)`);
          let resetButton: Component = await driver.waitForComponent(ON.id('resetButton_31'), 1000);
          console.info(`TEST_0310: 第${i + 1}次 - 成功找到重置AVPlayer按钮，开始点击`);
          await resetButton.click();
          console.info(`TEST_0310: 第${i + 1}次 - 重置AVPlayer按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          console.info(`TEST_0310: 第${i + 1}次重复操作完成`);
        }
        
        console.info('TEST_0310: 所有重复操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0310');
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0320
     * @tc.name   : Video组件跳转进度位置和停止播放重复测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0320', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize32');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 重复5次操作
        for (let i = 0; i < 5; i++) {
          console.info(`TEST_0320: 开始第${i + 1}次重复操作`);
          
          // 1、跳转到第10s
          console.info(`TEST_0320: 第${i + 1}次 - 开始查找跳转进度按钮 (seekButton_32)`);
          let jumpButton: Component = await driver.waitForComponent(ON.id('seekButton_32'), 1000);
          console.info(`TEST_0320: 第${i + 1}次 - 成功找到跳转进度按钮，开始点击`);
          await jumpButton.click();
          console.info(`TEST_0320: 第${i + 1}次 - 跳转进度按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          // 2、停止播放
          console.info(`TEST_0320: 第${i + 1}次 - 开始查找停止播放按钮 (stopButton_32)`);
          let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_32'), 1000);
          console.info(`TEST_0320: 第${i + 1}次 - 成功找到停止播放按钮，开始点击`);
          await stopButton.click();
          console.info(`TEST_0320: 第${i + 1}次 - 停止播放按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          console.info(`TEST_0320: 第${i + 1}次重复操作完成`);
        }
        
        console.info('TEST_0320: 所有重复操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0320');
        await Utils.sleep(1000);
        
        console.info('TEST_0320: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0320: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0320: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0330
     * @tc.name   : Video组件切换视频源和重置AVPlayer重复测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0330', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize33');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 重复5次操作
        for (let i = 0; i < 5; i++) {
          console.info(`TEST_0330: 开始第${i + 1}次重复操作`);
          
          // 1、切换成视频源video4
          console.info(`TEST_0330: 第${i + 1}次 - 开始查找切换视频源按钮 (switchButton_33)`);
          let switchButton: Component = await driver.waitForComponent(ON.id('switchButton_33'), 1000);
          console.info(`TEST_0330: 第${i + 1}次 - 成功找到切换视频源按钮，开始点击`);
          await switchButton.click();
          console.info(`TEST_0330: 第${i + 1}次 - 切换视频源按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          // 2、重置AVPlayer
          console.info(`TEST_0330: 第${i + 1}次 - 开始查找重置AVPlayer按钮 (resetButton_33)`);
          let resetButton: Component = await driver.waitForComponent(ON.id('resetButton_33'), 1000);
          console.info(`TEST_0330: 第${i + 1}次 - 成功找到重置AVPlayer按钮，开始点击`);
          await resetButton.click();
          console.info(`TEST_0330: 第${i + 1}次 - 重置AVPlayer按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          console.info(`TEST_0330: 第${i + 1}次重复操作完成`);
        }
        
        console.info('TEST_0330: 所有重复操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0330');
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0340
     * @tc.name   : Video组件开始播放、切换视频源、停止播放重复测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0340', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize34');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 重复5次操作
        for (let i = 0; i < 5; i++) {
          console.info(`TEST_0340: 开始第${i + 1}次重复操作`);
          
          // 1、开始播放
          console.info(`TEST_0340: 第${i + 1}次 - 开始查找开始播放按钮 (startButton_34)`);
          let startButton: Component = await driver.waitForComponent(ON.id('startButton_34'), 1000);
          console.info(`TEST_0340: 第${i + 1}次 - 成功找到开始播放按钮，开始点击`);
          await startButton.click();
          console.info(`TEST_0340: 第${i + 1}次 - 开始播放按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          // 2、切换成视频源video4
          console.info(`TEST_0340: 第${i + 1}次 - 开始查找切换视频源按钮 (switchButton_34)`);
          let switchButton: Component = await driver.waitForComponent(ON.id('switchButton_34'), 1000);
          console.info(`TEST_0340: 第${i + 1}次 - 成功找到切换视频源按钮，开始点击`);
          await switchButton.click();
          console.info(`TEST_0340: 第${i + 1}次 - 切换视频源按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          // 3、停止播放
          console.info(`TEST_0340: 第${i + 1}次 - 开始查找停止播放按钮 (stopButton_34)`);
          let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_34'), 1000);
          console.info(`TEST_0340: 第${i + 1}次 - 成功找到停止播放按钮，开始点击`);
          await stopButton.click();
          console.info(`TEST_0340: 第${i + 1}次 - 停止播放按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          console.info(`TEST_0340: 第${i + 1}次重复操作完成`);
        }
        
        console.info('TEST_0340: 所有重复操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0340');
        await Utils.sleep(1000);
        
        console.info('TEST_0340: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0340: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0340: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0350
     * @tc.name   : Video组件停止播放、切换视频源、重置AVPlayer重复测试
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0350', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize35');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 重复5次操作
        for (let i = 0; i < 5; i++) {
          console.info(`TEST_0350: 开始第${i + 1}次重复操作`);
          
          // 1、停止播放
          console.info(`TEST_0350: 第${i + 1}次 - 开始查找停止播放按钮 (stopButton_35)`);
          let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_35'), 1000);
          console.info(`TEST_0350: 第${i + 1}次 - 成功找到停止播放按钮，开始点击`);
          await stopButton.click();
          console.info(`TEST_0350: 第${i + 1}次 - 停止播放按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          // 2、切换成视频源video4
          console.info(`TEST_0350: 第${i + 1}次 - 开始查找切换视频源按钮 (switchButton_35)`);
          let switchButton: Component = await driver.waitForComponent(ON.id('switchButton_35'), 1000);
          console.info(`TEST_0350: 第${i + 1}次 - 成功找到切换视频源按钮，开始点击`);
          await switchButton.click();
          console.info(`TEST_0350: 第${i + 1}次 - 切换视频源按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          // 3、重置AVPlayer
          console.info(`TEST_0350: 第${i + 1}次 - 开始查找重置AVPlayer按钮 (resetButton_35)`);
          let resetButton: Component = await driver.waitForComponent(ON.id('resetButton_35'), 1000);
          console.info(`TEST_0350: 第${i + 1}次 - 成功找到重置AVPlayer按钮，开始点击`);
          await resetButton.click();
          console.info(`TEST_0350: 第${i + 1}次 - 重置AVPlayer按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          console.info(`TEST_0350: 第${i + 1}次重复操作完成`);
        }
        
        console.info('TEST_0350: 所有重复操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0350');
        await Utils.sleep(1000);
        
        console.info('TEST_0350: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0350: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0350: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0360
     * @tc.name   : Video组件切换视频源和停止播放重复测试(三Video)
     * @tc.desc   : Verify media video optimize interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0360', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/canvas_media/video_optimize/videoOptimize36');
      await driver.waitForIdle(500, 2000);
      
      try {
        // 重复5次操作
        for (let i = 0; i < 5; i++) {
          console.info(`TEST_0360: 开始第${i + 1}次重复操作`);
          
          // 1、切换成视频源video4
          console.info(`TEST_0360: 第${i + 1}次 - 开始查找切换视频源按钮 (switchButton_36)`);
          let switchButton: Component = await driver.waitForComponent(ON.id('switchButton_36'), 1000);
          console.info(`TEST_0360: 第${i + 1}次 - 成功找到切换视频源按钮，开始点击`);
          await switchButton.click();
          console.info(`TEST_0360: 第${i + 1}次 - 切换视频源按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          // 2、停止播放
          console.info(`TEST_0360: 第${i + 1}次 - 开始查找停止播放按钮 (stopButton_36)`);
          let stopButton: Component = await driver.waitForComponent(ON.id('stopButton_36'), 1000);
          console.info(`TEST_0360: 第${i + 1}次 - 成功找到停止播放按钮，开始点击`);
          await stopButton.click();
          console.info(`TEST_0360: 第${i + 1}次 - 停止播放按钮点击完成`);
          await driver.waitForIdle(500, 2000);
          
          console.info(`TEST_0360: 第${i + 1}次重复操作完成`);
        }
        
        console.info('TEST_0360: 所有重复操作完成，开始截图');
        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0360');
        await Utils.sleep(1000);
        
        console.info('TEST_0360: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0360: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0360: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });
  });
}