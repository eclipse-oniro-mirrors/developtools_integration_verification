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

export default function measurableUniqueId() {

  describe('measurableUniqueId', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0010
     * @tc.name   : Measuable uniqueid
     * @tc.desc   : Verify measuable uniqueid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0010 start.`);
      
      // 步骤1：进入测试正确修改FrameNode的通用属性页面
      Settings.createWindow('testability/pages/scenario/misc/MeasurableUniqueId/MeasurableUniqueId0010')
      let driver = await Driver.create();
      await Utils.sleep(500)
      
      // 等待页面加载完成，触发onMeasureSize和onPlaceChildren
      await driver.waitForIdle(2000, 3000)

      // 点击按钮获取FrameNode的UniqueId
      let getUniqueIdButton = await driver.waitForComponent(ON.id('get_uniqueid_button'), 500)
      await getUniqueIdButton.click()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `验证FrameNode、dump、Measurable三端uniqueId一致性`);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0020
     * @tc.name   : Measuable uniqueid
     * @tc.desc   : Verify measuable uniqueid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0020 start.`);
      
      // 步骤1：进入测试正确修改FrameNode的通用属性页面
      Settings.createWindow('testability/pages/scenario/misc/MeasurableUniqueId/MeasurableUniqueId0020')
      let driver = await Driver.create();
      await Utils.sleep(500)
      
      // 等待页面加载完成
      await driver.waitForIdle(2000, 3000)
      
      // 点击按钮修改FrameNode属性
      let modifyButton = await driver.waitForComponent(ON.id('modify_framenode_button'), 500)
      await modifyButton.click()
      await Utils.sleep(1000)
      
      // 截图记录最终效果 - 预期结果：屏幕出现三个100*100的粉色正方形
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0030
     * @tc.name   : Measuable uniqueid
     * @tc.desc   : Verify measuable uniqueid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0030 start.`);
      
      // 步骤1：进入测试正确调用FrameNode的Get系列API
      Settings.createWindow('testability/pages/scenario/misc/MeasurableUniqueId/MeasurableUniqueId0030')
      let driver = await Driver.create();
      await Utils.sleep(500)
      
      // 等待页面加载完成
      await driver.waitForIdle(2000, 3000)
      
      // 步骤2：点击一下获取子组件的MeasureId按钮
      let getMeasureIdButton = await driver.waitForComponent(ON.id('get_measure_id_button'), 500)
      await getMeasureIdButton.click()
      await Utils.sleep(1000)
      
      // 步骤3：点击getChildNumber按钮
      let getChildNumberButton = await driver.waitForComponent(ON.id('get_child_number_button'), 500)
      await getChildNumberButton.click()
      await Utils.sleep(1000)
      
      // 点击获取其他Get系列API信息按钮
      let getOtherInfoButton = await driver.waitForComponent(ON.id('get_other_info_button'), 500)
      await getOtherInfoButton.click()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `验证FrameNode、dump、Measurable10三端一致性`);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0040
     * @tc.name   : Measuable uniqueid
     * @tc.desc   : Verify measuable uniqueid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0040 start.`);
      
      // 步骤1：进入测试正确修改FrameNode的通用属性页面
      Settings.createWindow('testability/pages/scenario/misc/MeasurableUniqueId/MeasurableUniqueId0040')
      let driver = await Driver.create();
      await Utils.sleep(500)
      
      // 等待页面加载完成
      await driver.waitForIdle(2000, 3000)
      
      // 先点击按钮添加通用事件
      let addEventsButton = await driver.waitForComponent(ON.id('add_events_button'), 500)
      await addEventsButton.click()
      await Utils.sleep(1000)
      
      // 步骤2：点击三个粉色方块
      let nodeContainer0 = await driver.waitForComponent(ON.id('node_container_0'), 500)
      let nodeContainer1 = await driver.waitForComponent(ON.id('node_container_1'), 500)
      let nodeContainer2 = await driver.waitForComponent(ON.id('node_container_2'), 500)
      
      await nodeContainer0.click()
      await Utils.sleep(500)
      await nodeContainer1.click()
      await Utils.sleep(500)
      await nodeContainer2.click()
      await Utils.sleep(500)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0050
     * @tc.name   : Measuable uniqueid
     * @tc.desc   : Verify measuable uniqueid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0050 start.`);
      
      // 步骤1：进入测试正确添加FrameNode的手势事件
      Settings.createWindow('testability/pages/scenario/misc/MeasurableUniqueId/MeasurableUniqueId0050')
      let driver = await Driver.create();
      await Utils.sleep(500)
      
      // 等待页面加载完成
      await driver.waitForIdle(2000, 3000)
      
      // 先点击按钮添加滑动手势事件
      let addPanGestureButton = await driver.waitForComponent(ON.id('add_pan_gesture_button'), 500)
      await addPanGestureButton.click()
      await Utils.sleep(1000)
      
      // 步骤2：手指在三个粉色方块上滑动
      let nodeContainer0 = await driver.waitForComponent(ON.id('node_container_0'), 500)
      let nodeContainer1 = await driver.waitForComponent(ON.id('node_container_1'), 500)
      let nodeContainer2 = await driver.waitForComponent(ON.id('node_container_2'), 500)
      
      // 在第一个粉色方块上滑动
      await nodeContainer0.dragTo(nodeContainer0)
      await Utils.sleep(500)
      
      // 在第二个粉色方块上滑动
      await nodeContainer1.dragTo(nodeContainer1)
      await Utils.sleep(500)
      
      // 在第三个粉色方块上滑动
      await nodeContainer2.dragTo(nodeContainer2)
      await Utils.sleep(500)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0060
     * @tc.name   : Measuable uniqueid
     * @tc.desc   : Verify measuable uniqueid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0060 start.`);
      
      // 步骤1：进入测试正确添加FrameNode的手势事件
      Settings.createWindow('testability/pages/scenario/misc/MeasurableUniqueId/MeasurableUniqueId0060')
      let driver = await Driver.create();
      await Utils.sleep(500)
      
      // 等待页面加载完成
      await driver.waitForIdle(2000, 3000)
      
      // 先点击按钮添加长按手势事件
      let addLongPressGestureButton = await driver.waitForComponent(ON.id('add_longpress_gesture_button'), 500)
      await addLongPressGestureButton.click()
      await Utils.sleep(1000)
      
      // 步骤2：手指在三个粉色方块上长按
      let nodeContainer0 = await driver.waitForComponent(ON.id('node_container_0'), 500)
      let nodeContainer1 = await driver.waitForComponent(ON.id('node_container_1'), 500)
      let nodeContainer2 = await driver.waitForComponent(ON.id('node_container_2'), 500)
      
      // 在第一个粉色方块上长按
      await nodeContainer0.longClick()
      await Utils.sleep(1000)
      
      // 在第二个粉色方块上长按
      await nodeContainer1.longClick()
      await Utils.sleep(1000)
      
      // 在第三个粉色方块上长按
      await nodeContainer2.longClick()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0070
     * @tc.name   : Measuable uniqueid
     * @tc.desc   : Verify measuable uniqueid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0070 start.`);
      
      // 步骤1：进入测试正确添加FrameNode的手势事件
      Settings.createWindow('testability/pages/scenario/misc/MeasurableUniqueId/MeasurableUniqueId0070')
      let driver = await Driver.create();
      await Utils.sleep(500)
      
      // 等待页面加载完成
      await driver.waitForIdle(2000, 3000)
      
      // 先点击按钮添加双击手势事件
      let addDoubleTapGestureButton = await driver.waitForComponent(ON.id('add_doubletap_gesture_button'), 500)
      await addDoubleTapGestureButton.click()
      await Utils.sleep(1000)
      
      // 步骤2：手指在三个粉色方块上双击
      let nodeContainer0 = await driver.waitForComponent(ON.id('node_container_0'), 500)
      let nodeContainer1 = await driver.waitForComponent(ON.id('node_container_1'), 500)
      let nodeContainer2 = await driver.waitForComponent(ON.id('node_container_2'), 500)
      
      // 在第一个粉色方块上双击
      await nodeContainer0.doubleClick()
      await Utils.sleep(1000)
      
      // 在第二个粉色方块上双击
      await nodeContainer1.doubleClick()
      await Utils.sleep(1000)
      
      // 在第三个粉色方块上双击
      await nodeContainer2.doubleClick()
      await Utils.sleep(1000)

      
      // 预期结果：打印双击手势日志
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0080
     * @tc.name   : Measuable uniqueid
     * @tc.desc   : Verify measuable uniqueid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0080 start.`);
      
      // 步骤1：进入测试正确调用FrameNode的子节点增删API
      Settings.createWindow('testability/pages/scenario/misc/MeasurableUniqueId/MeasurableUniqueId0080')
      let driver = await Driver.create();
      await Utils.sleep(500)
      
      // 等待页面加载完成
      await driver.waitForIdle(2000, 3000)
      
      // 步骤2：在末尾添加子节点
      let addChildNodeButton = await driver.waitForComponent(ON.id('add_child_node_button'), 500)
      await addChildNodeButton.click()
      await Utils.sleep(1000)
      
      // 可以多次点击添加更多子节点
      await addChildNodeButton.click()
      await Utils.sleep(500)
      await addChildNodeButton.click()
      await Utils.sleep(500)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0090
     * @tc.name   : Measuable uniqueid
     * @tc.desc   : Verify measuable uniqueid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0090 start.`);
      
      // 步骤1：进入测试正确调用FrameNode的子节点增删API
      Settings.createWindow('testability/pages/scenario/misc/MeasurableUniqueId/MeasurableUniqueId0090')
      let driver = await Driver.create();
      await Utils.sleep(500)
      
      // 等待页面加载完成
      await driver.waitForIdle(2000, 3000)
      
      // 步骤2：在第六个节点后添加子节点
      let insertChildNodeButton = await driver.waitForComponent(ON.id('insert_child_node_button'), 500)
      await insertChildNodeButton.click()
      await Utils.sleep(1000)
      
      // 可以再次点击测试多次插入
      await insertChildNodeButton.click()
      await Utils.sleep(500)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0100
     * @tc.name   : Measuable uniqueid
     * @tc.desc   : Verify measuable uniqueid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0100 start.`);
      
      // 步骤1：进入测试正确调用FrameNode的子节点增删API
      Settings.createWindow('testability/pages/scenario/misc/MeasurableUniqueId/MeasurableUniqueId0100')
      let driver = await Driver.create();
      await Utils.sleep(500)
      
      // 等待页面加载完成
      await driver.waitForIdle(2000, 3000)
      
      // 步骤2：移除一个子节点
      let removeChildNodeButton = await driver.waitForComponent(ON.id('remove_child_node_button'), 500)
      await removeChildNodeButton.click()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0110
     * @tc.name   : Measuable uniqueid
     * @tc.desc   : Verify measuable uniqueid interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0110 start.`);
      
      // 步骤1：进入测试正确调用FrameNode的子节点增删API
      Settings.createWindow('testability/pages/scenario/misc/MeasurableUniqueId/MeasurableUniqueId0110')
      let driver = await Driver.create();
      await Utils.sleep(500)
      
      // 等待页面加载完成
      await driver.waitForIdle(2000, 3000)
      
      // 步骤2：清除所有子节点
      let clearAllChildrenButton = await driver.waitForComponent(ON.id('clear_all_children_button'), 500)
      await clearAllChildrenButton.click()
      await Utils.sleep(1000)

      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEASUABLE_UNIQUEID_0110 finish.`);
      done()
    })


  })
}