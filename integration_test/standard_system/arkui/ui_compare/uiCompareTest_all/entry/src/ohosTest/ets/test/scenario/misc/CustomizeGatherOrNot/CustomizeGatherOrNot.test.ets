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

export default function customizeGatherOrNot() {

  describe('customizeGatherOrNot', () => {
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
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_001
     * @tc.name   : Drag-and-drop multi-select effect for GridItem on mobile via finger touch
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_001', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_001 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot001')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击Grid组件测试按钮
      let test_button_001 = await driver.waitForComponent(ON.id('test_button_001'), 500)
      await test_button_001.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击Grid组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      
      // 步骤4：GridItem子组件已自动选中（点击按钮后自动选中前3个）
      await Utils.sleep(500)
      Logger.info('TEST', '步骤4：已选中多个GridItem子组件')
      
      // 步骤5：通过手指进行拖拽（模拟触摸拖拽操作）
      let grid_item_0_001 = await driver.waitForComponent(ON.id('grid_item_0_001'), 500)
      let drop_zone_001 = await driver.waitForComponent(ON.id('drop_zone_001'), 500)
      
      // 获取GridItem和释放区域的位置
      let gridItemBounds = await grid_item_0_001.getBoundsCenter()
      let dropZoneBounds = await drop_zone_001.getBoundsCenter()
      
      // 执行拖拽操作
      await driver.drag(gridItemBounds.x, gridItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(1000)
      Logger.info('TEST', '步骤5：已通过手指进行拖拽操作')
      
      // 步骤6：观察拖拽效果并截图
      Logger.info('TEST', '步骤6：观察拖拽效果 - 即使设置了非聚拢拖拽，通过手指拖拽依旧是聚拢效果')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_001 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_002
     * @tc.name   : Drag-and-drop multi-select effect for adjacent GridItem components on mobile via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_002', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_002 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot002')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击Grid组件测试按钮
      let test_button_002 = await driver.waitForComponent(ON.id('test_button_002'), 500)
      await test_button_002.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击Grid组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      
      // 步骤4：相邻的GridItem子组件已自动选中（点击按钮后自动选中第5、6、9、10项，形成2x2相邻区域）
      await Utils.sleep(500)
      Logger.info('TEST', '步骤4：已选中几个相邻的GridItem子组件')
      
      // 步骤5：通过鼠标进行拖拽（模拟鼠标拖拽操作）
      let grid_item_4_002 = await driver.waitForComponent(ON.id('grid_item_4_002'), 500)
      let drop_zone_002 = await driver.waitForComponent(ON.id('drop_zone_002'), 500)
      
      // 获取GridItem和释放区域的位置
      let gridItemBounds = await grid_item_4_002.getBoundsCenter()
      let dropZoneBounds = await drop_zone_002.getBoundsCenter()
      
      // 执行鼠标拖拽操作
      await driver.drag(gridItemBounds.x, gridItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(1000)
      Logger.info('TEST', '步骤5：已通过鼠标进行拖拽操作')
      
      // 步骤6：观察拖拽效果并截图
      Logger.info('TEST', '步骤6：观察拖拽效果 - 拖拽效果为非聚拢，鼠标光标位于拖拽预览图中间，拖拽预览图大小跟原组件一致无缩放，拖拽动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_002 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_003
     * @tc.name   : Drag-and-drop multi-select effect for non-adjacent GridItem components on mobile via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_003', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_003 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot003')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击Grid组件测试按钮
      let test_button_003 = await driver.waitForComponent(ON.id('test_button_003'), 500)
      await test_button_003.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击Grid组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      
      // 步骤4：不相邻的GridItem子组件已自动选中（点击按钮后自动选中第1、4、10、15项，分散在不同位置）
      await Utils.sleep(500)
      Logger.info('TEST', '步骤4：已选中几个不相邻的GridItem子组件')
      
      // 步骤5：通过鼠标进行拖拽（模拟鼠标拖拽操作）
      let grid_item_0_003 = await driver.waitForComponent(ON.id('grid_item_0_003'), 500)
      let drop_zone_003 = await driver.waitForComponent(ON.id('drop_zone_003'), 500)
      
      // 获取GridItem和释放区域的位置
      let gridItemBounds = await grid_item_0_003.getBoundsCenter()
      let dropZoneBounds = await drop_zone_003.getBoundsCenter()
      
      // 执行鼠标拖拽操作
      await driver.drag(gridItemBounds.x, gridItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(1000)
      Logger.info('TEST', '步骤5：已通过鼠标进行拖拽操作')
      
      // 步骤6：观察拖拽效果并截图
      Logger.info('TEST', '步骤6：观察拖拽效果 - 拖拽效果为非聚拢，鼠标光标位于拖拽预览图中间，拖拽预览图大小跟原组件一致无缩放，拖拽动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_003 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_004
     * @tc.name   : Continuous drag-and-drop multi-select effect for GridItem components on mobile via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_004', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_004 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot004')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击Grid组件测试按钮
      let test_button_004 = await driver.waitForComponent(ON.id('test_button_004'), 500)
      await test_button_004.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击Grid组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      
      // 步骤4：相邻或不相邻的GridItem子组件已自动选中（点击按钮后自动选中第2、3、6、7、12项）
      await Utils.sleep(500)
      Logger.info('TEST', '步骤4：已选中几个相邻或不相邻的GridItem子组件')
      
      // 步骤5：通过鼠标进行连续多次拖拽（模拟鼠标连续拖拽操作）
      let grid_item_1_004 = await driver.waitForComponent(ON.id('grid_item_1_004'), 500)
      let drop_zone_004 = await driver.waitForComponent(ON.id('drop_zone_004'), 500)
      
      // 获取GridItem和释放区域的位置
      let gridItemBounds = await grid_item_1_004.getBoundsCenter()
      let dropZoneBounds = await drop_zone_004.getBoundsCenter()
      
      // 执行第1次鼠标拖拽操作
      Logger.info('TEST', '步骤5：开始第1次鼠标拖拽操作')
      await driver.drag(gridItemBounds.x, gridItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤5：已完成第1次鼠标拖拽操作')
      
      // 步骤6：观察拖拽效果并截图
      Logger.info('TEST', '步骤6：观察拖拽效果 - 拖拽效果为非聚拢，鼠标光标位于拖拽预览图中间，拖拽预览图大小跟原组件一致无缩放，拖拽动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_004 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_005
     * @tc.name   : Multi-select drag-and-drop effect with selected state for GridItem components on mobile via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_005', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_005 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot005')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击Grid组件测试按钮
      let test_button_005 = await driver.waitForComponent(ON.id('test_button_005'), 500)
      await test_button_005.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击Grid组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      
      // 步骤4：设置子组件的选中态
      Logger.info('TEST', '步骤4：已设置子组件的选中态')
      
      // 步骤5：相邻或不相邻的GridItem子组件已自动选中（点击按钮后自动选中第1、3、6、7、11项）
      await Utils.sleep(500)
      Logger.info('TEST', '步骤5：已选中几个相邻或不相邻的GridItem子组件，组件的选中态改变正确')
      
      // 步骤6：通过鼠标进行连续多次拖拽（模拟鼠标连续拖拽操作）
      let grid_item_0_005 = await driver.waitForComponent(ON.id('grid_item_0_005'), 500)
      let drop_zone_005 = await driver.waitForComponent(ON.id('drop_zone_005'), 500)
      
      // 获取GridItem和释放区域的位置
      let gridItemBounds = await grid_item_0_005.getBoundsCenter()
      let dropZoneBounds = await drop_zone_005.getBoundsCenter()
      
      // 执行第1次鼠标拖拽操作
      Logger.info('TEST', '步骤6：开始第1次鼠标拖拽操作')
      await driver.drag(gridItemBounds.x, gridItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤6：已完成第1次鼠标拖拽操作')
      
      // 步骤7：观察拖拽效果并截图
      Logger.info('TEST', '步骤7：观察拖拽效果 - 拖拽效果为非聚拢，鼠标光标位于拖拽预览图中间，拖拽预览图大小跟原组件一致无缩放，拖拽的预览图显示带有选中态效果，拖拽动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_005 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_006
     * @tc.name   : Multi-select drag-and-drop effect with custom drag preview for GridItem components on mobile via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_006', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_006 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot006')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击Grid组件测试按钮
      let test_button_006 = await driver.waitForComponent(ON.id('test_button_006'), 500)
      await test_button_006.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击Grid组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      
      // 步骤4：设置一个带有图片的拖拽预览图
      Logger.info('TEST', '步骤4：已设置一个带有图片的自定义拖拽预览图')
      
      // 步骤5：相邻或不相邻的GridItem子组件已自动选中（点击按钮后自动选中第2、3、5、10、14项）
      await Utils.sleep(500)
      Logger.info('TEST', '步骤5：已选中几个相邻或不相邻的GridItem子组件，非聚拢拖拽显示的优先级要大于拖拽预览显示')
      
      // 步骤6：通过鼠标进行连续多次拖拽（模拟鼠标连续拖拽操作）
      let grid_item_1_006 = await driver.waitForComponent(ON.id('grid_item_1_006'), 500)
      let drop_zone_006 = await driver.waitForComponent(ON.id('drop_zone_006'), 500)
      
      // 获取GridItem和释放区域的位置
      let gridItemBounds = await grid_item_1_006.getBoundsCenter()
      let dropZoneBounds = await drop_zone_006.getBoundsCenter()
      
      // 执行第1次鼠标拖拽操作
      Logger.info('TEST', '步骤6：开始第1次鼠标拖拽操作')
      await driver.drag(gridItemBounds.x, gridItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤6：已完成第1次鼠标拖拽操作')
      
      // 步骤7：观察拖拽效果并截图
      Logger.info('TEST', '步骤7：观察拖拽效果 - 拖拽效果为非聚拢，鼠标光标位于拖拽预览图中间，拖拽预览图大小跟原组件一致无缩放，拖拽的预览图显示带有选中态效果，拖拽动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_006 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_007
     * @tc.name   : Multi-select drag-and-drop effect for GridItem components with different sizes on mobile via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_007', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_007 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot007')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击Grid组件测试按钮
      let test_button_007 = await driver.waitForComponent(ON.id('test_button_007'), 500)
      await test_button_007.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击Grid组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      
      // 步骤4：相邻或不相邻的并且宽高并不相同的GridItem子组件已自动选中
      await Utils.sleep(500)
      Logger.info('TEST', '步骤4：已选中几个相邻或不相邻的并且宽高并不相同的GridItem子组件')
      
      // 步骤5：通过鼠标进行连续多次拖拽（模拟鼠标连续拖拽操作）
      let grid_item_0_007 = await driver.waitForComponent(ON.id('grid_item_0_007'), 500)
      let drop_zone_007 = await driver.waitForComponent(ON.id('drop_zone_007'), 500)
      
      // 获取GridItem和释放区域的位置
      let gridItemBounds = await grid_item_0_007.getBoundsCenter()
      let dropZoneBounds = await drop_zone_007.getBoundsCenter()
      
      // 执行第1次鼠标拖拽操作
      Logger.info('TEST', '步骤5：开始第1次鼠标拖拽操作')
      await driver.drag(gridItemBounds.x, gridItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤5：已完成第1次鼠标拖拽操作')
      
      // 步骤6：观察拖拽效果并截图
      Logger.info('TEST', '步骤6：观察拖拽效果 - 拖拽效果为非聚拢，鼠标光标位于拖拽预览图中间，拖拽预览图大小跟原组件一致无缩放，拖拽预览图显示正确没有被截断，拖拽动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_007 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_008
     * @tc.name   : Multi-select drag-and-drop effect for GridItem components created with CustomBuilder on mobile via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_008', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_008 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot008')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击Grid组件测试按钮
      let test_button_008 = await driver.waitForComponent(ON.id('test_button_008'), 500)
      await test_button_008.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击Grid组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      
      // 步骤4：相邻或不相邻的通过CustomBuilder创建的GridItem子组件已自动选中
      await Utils.sleep(500)
      Logger.info('TEST', '步骤4：已选中几个相邻或不相邻的通过CustomBuilder创建的GridItem子组件')
      
      // 步骤5：通过鼠标进行连续多次拖拽（模拟鼠标连续拖拽操作）
      let grid_item_1_008 = await driver.waitForComponent(ON.id('grid_item_1_008'), 500)
      let drop_zone_008 = await driver.waitForComponent(ON.id('drop_zone_008'), 500)
      
      // 获取GridItem和释放区域的位置
      let gridItemBounds = await grid_item_1_008.getBoundsCenter()
      let dropZoneBounds = await drop_zone_008.getBoundsCenter()
      
      // 执行第1次鼠标拖拽操作
      Logger.info('TEST', '步骤5：开始第1次鼠标拖拽操作')
      await driver.drag(gridItemBounds.x, gridItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤5：已完成第1次鼠标拖拽操作')
      
      // 步骤6：观察拖拽效果并截图
      Logger.info('TEST', '步骤6：观察拖拽效果 - 拖拽效果为非聚拢，鼠标光标位于拖拽预览图中间，拖拽预览图大小跟原组件一致无缩放，拖拽动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_008 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_009
     * @tc.name   : Multi-select drag-and-drop effect for adjacent GridItem components with style change in onDragStart via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_009', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_009 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot009')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击Grid组件测试按钮
      let test_button_009 = await driver.waitForComponent(ON.id('test_button_009'), 500)
      await test_button_009.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击Grid组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      
      // 步骤4：在onDragStart中改变组件样式（透明度降低为0.4，背景色变为灰色）
      Logger.info('TEST', '步骤4：在onDragStart中改变组件样式（透明度0.4，背景色灰色）')
      
      // 步骤5：相邻或不相邻的GridItem子组件已自动选中
      await Utils.sleep(500)
      Logger.info('TEST', '步骤5：已选中几个相邻或不相邻的GridItem子组件')
      
      // 步骤6：通过鼠标进行连续多次拖拽（模拟鼠标连续拖拽操作）
      let grid_item_1_009 = await driver.waitForComponent(ON.id('grid_item_1_009'), 500)
      let drop_zone_009 = await driver.waitForComponent(ON.id('drop_zone_009'), 500)
      
      // 获取GridItem和释放区域的位置
      let gridItemBounds = await grid_item_1_009.getBoundsCenter()
      let dropZoneBounds = await drop_zone_009.getBoundsCenter()
      
      // 执行第1次鼠标拖拽操作
      Logger.info('TEST', '步骤6：开始第1次鼠标拖拽操作')
      await driver.drag(gridItemBounds.x, gridItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤6：已完成第1次鼠标拖拽操作，原组件样式已改变')
      
      // 步骤7：观察拖拽效果并截图
      Logger.info('TEST', '步骤7：观察拖拽效果 - 拖拽效果为非聚拢，鼠标光标位于拖拽预览图中间，拖拽预览图大小跟原组件一致无缩放，拖拽动效流畅，原组件样式改变正确')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_009 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_010
     * @tc.name   : Multi-select drag-and-drop effect for GridItem components with bindContextMenu via finger touch
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_010 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot010')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击Grid组件测试按钮
      let test_button_010 = await driver.waitForComponent(ON.id('test_button_010'), 500)
      await test_button_010.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击Grid组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      
      // 步骤4：在GridItem中绑定bindContextMenu
      Logger.info('TEST', '步骤4：在GridItem中已绑定bindContextMenu（长按弹出菜单）')
      
      // 步骤5：相邻或不相邻的GridItem子组件已自动选中
      await Utils.sleep(500)
      Logger.info('TEST', '步骤5：已选中几个相邻或不相邻的GridItem子组件')
      
      // 步骤6：通过手指进行连续多次拖拽（模拟触摸拖拽操作）
      let grid_item_1_010 = await driver.waitForComponent(ON.id('grid_item_1_010'), 500)
      let drop_zone_010 = await driver.waitForComponent(ON.id('drop_zone_010'), 500)
      
      // 获取GridItem和释放区域的位置
      let gridItemBounds = await grid_item_1_010.getBoundsCenter()
      let dropZoneBounds = await drop_zone_010.getBoundsCenter()
      
      // 执行第1次手指拖拽操作
      Logger.info('TEST', '步骤6：开始第1次手指拖拽操作')
      await driver.drag(gridItemBounds.x, gridItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤6：已完成第1次手指拖拽操作')
      
      // 步骤7：观察拖拽效果并截图
      Logger.info('TEST', '步骤7：观察拖拽效果 - 先弹出bindContextMenu然后呈非聚拢效果显示拖拽预览')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_011
     * @tc.name   : Multi-select drag-and-drop effect by toggling between gathering and non-gathering states via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_011', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_011 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot011')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击Grid组件测试按钮
      let test_button_011 = await driver.waitForComponent(ON.id('test_button_011'), 500)
      await test_button_011.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击Grid组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面初始化时设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT（非聚拢）')
      await Utils.sleep(300)
      
      // 获取GridItem和释放区域的位置
      let grid_item_1_011 = await driver.waitForComponent(ON.id('grid_item_1_011'), 500)
      let drop_zone_011 = await driver.waitForComponent(ON.id('drop_zone_011'), 500)
      let gridItemBounds = await grid_item_1_011.getBoundsCenter()
      let dropZoneBounds = await drop_zone_011.getBoundsCenter()
      
      // 步骤4：通过鼠标拖拽几个相邻或不相邻的GridItem子组件（第1次拖拽，mode=ENABLE_MULTI_TILE_EFFECT）
      Logger.info('TEST', '步骤4：开始第1次鼠标拖拽（mode=ENABLE_MULTI_TILE_EFFECT）')
      await driver.drag(gridItemBounds.x, gridItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤4：已完成第1次鼠标拖拽（mode=ENABLE_MULTI_TILE_EFFECT）')
      
      // 步骤5：设置dragPreviewOptions中的mode属性为AUTO
      let toggle_mode_button_011 = await driver.waitForComponent(ON.id('toggle_mode_button_011'), 500)
      await toggle_mode_button_011.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤5：已点击切换按钮，mode切换为AUTO（聚拢）')
      
      // 步骤6：通过鼠标拖拽几个相邻或不相邻的GridItem子组件（第2次拖拽，mode=AUTO）
      Logger.info('TEST', '步骤6：开始第2次鼠标拖拽（mode=AUTO）')
      await driver.drag(gridItemBounds.x, gridItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤6：已完成第2次鼠标拖拽（mode=AUTO）')
      
      // 步骤9：观察非聚拢效果并截图
      Logger.info('TEST', '步骤9：观察非聚拢效果')
      Logger.info('TEST', '预期结果9.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果9.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果9.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果9.4：拖拽过程中动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_011 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_012
     * @tc.name   : Multi-select drag-and-drop effect for GridItem components with numberBadge enabled via finger touch
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_012', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_012 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot012')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击Grid组件测试按钮
      let test_button_012 = await driver.waitForComponent(ON.id('test_button_012'), 500)
      await test_button_012.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击Grid组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      
      // 步骤4：设置numberBadge为true
      Logger.info('TEST', '步骤4：dragPreviewOptions的numberBadge已设置为true（显示角标）')
      
      // 步骤5：相邻或不相邻的GridItem子组件已自动选中
      await Utils.sleep(500)
      Logger.info('TEST', '步骤5：已选中几个相邻或不相邻的GridItem子组件（共5项）')
      
      // 步骤6：通过手指进行连续多次拖拽（模拟触摸拖拽操作）
      let grid_item_1_012 = await driver.waitForComponent(ON.id('grid_item_1_012'), 500)
      let drop_zone_012 = await driver.waitForComponent(ON.id('drop_zone_012'), 500)
      
      // 获取GridItem和释放区域的位置
      let gridItemBounds = await grid_item_1_012.getBoundsCenter()
      let dropZoneBounds = await drop_zone_012.getBoundsCenter()
      
      // 执行第1次手指拖拽操作
      Logger.info('TEST', '步骤6：开始第1次手指拖拽操作（numberBadge角标将显示"5"）')
      await driver.drag(gridItemBounds.x, gridItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤6：已完成第1次手指拖拽操作')
      
      // 步骤7：观察拖拽效果并截图
      Logger.info('TEST', '步骤7：观察拖拽效果')
      Logger.info('TEST', '预期结果7.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果7.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果7.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果7.4：拖拽过程中动效流畅')
      Logger.info('TEST', '预期结果7.5：角标显示在整个拖拽预览的右上方（显示数字"5"）')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_012 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_013
     * @tc.name   : Multi-select drag-and-drop effect for GridItem components with custom backdrop style via finger touch
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_013', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_013 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot013')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击Grid组件测试按钮
      let test_button_013 = await driver.waitForComponent(ON.id('test_button_013'), 500)
      await test_button_013.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击Grid组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      
      // 步骤4：设置自定义背板样式
      Logger.info('TEST', '步骤4：已设置自定义背板样式（半透明橙色背板、圆角15、紫色边框、橙色阴影）')
      
      // 步骤5：相邻或不相邻的GridItem子组件已自动选中
      await Utils.sleep(500)
      Logger.info('TEST', '步骤5：已选中几个相邻或不相邻的GridItem子组件（共5项）')
      
      // 步骤6：通过手指进行连续多次拖拽（模拟触摸拖拽操作）
      let grid_item_1_013 = await driver.waitForComponent(ON.id('grid_item_1_013'), 500)
      let drop_zone_013 = await driver.waitForComponent(ON.id('drop_zone_013'), 500)
      
      // 获取GridItem和释放区域的位置
      let gridItemBounds = await grid_item_1_013.getBoundsCenter()
      let dropZoneBounds = await drop_zone_013.getBoundsCenter()
      
      // 执行第1次手指拖拽操作
      Logger.info('TEST', '步骤6：开始第1次手指拖拽操作（观察自定义背板样式）')
      await driver.drag(gridItemBounds.x, gridItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤6：已完成第1次手指拖拽操作')
      
      // 步骤7：观察拖拽效果并截图
      Logger.info('TEST', '步骤7：观察拖拽效果')
      Logger.info('TEST', '预期结果7.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果7.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果7.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果7.4：拖拽过程中动效流畅')
      Logger.info('TEST', '预期结果7.5：自定义背板样式显示正确（半透明橙色背景、圆角、紫色边框、阴影）')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_013 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_014
     * @tc.name   : Multi-select drag-and-drop effect for GridItem components in landscape mode via finger touch
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_014', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_014 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot014')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击Grid组件测试按钮
      let test_button_014 = await driver.waitForComponent(ON.id('test_button_014'), 500)
      await test_button_014.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击Grid组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      
      // 步骤4：设备切换横屏（点击横屏标记按钮模拟）
      let toggle_landscape_button_014 = await driver.waitForComponent(ON.id('toggle_landscape_button_014'), 500)
      await toggle_landscape_button_014.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤4：设备已切换横屏模式（已标记为横屏）')
      
      // 步骤5：相邻或不相邻的GridItem子组件已自动选中
      await Utils.sleep(500)
      Logger.info('TEST', '步骤5：已选中几个相邻或不相邻的GridItem子组件（共5项）')
      
      // 步骤6：通过手指进行连续多次拖拽（模拟触摸拖拽操作）
      let grid_item_1_014 = await driver.waitForComponent(ON.id('grid_item_1_014'), 500)
      let drop_zone_014 = await driver.waitForComponent(ON.id('drop_zone_014'), 500)
      
      // 获取GridItem和释放区域的位置
      let gridItemBounds = await grid_item_1_014.getBoundsCenter()
      let dropZoneBounds = await drop_zone_014.getBoundsCenter()
      
      // 执行第1次手指拖拽操作（横屏模式）
      Logger.info('TEST', '步骤6：开始第1次手指拖拽操作（横屏模式）')
      await driver.drag(gridItemBounds.x, gridItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤6：已完成第1次手指拖拽操作（横屏模式）')
      
      // 步骤7：观察拖拽效果并截图
      Logger.info('TEST', '步骤7：观察拖拽效果（横屏模式）')
      Logger.info('TEST', '预期结果7.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果7.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果7.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果7.4：拖拽过程中动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_014 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_029
     * @tc.name   : Multi-select drag-and-drop effect for ListItem components via finger touch
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_029', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_029 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot029')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击List组件测试按钮
      let test_button_029 = await driver.waitForComponent(ON.id('test_button_029'), 500)
      await test_button_029.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击List组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      await Utils.sleep(500)
      
      // 步骤4：已选中几个ListItem子组件
      Logger.info('TEST', '步骤4：已选中几个ListItem子组件（共3项）')
      
      // 步骤5：通过手指进行拖拽（模拟触摸拖拽操作）
      let list_item_1_029 = await driver.waitForComponent(ON.id('list_item_1_029'), 500)
      let drop_zone_029 = await driver.waitForComponent(ON.id('drop_zone_029'), 500)
      
      // 获取ListItem和释放区域的位置
      let listItemBounds = await list_item_1_029.getBoundsCenter()
      let dropZoneBounds = await drop_zone_029.getBoundsCenter()
      
      // 执行手指拖拽操作
      Logger.info('TEST', '步骤5：开始通过手指进行拖拽操作')
      await driver.drag(listItemBounds.x, listItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(1000)
      Logger.info('TEST', '步骤5：已完成手指拖拽操作')
      
      // 步骤6：观察拖拽效果并截图
      Logger.info('TEST', '步骤6：观察拖拽效果')
      Logger.info('TEST', '预期结果：即使设置了非聚拢拖拽（ENABLE_MULTI_TILE_EFFECT），通过手指拖拽ListItem依旧是聚拢效果')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_029 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_030
     * @tc.name   : Multi-select drag-and-drop effect for adjacent ListItem components via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_030 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot030')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击List组件测试按钮
      let test_button_030 = await driver.waitForComponent(ON.id('test_button_030'), 500)
      await test_button_030.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击List组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      await Utils.sleep(500)
      
      // 步骤4：已选中几个相邻的ListItem子组件
      Logger.info('TEST', '步骤4：已选中几个相邻的ListItem子组件（项目2、3、4、5，共4项相邻）')
      
      // 步骤5：通过鼠标进行拖拽
      let list_item_1_030 = await driver.waitForComponent(ON.id('list_item_1_030'), 500)
      let drop_zone_030 = await driver.waitForComponent(ON.id('drop_zone_030'), 500)
      
      // 获取ListItem和释放区域的位置
      let listItemBounds = await list_item_1_030.getBoundsCenter()
      let dropZoneBounds = await drop_zone_030.getBoundsCenter()
      
      // 执行鼠标拖拽操作
      Logger.info('TEST', '步骤5：开始通过鼠标进行拖拽操作')
      await driver.drag(listItemBounds.x, listItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(1000)
      Logger.info('TEST', '步骤5：已完成鼠标拖拽操作')
      
      // 步骤6：观察拖拽效果并截图
      Logger.info('TEST', '步骤6：观察拖拽效果')
      Logger.info('TEST', '预期结果6.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果6.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果6.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果6.4：拖拽过程中动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_031
     * @tc.name   : Multi-select drag-and-drop effect for non-adjacent ListItem components via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_031', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_031 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot031')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击List组件测试按钮
      let test_button_031 = await driver.waitForComponent(ON.id('test_button_031'), 500)
      await test_button_031.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击List组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      await Utils.sleep(500)
      
      // 步骤4：已选中几个不相邻的ListItem子组件
      Logger.info('TEST', '步骤4：已选中几个不相邻的ListItem子组件（项目1、3、6、8，共4项不相邻）')
      
      // 步骤5：通过鼠标进行拖拽
      let list_item_0_031 = await driver.waitForComponent(ON.id('list_item_0_031'), 500)
      let drop_zone_031 = await driver.waitForComponent(ON.id('drop_zone_031'), 500)
      
      // 获取ListItem和释放区域的位置
      let listItemBounds = await list_item_0_031.getBoundsCenter()
      let dropZoneBounds = await drop_zone_031.getBoundsCenter()
      
      // 执行鼠标拖拽操作
      Logger.info('TEST', '步骤5：开始通过鼠标进行拖拽操作')
      await driver.drag(listItemBounds.x, listItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(1000)
      Logger.info('TEST', '步骤5：已完成鼠标拖拽操作')
      
      // 步骤6：观察拖拽效果并截图
      Logger.info('TEST', '步骤6：观察拖拽效果')
      Logger.info('TEST', '预期结果6.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果6.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果6.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果6.4：拖拽过程中动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_031 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_032
     * @tc.name   : Multi-select continuous drag-and-drop effect for ListItem components via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_032', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_032 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot032')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击List组件测试按钮
      let test_button_032 = await driver.waitForComponent(ON.id('test_button_032'), 500)
      await test_button_032.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击List组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      await Utils.sleep(500)
      
      // 步骤4：已选中几个相邻或不相邻的ListItem子组件
      Logger.info('TEST', '步骤4：已选中几个相邻或不相邻的ListItem子组件（项目1、2相邻，项目5、8不相邻，共4项）')
      
      // 步骤5：通过鼠标进行连续多次拖拽
      let list_item_0_032 = await driver.waitForComponent(ON.id('list_item_0_032'), 500)
      let drop_zone_032 = await driver.waitForComponent(ON.id('drop_zone_032'), 500)
      
      // 获取ListItem和释放区域的位置
      let listItemBounds = await list_item_0_032.getBoundsCenter()
      let dropZoneBounds = await drop_zone_032.getBoundsCenter()
      
      // 执行第1次鼠标拖拽操作
      Logger.info('TEST', '步骤5：开始第1次鼠标拖拽操作')
      await driver.drag(listItemBounds.x, listItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤5：已完成第1次鼠标拖拽操作')
      
      // 步骤6：观察拖拽效果并截图
      Logger.info('TEST', '步骤6：观察拖拽效果')
      Logger.info('TEST', '预期结果6.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果6.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果6.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果6.4：拖拽过程中动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_032 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_033
     * @tc.name   : Multi-select drag-and-drop effect with selected state for ListItem components via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_033', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_033 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot033')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击List组件测试按钮
      let test_button_033 = await driver.waitForComponent(ON.id('test_button_033'), 500)
      await test_button_033.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击List组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      await Utils.sleep(500)
      
      // 步骤4：设置子组件的选中态
      Logger.info('TEST', '步骤4：已设置ListItem子组件的选中态（4个ListItem已设置选中态）')
      
      // 步骤5：选中几个相邻或不相邻的ListItem子组件
      Logger.info('TEST', '步骤5：已选中几个相邻或不相邻的ListItem子组件（项目1、2相邻，项目5、8不相邻，共4项）')
      Logger.info('TEST', '预期结果5：组件的选中态改变正确（深紫色背景+金色边框+选中态标识）')
      
      // 步骤6：通过鼠标进行连续多次拖拽
      let list_item_0_033 = await driver.waitForComponent(ON.id('list_item_0_033'), 500)
      let drop_zone_033 = await driver.waitForComponent(ON.id('drop_zone_033'), 500)
      
      // 获取ListItem和释放区域的位置
      let listItemBounds = await list_item_0_033.getBoundsCenter()
      let dropZoneBounds = await drop_zone_033.getBoundsCenter()
      
      // 执行第1次鼠标拖拽操作
      Logger.info('TEST', '步骤6：开始第1次鼠标拖拽操作')
      await driver.drag(listItemBounds.x, listItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤6：已完成第1次鼠标拖拽操作')
      
      // 步骤7：观察拖拽效果并截图
      Logger.info('TEST', '步骤7：观察拖拽效果')
      Logger.info('TEST', '预期结果7.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果7.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果7.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果7.4：拖拽的预览图显示带有选中态效果（深紫色背景+金色边框）')
      Logger.info('TEST', '预期结果7.5：拖拽过程中动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_033 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_034
     * @tc.name   : Multi-select drag-and-drop effect with custom drag preview for ListItem components via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_034', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_034 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot034')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击List组件测试按钮
      let test_button_034 = await driver.waitForComponent(ON.id('test_button_034'), 500)
      await test_button_034.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击List组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      await Utils.sleep(500)
      
      // 步骤4：设置一个带有图片的拖拽预览图
      Logger.info('TEST', '步骤4：已设置一个带有图片的拖拽预览图（橙色背景+icon图标的自定义预览图）')
      
      // 步骤5：选中几个相邻或不相邻的ListItem子组件
      Logger.info('TEST', '步骤5：已选中几个相邻或不相邻的ListItem子组件（项目1、2相邻，项目5、8不相邻，共4项）')
      Logger.info('TEST', '预期结果5：非聚拢拖拽显示的优先级要大于拖拽预览显示')
      
      // 步骤6：通过鼠标进行连续多次拖拽
      let list_item_0_034 = await driver.waitForComponent(ON.id('list_item_0_034'), 500)
      let drop_zone_034 = await driver.waitForComponent(ON.id('drop_zone_034'), 500)
      
      // 获取ListItem和释放区域的位置
      let listItemBounds = await list_item_0_034.getBoundsCenter()
      let dropZoneBounds = await drop_zone_034.getBoundsCenter()
      
      // 执行第1次鼠标拖拽操作
      Logger.info('TEST', '步骤6：开始第1次鼠标拖拽操作')
      await driver.drag(listItemBounds.x, listItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤6：已完成第1次鼠标拖拽操作')
      
      // 步骤7：观察拖拽效果并截图
      Logger.info('TEST', '步骤7：观察拖拽效果')
      Logger.info('TEST', '预期结果7.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果7.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果7.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果7.4：拖拽的预览图显示带有选中态效果')
      Logger.info('TEST', '预期结果7.5：拖拽过程中动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_034 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_035
     * @tc.name   : Multi-select drag-and-drop effect for ListItem components with different widths and heights via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_035', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_035 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot035')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击List组件测试按钮
      let test_button_035 = await driver.waitForComponent(ON.id('test_button_035'), 500)
      await test_button_035.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击List组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      await Utils.sleep(500)
      
      // 步骤4：选中几个相邻或不相邻的并且宽高并不相同的ListItem子组件
      Logger.info('TEST', '步骤4：已选中几个相邻或不相邻的并且宽高并不相同的ListItem子组件')
      Logger.info('TEST', '选中的ListItem尺寸：项目2(高90,宽90%)、项目4(高110,宽95%)、项目6(高120,宽90%)、项目8(高100,宽92%)')
      
      // 步骤5：通过鼠标进行连续多次拖拽
      let list_item_1_035 = await driver.waitForComponent(ON.id('list_item_1_035'), 500)
      let drop_zone_035 = await driver.waitForComponent(ON.id('drop_zone_035'), 500)
      
      // 获取ListItem和释放区域的位置
      let listItemBounds = await list_item_1_035.getBoundsCenter()
      let dropZoneBounds = await drop_zone_035.getBoundsCenter()
      
      // 执行第1次鼠标拖拽操作
      Logger.info('TEST', '步骤5：开始第1次鼠标拖拽操作')
      await driver.drag(listItemBounds.x, listItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤5：已完成第1次鼠标拖拽操作')
      
      // 步骤6：观察拖拽效果并截图
      Logger.info('TEST', '步骤6：观察拖拽效果')
      Logger.info('TEST', '预期结果6.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果6.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果6.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果6.4：拖拽预览图显示正确，没有被截断的现象')
      Logger.info('TEST', '预期结果6.5：拖拽过程中动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_035 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_036
     * @tc.name   : Multi-select drag-and-drop effect for ListItem components created by CustomBuilder via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_036', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_036 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot036')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击List组件测试按钮
      let test_button_036 = await driver.waitForComponent(ON.id('test_button_036'), 500)
      await test_button_036.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击List组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      await Utils.sleep(500)
      
      // 步骤4：选中几个相邻或不相邻的通过CustomBuilder创建的ListItem子组件
      Logger.info('TEST', '步骤4：已选中几个相邻或不相邻的通过CustomBuilder创建的ListItem子组件')
      Logger.info('TEST', '选中的ListItem：项目1、2（相邻）、项目5、8（不相邻），均通过CustomBuilder创建复杂UI')
      
      // 步骤5：通过鼠标进行连续多次拖拽
      let list_item_0_036 = await driver.waitForComponent(ON.id('list_item_0_036'), 500)
      let drop_zone_036 = await driver.waitForComponent(ON.id('drop_zone_036'), 500)
      
      // 获取ListItem和释放区域的位置
      let listItemBounds = await list_item_0_036.getBoundsCenter()
      let dropZoneBounds = await drop_zone_036.getBoundsCenter()
      
      // 执行第1次鼠标拖拽操作
      Logger.info('TEST', '步骤5：开始第1次鼠标拖拽操作')
      await driver.drag(listItemBounds.x, listItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤5：已完成第1次鼠标拖拽操作')
      
      // 步骤6：观察拖拽效果并截图
      Logger.info('TEST', '步骤6：观察拖拽效果')
      Logger.info('TEST', '预期结果6.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果6.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果6.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果6.4：拖拽过程中动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_036 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_037
     * @tc.name   : Multi-select drag-and-drop effect with style changes in onDragStart for ListItem components via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_037', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_037 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot037')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击List组件测试按钮
      let test_button_037 = await driver.waitForComponent(ON.id('test_button_037'), 500)
      await test_button_037.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击List组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      await Utils.sleep(500)
      
      // 步骤4：在onDragStart中改变组件样式
      Logger.info('TEST', '步骤4：已在onDragStart中设置改变组件样式逻辑（透明度0.3+灰色背景）')
      
      // 步骤5：选中几个相邻或不相邻的ListItem子组件
      Logger.info('TEST', '步骤5：已选中几个相邻或不相邻的ListItem子组件（项目1、2相邻，项目5、8不相邻，共4项）')
      
      // 步骤6：通过鼠标进行连续多次拖拽
      let list_item_0_037 = await driver.waitForComponent(ON.id('list_item_0_037'), 500)
      let drop_zone_037 = await driver.waitForComponent(ON.id('drop_zone_037'), 500)
      
      // 获取ListItem和释放区域的位置
      let listItemBounds = await list_item_0_037.getBoundsCenter()
      let dropZoneBounds = await drop_zone_037.getBoundsCenter()
      
      // 执行第1次鼠标拖拽操作
      Logger.info('TEST', '步骤6：开始第1次鼠标拖拽操作')
      await driver.drag(listItemBounds.x, listItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤6：已完成第1次鼠标拖拽操作')
      
      // 步骤7：观察拖拽效果并截图
      Logger.info('TEST', '步骤7：观察拖拽效果')
      Logger.info('TEST', '预期结果7.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果7.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果7.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果7.4：拖拽过程中动效流畅')
      Logger.info('TEST', '预期结果7.5：原组件样式改变正确（拖拽时透明度0.3+灰色背景，拖拽结束后恢复）')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_037 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_038
     * @tc.name   : Multi-select drag-and-drop effect with bindContextMenu for ListItem components via finger
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_038', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_038 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot038')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击List组件测试按钮
      let test_button_038 = await driver.waitForComponent(ON.id('test_button_038'), 500)
      await test_button_038.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击List组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      await Utils.sleep(500)
      
      // 步骤4：在ListItem中绑定bindContextMenu
      Logger.info('TEST', '步骤4：已在ListItem中绑定bindContextMenu（长按触发）')
      
      // 步骤5：选中几个相邻或不相邻的ListItem子组件
      Logger.info('TEST', '步骤5：已选中几个相邻或不相邻的ListItem子组件（项目1、2相邻，项目5、8不相邻，共4项）')
      
      // 步骤6：通过手指进行连续多次拖拽
      let list_item_0_038 = await driver.waitForComponent(ON.id('list_item_0_038'), 500)
      let drop_zone_038 = await driver.waitForComponent(ON.id('drop_zone_038'), 500)
      
      // 获取ListItem和释放区域的位置
      let listItemBounds = await list_item_0_038.getBoundsCenter()
      let dropZoneBounds = await drop_zone_038.getBoundsCenter()
      
      // 执行第1次手指拖拽操作
      Logger.info('TEST', '步骤6：开始第1次手指拖拽操作')
      await driver.drag(listItemBounds.x, listItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤6：已完成第1次手指拖拽操作')
      
      // 步骤7：观察拖拽效果并截图
      Logger.info('TEST', '步骤7：观察拖拽效果')
      Logger.info('TEST', '预期结果7：先弹出bindContextMenu然后呈非聚拢效果显示拖拽预览')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_038 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_039
     * @tc.name   : Multi-select drag-and-drop effect by toggling between gathering and non-gathering states for ListItem components via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_039', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_039 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot039')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击List组件测试按钮
      let test_button_039 = await driver.waitForComponent(ON.id('test_button_039'), 500)
      await test_button_039.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击List组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面初始化时设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT（非聚拢）')
      await Utils.sleep(300)
      
      // 获取ListItem和释放区域的位置
      let list_item_0_039 = await driver.waitForComponent(ON.id('list_item_0_039'), 500)
      let drop_zone_039 = await driver.waitForComponent(ON.id('drop_zone_039'), 500)
      let listItemBounds = await list_item_0_039.getBoundsCenter()
      let dropZoneBounds = await drop_zone_039.getBoundsCenter()
      
      // 步骤4：通过鼠标拖拽几个相邻或不相邻的ListItem子组件（第1次拖拽，mode=ENABLE_MULTI_TILE_EFFECT）
      Logger.info('TEST', '步骤4：开始第1次鼠标拖拽（mode=ENABLE_MULTI_TILE_EFFECT）')
      await driver.drag(listItemBounds.x, listItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤4：已完成第1次鼠标拖拽（mode=ENABLE_MULTI_TILE_EFFECT）')
      
      // 步骤5：设置dragPreviewOptions中的mode属性为AUTO
      let toggle_mode_button_039 = await driver.waitForComponent(ON.id('toggle_mode_button_039'), 500)
      await toggle_mode_button_039.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤5：已点击切换按钮，mode切换为AUTO（聚拢）')
      
      // 步骤6：通过鼠标拖拽几个相邻或不相邻的ListItem子组件（第2次拖拽，mode=AUTO）
      Logger.info('TEST', '步骤6：开始第2次鼠标拖拽（mode=AUTO）')
      await driver.drag(listItemBounds.x, listItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤6：已完成第2次鼠标拖拽（mode=AUTO）')
      
      // 步骤9：观察非聚拢效果并截图
      Logger.info('TEST', '步骤9：观察非聚拢效果')
      Logger.info('TEST', '预期结果9.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果9.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果9.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果9.4：拖拽过程中动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_039 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_040
     * @tc.name   : Multi-select drag-and-drop effect with numberBadge for ListItem components via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_040 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot040')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击List组件测试按钮
      let test_button_040 = await driver.waitForComponent(ON.id('test_button_040'), 500)
      await test_button_040.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击List组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      await Utils.sleep(500)
      
      // 步骤4：设置numberBadge为true
      Logger.info('TEST', '步骤4：dragPreviewOptions的numberBadge已设置为true（显示角标）')
      
      // 步骤5：已选中几个相邻或不相邻的ListItem子组件
      Logger.info('TEST', '步骤5：已选中几个相邻或不相邻的ListItem子组件（项目1、2相邻，项目5、8、10不相邻，共5项）')
      
      // 步骤6：通过手指进行连续多次拖拽
      let list_item_0_040 = await driver.waitForComponent(ON.id('list_item_0_040'), 500)
      let drop_zone_040 = await driver.waitForComponent(ON.id('drop_zone_040'), 500)
      
      // 获取ListItem和释放区域的位置
      let listItemBounds = await list_item_0_040.getBoundsCenter()
      let dropZoneBounds = await drop_zone_040.getBoundsCenter()
      
      // 执行第1次手指拖拽操作
      Logger.info('TEST', '步骤6：开始第1次手指拖拽操作（numberBadge角标将显示"5"）')
      await driver.drag(listItemBounds.x, listItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤6：已完成第1次手指拖拽操作')
      
      // 步骤7：观察拖拽效果并截图
      Logger.info('TEST', '步骤7：观察拖拽效果')
      Logger.info('TEST', '预期结果7.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果7.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果7.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果7.4：拖拽过程中动效流畅')
      Logger.info('TEST', '预期结果7.5：角标显示在整个拖拽预览的右上方（显示数字"5"）')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_041
     * @tc.name   : Multi-select drag-and-drop effect with custom backdrop style for ListItem components via finger
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_041', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_041 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot041')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击List组件测试按钮
      let test_button_041 = await driver.waitForComponent(ON.id('test_button_041'), 500)
      await test_button_041.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击List组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      await Utils.sleep(500)
      
      // 步骤4：设置自定义背板样式
      Logger.info('TEST', '步骤4：已设置自定义背板样式（半透明橙色背板、圆角15、紫色边框、橙色阴影）')
      
      // 步骤5：已选中几个相邻或不相邻的ListItem子组件
      Logger.info('TEST', '步骤5：已选中几个相邻或不相邻的ListItem子组件（项目1、2相邻，项目5、8、10不相邻，共5项）')
      
      // 步骤6：通过手指进行连续多次拖拽
      let list_item_0_041 = await driver.waitForComponent(ON.id('list_item_0_041'), 500)
      let drop_zone_041 = await driver.waitForComponent(ON.id('drop_zone_041'), 500)
      
      // 获取ListItem和释放区域的位置
      let listItemBounds = await list_item_0_041.getBoundsCenter()
      let dropZoneBounds = await drop_zone_041.getBoundsCenter()
      
      // 执行第1次手指拖拽操作
      Logger.info('TEST', '步骤6：开始第1次手指拖拽操作（观察自定义背板样式）')
      await driver.drag(listItemBounds.x, listItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤6：已完成第1次手指拖拽操作')
      
      // 步骤7：观察拖拽效果并截图
      Logger.info('TEST', '步骤7：观察拖拽效果')
      Logger.info('TEST', '预期结果7.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果7.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果7.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果7.4：拖拽过程中动效流畅')
      Logger.info('TEST', '预期结果7.5：自定义背板样式显示正确（半透明橙色背景、圆角15、紫色边框、橙色阴影）')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_041 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_042
     * @tc.name   : Multi-select drag-and-drop effect for ListItem components in landscape mode via finger
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_042', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_042 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot042')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击List组件测试按钮
      let test_button_042 = await driver.waitForComponent(ON.id('test_button_042'), 500)
      await test_button_042.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击List组件测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT')
      await Utils.sleep(500)
      
      // 步骤4：设备切换横屏（点击横屏切换按钮）
      let toggle_landscape_button_042 = await driver.waitForComponent(ON.id('toggle_landscape_button_042'), 500)
      await toggle_landscape_button_042.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤4：设备已切换横屏模式')
      
      // 步骤5：已选中几个相邻或不相邻的ListItem子组件
      Logger.info('TEST', '步骤5：已选中几个相邻或不相邻的ListItem子组件（项目1、2相邻，项目5、8、10不相邻，共5项）')
      
      // 步骤6：通过手指进行连续多次拖拽
      let list_item_0_042 = await driver.waitForComponent(ON.id('list_item_0_042'), 500)
      let drop_zone_042 = await driver.waitForComponent(ON.id('drop_zone_042'), 500)
      
      // 获取ListItem和释放区域的位置
      let listItemBounds = await list_item_0_042.getBoundsCenter()
      let dropZoneBounds = await drop_zone_042.getBoundsCenter()
      
      // 执行第1次手指拖拽操作（横屏模式）
      Logger.info('TEST', '步骤6：开始第1次手指拖拽操作（横屏模式）')
      await driver.drag(listItemBounds.x, listItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(800)
      Logger.info('TEST', '步骤6：已完成第1次手指拖拽操作（横屏模式）')
      
      // 步骤7：观察拖拽效果并截图
      Logger.info('TEST', '步骤7：观察拖拽效果（横屏模式）')
      Logger.info('TEST', '预期结果7.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果7.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果7.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果7.4：拖拽过程中动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_042 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_057
     * @tc.name   : Multi-select drag-and-drop effect for adjacent GridItem components with Modifier via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_057', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_057 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot057')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击Grid组件Modifier测试按钮
      let test_button_057 = await driver.waitForComponent(ON.id('test_button_057'), 500)
      await test_button_057.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击Grid组件Modifier测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT，使用Modifier设置样式')
      await Utils.sleep(500)
      
      // 步骤4：已选中几个相邻的GridItem子组件
      Logger.info('TEST', '步骤4：已选中几个相邻的GridItem子组件（第5、6、9、10项，形成2x2相邻区域）')
      
      // 步骤5：通过鼠标进行拖拽
      let grid_item_4_057 = await driver.waitForComponent(ON.id('grid_item_4_057'), 500)
      let drop_zone_057 = await driver.waitForComponent(ON.id('drop_zone_057'), 500)
      
      // 获取GridItem和释放区域的位置
      let gridItemBounds = await grid_item_4_057.getBoundsCenter()
      let dropZoneBounds = await drop_zone_057.getBoundsCenter()
      
      // 执行鼠标拖拽操作
      Logger.info('TEST', '步骤5：开始通过鼠标进行拖拽操作（Modifier设置的样式生效）')
      await driver.drag(gridItemBounds.x, gridItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(1000)
      Logger.info('TEST', '步骤5：已完成鼠标拖拽操作')
      
      // 步骤6：观察拖拽效果并截图
      Logger.info('TEST', '步骤6：观察拖拽效果（使用Modifier设置的相邻GridItem）')
      Logger.info('TEST', '预期结果6.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果6.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果6.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果6.4：拖拽过程中动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_057 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_058
     * @tc.name   : Multi-select drag-and-drop effect for non-adjacent GridItem components with Modifier via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_058', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_058 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot058')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击Grid组件Modifier测试按钮
      let test_button_058 = await driver.waitForComponent(ON.id('test_button_058'), 500)
      await test_button_058.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击Grid组件Modifier测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT，使用Modifier设置样式')
      await Utils.sleep(500)
      
      // 步骤4：已选中几个不相邻的GridItem子组件
      Logger.info('TEST', '步骤4：已选中几个不相邻的GridItem子组件（第1、4、10、15项，分散在不同位置）')
      
      // 步骤5：通过鼠标进行拖拽
      let grid_item_0_058 = await driver.waitForComponent(ON.id('grid_item_0_058'), 500)
      let drop_zone_058 = await driver.waitForComponent(ON.id('drop_zone_058'), 500)
      
      // 获取GridItem和释放区域的位置
      let gridItemBounds = await grid_item_0_058.getBoundsCenter()
      let dropZoneBounds = await drop_zone_058.getBoundsCenter()
      
      // 执行鼠标拖拽操作
      Logger.info('TEST', '步骤5：开始通过鼠标进行拖拽操作（Modifier设置的样式生效）')
      await driver.drag(gridItemBounds.x, gridItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(1000)
      Logger.info('TEST', '步骤5：已完成鼠标拖拽操作')
      
      // 步骤6：观察拖拽效果并截图
      Logger.info('TEST', '步骤6：观察拖拽效果（使用Modifier设置的不相邻GridItem）')
      Logger.info('TEST', '预期结果6.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果6.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果6.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果6.4：拖拽过程中动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_058 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_061
     * @tc.name   : Multi-select drag-and-drop effect for adjacent ListItem components with Modifier via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_061', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_061 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot061')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击List组件Modifier测试按钮
      let test_button_061 = await driver.waitForComponent(ON.id('test_button_061'), 500)
      await test_button_061.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击List组件Modifier测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT，使用Modifier设置样式')
      await Utils.sleep(500)
      
      // 步骤4：已选中几个相邻的ListItem子组件
      Logger.info('TEST', '步骤4：已选中几个相邻的ListItem子组件（第2、3、4、5项，连续相邻）')
      
      // 步骤5：通过鼠标进行拖拽
      let list_item_1_061 = await driver.waitForComponent(ON.id('list_item_1_061'), 500)
      let drop_zone_061 = await driver.waitForComponent(ON.id('drop_zone_061'), 500)
      
      // 获取ListItem和释放区域的位置
      let listItemBounds = await list_item_1_061.getBoundsCenter()
      let dropZoneBounds = await drop_zone_061.getBoundsCenter()
      
      // 执行鼠标拖拽操作
      Logger.info('TEST', '步骤5：开始通过鼠标进行拖拽操作（Modifier设置的样式生效）')
      await driver.drag(listItemBounds.x, listItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(1000)
      Logger.info('TEST', '步骤5：已完成鼠标拖拽操作')
      
      // 步骤6：观察拖拽效果并截图
      Logger.info('TEST', '步骤6：观察拖拽效果（使用Modifier设置的相邻ListItem）')
      Logger.info('TEST', '预期结果6.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果6.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果6.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果6.4：拖拽过程中动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_061 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_062
     * @tc.name   : Multi-select drag-and-drop effect for non-adjacent ListItem components with Modifier via mouse
     * @tc.desc   : Verify multiple selection and drag customize gather or not interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_062', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_062 start.`);
      
      // 步骤1：打开hap
      Settings.createWindow('testability/pages/scenario/misc/CustomizeGatherOrNot/CustomizeGatherOrNot062')
      let driver: Driver = await Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击List组件Modifier测试按钮
      let test_button_062 = await driver.waitForComponent(ON.id('test_button_062'), 500)
      await test_button_062.click()
      await Utils.sleep(500)
      Logger.info('TEST', '步骤2：已点击List组件Modifier测试按钮')
      
      // 步骤3：dragPreviewOptions的mode已在页面中设置为ENABLE_MULTI_TILE_EFFECT
      Logger.info('TEST', '步骤3：dragPreviewOptions的mode已设置为ENABLE_MULTI_TILE_EFFECT，使用Modifier设置样式')
      await Utils.sleep(500)
      
      // 步骤4：已选中几个不相邻的ListItem子组件
      Logger.info('TEST', '步骤4：已选中几个不相邻的ListItem子组件（第1、3、6、8项，分散在不同位置）')
      
      // 步骤5：通过鼠标进行拖拽
      let list_item_0_062 = await driver.waitForComponent(ON.id('list_item_0_062'), 500)
      let drop_zone_062 = await driver.waitForComponent(ON.id('drop_zone_062'), 500)
      
      // 获取ListItem和释放区域的位置
      let listItemBounds = await list_item_0_062.getBoundsCenter()
      let dropZoneBounds = await drop_zone_062.getBoundsCenter()
      
      // 执行鼠标拖拽操作
      Logger.info('TEST', '步骤5：开始通过鼠标进行拖拽操作（Modifier设置的样式生效）')
      await driver.drag(listItemBounds.x, listItemBounds.y, dropZoneBounds.x, dropZoneBounds.y, 600)
      await Utils.sleep(1000)
      Logger.info('TEST', '步骤5：已完成鼠标拖拽操作')
      
      // 步骤6：观察拖拽效果并截图
      Logger.info('TEST', '步骤6：观察拖拽效果（使用Modifier设置的不相邻ListItem）')
      Logger.info('TEST', '预期结果6.1：拖拽效果为非聚拢')
      Logger.info('TEST', '预期结果6.2：鼠标光标位于整个拖拽预览图中间')
      Logger.info('TEST', '预期结果6.3：拖拽预览图的大小跟原组件大小一致，没有等比例缩放效果')
      Logger.info('TEST', '预期结果6.4：拖拽过程中动效流畅')
      windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_MULTIPLE_SELECTION_AND_DRAG_CUSTOMIZE_GATHER_OR_NOT_062 finish.`);
      done()
    })


  })
}