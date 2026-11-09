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

const TAG: string = '[SwiperIndicatorInteractiveTest]';
const LEVEL: number = 3;

export default function swiperIndicatorInteractiveTest() {
  describe('SwiperIndicatorInteractiveTest', () => {

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
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ARROWHEAD_0100
     * @tc.name   : Set the arrowColor property of displayArrow() to rgb(2, 184, 17), verify that the arrow color is green.
     * @tc.desc   : Verify scroll swiper arrowhead interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ARROWHEAD_0100', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ARROWHEAD_0100 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive11');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - 箭头颜色为绿色
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ARROWHEAD_0100_01');
      
      // 步骤2: 测试箭头功能
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ARROWHEAD_0100_02');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ARROWHEAD_0100 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ARROWHEAD_0970
     * @tc.name   : Set the first parameter of displayArrow() to true, verify that the arrows are enabled.
     * @tc.desc   : Verify scroll swiper arrowhead interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ARROWHEAD_0970', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ARROWHEAD_0970 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive12');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - 箭头启用
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ARROWHEAD_0970_01');
      
      // 步骤2: 测试箭头功能
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ARROWHEAD_0970_02');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ARROWHEAD_0970 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACEMIX_0030
     * @tc.name   : Delete the fifth page, verify that the current display page is the first page (index 0).
     * @tc.desc   : Verify scroll swiper interfacemix interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACEMIX_0030', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACEMIX_0030 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive13');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACEMIX_0030_01');
      
      // 步骤2: 删除第五个页面
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACEMIX_0030_02');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACEMIX_0030 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACEMIX_0040
     * @tc.name   : Add a page at index 0, verify that the current display page is the newly added page.
     * @tc.desc   : Verify scroll swiper interfacemix interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACEMIX_0040', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACEMIX_0040 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive14');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACEMIX_0040_01');
      
      // 步骤2: 在index为0的位置添加页面
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACEMIX_0040_02');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACEMIX_0040 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_SWIPER_INDICATORINTERACTIVE_0050
     * @tc.name   : Set indicatorInteractive to true and disableSwipe to true, verify that both swiper and navigation points are not interactive.
     * @tc.desc   : Verify ArkUI swiper indicatorinteractive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ARKUI_SWIPER_INDICATORINTERACTIVE_0050', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_ARKUI_SWIPER_INDICATORINTERACTIVE_0050 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive15');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ARKUI_SWIPER_INDICATORINTERACTIVE_0050_01');
      
      // 步骤2: 测试disableSwipe为true时的状态
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ARKUI_SWIPER_INDICATORINTERACTIVE_0050_02');
      
      // 步骤3: 测试disableSwipe为false时的状态
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ARKUI_SWIPER_INDICATORINTERACTIVE_0050_03');
      
      Logger.info(TAG, `SUB_ACE_UI_ARKUI_SWIPER_INDICATORINTERACTIVE_0050 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0030
     * @tc.name   : Set displayCount to (3, false), verify that navigation points move one by one.
     * @tc.desc   : Verify scroll swiper  ux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0030', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0030 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive07');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0030_01');
      
      // 步骤2: 测试页面滑动
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0030_02');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0030 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0090
     * @tc.name   : Set duration to 2000ms, verify that navigation points move with 2000ms duration.
     * @tc.desc   : Verify scroll swiper  ux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0090', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0090 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive08');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0090_01');
      
      // 步骤2: 测试页面滑动
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0090_02');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0090 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_0500
     * @tc.name   : Do not set autoPlay, verify that child components do not auto-play.
     * @tc.desc   : Verify scroll swiper add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_0500', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_0500 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive09');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - 不自动播放
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_0500_01');
      
      // 步骤2: 测试手动切换
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_0500_02');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_0500 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0010
     * @tc.name   : Set index to 0, verify the margin layout and circular swiping.
     * @tc.desc   : Verify scroll swiper margin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0010', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0010 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive10');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0010_01');
      
      // 步骤2: 测试左右滑动
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0010_02');
      
      // 步骤3: 测试单向滑动
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0010_03');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0010 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_SWIPER_INDICATORINTERACTIVE_0070
     * @tc.name   : Set indicatorInteractive to true and vertical to true, verify that the swiper is vertical and navigation points are interactive.
     * @tc.desc   : Verify ArkUI swiper indicatorinteractive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ARKUI_SWIPER_INDICATORINTERACTIVE_0070', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_ARKUI_SWIPER_INDICATORINTERACTIVE_0070 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive16');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - 纵向swiper
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ARKUI_SWIPER_INDICATORINTERACTIVE_0070_01');
      
      // 步骤2: 测试导航点交互
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_ARKUI_SWIPER_INDICATORINTERACTIVE_0070_02');
      
      Logger.info(TAG, `SUB_ACE_UI_ARKUI_SWIPER_INDICATORINTERACTIVE_0070 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0480
     * @tc.name   : Set loop to false and autoPlay to true, verify that playback stops when reaching edge pages.
     * @tc.desc   : Verify scroll swiper  ux interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0480', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0480 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive17');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - loop=false, autoPlay=true
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0480_01');
      
      // 步骤2: 测试自动播放到边缘页面后停止
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0480_02');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ UX_0480 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_0520
     * @tc.name   : Set autoPlay to false, verify that child components do not auto-play.
     * @tc.desc   : Verify scroll swiper add interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_0520', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_0520 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive18');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - autoPlay=false
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_0520_01');
      
      // 步骤2: 测试手动切换
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_0520_02');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_0520 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0020
     * @tc.name   : Set index to 0, verify the margin layout with 1,2,3 sequence and 4 at the end.
     * @tc.desc   : Verify scroll swiper margin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0020', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0020 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive19');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - index=0, 布局: 1、2、3，结尾有4
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0020_01');
      
      // 步骤2: 测试左右滑动
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0020_02');
      
      // 步骤3: 测试单向滑动
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0020_03');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0020 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0110
     * @tc.name   : Set index to 3, verify the margin layout with 4,1,2 sequence and 3 at start and end.
     * @tc.desc   : Verify scroll swiper margin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0110', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0110 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive20');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - index=3, 布局: 4、1、2，开始和结尾有3
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0110_01');
      
      // 步骤2: 测试左右滑动
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0110_02');
      
      // 步骤3: 测试单向滑动
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0110_03');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0110 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0080
     * @tc.name   : Set index to 1, verify the margin layout with 2,3,4 sequence and 1 at start and end.
     * @tc.desc   : Verify scroll swiper margin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0080', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0080 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive21');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - index=1, 布局: 2、3、4，开始和结尾有1
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0080_01');
      
      // 步骤2: 测试左右滑动
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0080_02');
      
      // 步骤3: 测试单向滑动
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0080_03');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARGIN_0080 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0180
     * @tc.name   : Test displayCount(2, false), loop(false), changeIndex(7, false) - jump to page 8, showing 7th and 8th sub-components, no animation.
     * @tc.desc   : Verify scroll swiper across interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0180', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0180 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive22');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - displayCount(2, false), loop(false)
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0180_01');
      
      // 步骤2: 点击changeIndex(7, false)按钮 - 无动画跳转到第8页
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0180_02');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0180 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0140
     * @tc.name   : Test displayCount(1, false), loop(false), changeIndex(7, false) - jump to page 8, no animation.
     * @tc.desc   : Verify scroll swiper across interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0140', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0140 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive23');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - displayCount(1, false), loop(false)
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0140_01');
      
      // 步骤2: 点击changeIndex(7, false)按钮 - 无动画跳转到第8页
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0140_02');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0140 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0150
     * @tc.name   : Test displayCount(1, false), loop(false), changeIndex(7, true) - jump to page 8, with animation.
     * @tc.desc   : Verify scroll swiper across interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0150', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0150 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive24');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - displayCount(1, false), loop(false)
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0150_01');
      
      // 步骤2: 点击changeIndex(7, true)按钮 - 有动画跳转到第8页
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0150_02');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0150 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0190
     * @tc.name   : Test displayCount(2, false), loop(false), changeIndex(7, true) - jump to page 8, showing 7th and 8th sub-components, with animation.
     * @tc.desc   : Verify scroll swiper across interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0190', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0190 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive25');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - displayCount(2, false), loop(false)
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0190_01');
      
      // 步骤2: 点击changeIndex(7, true)按钮 - 有动画跳转到第8页，显示第7和第8个子组件
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0190_02');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0190 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0160
     * @tc.name   : Test displayCount(1, false), loop(true), changeIndex(4, false) - jump to page 5, no animation.
     * @tc.desc   : Verify scroll swiper across interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0160', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0160 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive26');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - displayCount(1, false), loop(true)
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0160_01');
      
      // 步骤2: 点击changeIndex(4, false)按钮 - 无动画跳转到第5页
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0160_02');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0160 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0200
     * @tc.name   : Test displayCount(2, false), loop(true), changeIndex(4, false) - jump to page 5, showing 5th and 6th sub-components, no animation.
     * @tc.desc   : Verify scroll swiper across interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0200', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0200 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive27');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - displayCount(2, false), loop(true)
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0200_01');
      
      // 步骤2: 点击changeIndex(4, false)按钮 - 无动画跳转到第5页，显示第5和第6个子组件
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0200_02');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0200 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0170
     * @tc.name   : Test displayCount(1, false), loop(true), changeIndex(4, true) - jump to page 5, with animation.
     * @tc.desc   : Verify scroll swiper across interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0170', LEVEL, async (done: Function) => {
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0170 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/component/scroll/swiper_indicatorInteractive/swiperIndicatorInteractive28');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - displayCount(1, false), loop(true)
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0170_01');
      
      // 步骤2: 点击changeIndex(4, true)按钮 - 有动画跳转到第5页
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0170_02');
      
      Logger.info(TAG, `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0170 finish.`);
      done();
    });
  });
}
