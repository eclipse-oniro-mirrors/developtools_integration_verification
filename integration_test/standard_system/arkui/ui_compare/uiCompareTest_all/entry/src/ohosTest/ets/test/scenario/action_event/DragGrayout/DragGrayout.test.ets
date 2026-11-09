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

export default function dragGrayout() {

  describe('dragGrayout', () => {
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
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0010
     * @tc.name   : Button component calls ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0010 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发拖拽button组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件灰显，效果符合UX规范，灰显效果为0.4
      Logger.info('TEST', '步骤2-1：验证原组件灰显，灰显效果为0.4');
      await Utils.sleep(500);
      
      // 步骤3：自动释放
      Logger.info('TEST', '步骤3：等待自动释放');
      await Utils.sleep(1500); // 等待释放效果
      
      // 步骤3-1：验证组件恢复原有效果
      Logger.info('TEST', '步骤3-1：验证组件恢复原有效果');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0020
     * @tc.name   : Button component does not call ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0020 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：不调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：不调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发拖拽button组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件不灰显
      Logger.info('TEST', '步骤2-1：验证原组件不灰显');
      await Utils.sleep(1500); // 等待释放效果
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0030
     * @tc.name   : Column component calls ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0030 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发拖拽Column组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件灰显，效果符合UX规范，灰显效果为0.4
      Logger.info('TEST', '步骤2-1：验证原组件灰显，灰显效果为0.4');
      await Utils.sleep(500);
      
      // 步骤3：自动释放
      Logger.info('TEST', '步骤3：等待自动释放');
      await Utils.sleep(1000); // 等待释放效果
      
      // 步骤3-1：验证组件恢复原有效果
      Logger.info('TEST', '步骤3-1：验证组件恢复原有效果');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0050
     * @tc.name   : Image component calls ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0050 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发拖拽Image组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件灰显，效果符合UX规范，灰显效果为0.4
      Logger.info('TEST', '步骤2-1：验证原组件灰显，灰显效果为0.4');
      await Utils.sleep(500);
      
      // 步骤3：自动释放
      Logger.info('TEST', '步骤3：等待自动释放');
      await Utils.sleep(1500); // 等待释放效果
      
      // 步骤3-1：验证组件恢复原有效果
      Logger.info('TEST', '步骤3-1：验证组件恢复原有效果');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0060
     * @tc.name   : Image component does not call ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0060 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：不调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：不调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发拖拽Image组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件不灰显
      Logger.info('TEST', '步骤2-1：验证原组件不灰显');
      await Utils.sleep(1500); // 等待释放效果
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0070
     * @tc.name   : List component single selection calls ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0070 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发list组件拖拽
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件灰显，效果符合UX规范，灰显效果为0.4
      Logger.info('TEST', '步骤2-1：验证原组件灰显，灰显效果为0.4');
      await Utils.sleep(500);
      
      // 步骤3：自动释放
      Logger.info('TEST', '步骤3：等待自动释放');
      await Utils.sleep(1500); // 等待释放效果
      
      // 步骤3-1：验证组件恢复原有效果
      Logger.info('TEST', '步骤3-1：验证组件恢复原有效果');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0080
     * @tc.name   : List component single selection does not call ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0080 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：不调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：不调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发list组件拖拽
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件不灰显
      Logger.info('TEST', '步骤2-1：验证原组件不灰显');
      await Utils.sleep(1500); // 等待释放效果
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0100
     * @tc.name   : List component multi-selection drag, button1 and button2 both call ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0100 start.`);
      
      // 预置条件：List为父组件、button为子组件，组件button1调用、组件button2调用
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      Logger.info('TEST', '预置条件：List为父组件、button为子组件');
      await Utils.sleep(500);
      
      // 步骤1：页面自动触发拖拽button1、2
      Logger.info('TEST', '步骤1：等待页面自动触发拖拽button1');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 预期结果1：button1灰显
      Logger.info('TEST', '预期结果1：button1灰显');
      await Utils.sleep(1000);
      
      // 自动拖拽button2
      Logger.info('TEST', '等待页面自动触发拖拽button2');
      await Utils.sleep(500);
      
      // 预期结果1：button2灰显
      Logger.info('TEST', '预期结果1：button2灰显');
      await Utils.sleep(1000);
      
      // 步骤2：自动释放
      Logger.info('TEST', '步骤2：等待自动释放');
      
      // 预期结果2：组件恢复原有效果
      Logger.info('TEST', '预期结果2：组件恢复原有效果');
      await Utils.sleep(1500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0110
     * @tc.name   : Grid component single selection calls ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0110 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发Grid组件拖拽
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件灰显，效果符合UX规范，灰显效果为0.4
      Logger.info('TEST', '步骤2-1：验证原组件灰显，灰显效果为0.4');
      await Utils.sleep(500);
      
      // 步骤3：自动释放
      Logger.info('TEST', '步骤3：等待自动释放');
      await Utils.sleep(1500); // 等待释放效果
      
      // 步骤3-1：验证组件恢复原有效果
      Logger.info('TEST', '步骤3-1：验证组件恢复原有效果');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0120
     * @tc.name   : Grid component single selection does not call ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0120 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：不调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：不调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发Grid组件拖拽
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件不灰显
      Logger.info('TEST', '步骤2-1：验证原组件不灰显');
      await Utils.sleep(1500); // 等待释放效果
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0130
     * @tc.name   : Grid component multi-selection calls ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0130 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0130')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发Grid组件多选拖拽
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽GridItem1');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件灰显，效果符合UX规范，灰显效果为0.4
      Logger.info('TEST', '步骤2-1：验证GridItem1灰显，灰显效果为0.4');
      await Utils.sleep(1000);
      
      // 自动拖拽GridItem2
      Logger.info('TEST', '等待页面自动触发拖拽GridItem2');
      await Utils.sleep(500);
      
      // 步骤2-1：验证原组件灰显，效果符合UX规范，灰显效果为0.4
      Logger.info('TEST', '步骤2-1：验证GridItem2灰显，灰显效果为0.4');
      await Utils.sleep(1000);
      
      // 步骤3：自动释放
      Logger.info('TEST', '步骤3：等待自动释放');
      await Utils.sleep(500);
      
      // 步骤3-1：验证组件恢复原有效果
      Logger.info('TEST', '步骤3-1：验证组件恢复原有效果');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0130 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0140
     * @tc.name   : Grid component multi-selection does not call ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0140 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0140')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：不调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：不调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发Grid组件多选拖拽
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽GridItem1');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件不灰显
      Logger.info('TEST', '步骤2-1：验证GridItem1不灰显');
      await Utils.sleep(1000);
      
      // 自动拖拽GridItem2
      Logger.info('TEST', '等待页面自动触发拖拽GridItem2');
      await Utils.sleep(500);
      
      // 步骤2-1：验证原组件不灰显
      Logger.info('TEST', '步骤2-1：验证GridItem2不灰显');
      await Utils.sleep(1500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0150
     * @tc.name   : Video component calls ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0150 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0150')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发拖拽video组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件灰显，效果符合UX规范，灰显效果为0.4
      Logger.info('TEST', '步骤2-1：验证原组件灰显，灰显效果为0.4');
      await Utils.sleep(500);
      
      // 步骤3：自动释放
      Logger.info('TEST', '步骤3：等待自动释放');
      await Utils.sleep(1500); // 等待释放效果
      
      // 步骤3-1：验证组件恢复原有效果
      Logger.info('TEST', '步骤3-1：验证组件恢复原有效果');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0150 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0160
     * @tc.name   : Video component does not call ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0160 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0160')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：不调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：不调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发拖拽video组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件不灰显
      Logger.info('TEST', '步骤2-1：验证原组件不灰显');
      await Utils.sleep(1500); // 等待释放效果
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0160 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0170
     * @tc.name   : Link component calls ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0170 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0170')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发拖拽Link组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件灰显，效果符合UX规范，灰显效果为0.4
      Logger.info('TEST', '步骤2-1：验证原组件灰显，灰显效果为0.4');
      await Utils.sleep(500);
      
      // 步骤3：自动释放
      Logger.info('TEST', '步骤3：等待自动释放');
      await Utils.sleep(1500); // 等待释放效果
      
      // 步骤3-1：验证组件恢复原有效果
      Logger.info('TEST', '步骤3-1：验证组件恢复原有效果');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0170 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0180
     * @tc.name   : Link component does not call ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0180 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0180')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：不调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：不调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发拖拽Link组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件不灰显
      Logger.info('TEST', '步骤2-1：验证原组件不灰显');
      await Utils.sleep(1500); // 等待释放效果
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0180 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0190
     * @tc.name   : Text component calls ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0190 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0190')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发拖拽text组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件灰显，效果符合UX规范，灰显效果为0.4
      Logger.info('TEST', '步骤2-1：验证原组件灰显，灰显效果为0.4');
      await Utils.sleep(500);
      
      // 步骤3：自动释放
      Logger.info('TEST', '步骤3：等待自动释放');
      await Utils.sleep(1500); // 等待释放效果
      
      // 步骤3-1：验证组件恢复原有效果
      Logger.info('TEST', '步骤3-1：验证组件恢复原有效果');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0190 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0200
     * @tc.name   : Text component does not call ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0200 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0200')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：不调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：不调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发拖拽text组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件不灰显
      Logger.info('TEST', '步骤2-1：验证原组件不灰显');
      await Utils.sleep(500);
      
      // 步骤3：自动释放
      Logger.info('TEST', '步骤3：等待自动释放');
      await Utils.sleep(1000); // 等待释放效果
      
      // 步骤3-1：验证组件恢复原有效果
      Logger.info('TEST', '步骤3-1：验证组件恢复原有效果');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0200 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0210
     * @tc.name   : TextArea component calls ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0210 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0210')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发拖拽textArea组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件灰显，效果符合UX规范，灰显效果为0.4
      Logger.info('TEST', '步骤2-1：验证原组件灰显，灰显效果为0.4');
      await Utils.sleep(500);
      
      // 步骤3：自动释放
      Logger.info('TEST', '步骤3：等待自动释放');
      await Utils.sleep(1500); // 等待释放效果
      
      // 步骤3-1：验证组件恢复原有效果
      Logger.info('TEST', '步骤3-1：验证组件恢复原有效果');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0210 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0220
     * @tc.name   : TextArea component does not call ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0220 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0220')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：不调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：不调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发拖拽textArea组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件不灰显
      Logger.info('TEST', '步骤2-1：验证原组件不灰显');
      await Utils.sleep(500);
      
      // 步骤3：自动释放
      Logger.info('TEST', '步骤3：等待自动释放');
      await Utils.sleep(1000); // 等待释放效果
      
      // 步骤3-1：验证组件恢复原有效果
      Logger.info('TEST', '步骤3-1：验证组件恢复原有效果');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0220 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0230
     * @tc.name   : TextInput component calls ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0230 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0230')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发拖拽textInput组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件灰显，效果符合UX规范，灰显效果为0.4
      Logger.info('TEST', '步骤2-1：验证原组件灰显，灰显效果为0.4');
      await Utils.sleep(500);
      
      // 步骤3：自动释放
      Logger.info('TEST', '步骤3：等待自动释放');
      await Utils.sleep(1500); // 等待释放效果
      
      // 步骤3-1：验证组件恢复原有效果
      Logger.info('TEST', '步骤3-1：验证组件恢复原有效果');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0230 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0240
     * @tc.name   : TextInput component does not call ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0240 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0240')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：不调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：不调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发拖拽textInput组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件不灰显
      Logger.info('TEST', '步骤2-1：验证原组件不灰显');
      await Utils.sleep(500);
      
      // 步骤3：自动释放
      Logger.info('TEST', '步骤3：等待自动释放');
      await Utils.sleep(1000); // 等待释放效果
      
      // 步骤3-1：验证组件恢复原有效果
      Logger.info('TEST', '步骤3-1：验证组件恢复原有效果');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0240 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0250
     * @tc.name   : RichEditor component calls ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0250 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0250')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发拖拽richeditor组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件灰显，效果符合UX规范，灰显效果为0.4
      Logger.info('TEST', '步骤2-1：验证原组件灰显，灰显效果为0.4');
      await Utils.sleep(500);
      
      // 步骤3：自动释放
      Logger.info('TEST', '步骤3：等待自动释放');
      await Utils.sleep(1500); // 等待释放效果
      
      // 步骤3-1：验证组件恢复原有效果
      Logger.info('TEST', '步骤3-1：验证组件恢复原有效果');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0250 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0260
     * @tc.name   : RichEditor component does not call ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0260 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0260')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 步骤1：不调用ENABLE_DEFAULT_GRAYED
      Logger.info('TEST', '步骤1：不调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤2：页面自动触发拖拽richeditor组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 步骤2-1：验证原组件不灰显
      Logger.info('TEST', '步骤2-1：验证原组件不灰显');
      await Utils.sleep(500);
      
      // 步骤3：自动释放
      Logger.info('TEST', '步骤3：等待自动释放');
      await Utils.sleep(1000); // 等待释放效果
      
      // 步骤3-1：验证组件恢复原有效果
      Logger.info('TEST', '步骤3-1：验证组件恢复原有效果');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0260 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0270
     * @tc.name   : Parent and child components are non-text components, parent does not call, child calls.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0270 start.`);
      
      // 预置条件：Row为父组件，image为子组件；父组件不调用，子组件调用
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0270')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      Logger.info('TEST', '预置条件：Row为父组件，image为子组件');
      await Utils.sleep(500);
      
      // 步骤1：页面自动触发拖拽子组件
      Logger.info('TEST', '步骤1：等待页面自动触发拖拽子组件');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 预期结果1：子组件灰显
      Logger.info('TEST', '预期结果1：子组件灰显');
      await Utils.sleep(1000);
      
      // 步骤2：页面自动触发拖拽父组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽父组件');
      await Utils.sleep(500);
      
      // 预期结果2：父、子组件均不灰显
      Logger.info('TEST', '预期结果2：父、子组件均不灰显');
      await Utils.sleep(1500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0270 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0280
     * @tc.name   : Parent and child components are non-text components, parent calls, child does not call.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0280 start.`);
      
      // 预置条件：Row为父组件，image为子组件；父组件调用，子组件不调用
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0280')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      Logger.info('TEST', '预置条件：Row为父组件，image为子组件');
      await Utils.sleep(500);
      
      // 步骤1：页面自动触发拖拽子组件
      Logger.info('TEST', '步骤1：等待页面自动触发拖拽子组件');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 预期结果1：子组件不灰显
      Logger.info('TEST', '预期结果1：子组件不灰显');
      await Utils.sleep(1000);
      
      // 步骤2：页面自动触发拖拽父组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽父组件');
      await Utils.sleep(500);
      
      // 预期结果2：父、子组件均灰显
      Logger.info('TEST', '预期结果2：父、子组件均灰显');
      await Utils.sleep(1500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0280 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0290
     * @tc.name   : Parent and child components are non-text components, both call ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0290 start.`);
      
      // 预置条件：Row为父组件，image为子组件；父、子组件均调用
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0290')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      Logger.info('TEST', '预置条件：Row为父组件，image为子组件');
      await Utils.sleep(500);
      
      // 步骤1：页面自动触发拖拽子组件
      Logger.info('TEST', '步骤1：等待页面自动触发拖拽子组件');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 预期结果1：子组件灰显，透明度为0.4
      Logger.info('TEST', '预期结果1：子组件灰显，透明度为0.4');
      await Utils.sleep(1000);
      
      // 步骤2：页面自动触发拖拽父组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽父组件');
      await Utils.sleep(500);
      
      // 预期结果2：父、子组件均灰显，透明度为0.4
      Logger.info('TEST', '预期结果2：父、子组件均灰显，透明度为0.4');
      await Utils.sleep(1500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0290 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0300
     * @tc.name   : Parent and child components are non-text components, both do not call ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0300 start.`);
      
      // 预置条件：Row为父组件，image为子组件；父、子组件均不调用
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0300')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      Logger.info('TEST', '预置条件：Row为父组件，image为子组件');
      await Utils.sleep(500);
      
      // 步骤1：页面自动触发拖拽子组件
      Logger.info('TEST', '步骤1：等待页面自动触发拖拽子组件');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 预期结果1：子组件不灰显
      Logger.info('TEST', '预期结果1：子组件不灰显');
      await Utils.sleep(1000);
      
      // 步骤2：页面自动触发拖拽父组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽父组件');
      await Utils.sleep(500);
      
      // 预期结果2：父、子组件均不灰显
      Logger.info('TEST', '预期结果2：父、子组件均不灰显');
      await Utils.sleep(1500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0300 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0310
     * @tc.name   : Parent and child components are non-text, child A calls, child B does not call.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0310 start.`);
      
      // 预置条件：Row为父组件，image为子组件；父组件调用，子组件A调用，子组件B不调用
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0310')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      Logger.info('TEST', '预置条件：Row为父组件，image为子组件；父组件调用，子组件A调用，子组件B不调用');
      await Utils.sleep(500);
      
      // 步骤1：页面自动触发拖拽子组件A
      Logger.info('TEST', '步骤1：等待页面自动触发拖拽子组件A');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 预期结果1：子组件A灰显，透明度为0.4
      Logger.info('TEST', '预期结果1：子组件A灰显，透明度为0.4');
      await Utils.sleep(1000);
      
      // 步骤2：页面自动触发拖拽子组件B
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽子组件B');
      await Utils.sleep(500);
      
      // 预期结果2：子组件B不灰显
      Logger.info('TEST', '预期结果2：子组件B不灰显');
      await Utils.sleep(1000);
      
      // 步骤3：页面自动触发拖拽父组件
      Logger.info('TEST', '步骤3：等待页面自动触发拖拽父组件');
      await Utils.sleep(500);
      
      // 预期结果3：父、子组件均灰显，透明度为0.4
      Logger.info('TEST', '预期结果3：父、子组件均灰显，透明度为0.4');
      await Utils.sleep(1500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0310 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0320
     * @tc.name   : Parent and child components are non-text, child A opacity 0.4, child B no opacity.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0320 start.`);
      
      // 预置条件：Row为父组件，image为子组件；父组件调用，两个子均不调用；子组件A透明度为0.4，子组件B无透明度
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0320')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      Logger.info('TEST', '预置条件：Row为父组件，image为子组件；父组件调用，两个子均不调用；子组件A透明度为0.4，子组件B无透明度');
      await Utils.sleep(500);
      
      // 步骤1：页面自动触发拖拽子组件A
      Logger.info('TEST', '步骤1：等待页面自动触发拖拽子组件A');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 预期结果1：子组件A灰显，透明度为0.4
      Logger.info('TEST', '预期结果1：子组件A灰显，透明度为0.4');
      await Utils.sleep(1000);
      
      // 步骤2：页面自动触发拖拽子组件B
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽子组件B');
      await Utils.sleep(500);
      
      // 预期结果2：子组件B不灰显
      Logger.info('TEST', '预期结果2：子组件B不灰显');
      await Utils.sleep(1000);
      
      // 步骤3：页面自动触发拖拽父组件
      Logger.info('TEST', '步骤3：等待页面自动触发拖拽父组件');
      await Utils.sleep(500);
      
      // 预期结果3：父、子组件均灰显，子组件A透明度为0.4*0.4=0.16，子组件B透明度为0.4
      Logger.info('TEST', '预期结果3：父、子组件均灰显，子组件A透明度为0.16，子组件B透明度为0.4');
      await Utils.sleep(1500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0320 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0330
     * @tc.name   : Component self opacity 0.4, calls ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0330 start.`);
      
      // 预置条件：组件自身设置透明度0.4，调用ENABLE_DEFAULT_GRAYED
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0330')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      Logger.info('TEST', '预置条件：组件自身设置透明度0.4，调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤1：页面自动触发拖拽组件
      Logger.info('TEST', '步骤1：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 预期结果1：组件的透明度为0.4*0.4=0.16
      Logger.info('TEST', '预期结果1：组件的透明度为0.4*0.4=0.16');
      await Utils.sleep(500);
      
      // 步骤2：自动释放
      Logger.info('TEST', '步骤2：等待自动释放');
      await Utils.sleep(1000); // 等待释放效果
      
      // 预期结果2：组件的透明度还原为0.4
      Logger.info('TEST', '预期结果2：组件的透明度还原为0.4');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0330 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0340
     * @tc.name   : Component self opacity 0.4, calls ENABLE_DEFAULT_GRAYED, release to droppable area.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0340 start.`);
      
      // 预置条件：组件自身设置透明度0.4，调用ENABLE_DEFAULT_GRAYED
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0340')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      Logger.info('TEST', '预置条件：组件自身设置透明度0.4，调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤1：页面自动触发拖拽组件
      Logger.info('TEST', '步骤1：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 预期结果1：组件的透明度为0.4*0.4=0.16
      Logger.info('TEST', '预期结果1：组件的透明度为0.4*0.4=0.16');
      await Utils.sleep(500);
      
      // 步骤2：自动释放至可释放区域
      Logger.info('TEST', '步骤2：等待自动释放至可释放区域');
      await Utils.sleep(1000); // 等待释放效果
      
      // 预期结果2：组件的透明度还原为0.4
      Logger.info('TEST', '预期结果2：组件的透明度还原为0.4');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0340 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0350
     * @tc.name   : Component self opacity 0.4, does not call ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0350 start.`);
      
      // 预置条件：组件自身设置透明度0.4，不调用ENABLE_DEFAULT_GRAYED
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0350')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      Logger.info('TEST', '预置条件：组件自身设置透明度0.4，不调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤1：页面自动触发拖拽组件
      Logger.info('TEST', '步骤1：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 预期结果1：组件的透明度为0.4
      Logger.info('TEST', '预期结果1：组件的透明度为0.4');
      await Utils.sleep(500);
      
      // 步骤2：自动释放
      Logger.info('TEST', '步骤2：等待自动释放');
      await Utils.sleep(1000); // 等待释放效果
      
      // 预期结果2：组件的透明度依然为0.4
      Logger.info('TEST', '预期结果2：组件的透明度依然为0.4');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0350 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0360
     * @tc.name   : Parent opacity 0.2, child A opacity 0.9, child B opacity 0.4, parent calls - drag child.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0360 start.`);
      
      // 预置条件：父组件透明度0.2，子组件A透明度0.9，子组件B透明度为0.4；父组件调用ENABLE_DEFAULT_GRAYED
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0360')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      Logger.info('TEST', '预置条件：父组件透明度0.2，子组件A透明度0.9，子组件B透明度0.4，父组件调用');
      await Utils.sleep(500);
      
      // 步骤1：页面自动触发拖拽子组件A
      Logger.info('TEST', '步骤1：等待页面自动触发拖拽子组件A');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 预期结果1：子组件A的透明度为0.9*0.2*0.4=0.072
      Logger.info('TEST', '预期结果1：子组件A的透明度为0.9*0.2*0.4=0.072');
      await Utils.sleep(500);
      
      // 步骤2：自动释放
      Logger.info('TEST', '步骤2：等待自动释放');
      await Utils.sleep(1000);
      
      // 预期结果2：子组件A的透明度还原为0.9*0.2=0.18
      Logger.info('TEST', '预期结果2：子组件A的透明度还原为0.9*0.2=0.18');
      await Utils.sleep(500);
      
      // 步骤3：页面自动触发拖拽子组件B
      Logger.info('TEST', '步骤3：等待页面自动触发拖拽子组件B');
      await Utils.sleep(500);
      
      // 预期结果3：子组件B的透明度为0.9*0.4*0.4=0.144
      Logger.info('TEST', '预期结果3：子组件B的透明度为0.9*0.4*0.4=0.144');
      await Utils.sleep(500);
      
      // 步骤4：自动释放至可落入区域
      Logger.info('TEST', '步骤4：等待自动释放至可落入区域');
      await Utils.sleep(1000);
      
      // 预期结果4：子组件B的透明度还原为0.9*0.4=0.36
      Logger.info('TEST', '预期结果4：子组件B的透明度还原为0.9*0.4=0.36');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0360 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0370
     * @tc.name   : Parent opacity 0.2, child A opacity 0.9, child B opacity 0.4, parent calls - drag parent.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0370 start.`);
      
      // 预置条件：父组件透明度0.2，子组件A透明度0.9，子组件B透明度为0.4；父组件调用ENABLE_DEFAULT_GRAYED
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0370')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      Logger.info('TEST', '预置条件：父组件透明度0.2，子组件A透明度0.9，子组件B透明度0.4，父组件调用');
      await Utils.sleep(500);
      
      // 步骤1：页面自动触发拖拽父组件
      Logger.info('TEST', '步骤1：等待页面自动触发拖拽父组件');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 预期结果1-1：子组件A的透明度为0.9*0.2*0.4=0.072
      Logger.info('TEST', '预期结果1-1：子组件A的透明度为0.9*0.2*0.4=0.072');
      
      // 预期结果1-2：子组件B的透明度为0.9*0.4*0.4=0.144
      Logger.info('TEST', '预期结果1-2：子组件B的透明度为0.9*0.4*0.4=0.144');
      await Utils.sleep(500);
      
      // 步骤2：自动释放至可落入区域
      Logger.info('TEST', '步骤2：等待自动释放至可落入区域');
      await Utils.sleep(1000);
      
      // 预期结果2-1：子组件A的透明度还原为0.9*0.2=0.18
      Logger.info('TEST', '预期结果2-1：子组件A的透明度还原为0.9*0.2=0.18');
      
      // 预期结果2-2：子组件B的透明度还原为0.9*0.4=0.36
      Logger.info('TEST', '预期结果2-2：子组件B的透明度还原为0.9*0.4=0.36');
      await Utils.sleep(500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0370 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0380
     * @tc.name   : Child component opacity 3, parent calls ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0380 start.`);
      
      // 预置条件：子组件设置透明度3，父组件调用ENABLE_DEFAULT_GRAYED
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0380')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      Logger.info('TEST', '预置条件：子组件设置透明度3，父组件调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤1：页面自动触发拖拽子组件
      Logger.info('TEST', '步骤1：等待页面自动触发拖拽子组件');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 预期结果1：子组件的透明度为1*0.4=0.4
      Logger.info('TEST', '预期结果1：子组件的透明度为1*0.4=0.4');
      await Utils.sleep(1000);
      
      // 步骤2：页面自动触发拖拽父组件
      Logger.info('TEST', '步骤2：等待页面自动触发拖拽父组件');
      await Utils.sleep(500);
      
      // 预期结果2：父组件的透明度为1*0.4=0.4
      Logger.info('TEST', '预期结果2：父组件的透明度为1*0.4=0.4');
      await Utils.sleep(1500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0380 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0400
     * @tc.name   : Continuously drag component 15 times with fast, slow, and normal speed.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0400 start.`);
      
      // 预置条件：组件调用ENABLE_DEFAULT_GRAYED
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0400')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      Logger.info('TEST', '预置条件：组件调用ENABLE_DEFAULT_GRAYED');
      await Utils.sleep(500);
      
      // 步骤1：页面自动触发连续拖拽15次
      Logger.info('TEST', '步骤1：等待页面自动触发连续拖拽15次');
      await Utils.sleep(1000); // 等待页面加载2秒+开始拖拽
      
      // 预期结果1：原组件的灰显效果正确，释放后正确还原
      Logger.info('TEST', '预期结果1：原组件的灰显效果正确，释放后正确还原');
      await Utils.sleep(1000);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0400 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0410
     * @tc.name   : DragController single object, calls ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0410 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0410')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      Logger.info('TEST', '预置条件：新建ets页面');
      await Utils.sleep(500);
      
      // 步骤1：页面自动触发拖拽组件
      Logger.info('TEST', '步骤1：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 预期结果1：原组件不灰显
      Logger.info('TEST', '预期结果1：原组件不灰显');
      await Utils.sleep(1500); // 等待释放效果
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0410 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0420
     * @tc.name   : DragController multiple objects, calls ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0420 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0420')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      Logger.info('TEST', '预置条件：新建ets页面');
      await Utils.sleep(500);
      
      // 步骤1：页面自动触发依次拖拽三个按钮
      Logger.info('TEST', '步骤1：等待页面自动触发拖拽Button1');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      Logger.info('TEST', '等待页面自动触发拖拽Button2');
      await Utils.sleep(2000);
      
      Logger.info('TEST', '等待页面自动触发拖拽Button3');
      await Utils.sleep(2000);
      
      // 预期结果1：原组件不灰显
      Logger.info('TEST', '预期结果1：原组件不灰显');
      await Utils.sleep(1500);
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0420 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0430
     * @tc.name   : ItemDrag drag, calls ENABLE_DEFAULT_GRAYED.
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0430 start.`);
      
      // 预置条件：新建ets页面
      Settings.createWindow('testability/pages/scenario/action_event/DragGrayout/DragGrayout0430')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      Logger.info('TEST', '预置条件：新建ets页面');
      await Utils.sleep(500);
      
      // 步骤1：页面自动触发拖拽组件
      Logger.info('TEST', '步骤1：等待页面自动触发拖拽效果');
      await Utils.sleep(2500); // 等待页面加载2秒+拖拽效果500ms
      
      // 预期结果1：原组件不灰显
      Logger.info('TEST', '预期结果1：原组件不灰显');
      await Utils.sleep(1500); // 等待释放效果
      
      // 最后截图
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0430 finish.`);
      done()
    })






  })
}