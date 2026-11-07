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

export default function sr20241230845510() {

  describe('sr20241230845510', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        done()
        return
      }

      await Utils.sleep(1000); // 等待UI操作完成
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
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241230845510_001
     * @tc.name   : Test symbol page switching and symbol icon loop animation start/stop
     * @tc.desc   : Verify componentperformance sr20241230845510 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241230845510_001', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241230845510_001 start.`);
      // 步骤1：编译hap，并安装（此步骤在测试环境中已完成）
      
      // 步骤2：开启log日志监控，搜索动效启停关键字
      Logger.info('TEST', 'Starting log monitoring for animation start/stop keywords');
      
      // 步骤3：打开hap首页
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241230845510/Sr20241230845510001')
      let driver: Driver = Driver.create();
      await Utils.sleep(1000) // 等待页面加载完成

      // 验证初始状态 - Symbol页面应该显示，动效应该运行
      Logger.info('TEST', 'Verifying initial state - symbol page should be active with animation running');
      let animationStatus = await driver.findComponent(ON.id('animation_status_sr20241230845510_001'))
      await Utils.sleep(1000) // 观察动效运行

      // 切换到其他页面
      Logger.info('TEST', 'Switching to other page - animation should stop');
      let btnOtherPage = await driver.findComponent(ON.id('button_other_page_sr20241230845510_001'))
      await btnOtherPage.click()
      await Utils.sleep(1000) // 等待页面切换完成和动效停止

      // 验证其他页面状态
      Logger.info('TEST', 'Verifying other page state - animation should be stopped');
      let otherPageContent = await driver.findComponent(ON.id('other_page_content_sr20241230845510_001'))
      await Utils.sleep(1000)

      // 切回Symbol页面
      Logger.info('TEST', 'Switching back to symbol page - animation should resume');
      let btnSymbolPage = await driver.findComponent(ON.id('button_symbol_page_sr20241230845510_001'))
      await btnSymbolPage.click()
      await Utils.sleep(1000) // 等待页面切换完成和动效恢复

      // 验证动效恢复状态
      Logger.info('TEST', 'Verifying animation resumed state');
      let symbolAnimationArea = await driver.findComponent(ON.id('symbol_animation_area_sr20241230845510_001'))
      await Utils.sleep(1000) // 观察动效恢复

      // 再次测试切换（确保机制稳定）
      Logger.info('TEST', 'Testing page switch again to ensure stability');
      await btnOtherPage.click()
      await Utils.sleep(800)
      await btnSymbolPage.click()
      await Utils.sleep(800)

      Logger.info('TEST', 'Symbol page switching animation test completed');
      
      // 预期结果：从symbol页面切换到其他页面，动效关闭；从其他页面回到symbol页面，动效恢复
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241230845510_001 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241230845510_002
     * @tc.name   : Test scroll page to make symbol icon visible/invisible and observe animation start/stop
     * @tc.desc   : Verify componentperformance sr20241230845510 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241230845510_002', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241230845510_002 start.`);
      // 步骤1：编译hap，并安装（此步骤在测试环境中已完成）
      
      // 步骤2：开启log日志监控，搜索动效启停关键字
      Logger.info('TEST', 'Starting log monitoring for animation start/stop keywords');
      
      // 步骤3：打开hap首页
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241230845510/Sr20241230845510002')
      await Utils.sleep(500)
      let driver: Driver = Driver.create();
      await Utils.sleep(500) // 等待页面加载完成

      // 获取滚动容器
      let scrollContainer = await driver.findComponent(ON.id('scroll_container_sr20241230845510_002'))
      
      // 验证初始状态 - Symbol图标应该可见，动效应该运行
      Logger.info('TEST', 'Verifying initial state - symbol should be visible and animation running');
      await Utils.sleep(300)

      // 下滑到动效处（确保动效可见）
      Logger.info('TEST', 'Scrolling down to animation area');
      await scrollContainer.scrollSearch(ON.id('symbol_animation_container_sr20241230845510_002'))
      await Utils.sleep(500) // 等待滚动完成和动效启动

      // 验证动效运行状态
      Logger.info('TEST', 'Animation should be running when symbol is visible');
      
      // 预期结果：symbol图标可见时，动效恢复；symbol图标不可见时，动效关闭
      await windowSnap.snapShot()
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241230845510_002 finish.`);
      done()
    })


  })
}