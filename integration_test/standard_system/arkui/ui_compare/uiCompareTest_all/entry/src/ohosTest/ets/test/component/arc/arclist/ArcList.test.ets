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

export default function arcListTest() {
  describe('arcListTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_0010
     * @tc.name   : Arclist
     * @tc.desc   : Verify arclist interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_0010 start.`);
      Settings.createWindow('testability/pages/component/arc/arclist/arcList01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 观察初始状态
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_0010_01')
      await Utils.sleep(1000)

      // 步骤2: 拖拽ArcListItem
      let arcListItem: Component = await driver.waitForComponent(ON.id('arcListItem_01_0'), 1000);
      // 长按后拖拽操作
      await arcListItem.longClick();
      await driver.waitForIdle(300, 1000);
      // 拖拽到目标位置
      await driver.swipe(200, 200, 200, 300, 500);
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_0010_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_0030
     * @tc.name   : Arclist
     * @tc.desc   : Verify arclist interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_0030 start.`);
      Settings.createWindow('testability/pages/component/arc/arclist/arcList02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 底部过界时，给列表尾端增加/删除元素
      let addBottomButton: Component = await driver.waitForComponent(ON.id('addBottomButton'), 1000);
      await addBottomButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_0030_01')
      await Utils.sleep(1000)

      // 步骤2: 顶部过界时，给列表开头增加/删除元素
      let addTopButton: Component = await driver.waitForComponent(ON.id('addTopButton'), 1000);
      await addTopButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_0030_02')
      await Utils.sleep(1000)

      // 步骤3: 给显示区域上方增删item
      let addAboveButton: Component = await driver.waitForComponent(ON.id('addAboveButton'), 1000);
      await addAboveButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_0030_03')
      await Utils.sleep(1000)

      // 步骤4: 给显示区域下方增删item
      let addBelowButton: Component = await driver.waitForComponent(ON.id('addBelowButton'), 1000);
      await addBelowButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_0030_04')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_0040
     * @tc.name   : Arclist
     * @tc.desc   : Verify arclist interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_0040 start.`);
      Settings.createWindow('testability/pages/component/arc/arclist/arcList03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 从没有item开始增加item
      let addItemButton: Component = await driver.waitForComponent(ON.id('addItemButton'), 1000);
      await addItemButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_0040')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_DIRECTION_0010
     * @tc.name   : Arclist direction
     * @tc.desc   : Verify arclist direction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_DIRECTION_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_DIRECTION_0010 start.`);
      Settings.createWindow('testability/pages/component/arc/arclist/arcList04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 动态切换direction的值：Ltr，Rtl
      let switchDirectionButton: Component = await driver.waitForComponent(ON.id('switchDirectionButton'), 1000);
      await switchDirectionButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_DIRECTION_0010')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_DIRECTION_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_PM_0010
     * @tc.name   : Arclist pm
     * @tc.desc   : Verify arclist pm interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_PM_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_PM_0010 start.`);
      Settings.createWindow('testability/pages/component/arc/arclist/arcList05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 观察padding或margin效果
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_PM_0010_01')
      await Utils.sleep(1000)

      // 测试过界回弹动效
      let arcList: Component = await driver.waitForComponent(ON.id('arcList_05'), 1000);
      let rect = await arcList.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      await driver.swipe(centerX, centerY, centerX, centerY - 200, 500);
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_PM_0010_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_PM_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0040
     * @tc.name   : Arclist scrollbar
     * @tc.desc   : Verify arclist scrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0040 start.`);
      Settings.createWindow('testability/pages/component/arc/arclist/arcList06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 重复抛滑滚动条（通过滑动ArcList来触发滚动条交互）
      let arcList: Component = await driver.waitForComponent(ON.id('arcList_06'), 1000);
      let rect = await arcList.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let startY = rect.top + (rect.bottom - rect.top) / 2;
      let endY = startY + 200;
      // 快速滑动触发抛滑效果
      await driver.swipe(centerX, startY, centerX, endY, 200);
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0040')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0050
     * @tc.name   : Arclist scrollbar
     * @tc.desc   : Verify arclist scrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0050 start.`);
      Settings.createWindow('testability/pages/component/arc/arclist/arcList07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 增加item
      let addItemButton: Component = await driver.waitForComponent(ON.id('addItemButton_07'), 1000);
      await addItemButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0050_01')
      await Utils.sleep(1000)

      // 步骤2: 减少item
      let removeItemButton: Component = await driver.waitForComponent(ON.id('removeItemButton_07'), 1000);
      await removeItemButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0050_02')
      await Utils.sleep(1000)

      // 拖动滚动条滑动（通过滑动ArcList来触发）
      let arcList: Component = await driver.waitForComponent(ON.id('arcList_07'), 1000);
      let rect = await arcList.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let startY = rect.top + (rect.bottom - rect.top) / 2;
      let endY = startY + 100;
      await driver.swipe(centerX, startY, centerX, endY, 300);
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0050_03')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0060
     * @tc.name   : Arclist scrollbar
     * @tc.desc   : Verify arclist scrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0060 start.`);
      Settings.createWindow('testability/pages/component/arc/arclist/arcList08')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 观察ArcList内元素不满一屏时滚动条不显示
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0060')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0070
     * @tc.name   : Arclist scrollbar
     * @tc.desc   : Verify arclist scrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0070 start.`);
      Settings.createWindow('testability/pages/component/arc/arclist/arcList09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤3: 滑动页面
      let arcList: Component = await driver.waitForComponent(ON.id('arcList_09'), 1000);
      let rect = await arcList.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let startY = rect.top + (rect.bottom - rect.top) / 2;
      let endY = startY + 200;
      await driver.swipe(centerX, startY, centerX, endY, 500);
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0070')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0080
     * @tc.name   : Arclist scrollbar
     * @tc.desc   : Verify arclist scrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0080 start.`);
      Settings.createWindow('testability/pages/component/arc/arclist/arcList10')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2: 触摸滚动条（通过点击滚动条区域来测试）
      // 由于内置滚动条无法直接通过ID定位，通过滑动ArcList右侧区域来测试
      let arcList: Component = await driver.waitForComponent(ON.id('arcList_10'), 1000);
      // 在右侧区域点击，模拟点击滚动条
      await driver.click(380, 300);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0080')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0090
     * @tc.name   : Arclist scrollbar
     * @tc.desc   : Verify arclist scrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0090 start.`);
      Settings.createWindow('testability/pages/component/arc/arclist/arcList11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 滑动内容区后反方向拖动滚动条
      let arcList: Component = await driver.waitForComponent(ON.id('arcList_11'), 1000);
      let rect = await arcList.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let startY = rect.top + (rect.bottom - rect.top) / 2;
      let endY = startY + 100;
      await driver.swipe(centerX, startY, centerX, endY, 500);
      await driver.waitForIdle(500, 2000);
      
      // 在右侧区域反方向滑动，模拟拖动滚动条
      await driver.swipe(380, 300, 380, 200, 300);
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0090')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0110
     * @tc.name   : Arclist scrollbar
     * @tc.desc   : Verify arclist scrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0110 start.`);
      Settings.createWindow('testability/pages/component/arc/arclist/arcList12')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: ArcList动态切换direction的值：Ltr，Rtl
      let switchDirectionButton: Component = await driver.waitForComponent(ON.id('switchDirectionButton_12'), 1000);
      await switchDirectionButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0110')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLIST_SCROLLBAR_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLISTITEM_0010
     * @tc.name   : Arclistitem
     * @tc.desc   : Verify arclistitem interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_ARCLISTITEM_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLISTITEM_0010 start.`);
      Settings.createWindow('testability/pages/component/arc/arclist/arcList13')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 分别设置ArcListItem的多态样式
      // 测试normal状态
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLISTITEM_0010_01')
      await Utils.sleep(1000)

      // 测试pressed状态
      let arcListItem: Component = await driver.waitForComponent(ON.id('arcListItem_13_0'), 1000);
      await arcListItem.longClick();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLISTITEM_0010_02')
      await Utils.sleep(1000)

      // 测试disabled状态
      let disableButton: Component = await driver.waitForComponent(ON.id('disableButton'), 1000);
      await disableButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLISTITEM_0010_03')
      await Utils.sleep(1000)

      // 测试clicked状态
      let enableButton: Component = await driver.waitForComponent(ON.id('enableButton'), 1000);
      await enableButton.click();
      await driver.waitForIdle(500, 2000);
      await arcListItem.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLISTITEM_0010_04')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_ARCLISTITEM_0010 finish.`);
      done()
    })
  })
}
