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

export default function sr20241118811498() {

  describe('sr20241118811498', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        done()
        return
      }

      await Utils.sleep(2000); // 等待所有UI操作完成，避免并发问题
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
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811498_001
     * @tc.name   : Grid component predict algorithm optimization
     * @tc.desc   : Verify componentperformance sr20241118811498 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811498_001', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811498_001 start.`);
      // 步骤1：编译hap，并安装（此步骤在测试环境中已完成）
      
      // 步骤2：开启trace采集，应用冷启动
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811498/Sr20241118811498001')
      await Utils.sleep(500)
      let driver: Driver = Driver.create();
      await Utils.sleep(500) // 等待应用冷启动完成

      // 步骤3：点击Grid按钮
      let btnGrid = await driver.findComponent(ON.id('button_grid_sr20241118811498_001'))
      await btnGrid.click()
      await Utils.sleep(500) // 等待Grid显示

      // 获取Grid组件，使用waitForComponent等待组件出现
      let gridContainer = await driver.waitForComponent(ON.id('grid_container_sr20241118811498_001'), 2000)
      
      // 使用swipe方法进行滑动操作，避免scrollSearch在大数据量时超时
      Logger.info('TEST', 'Starting scroll operations');
      // 下滑操作 - 使用swipe模拟滑动
      await driver.swipe(360, 800, 360, 300, 600)
      await Utils.sleep(300)
      Logger.info('TEST', 'Downward scroll completed');

      // 上滑操作
      await driver.swipe(360, 300, 360, 800, 600)
      await Utils.sleep(300)
      Logger.info('TEST', 'Upward scroll completed');

      // 步骤4：关闭trace采集，pull出trace，通过工具查看trace
      Logger.info('TEST', 'Grid predict algorithm test completed');
      
      // 预期结果：1.Trace解析查看frameround，是否存在0、1、2、3、4…..等节点
      // 2.查看阻塞时间是否优化20%
      await windowSnap.snapShot()
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811498_001 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811498_002
     * @tc.name   : List component predict algorithm optimization
     * @tc.desc   : Verify componentperformance sr20241118811498 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811498_002', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811498_002 start.`);
      // 步骤1：编译hap，并安装（此步骤在测试环境中已完成）
      
      // 步骤2：开启trace采集，应用冷启动
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811498/Sr20241118811498002')
      await Utils.sleep(1000) // 等待窗口创建完成，避免并发调用问题
      let driver: Driver = Driver.create();
      await Utils.sleep(500) // 等待应用冷启动完成

      // 步骤3：点击List按钮
      let btnList = await driver.findComponent(ON.id('button_list_sr20241118811498_002'))
      await btnList.click()
      await Utils.sleep(500) // 等待List显示

      // 获取List组件，使用waitForComponent等待组件出现
      let listContainer = await driver.waitForComponent(ON.id('list_container_sr20241118811498_002'), 2000)
      
      // 使用swipe方法进行滑动操作，避免scrollSearch在大数据量时超时
      Logger.info('TEST', 'Starting scroll operations for List');
      // 下滑操作 - 使用swipe模拟滑动
      await driver.swipe(360, 800, 360, 300, 600)
      await Utils.sleep(300)
      Logger.info('TEST', 'List downward scroll completed');

      // 上滑操作
      await driver.swipe(360, 300, 360, 800, 600)
      await Utils.sleep(300)
      Logger.info('TEST', 'List upward scroll completed');

      // 步骤4：关闭trace采集，pull出trace，通过工具查看trace
      Logger.info('TEST', 'List predict algorithm test completed');
      
      // 预期结果：1.Trace解析查看frameround，是否存在0、1、2、3、4…..等节点
      // 2.查看阻塞时间是否优化20%
      await windowSnap.snapShot()
      await Utils.sleep(500)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811498_002 finish.`);
      done()
    })


  })
}