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

export default function refreshTest() {

  describe('refreshTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err: BusinessError) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_REFRESH_INTERCONNECTION_0020
     * @tc.name   : Refresh nested Swiper test - loop true without edge
     * @tc.desc   : Verify other refresh interconnection interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_INTERCONNECTION_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_REFRESH_INTERCONNECTION_0020 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/scenario/misc/other/refresh/refreshInterconnection01');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - Refresh嵌套Swiper应该正常显示
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_INTERCONNECTION_0020_01');
      
      // 步骤2: 测试Swiper下一页功能
      let nextButton: Component = await driver.waitForComponent(ON.id('refreshInterconnection01_01'), 1000);
      await nextButton.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_INTERCONNECTION_0020_02');
      
      // 步骤3: 测试Swiper上一页功能
      let prevButton: Component = await driver.waitForComponent(ON.id('refreshInterconnection01_02'), 1000);
      await prevButton.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_INTERCONNECTION_0020_03');
      
      // 步骤4: 测试Refresh功能
      let refreshButton: Component = await driver.waitForComponent(ON.id('refreshInterconnection01_03'), 1000);
      await refreshButton.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_INTERCONNECTION_0020_04');
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_REFRESH_INTERCONNECTION_0020 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0010
     * @tc.name   : Refresh pullDownRatio 0 test - cannot pull down or up
     * @tc.desc   : Verify refresh pulldownradio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0010 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/scenario/misc/other/refresh/refreshPullDownRatio01');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - pullDownRatio为0时应该无法下拉
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0010_01');
      
      // 步骤2: 测试下拉操作 - 应该无法下拉
      await driver.swipe(200, 100, 200, 300, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0010_02');
      
      // 步骤3: 测试上滑操作 - 应该无法上滑
      await driver.swipe(200, 300, 200, 100, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0010_03');
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0010 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0050
     * @tc.name   : Refresh pullDownRatio 1 test - can follow hand pull down and up
     * @tc.desc   : Verify refresh pulldownradio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0050 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/scenario/misc/other/refresh/refreshPullDownRatio05');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - pullDownRatio为1时应该可以跟手下拉
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0050_01');
      
      // 步骤2: 测试下拉操作 - 应该可以跟手下拉
      await driver.swipe(200, 100, 200, 300, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0050_02');
      
      // 步骤3: 测试上滑操作 - 应该可以跟手上滑
      await driver.swipe(200, 300, 200, 100, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0050_03');
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0050 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0020
     * @tc.name   : Refresh pullDownRatio 0.1 test - high resistance when pulling
     * @tc.desc   : Verify refresh pulldownradio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0020 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/scenario/misc/other/refresh/refreshPullDownRatio02');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - pullDownRatio为0.1时应该有很大阻力
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0020_01');
      
      // 步骤2: 测试下拉操作 - 应该有很大阻力
      await driver.swipe(200, 100, 200, 300, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0020_02');
      
      // 步骤3: 测试上滑操作 - 应该有很大阻力
      await driver.swipe(200, 300, 200, 100, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0020_03');
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0020 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0040
     * @tc.name   : Refresh pullDownRatio 0.9 test - normal pull down and up
     * @tc.desc   : Verify refresh pulldownradio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0040 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/scenario/misc/other/refresh/refreshPullDownRatio04');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - pullDownRatio为0.9时应该可以正常下拉
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0040_01');
      
      // 步骤2: 测试下拉操作 - 应该可以正常下拉
      await driver.swipe(200, 100, 200, 300, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0040_02');
      
      // 步骤3: 测试上滑操作 - 应该可以正常上滑
      await driver.swipe(200, 300, 200, 100, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0040_03');
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0040 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0030
     * @tc.name   : Refresh pullDownRatio 0.5 test - normal pull down and up
     * @tc.desc   : Verify refresh pulldownradio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0030 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/scenario/misc/other/refresh/refreshPullDownRatio03');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - pullDownRatio为0.5时应该可以正常下拉
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0030_01');
      
      // 步骤2: 测试下拉操作 - 应该可以正常下拉
      await driver.swipe(200, 100, 200, 300, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0030_02');
      
      // 步骤3: 测试上滑操作 - 应该可以正常上滑
      await driver.swipe(200, 300, 200, 100, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0030_03');
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0030 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0180
     * @tc.name   : Refresh default dynamic pullDownRatio test - resistance increases with pull distance
     * @tc.desc   : Verify refresh pulldownradio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0180 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/scenario/misc/other/refresh/refreshPullDownRatio06');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - 默认使用动态下拉跟手系数
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0180_01');
      
      // 步骤2: 测试下拉操作 - 下拉距离越大，阻力越大
      await driver.swipe(200, 100, 200, 300, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0180_02');
      
      // 步骤3: 测试上滑操作 - 上滑距离越大，阻力越大
      await driver.swipe(200, 300, 200, 100, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0180_03');
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_REFRESH_PULLDOWNRADIO_0180 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_REFRESH_ABILITY_0010
     * @tc.name   : Refresh pullToRefresh false test - cannot pull down to refresh
     * @tc.desc   : Verify other refresh ability interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_ABILITY_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_REFRESH_ABILITY_0010 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/scenario/misc/other/refresh/refreshPullToRefresh01');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - pullToRefresh为false时应该无法下拉刷新
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_ABILITY_0010_01');
      
      // 步骤2: 测试下拉操作 - 应该无法下拉刷新
      await driver.swipe(200, 100, 200, 300, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_ABILITY_0010_02');
      
      // 步骤3: 测试上滑操作 - 应该无法上滑刷新
      await driver.swipe(200, 300, 200, 100, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_ABILITY_0010_03');
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_REFRESH_ABILITY_0010 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0140
     * @tc.name   : Refresh custom builder refresh component test - custom text display
     * @tc.desc   : Verify other refresh prompttext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0140 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/scenario/misc/other/refresh/refreshPromptText01');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - 自定义builder刷新组件应该正常显示
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0140_01');
      
      // 步骤2: 测试下拉操作 - 自定义文本应该正常显示
      await driver.swipe(200, 100, 200, 300, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0140_02');
      
      // 步骤3: 测试上滑操作 - 自定义文本应该正常显示
      await driver.swipe(200, 300, 200, 100, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0140_03');
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0140 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0130
     * @tc.name   : Refresh custom text and bounce animation test - text fades during bounce
     * @tc.desc   : Verify other refresh prompttext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0130 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/scenario/misc/other/refresh/refreshPromptText02');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - 自定义文本应该正常显示
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0130_01');
      
      // 步骤2: 测试下拉操作 - 自定义文本应该显示
      await driver.swipe(200, 100, 200, 300, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0130_02');
      
      // 步骤3: 测试上滑操作 - 自定义文本应该显示
      await driver.swipe(200, 300, 200, 100, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0130_03');
      
      // 步骤4: 测试回弹过程 - 文本应该由大变小，颜色渐变透明消失
      await driver.swipe(200, 100, 200, 200, 300);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0130_04');
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0130 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0190
     * @tc.name   : Refresh nested List with custom text test - text display normal
     * @tc.desc   : Verify other refresh prompttext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0190 start.`);
      
      // 创建测试窗口
      Settings.createWindow('testability/pages/scenario/misc/other/refresh/refreshPromptText03');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - Refresh嵌套List和自定义文本应该正常显示
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0190_01');
      
      // 步骤2: 测试下拉操作 - 自定义文本应该正常显示
      await driver.swipe(200, 100, 200, 300, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0190_02');
      
      // 步骤3: 测试上滑操作 - 自定义文本应该正常显示
      await driver.swipe(200, 300, 200, 100, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0190_03');
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_REFRESH_PROMPTTEXT_0190 finish.`);
      done();
    });
  })
}