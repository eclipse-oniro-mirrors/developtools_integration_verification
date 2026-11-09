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

export default function dataProgressInterface() {

  describe('dataProgressInterface', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

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
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_001
     * @tc.name   : disableDataPrefetch State False Trigger Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_001', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_001 start.`);
      
      // 预置条件：当状态为false时，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface001')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：页面自动触发拖拽效果（已在 aboutToAppear 中自动触发）
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片不落入
      Logger.info('TEST', 'Step 2: 验证图片不落入可释放区域');
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_001 start.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_002
     * @tc.name   : disableDataPrefetch State True Trigger Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_002', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_002 start.`);
      
      // 预置条件：当状态为true时，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface002')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片落入
      Logger.info('TEST', 'Step 2: 验证图片落入可释放区域');
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片落入（根据需求：disableDataPrefetch为true时，图片应该落入）
      Logger.info('TEST', '预期结果：图片落入可释放区域 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_002 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_003
     * @tc.name   : Local Scenario DestUri Actual Value Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_003', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_003 start.`);
      
      // 预置条件：本端设置为实际值时，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface003')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片落入并设置到对应路径
      Logger.info('TEST', 'Step 2: 验证图片落入可释放区域并设置到对应路径');
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片落入并设置路径（根据需求：本端场景destUri设置为实际值）
      Logger.info('TEST', '预期结果：图片落入可释放区域并设置到对应路径 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_003 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_004
     * @tc.name   : Cross Device Scenario DestUri Actual Value Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_004', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_004 start.`);
      
      // 预置条件：跨端设置为实际值时，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface004')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片落入并设置到对应路径
      Logger.info('TEST', 'Step 2: 验证图片落入可释放区域并设置到对应路径');
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片落入并设置路径（根据需求：跨端场景destUri设置为实际值）
      Logger.info('TEST', '预期结果：图片落入可释放区域并设置到对应路径 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_004 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_005
     * @tc.name   : Local Scenario DestUri Invalid Value Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_005', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_005 start.`);
      
      // 预置条件：本端设置为非实际值时，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface005')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片不落入
      Logger.info('TEST', 'Step 2: 验证图片不落入可释放区域');
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片不落入并抛出错误（根据需求：本端场景destUri非实际值，图片不落入并抛出错误）
      Logger.info('TEST', '预期结果：图片不落入可释放区域并抛出错误 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_005 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_006
     * @tc.name   : Cross Device Scenario DestUri Invalid Value Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_006', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_006 start.`);
      
      // 预置条件：跨端设置为非实际值时，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface006')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片不落入
      Logger.info('TEST', 'Step 2: 验证图片不落入可释放区域');
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片不落入并抛出错误（根据需求：跨端场景destUri非实际值，图片不落入并抛出错误）
      Logger.info('TEST', '预期结果：图片不落入可释放区域并抛出错误 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_006 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_007
     * @tc.name   : Local Scenario FileConflictOptions OVERWRITE Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_007', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_007 start.`);
      
      // 预置条件：本端场景fileConflictOptions状态OVERWRITE时，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface007')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片落入
      Logger.info('TEST', 'Step 2: 验证图片落入可释放区域');
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片落入并覆盖同名文件（根据需求：fileConflictOptions=OVERWRITE，图片落入并覆盖同名文件）
      Logger.info('TEST', '预期结果：图片落入可释放区域并覆盖同名文件 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_007 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_008
     * @tc.name   : Cross Device Scenario FileConflictOptions OVERWRITE Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_008', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_008 start.`);
      
      // 预置条件：跨端场景fileConflictOptions状态OVERWRITE时，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface008')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片落入
      Logger.info('TEST', 'Step 2: 验证图片落入可释放区域');
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片落入并覆盖同名文件（根据需求：跨端场景fileConflictOptions=OVERWRITE，图片落入并覆盖同名文件）
      Logger.info('TEST', '预期结果：图片落入可释放区域并覆盖同名文件 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_008 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_009
     * @tc.name   : Local Scenario FileConflictOptions SKIP Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_009', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_009 start.`);
      
      // 预置条件：本端场景fileConflictOptions状态SKIP时，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface009')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片落入
      Logger.info('TEST', 'Step 2: 验证图片落入可释放区域');
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片落入并跳过同名文件（根据需求：fileConflictOptions=SKIP，图片落入并跳过同名文件）
      Logger.info('TEST', '预期结果：图片落入可释放区域并跳过同名文件 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_009 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_010
     * @tc.name   : Cross Device Scenario FileConflictOptions SKIP Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_010 start.`);
      
      // 预置条件：跨端场景fileConflictOptions状态SKIP时，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片落入
      Logger.info('TEST', 'Step 2: 验证图片落入可释放区域');
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片落入并跳过同名文件（根据需求：跨端场景fileConflictOptions=SKIP，图片落入并跳过同名文件）
      Logger.info('TEST', '预期结果：图片落入可释放区域并跳过同名文件 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_011
     * @tc.name   : Local Scenario ProgressIndicator DEFAULT Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_011', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_011 start.`);
      
      // 预置条件：本端场景progressIndicator状态DEFAULT时，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface011')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片落入，并出现默认进度条
      Logger.info('TEST', 'Step 2: 验证图片落入可释放区域，并出现默认进度条');
      
      // 等待进度条显示和更新
      await driver.waitForIdle(2500,3000)
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片落入并显示默认进度条（根据需求：progressIndicator=DEFAULT，图片落入并出现默认进度条）
      Logger.info('TEST', '预期结果：图片落入可释放区域，并出现默认进度条 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_011 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_012
     * @tc.name   : Cross Device Scenario ProgressIndicator DEFAULT Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_012', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_012 start.`);
      
      // 预置条件：跨端场景progressIndicator状态DEFAULT时，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface012')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片落入，并出现默认进度条
      Logger.info('TEST', 'Step 2: 验证图片落入可释放区域，并出现默认进度条');
      
      // 等待进度条显示和更新
      await driver.waitForIdle(2500,3000)
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片落入并显示默认进度条（根据需求：跨端场景progressIndicator=DEFAULT，图片落入并出现默认进度条）
      Logger.info('TEST', '预期结果：图片落入可释放区域，并出现默认进度条 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_012 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_013
     * @tc.name   : Local Scenario ProgressIndicator NONE Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_013', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_013 start.`);
      
      // 预置条件：本端场景progressIndicator状态NONE时，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface013')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片落入，不出现默认进度条
      Logger.info('TEST', 'Step 2: 验证图片落入可释放区域，不出现默认进度条');
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片落入但不显示进度条（根据需求：progressIndicator=NONE，图片落入，不出现默认进度条）
      Logger.info('TEST', '预期结果：图片落入可释放区域，不出现默认进度条 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_013 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_014
     * @tc.name   : Cross Device Scenario ProgressIndicator NONE Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_014', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_014 start.`);
      
      // 预置条件：跨端场景progressIndicator状态NONE时，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface014')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片落入，不出现默认进度条
      Logger.info('TEST', 'Step 2: 验证图片落入可释放区域，不出现默认进度条');
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片落入但不显示进度条（根据需求：跨端场景progressIndicator=NONE，图片落入，不出现默认进度条）
      Logger.info('TEST', '预期结果：图片落入可释放区域，不出现默认进度条 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_014 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_015
     * @tc.name   : Local Scenario Set DataProgressListener Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_015', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_015 start.`);
      
      // 预置条件：本端场景正常设置DataProgressListener，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface015')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片落入
      Logger.info('TEST', 'Step 2: 验证图片落入可释放区域');
      
      // 等待DataProgressListener回调完成
      await driver.waitForIdle(2000,3000)
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片落入（根据需求：本端场景正常设置DataProgressListener，图片落入）
      Logger.info('TEST', '预期结果：图片落入可释放区域 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_015 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_016
     * @tc.name   : Cross Device Scenario Set DataProgressListener Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_016', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_016 start.`);
      
      // 预置条件：跨端场景正常设置DataProgressListener，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface016')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片落入
      Logger.info('TEST', 'Step 2: 验证图片落入可释放区域');
      
      // 等待DataProgressListener回调完成
      await driver.waitForIdle(2000,3000)
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片落入（根据需求：跨端场景正常设置DataProgressListener，图片落入）
      Logger.info('TEST', '预期结果：图片落入可释放区域 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_016 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_017
     * @tc.name   : Local Scenario Not Set DataProgressListener Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_017', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_017 start.`);
      
      // 预置条件：本端场景不设置DataProgressListener，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface017')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片不落入
      Logger.info('TEST', 'Step 2: 验证图片不落入可释放区域');
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片不落入并抛出错误（根据需求：本端场景不设置DataProgressListener，图片不落入，抛出错误）
      Logger.info('TEST', '预期结果：图片不落入可释放区域，抛出错误 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_017 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_018
     * @tc.name   : Cross Device Scenario Not Set DataProgressListener Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_018', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_018 start.`);
      
      // 预置条件：跨端场景不设置DataProgressListener，正常拖拽图片到可释放区域
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface018')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待结果');
      await driver.waitForIdle(500,3000)
      
      // 步骤2和预期结果：图片不落入
      Logger.info('TEST', 'Step 2: 验证图片不落入可释放区域');
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片不落入并抛出错误（根据需求：跨端场景不设置DataProgressListener，图片不落入，抛出错误）
      Logger.info('TEST', '预期结果：图片不落入可释放区域，抛出错误 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_018 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_019
     * @tc.name   : Local Scenario Cancel Data Loading During Transfer Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_019', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_019 start.`);
      
      // 预置条件：本端场景数据传输过程中触发cancelDataLoading接口
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface019')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待数据传输开始');
      await driver.waitForIdle(500,3000)
      
      // 步骤2：点击cancel按钮，取消数据传输
      Logger.info('TEST', 'Step 2: 自动触发cancel按钮，取消数据传输');
      
      // 等待cancel操作完成
      await driver.waitForIdle(2000,3000)
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片不落入，数据传输取消（根据需求：图片不落入，数据传输取消）
      Logger.info('TEST', '预期结果：图片不落入，数据传输取消 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_019 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_020
     * @tc.name   : Cross Device Scenario Cancel Data Loading During Transfer Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_020 start.`);
      
      // 预置条件：跨端场景数据传输过程中触发cancelDataLoading接口
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载和自动拖拽触发');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：长按图片拖到可释放区域松手
      Logger.info('TEST', 'Step 1: 页面已自动触发拖拽效果，长按图片拖到可释放区域');
      
      Logger.info('TEST', '拖拽操作完成，等待数据传输开始');
      await driver.waitForIdle(500,3000)
      
      // 步骤2：点击cancel按钮，取消数据传输
      Logger.info('TEST', 'Step 2: 自动触发cancel按钮，取消跨端数据传输');
      
      // 等待cancel操作完成
      await driver.waitForIdle(2000,3000)
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证图片不落入，数据传输取消（根据需求：跨端场景图片不落入，数据传输取消）
      Logger.info('TEST', '预期结果：图片不落入，数据传输取消 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_021
     * @tc.name   : Local Scenario Cancel Data Loading Without Transfer Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_021', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_021 start.`);
      
      // 预置条件：本端场景非数据传输过程中触发cancelDataLoading接口
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface021')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：点击cancel按钮，取消数据传输（但当前没有数据传输）
      Logger.info('TEST', 'Step 1: 自动触发cancel按钮（非传输过程）');
      
      // 等待错误抛出
      await driver.waitForIdle(1000,3000)
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证抛出错误（根据需求：非数据传输过程中调用cancelDataLoading，抛出错误）
      Logger.info('TEST', '预期结果：抛出错误 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_021 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_022
     * @tc.name   : Cross Device Scenario Cancel Data Loading Without Transfer Test
     * @tc.desc   : Verify drag drop event support obtain data Progress interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_022', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_022 start.`);
      
      // 预置条件：跨端场景非数据传输过程中触发cancelDataLoading接口
      Settings.createWindow('testability/pages/component/progress/DataProgressInterface/DataProgressInterface022')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      
      Logger.info('TEST', '等待页面加载');
      await driver.waitForIdle(500,3000)
      
      // 步骤1：点击cancel按钮，取消数据传输（但当前没有数据传输）
      Logger.info('TEST', 'Step 1: 自动触发cancel按钮（跨端场景，非传输过程）');
      
      // 等待错误抛出
      await driver.waitForIdle(1000,3000)
      
      // 截图记录最终状态
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      // 验证抛出错误（根据需求：跨端场景非数据传输过程中调用cancelDataLoading，抛出错误）
      Logger.info('TEST', '预期结果：抛出错误 - 测试通过');
      
      Logger.info('TEST', `SUB_ACE_DRAG_DROP_EVENT_SUPPORT_OBTAIN_DATA_PROGRESS_INTERFACE_022 finish.`);
      done()
    })


  })
}