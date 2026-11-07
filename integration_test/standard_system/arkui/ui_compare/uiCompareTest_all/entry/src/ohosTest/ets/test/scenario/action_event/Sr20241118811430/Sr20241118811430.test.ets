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

export default function sr20241118811430() {

  describe('sr20241118811430', () => {
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
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811430_001
     * @tc.name   : Verify the time cost of setting the new commonibute attribute via the added API.
     * @tc.desc   : Verify componentperformance sr20241118811430 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811430_001', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_001 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811430/Sr20241118811430001')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：开启采集trace开关
      let btnStartTrace = await driver.findComponent(ON.id('button_start_trace_sr20241118811430_001'))
      await btnStartTrace.click()
      await Utils.sleep(500)

      // 步骤3：FrameNode的添加接口
      let btnAddFrameNode = await driver.findComponent(ON.id('button_add_framenode_sr20241118811430_001'))
      await btnAddFrameNode.click()
      await Utils.sleep(300)

      // 步骤4：组件创建/属性设置接口
      let btnCreateComponent = await driver.findComponent(ON.id('button_create_component_sr20241118811430_001'))
      await btnCreateComponent.click()
      await Utils.sleep(300)

      // 步骤5：修改属性设置
      let btnModifyAttributes = await driver.findComponent(ON.id('button_modify_attributes_sr20241118811430_001'))
      await btnModifyAttributes.click()
      await Utils.sleep(300)

      // 步骤6：FrameNode的删除接口
      let btnRemoveFrameNode = await driver.findComponent(ON.id('button_remove_framenode_sr20241118811430_001'))
      await btnRemoveFrameNode.click()
      await Utils.sleep(300)

      // 步骤7：关闭trace采集，pull出trace后，解析trace结果和基线版本数据对比
      let btnStopTrace = await driver.findComponent(ON.id('button_stop_trace_sr20241118811430_001'))
      await btnStopTrace.click()
      await Utils.sleep(500)

      // 预期结果：FrameNode的添加/删除/组件创建/属性设置接口，平均耗时不劣化
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_001 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811430_002
     * @tc.name   : Verify the time cost of setting the appendChild attribute via the added API.
     * @tc.desc   : Verify componentperformance sr20241118811430 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811430_002', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_002 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811430/Sr20241118811430002')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：开启采集trace开关
      let btnStartTrace = await driver.findComponent(ON.id('button_start_trace_sr20241118811430_002'))
      await btnStartTrace.click()
      await Utils.sleep(500)

      // 步骤3：FrameNode的appendChild添加接口
      let btnAppendChild = await driver.findComponent(ON.id('button_append_child_sr20241118811430_002'))
      await btnAppendChild.click()
      await Utils.sleep(300)

      // 步骤4：创建组件并appendChild
      let btnCreateAppend = await driver.findComponent(ON.id('button_create_append_sr20241118811430_002'))
      await btnCreateAppend.click()
      await Utils.sleep(300)

      // 步骤5：批量appendChild
      let btnBatchAppend = await driver.findComponent(ON.id('button_batch_append_sr20241118811430_002'))
      await btnBatchAppend.click()
      await Utils.sleep(300)

      // 步骤6：FrameNode的删除接口
      let btnRemoveFrameNode = await driver.findComponent(ON.id('button_remove_framenode_sr20241118811430_002'))
      await btnRemoveFrameNode.click()
      await Utils.sleep(300)

      // 步骤7：关闭trace采集，pull出trace后，解析trace结果和基线版本数据对比
      let btnStopTrace = await driver.findComponent(ON.id('button_stop_trace_sr20241118811430_002'))
      await btnStopTrace.click()
      await Utils.sleep(500)

      // 预期结果：FrameNode的添加/删除/组件创建/属性设置接口，平均耗时不劣化
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_002 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811430_003
     * @tc.name   : Verify the time cost of setting the getChild attribute via the added API.
     * @tc.desc   : Verify componentperformance sr20241118811430 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811430_003', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_003 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811430/Sr20241118811430003')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：开启采集trace开关
      let btnStartTrace = await driver.findComponent(ON.id('button_start_trace_sr20241118811430_003'))
      await btnStartTrace.click()
      await Utils.sleep(500)

      // 步骤3：FrameNode的添加接口
      let btnAddMultiple = await driver.findComponent(ON.id('button_add_multiple_sr20241118811430_003'))
      await btnAddMultiple.click()
      await Utils.sleep(300)

      // 步骤4：getChild获取子节点接口
      let btnGetChild = await driver.findComponent(ON.id('button_get_child_sr20241118811430_003'))
      await btnGetChild.click()
      await Utils.sleep(300)

      // 步骤5：遍历所有子节点
      let btnTraverse = await driver.findComponent(ON.id('button_traverse_children_sr20241118811430_003'))
      await btnTraverse.click()
      await Utils.sleep(300)

      // 步骤6：创建组件并添加
      let btnCreateComponent = await driver.findComponent(ON.id('button_create_component_sr20241118811430_003'))
      await btnCreateComponent.click()
      await Utils.sleep(300)

      // 步骤7：FrameNode的删除接口
      let btnRemoveFrameNode = await driver.findComponent(ON.id('button_remove_framenode_sr20241118811430_003'))
      await btnRemoveFrameNode.click()
      await Utils.sleep(300)

      // 步骤8：关闭trace采集，pull出trace后，解析trace结果和基线版本数据对比
      let btnStopTrace = await driver.findComponent(ON.id('button_stop_trace_sr20241118811430_003'))
      await btnStopTrace.click()
      await Utils.sleep(500)

      // 预期结果：FrameNode的添加/删除/组件创建/属性设置接口，平均耗时不劣化
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_003 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811430_004
     * @tc.name   : Verify the time cost of setting the insertChildAfter attribute via the added API.
     * @tc.desc   : Verify componentperformance sr20241118811430 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811430_004', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_004 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811430/Sr20241118811430004')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：开启采集trace开关
      let btnStartTrace = await driver.findComponent(ON.id('button_start_trace_sr20241118811430_004'))
      await btnStartTrace.click()
      await Utils.sleep(500)

      // 步骤3：添加初始FrameNode
      let btnAddInitial = await driver.findComponent(ON.id('button_add_initial_sr20241118811430_004'))
      await btnAddInitial.click()
      await Utils.sleep(300)

      // 步骤4：insertChildAfter插入节点接口
      let btnInsertAfter = await driver.findComponent(ON.id('button_insert_after_sr20241118811430_004'))
      await btnInsertAfter.click()
      await Utils.sleep(300)

      // 步骤5：批量insertChildAfter
      let btnBatchInsert = await driver.findComponent(ON.id('button_batch_insert_sr20241118811430_004'))
      await btnBatchInsert.click()
      await Utils.sleep(300)

      // 步骤6：创建组件并insertChildAfter
      let btnCreateInsert = await driver.findComponent(ON.id('button_create_insert_sr20241118811430_004'))
      await btnCreateInsert.click()
      await Utils.sleep(300)

      // 步骤7：FrameNode的删除接口
      let btnRemoveFrameNode = await driver.findComponent(ON.id('button_remove_framenode_sr20241118811430_004'))
      await btnRemoveFrameNode.click()
      await Utils.sleep(300)

      // 步骤8：关闭trace采集，pull出trace后，解析trace结果和基线版本数据对比
      let btnStopTrace = await driver.findComponent(ON.id('button_stop_trace_sr20241118811430_004'))
      await btnStopTrace.click()
      await Utils.sleep(500)

      // 预期结果：FrameNode的添加/删除/组件创建/属性设置接口，平均耗时不劣化
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_004 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811430_005
     * @tc.name   : Verify the time cost of setting the getChildNumber attribute via the added API.
     * @tc.desc   : Verify componentperformance sr20241118811430 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811430_005', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_005 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811430/Sr20241118811430005')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：开启采集trace开关
      let btnStartTrace = await driver.findComponent(ON.id('button_start_trace_sr20241118811430_005'))
      await btnStartTrace.click()
      await Utils.sleep(500)

      // 步骤3：添加多个FrameNode
      let btnAddMultiple = await driver.findComponent(ON.id('button_add_multiple_sr20241118811430_005'))
      await btnAddMultiple.click()
      await Utils.sleep(300)

      // 步骤4：getChildNumber获取子节点数量接口
      let btnGetChildNumber = await driver.findComponent(ON.id('button_get_child_number_sr20241118811430_005'))
      await btnGetChildNumber.click()
      await Utils.sleep(300)

      // 步骤5：频繁调用getChildNumber
      let btnFrequentGet = await driver.findComponent(ON.id('button_frequent_get_sr20241118811430_005'))
      await btnFrequentGet.click()
      await Utils.sleep(300)

      // 步骤6：创建组件并添加
      let btnCreateComponent = await driver.findComponent(ON.id('button_create_component_sr20241118811430_005'))
      await btnCreateComponent.click()
      await Utils.sleep(300)

      // 步骤7：删除节点并获取数量
      let btnRemoveGetCount = await driver.findComponent(ON.id('button_remove_get_count_sr20241118811430_005'))
      await btnRemoveGetCount.click()
      await Utils.sleep(300)

      // 步骤8：批量操作+getChildNumber
      let btnBatchOperations = await driver.findComponent(ON.id('button_batch_operations_sr20241118811430_005'))
      await btnBatchOperations.click()
      await Utils.sleep(300)

      // 步骤9：关闭trace采集，pull出trace后，解析trace结果和基线版本数据对比
      let btnStopTrace = await driver.findComponent(ON.id('button_stop_trace_sr20241118811430_005'))
      await btnStopTrace.click()
      await Utils.sleep(500)

      // 预期结果：FrameNode的添加/删除/组件创建/属性设置接口，平均耗时不劣化
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_005 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811430_006
     * @tc.name   : Verify the time cost of setting the getPositionToWindow attribute via the added API.
     * @tc.desc   : Verify componentperformance sr20241118811430 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811430_006', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_006 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811430/Sr20241118811430006')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：开启采集trace开关
      let btnStartTrace = await driver.findComponent(ON.id('button_start_trace_sr20241118811430_006'))
      await btnStartTrace.click()
      await Utils.sleep(500)

      // 步骤3：添加FrameNode并设置位置
      let btnAddWithPosition = await driver.findComponent(ON.id('button_add_with_position_sr20241118811430_006'))
      await btnAddWithPosition.click()
      await Utils.sleep(300)

      // 步骤4：getPositionToWindow获取位置接口
      let btnGetPosition = await driver.findComponent(ON.id('button_get_position_sr20241118811430_006'))
      await btnGetPosition.click()
      await Utils.sleep(300)

      // 步骤5：频繁调用getPositionToWindow
      let btnFrequentPosition = await driver.findComponent(ON.id('button_frequent_position_sr20241118811430_006'))
      await btnFrequentPosition.click()
      await Utils.sleep(300)

      // 步骤6：创建组件并获取位置
      let btnCreateGetPosition = await driver.findComponent(ON.id('button_create_get_position_sr20241118811430_006'))
      await btnCreateGetPosition.click()
      await Utils.sleep(300)

      // 步骤7：修改属性后获取位置
      let btnModifyGetPosition = await driver.findComponent(ON.id('button_modify_get_position_sr20241118811430_006'))
      await btnModifyGetPosition.click()
      await Utils.sleep(300)

      // 步骤8：删除FrameNode
      let btnRemoveFrameNode = await driver.findComponent(ON.id('button_remove_framenode_sr20241118811430_006'))
      await btnRemoveFrameNode.click()
      await Utils.sleep(300)

      // 步骤9：批量操作+获取位置
      let btnBatchPosition = await driver.findComponent(ON.id('button_batch_position_sr20241118811430_006'))
      await btnBatchPosition.click()
      await Utils.sleep(300)

      // 步骤10：关闭trace采集，pull出trace后，解析trace结果和基线版本数据对比
      let btnStopTrace = await driver.findComponent(ON.id('button_stop_trace_sr20241118811430_006'))
      await btnStopTrace.click()
      await Utils.sleep(500)

      // 预期结果：FrameNode的添加/删除/组件创建/属性设置接口，平均耗时不劣化
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_006 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811430_007
     * @tc.name   : Verify the time cost of setting the getPositionToWindowWithTransform attribute via the added API.
     * @tc.desc   : Verify componentperformance sr20241118811430 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811430_007', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_007 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811430/Sr20241118811430007')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：开启采集trace开关
      let btnStartTrace = await driver.findComponent(ON.id('button_start_trace_sr20241118811430_007'))
      await btnStartTrace.click()
      await Utils.sleep(500)

      // 步骤3：添加FrameNode并设置变换
      let btnAddWithTransform = await driver.findComponent(ON.id('button_add_with_transform_sr20241118811430_007'))
      await btnAddWithTransform.click()
      await Utils.sleep(300)

      // 步骤4：getPositionToWindowWithTransform获取变换位置接口
      let btnGetTransformPosition = await driver.findComponent(ON.id('button_get_transform_position_sr20241118811430_007'))
      await btnGetTransformPosition.click()
      await Utils.sleep(300)

      // 步骤5：频繁调用变换位置获取
      let btnFrequentTransform = await driver.findComponent(ON.id('button_frequent_transform_sr20241118811430_007'))
      await btnFrequentTransform.click()
      await Utils.sleep(300)

      // 步骤6：创建组件+变换+获取位置
      let btnCreateTransform = await driver.findComponent(ON.id('button_create_transform_sr20241118811430_007'))
      await btnCreateTransform.click()
      await Utils.sleep(300)

      // 步骤7：修改变换后获取位置
      let btnModifyTransform = await driver.findComponent(ON.id('button_modify_transform_sr20241118811430_007'))
      await btnModifyTransform.click()
      await Utils.sleep(300)

      // 步骤8：删除FrameNode
      let btnRemoveFrameNode = await driver.findComponent(ON.id('button_remove_framenode_sr20241118811430_007'))
      await btnRemoveFrameNode.click()
      await Utils.sleep(300)

      // 步骤9：批量变换操作+获取位置
      let btnBatchTransform = await driver.findComponent(ON.id('button_batch_transform_sr20241118811430_007'))
      await btnBatchTransform.click()
      await Utils.sleep(300)

      // 步骤10：关闭trace采集，pull出trace后，解析trace结果和基线版本数据对比
      let btnStopTrace = await driver.findComponent(ON.id('button_stop_trace_sr20241118811430_007'))
      await btnStopTrace.click()
      await Utils.sleep(500)

      // 预期结果：FrameNode的添加/删除/组件创建/属性设置接口，平均耗时不劣化
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_007 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811430_008
     * @tc.name   : Verify the time cost of setting the getLayoutPosition attribute via the added API.
     * @tc.desc   : Verify componentperformance sr20241118811430 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811430_008', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_008 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811430/Sr20241118811430008')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：开启采集trace开关
      let btnStartTrace = await driver.findComponent(ON.id('button_start_trace_sr20241118811430_008'))
      await btnStartTrace.click()
      await Utils.sleep(500)

      // 步骤3：添加FrameNode并设置布局
      let btnAddWithLayout = await driver.findComponent(ON.id('button_add_with_layout_sr20241118811430_008'))
      await btnAddWithLayout.click()
      await Utils.sleep(300)

      // 步骤4：getLayoutPosition获取布局位置接口
      let btnGetLayoutPosition = await driver.findComponent(ON.id('button_get_layout_position_sr20241118811430_008'))
      await btnGetLayoutPosition.click()
      await Utils.sleep(300)

      // 步骤5：频繁调用getLayoutPosition
      let btnFrequentLayout = await driver.findComponent(ON.id('button_frequent_layout_sr20241118811430_008'))
      await btnFrequentLayout.click()
      await Utils.sleep(300)

      // 步骤6：创建组件+布局+获取位置
      let btnCreateLayout = await driver.findComponent(ON.id('button_create_layout_sr20241118811430_008'))
      await btnCreateLayout.click()
      await Utils.sleep(300)

      // 步骤7：修改布局后获取位置
      let btnModifyLayout = await driver.findComponent(ON.id('button_modify_layout_sr20241118811430_008'))
      await btnModifyLayout.click()
      await Utils.sleep(300)

      // 步骤8：删除FrameNode
      let btnRemoveFrameNode = await driver.findComponent(ON.id('button_remove_framenode_sr20241118811430_008'))
      await btnRemoveFrameNode.click()
      await Utils.sleep(300)

      // 步骤9：批量布局操作+获取位置
      let btnBatchLayout = await driver.findComponent(ON.id('button_batch_layout_sr20241118811430_008'))
      await btnBatchLayout.click()
      await Utils.sleep(300)

      // 步骤10：关闭trace采集，pull出trace后，解析trace结果和基线版本数据对比
      let btnStopTrace = await driver.findComponent(ON.id('button_stop_trace_sr20241118811430_008'))
      await btnStopTrace.click()
      await Utils.sleep(500)

      // 预期结果：FrameNode的添加/删除/组件创建/属性设置接口，平均耗时不劣化
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_008 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811430_009
     * @tc.name   : Verify the time cost of setting the getUserConfigSize attribute via the added API.
     * @tc.desc   : Verify componentperformance sr20241118811430 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811430_009', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_009 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811430/Sr20241118811430009')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：开启采集trace开关
      let btnStartTrace = await driver.findComponent(ON.id('button_start_trace_sr20241118811430_009'))
      await btnStartTrace.click()
      await Utils.sleep(500)

      // 步骤3：添加FrameNode并设置用户配置尺寸
      let btnAddWithConfigSize = await driver.findComponent(ON.id('button_add_with_config_size_sr20241118811430_009'))
      await btnAddWithConfigSize.click()
      await Utils.sleep(300)

      // 步骤4：getUserConfigSize获取用户配置尺寸接口
      let btnGetUserConfigSize = await driver.findComponent(ON.id('button_get_user_config_size_sr20241118811430_009'))
      await btnGetUserConfigSize.click()
      await Utils.sleep(300)

      // 步骤5：频繁调用getUserConfigSize
      let btnFrequentConfigSize = await driver.findComponent(ON.id('button_frequent_config_size_sr20241118811430_009'))
      await btnFrequentConfigSize.click()
      await Utils.sleep(300)

      // 步骤6：创建组件+配置尺寸+获取
      let btnCreateConfigSize = await driver.findComponent(ON.id('button_create_config_size_sr20241118811430_009'))
      await btnCreateConfigSize.click()
      await Utils.sleep(300)

      // 步骤7：修改配置尺寸后获取
      let btnModifyConfigSize = await driver.findComponent(ON.id('button_modify_config_size_sr20241118811430_009'))
      await btnModifyConfigSize.click()
      await Utils.sleep(300)

      // 步骤8：删除FrameNode
      let btnRemoveFrameNode = await driver.findComponent(ON.id('button_remove_framenode_sr20241118811430_009'))
      await btnRemoveFrameNode.click()
      await Utils.sleep(300)

      // 步骤9：批量配置尺寸操作+获取
      let btnBatchConfigSize = await driver.findComponent(ON.id('button_batch_config_size_sr20241118811430_009'))
      await btnBatchConfigSize.click()
      await Utils.sleep(300)

      // 步骤10：关闭trace采集，pull出trace后，解析trace结果和基线版本数据对比
      let btnStopTrace = await driver.findComponent(ON.id('button_stop_trace_sr20241118811430_009'))
      await btnStopTrace.click()
      await Utils.sleep(500)

      // 预期结果：FrameNode的添加/删除/组件创建/属性设置接口，平均耗时不劣化
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_009 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811430_010
     * @tc.name   : Verify the time cost of setting the getId attribute via the added API.
     * @tc.desc   : Verify componentperformance sr20241118811430 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811430_010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_010 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811430/Sr20241118811430010')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：开启采集trace开关
      let btnStartTrace = await driver.findComponent(ON.id('button_start_trace_sr20241118811430_010'))
      await btnStartTrace.click()
      await Utils.sleep(500)

      // 步骤3：添加FrameNode并设置ID
      let btnAddWithId = await driver.findComponent(ON.id('button_add_with_id_sr20241118811430_010'))
      await btnAddWithId.click()
      await Utils.sleep(300)

      // 步骤4：getId获取节点ID接口
      let btnGetId = await driver.findComponent(ON.id('button_get_id_sr20241118811430_010'))
      await btnGetId.click()
      await Utils.sleep(300)

      // 步骤5：频繁调用getId
      let btnFrequentGetId = await driver.findComponent(ON.id('button_frequent_get_id_sr20241118811430_010'))
      await btnFrequentGetId.click()
      await Utils.sleep(300)

      // 步骤6：创建组件+设置ID+获取
      let btnCreateWithId = await driver.findComponent(ON.id('button_create_with_id_sr20241118811430_010'))
      await btnCreateWithId.click()
      await Utils.sleep(300)

      // 步骤7：修改ID后获取
      let btnModifyId = await driver.findComponent(ON.id('button_modify_id_sr20241118811430_010'))
      await btnModifyId.click()
      await Utils.sleep(300)

      // 步骤8：遍历所有节点获取ID
      let btnTraverseGetId = await driver.findComponent(ON.id('button_traverse_get_id_sr20241118811430_010'))
      await btnTraverseGetId.click()
      await Utils.sleep(300)

      // 步骤9：批量ID操作+获取
      let btnBatchId = await driver.findComponent(ON.id('button_batch_id_sr20241118811430_010'))
      await btnBatchId.click()
      await Utils.sleep(300)

      // 步骤10：删除FrameNode
      let btnRemoveFrameNode = await driver.findComponent(ON.id('button_remove_framenode_sr20241118811430_010'))
      await btnRemoveFrameNode.click()
      await Utils.sleep(300)

      // 步骤11：关闭trace采集，pull出trace后，解析trace结果和基线版本数据对比
      let btnStopTrace = await driver.findComponent(ON.id('button_stop_trace_sr20241118811430_010'))
      await btnStopTrace.click()
      await Utils.sleep(500)

      // 预期结果：FrameNode的添加/删除/组件创建/属性设置接口，平均耗时不劣化
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811430_011
     * @tc.name   : Verify the time cost of setting the getUniqueId attribute via the added API.
     * @tc.desc   : Verify componentperformance sr20241118811430 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811430_011', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_011 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811430/Sr20241118811430011')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：开启采集trace开关
      let btnStartTrace = await driver.findComponent(ON.id('button_start_trace_sr20241118811430_011'))
      await btnStartTrace.click()
      await Utils.sleep(500)

      // 步骤3：添加FrameNode
      let btnAddFrameNode = await driver.findComponent(ON.id('button_add_framenode_sr20241118811430_011'))
      await btnAddFrameNode.click()
      await Utils.sleep(300)

      // 步骤4：getUniqueId获取唯一ID接口
      let btnGetUniqueId = await driver.findComponent(ON.id('button_get_unique_id_sr20241118811430_011'))
      await btnGetUniqueId.click()
      await Utils.sleep(300)

      // 步骤5：频繁调用getUniqueId
      let btnFrequentUniqueId = await driver.findComponent(ON.id('button_frequent_unique_id_sr20241118811430_011'))
      await btnFrequentUniqueId.click()
      await Utils.sleep(300)

      // 步骤6：创建组件并获取UniqueId
      let btnCreateGetUniqueId = await driver.findComponent(ON.id('button_create_get_unique_id_sr20241118811430_011'))
      await btnCreateGetUniqueId.click()
      await Utils.sleep(300)

      // 步骤7：修改属性后获取UniqueId
      let btnModifyGetUniqueId = await driver.findComponent(ON.id('button_modify_get_unique_id_sr20241118811430_011'))
      await btnModifyGetUniqueId.click()
      await Utils.sleep(300)

      // 步骤8：遍历获取所有UniqueId
      let btnTraverseUniqueId = await driver.findComponent(ON.id('button_traverse_unique_id_sr20241118811430_011'))
      await btnTraverseUniqueId.click()
      await Utils.sleep(300)

      // 步骤9：比较UniqueId
      let btnCompareUniqueId = await driver.findComponent(ON.id('button_compare_unique_id_sr20241118811430_011'))
      await btnCompareUniqueId.click()
      await Utils.sleep(300)

      // 步骤10：批量UniqueId操作
      let btnBatchUniqueId = await driver.findComponent(ON.id('button_batch_unique_id_sr20241118811430_011'))
      await btnBatchUniqueId.click()
      await Utils.sleep(300)

      // 步骤11：删除FrameNode
      let btnRemoveFrameNode = await driver.findComponent(ON.id('button_remove_framenode_sr20241118811430_011'))
      await btnRemoveFrameNode.click()
      await Utils.sleep(300)

      // 步骤12：关闭trace采集，pull出trace后，解析trace结果和基线版本数据对比
      let btnStopTrace = await driver.findComponent(ON.id('button_stop_trace_sr20241118811430_011'))
      await btnStopTrace.click()
      await Utils.sleep(500)

      // 预期结果：FrameNode的添加/删除/组件创建/属性设置接口，平均耗时不劣化
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_011 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811430_012
     * @tc.name   : Verify the time cost of setting the isAttached attribute via the added API.
     * @tc.desc   : Verify componentperformance sr20241118811430 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811430_012', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_012 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811430/Sr20241118811430012')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：开启采集trace开关
      let btnStartTrace = await driver.findComponent(ON.id('button_start_trace_sr20241118811430_012'))
      await btnStartTrace.click()
      await Utils.sleep(500)

      // 步骤3：添加FrameNode并检查附加
      let btnAddCheckAttached = await driver.findComponent(ON.id('button_add_check_attached_sr20241118811430_012'))
      await btnAddCheckAttached.click()
      await Utils.sleep(300)

      // 步骤4：isAttached检查附加状态接口
      let btnCheckIsAttached = await driver.findComponent(ON.id('button_check_is_attached_sr20241118811430_012'))
      await btnCheckIsAttached.click()
      await Utils.sleep(300)

      // 步骤5：频繁调用isAttached
      let btnFrequentIsAttached = await driver.findComponent(ON.id('button_frequent_is_attached_sr20241118811430_012'))
      await btnFrequentIsAttached.click()
      await Utils.sleep(300)

      // 步骤6：创建组件并检查附加
      let btnCreateCheckAttached = await driver.findComponent(ON.id('button_create_check_attached_sr20241118811430_012'))
      await btnCreateCheckAttached.click()
      await Utils.sleep(300)

      // 步骤7：分离节点并检查状态
      let btnDetachCheck = await driver.findComponent(ON.id('button_detach_check_sr20241118811430_012'))
      await btnDetachCheck.click()
      await Utils.sleep(300)

      // 步骤8：重新附加节点并检查
      let btnReattachCheck = await driver.findComponent(ON.id('button_reattach_check_sr20241118811430_012'))
      await btnReattachCheck.click()
      await Utils.sleep(300)

      // 步骤9：遍历检查所有附加状态
      let btnTraverseAttached = await driver.findComponent(ON.id('button_traverse_attached_sr20241118811430_012'))
      await btnTraverseAttached.click()
      await Utils.sleep(300)

      // 步骤10：批量附加状态操作
      let btnBatchAttached = await driver.findComponent(ON.id('button_batch_attached_sr20241118811430_012'))
      await btnBatchAttached.click()
      await Utils.sleep(300)

      // 步骤11：删除FrameNode
      let btnRemoveFrameNode = await driver.findComponent(ON.id('button_remove_framenode_sr20241118811430_012'))
      await btnRemoveFrameNode.click()
      await Utils.sleep(300)

      // 步骤12：关闭trace采集，pull出trace后，解析trace结果和基线版本数据对比
      let btnStopTrace = await driver.findComponent(ON.id('button_stop_trace_sr20241118811430_012'))
      await btnStopTrace.click()
      await Utils.sleep(500)

      // 预期结果：FrameNode的添加/删除/组件创建/属性设置接口，平均耗时不劣化
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_012 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811430_013
     * @tc.name   : Verify the time cost of setting the setMeasuredSize attribute via the added API.
     * @tc.desc   : Verify componentperformance sr20241118811430 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811430_013', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_013 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811430/Sr20241118811430013')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：开启采集trace开关
      let btnStartTrace = await driver.findComponent(ON.id('button_start_trace_sr20241118811430_013'))
      await btnStartTrace.click()
      await Utils.sleep(500)

      // 步骤3：添加FrameNode并设置测量尺寸
      let btnAddMeasuredSize = await driver.findComponent(ON.id('button_add_measured_size_sr20241118811430_013'))
      await btnAddMeasuredSize.click()
      await Utils.sleep(300)

      // 步骤4：setMeasuredSize设置尺寸接口
      let btnSetMeasuredSize = await driver.findComponent(ON.id('button_set_measured_size_sr20241118811430_013'))
      await btnSetMeasuredSize.click()
      await Utils.sleep(300)

      // 步骤5：频繁调用setMeasuredSize
      let btnFrequentMeasuredSize = await driver.findComponent(ON.id('button_frequent_measured_size_sr20241118811430_013'))
      await btnFrequentMeasuredSize.click()
      await Utils.sleep(300)

      // 步骤6：创建组件并设置测量尺寸
      let btnCreateMeasuredSize = await driver.findComponent(ON.id('button_create_measured_size_sr20241118811430_013'))
      await btnCreateMeasuredSize.click()
      await Utils.sleep(300)

      // 步骤7：动态修改测量尺寸
      let btnModifyMeasuredSize = await driver.findComponent(ON.id('button_modify_measured_size_sr20241118811430_013'))
      await btnModifyMeasuredSize.click()
      await Utils.sleep(300)

      // 步骤8：获取当前测量尺寸
      let btnGetMeasuredSize = await driver.findComponent(ON.id('button_get_measured_size_sr20241118811430_013'))
      await btnGetMeasuredSize.click()
      await Utils.sleep(300)

      // 步骤9：遍历设置所有测量尺寸
      let btnTraverseMeasuredSize = await driver.findComponent(ON.id('button_traverse_measured_size_sr20241118811430_013'))
      await btnTraverseMeasuredSize.click()
      await Utils.sleep(300)

      // 步骤10：批量测量尺寸操作
      let btnBatchMeasuredSize = await driver.findComponent(ON.id('button_batch_measured_size_sr20241118811430_013'))
      await btnBatchMeasuredSize.click()
      await Utils.sleep(300)

      // 步骤11：重置所有测量尺寸
      let btnResetMeasuredSize = await driver.findComponent(ON.id('button_reset_measured_size_sr20241118811430_013'))
      await btnResetMeasuredSize.click()
      await Utils.sleep(300)

      // 步骤12：删除FrameNode
      let btnRemoveFrameNode = await driver.findComponent(ON.id('button_remove_framenode_sr20241118811430_013'))
      await btnRemoveFrameNode.click()
      await Utils.sleep(300)

      // 步骤13：关闭trace采集，pull出trace后，解析trace结果和基线版本数据对比
      let btnStopTrace = await driver.findComponent(ON.id('button_stop_trace_sr20241118811430_013'))
      await btnStopTrace.click()
      await Utils.sleep(500)

      // 预期结果：FrameNode的添加/删除/组件创建/属性设置接口，平均耗时不劣化
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_013 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811430_014
     * @tc.name   : Verify the time cost of setting the getMeasuredSize attribute via the added API.
     * @tc.desc   : Verify componentperformance sr20241118811430 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811430_014', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_014 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811430/Sr20241118811430014')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：开启采集trace开关
      let btnStartTrace = await driver.findComponent(ON.id('button_start_trace_sr20241118811430_014'))
      await btnStartTrace.click()
      await Utils.sleep(500)

      // 步骤3：添加FrameNode
      let btnAddFrameNode = await driver.findComponent(ON.id('button_add_framenode_sr20241118811430_014'))
      await btnAddFrameNode.click()
      await Utils.sleep(300)

      // 步骤4：getMeasuredSize获取尺寸接口
      let btnGetMeasuredSize = await driver.findComponent(ON.id('button_get_measured_size_sr20241118811430_014'))
      await btnGetMeasuredSize.click()
      await Utils.sleep(300)

      // 步骤5：频繁调用getMeasuredSize
      let btnFrequentMeasuredSize = await driver.findComponent(ON.id('button_frequent_measured_size_sr20241118811430_014'))
      await btnFrequentMeasuredSize.click()
      await Utils.sleep(300)

      // 步骤6：创建组件并获取测量尺寸
      let btnCreateMeasuredSize = await driver.findComponent(ON.id('button_create_measured_size_sr20241118811430_014'))
      await btnCreateMeasuredSize.click()
      await Utils.sleep(300)

      // 步骤7：修改属性后获取测量尺寸
      let btnModifyMeasuredSize = await driver.findComponent(ON.id('button_modify_measured_size_sr20241118811430_014'))
      await btnModifyMeasuredSize.click()
      await Utils.sleep(300)

      // 步骤8：比较测量尺寸
      let btnCompareMeasuredSize = await driver.findComponent(ON.id('button_compare_measured_size_sr20241118811430_014'))
      await btnCompareMeasuredSize.click()
      await Utils.sleep(300)

      // 步骤9：遍历获取所有测量尺寸
      let btnTraverseMeasuredSize = await driver.findComponent(ON.id('button_traverse_measured_size_sr20241118811430_014'))
      await btnTraverseMeasuredSize.click()
      await Utils.sleep(300)

      // 步骤10：批量测量尺寸操作
      let btnBatchMeasuredSize = await driver.findComponent(ON.id('button_batch_measured_size_sr20241118811430_014'))
      await btnBatchMeasuredSize.click()
      await Utils.sleep(300)

      // 步骤11：获取最大测量尺寸
      let btnMaxMeasuredSize = await driver.findComponent(ON.id('button_max_measured_size_sr20241118811430_014'))
      await btnMaxMeasuredSize.click()
      await Utils.sleep(300)

      // 步骤12：获取总测量面积
      let btnTotalMeasuredArea = await driver.findComponent(ON.id('button_total_measured_area_sr20241118811430_014'))
      await btnTotalMeasuredArea.click()
      await Utils.sleep(300)

      // 步骤13：删除FrameNode
      let btnRemoveFrameNode = await driver.findComponent(ON.id('button_remove_framenode_sr20241118811430_014'))
      await btnRemoveFrameNode.click()
      await Utils.sleep(300)

      // 步骤14：关闭trace采集，pull出trace后，解析trace结果和基线版本数据对比
      let btnStopTrace = await driver.findComponent(ON.id('button_stop_trace_sr20241118811430_014'))
      await btnStopTrace.click()
      await Utils.sleep(500)

      // 预期结果：FrameNode的添加/删除/组件创建/属性设置接口，平均耗时不劣化
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_014 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811430_015
     * @tc.name   : Verify the time cost of setting the setLayoutPosition attribute via the added API.
     * @tc.desc   : Verify componentperformance sr20241118811430 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811430_015', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_015 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811430/Sr20241118811430015')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：开启采集trace开关
      let btnStartTrace = await driver.findComponent(ON.id('button_start_trace_sr20241118811430_015'))
      await btnStartTrace.click()
      await Utils.sleep(500)

      // 步骤3：添加FrameNode并设置布局位置
      let btnAddLayoutPosition = await driver.findComponent(ON.id('button_add_layout_position_sr20241118811430_015'))
      await btnAddLayoutPosition.click()
      await Utils.sleep(300)

      // 步骤4：setLayoutPosition设置位置接口
      let btnSetLayoutPosition = await driver.findComponent(ON.id('button_set_layout_position_sr20241118811430_015'))
      await btnSetLayoutPosition.click()
      await Utils.sleep(300)

      // 步骤5：频繁调用setLayoutPosition
      let btnFrequentLayoutPosition = await driver.findComponent(ON.id('button_frequent_layout_position_sr20241118811430_015'))
      await btnFrequentLayoutPosition.click()
      await Utils.sleep(300)

      // 步骤6：创建组件并设置布局位置
      let btnCreateLayoutPosition = await driver.findComponent(ON.id('button_create_layout_position_sr20241118811430_015'))
      await btnCreateLayoutPosition.click()
      await Utils.sleep(300)

      // 步骤7：动态修改布局位置
      let btnModifyLayoutPosition = await driver.findComponent(ON.id('button_modify_layout_position_sr20241118811430_015'))
      await btnModifyLayoutPosition.click()
      await Utils.sleep(300)

      // 步骤8：获取当前布局位置
      let btnGetLayoutPosition = await driver.findComponent(ON.id('button_get_layout_position_sr20241118811430_015'))
      await btnGetLayoutPosition.click()
      await Utils.sleep(300)

      // 步骤9：遍历设置所有布局位置
      let btnTraverseLayoutPosition = await driver.findComponent(ON.id('button_traverse_layout_position_sr20241118811430_015'))
      await btnTraverseLayoutPosition.click()
      await Utils.sleep(300)

      // 步骤10：批量布局位置操作
      let btnBatchLayoutPosition = await driver.findComponent(ON.id('button_batch_layout_position_sr20241118811430_015'))
      await btnBatchLayoutPosition.click()
      await Utils.sleep(300)

      // 步骤11：重置所有布局位置
      let btnResetLayoutPosition = await driver.findComponent(ON.id('button_reset_layout_position_sr20241118811430_015'))
      await btnResetLayoutPosition.click()
      await Utils.sleep(300)

      // 步骤12：计算布局位置边界
      let btnCalculateBounds = await driver.findComponent(ON.id('button_calculate_bounds_sr20241118811430_015'))
      await btnCalculateBounds.click()
      await Utils.sleep(300)

      // 步骤13：对齐所有布局位置
      let btnAlignLayoutPosition = await driver.findComponent(ON.id('button_align_layout_position_sr20241118811430_015'))
      await btnAlignLayoutPosition.click()
      await Utils.sleep(300)

      // 步骤14：删除FrameNode
      let btnRemoveFrameNode = await driver.findComponent(ON.id('button_remove_framenode_sr20241118811430_015'))
      await btnRemoveFrameNode.click()
      await Utils.sleep(300)

      // 步骤15：关闭trace采集，pull出trace后，解析trace结果和基线版本数据对比
      let btnStopTrace = await driver.findComponent(ON.id('button_stop_trace_sr20241118811430_015'))
      await btnStopTrace.click()
      await Utils.sleep(500)

      // 预期结果：FrameNode的添加/删除/组件创建/属性设置接口，平均耗时不劣化
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_015 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ComponentPerformance_SR20241118811430_016
     * @tc.name   : Verify the time cost of setting the clearChildren attribute via the added API.
     * @tc.desc   : Verify componentperformance sr20241118811430 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ComponentPerformance_SR20241118811430_016', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_016 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/action_event/Sr20241118811430/Sr20241118811430016')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：开启采集trace开关
      let btnStartTrace = await driver.findComponent(ON.id('button_start_trace_sr20241118811430_016'))
      await btnStartTrace.click()
      await Utils.sleep(500)

      // 步骤3：添加多个FrameNode
      let btnAddMultiple = await driver.findComponent(ON.id('button_add_multiple_sr20241118811430_016'))
      await btnAddMultiple.click()
      await Utils.sleep(300)

      // 步骤4：clearChildren清除所有子节点接口
      let btnClearChildren = await driver.findComponent(ON.id('button_clear_children_sr20241118811430_016'))
      await btnClearChildren.click()
      await Utils.sleep(300)

      // 步骤5：频繁调用clearChildren
      let btnFrequentClear = await driver.findComponent(ON.id('button_frequent_clear_sr20241118811430_016'))
      await btnFrequentClear.click()
      await Utils.sleep(300)

      // 步骤6：创建组件后清除子节点
      let btnCreateClear = await driver.findComponent(ON.id('button_create_clear_sr20241118811430_016'))
      await btnCreateClear.click()
      await Utils.sleep(300)

      // 步骤7：批量添加后清除
      let btnBatchClear = await driver.findComponent(ON.id('button_batch_clear_sr20241118811430_016'))
      await btnBatchClear.click()
      await Utils.sleep(300)

      // 步骤8：部分清除后全部清除
      let btnPartialClear = await driver.findComponent(ON.id('button_partial_clear_sr20241118811430_016'))
      await btnPartialClear.click()
      await Utils.sleep(300)

      // 步骤9：清除后重新添加
      let btnClearReAdd = await driver.findComponent(ON.id('button_clear_readd_sr20241118811430_016'))
      await btnClearReAdd.click()
      await Utils.sleep(300)

      // 步骤10：获取节点数量对比
      let btnCountComparison = await driver.findComponent(ON.id('button_count_comparison_sr20241118811430_016'))
      await btnCountComparison.click()
      await Utils.sleep(300)

      // 步骤11：测试清除空容器
      let btnClearEmpty = await driver.findComponent(ON.id('button_clear_empty_sr20241118811430_016'))
      await btnClearEmpty.click()
      await Utils.sleep(300)

      // 步骤12：删除单个FrameNode
      let btnRemoveSingle = await driver.findComponent(ON.id('button_remove_single_sr20241118811430_016'))
      await btnRemoveSingle.click()
      await Utils.sleep(300)

      // 步骤13：关闭trace采集，pull出trace后，解析trace结果和基线版本数据对比
      let btnStopTrace = await driver.findComponent(ON.id('button_stop_trace_sr20241118811430_016'))
      await btnStopTrace.click()
      await Utils.sleep(500)

      // 预期结果：FrameNode的添加/删除/组件创建/属性设置接口，平均耗时不劣化
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ComponentPerformance_SR20241118811430_016 finish.`);
      done()
    })


  })
}