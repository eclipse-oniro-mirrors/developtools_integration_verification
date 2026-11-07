/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
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
import { Driver, ON, Component, MouseButton } from '@kit.TestKit'
/*
 * SUB_ACE_UI_ATTRIBUTES_FONT_INTERFACE_0010:设置文本颜色
 *
 * Settings.createWindow(config.url)：
 *  创建窗口，更改窗口基本配置，更改方式详见model/Settings createWindow方法
 *
 * windowSnap.snapShot(globalThis.context)：
 *  窗口截屏&图片文件保存，存储在设备端
 *  存储文件固定，单挑用例执行后覆盖，用于自动化UI对比
 *  支持调试更改文件名为时间戳格式，更改model/snapShot createAndGetFile方法 注释L35，放开L32，L33
 *
 * Logger日志使用方法：
 *  import Logger form './model/Logger'
 *  Logger.info(TAG,`config = ${config}, err = ${JSON.stringify(exception)}`)
 * */

export default function aceDragGrayOut() {

  describe('aceDragGrayOut', () => {
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
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0550
     * @tc.name   : [DragPreviewMode.DISABLE_SCALE, DragPreviewMode.ENABLE_DEFAULT_SHADOW] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_DRAG_GRAYOUT_0550', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0550 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut01')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut01_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut01_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0590
     * @tc.name   : [DragPreviewMode.DISABLE_SCALE, DragPreviewMode.ENABLE_DEFAULT_SHADOW, DragPreviewMode.ENABLE_DRAG_ITEM_GRAY_EFFECT] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0590 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut02')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut02_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut02_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0650
     * @tc.name   : [DragPreviewMode.ENABLE_DEFAULT_SHADOW, DragPreviewMode.ENABLE_DEFAULT_SHADOW] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0650 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut03')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut03_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut03_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0650 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0530
     * @tc.name   : [DragPreviewMode.AUTO, DragPreviewMode.ENABLE_DRAG_ITEM_GRAY_EFFECT] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0530 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut04')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut04_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut04_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0630
     * @tc.name   : [DragPreviewMode.ENABLE_DEFAULT_SHADOW, DragPreviewMode.ENABLE_DEFAULT_RADIUS, DragPreviewMode.ENABLE_DRAG_ITEM_GRAY_EFFECT] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0630 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut05')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut05_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut05_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0630 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0560
     * @tc.name   : [DragPreviewMode.DISABLE_SCALE, DragPreviewMode.ENABLE_DEFAULT_RADIUS] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0560 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut06')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut06_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut06_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0560 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0520
     * @tc.name   : [DragPreviewMode.AUTO, DragPreviewMode.ENABLE_DEFAULT_RADIUS] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0520 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut07')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut07_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut07_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0570
     * @tc.name   : [DragPreviewMode.DISABLE_SCALE, DragPreviewMode.ENABLE_DRAG_ITEM_GRAY_EFFECT] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0570 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut08')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut08_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut08_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0660
     * @tc.name   : [DragPreviewMode.ENABLE_DEFAULT_RADIUS, DragPreviewMode.ENABLE_DEFAULT_RADIUS] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0660 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut09')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut09_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut09_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0610
     * @tc.name   : [DragPreviewMode.ENABLE_DEFAULT_SHADOW, DragPreviewMode.ENABLE_DEFAULT_RADIUS] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0610 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut10')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut10_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut10_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0610 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0640
     * @tc.name   : [DragPreviewMode.ENABLE_DEFAULT_RADIUS, DragPreviewMode.ENABLE_DRAG_ITEM_GRAY_EFFECT] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0640 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut11')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut11_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut11_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0640 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0600
     * @tc.name   : [DragPreviewMode.DISABLE_SCALE, DragPreviewMode.ENABLE_DEFAULT_RADIUS, DragPreviewMode.ENABLE_DRAG_ITEM_GRAY_EFFECT] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0600 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut12')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut12_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut12_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0620
     * @tc.name   : [DragPreviewMode.ENABLE_DEFAULT_SHADOW, DragPreviewMode.ENABLE_DRAG_ITEM_GRAY_EFFECT] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0620 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut13')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut13_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut13_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0620 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0580
     * @tc.name   : [DragPreviewMode.DISABLE_SCALE, DragPreviewMode.ENABLE_DEFAULT_SHADOW, DragPreviewMode.ENABLE_DEFAULT_RADIUS] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0580 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut14')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut14_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut14_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0670
     * @tc.name   : [DragPreviewMode.ENABLE_DRAG_ITEM_GRAY_EFFECT, DragPreviewMode.ENABLE_DRAG_ITEM_GRAY_EFFECT] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0670', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0670 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut15')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut15_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut15_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0670 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0680
     * @tc.name   : [DragPreviewMode.ENABLE_DEFAULT_SHADOW] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0680', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0680 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut16')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut16_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut16_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0680 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0690
     * @tc.name   : [DragPreviewMode.ENABLE_DEFAULT_RADIUS] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0690', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0690 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut17')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut17_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut17_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0690 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0700
     * @tc.name   : [DragPreviewMode.ENABLE_DRAG_ITEM_GRAY_EFFECT] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0700 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut18')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut18_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut18_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0700 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0710
     * @tc.name   : dragPreviewOptions mode is empty and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0710 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut19')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut19_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut19_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0710 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0460
     * @tc.name   : [DragPreviewMode.DISABLE_SCALE] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0460 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut20')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut20_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut20_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0480
     * @tc.name   : [DragPreviewMode.ENABLE_DEFAULT_RADIUS] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0480 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut21')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut21_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut21_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0450
     * @tc.name   : [DragPreviewMode.AUTO] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0450 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut22')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut22_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut22_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0470
     * @tc.name   : [DragPreviewMode.ENABLE_DEFAULT_SHADOW] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0470 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut23')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut23_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut23_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0490
     * @tc.name   : [DragPreviewMode.ENABLE_DRAG_ITEM_GRAY_EFFECT] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0490 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut24')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut24_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut24_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0500
     * @tc.name   : [DragPreviewMode.AUTO, DragPreviewMode.DISABLE_SCALE] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0500 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut25')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut25_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut25_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0040
     * @tc.name   : Column component without calling dragPreviewOptions and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0040 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut26')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut26_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut26_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0540
     * @tc.name   : [DragPreviewMode.AUTO, DragPreviewMode.DISABLE_SCALE, DragPreviewMode.ENABLE_DEFAULT_SHADOW, DragPreviewMode.ENABLE_DEFAULT_RADIUS, DragPreviewMode.ENABLE_DRAG_ITEM_GRAY_EFFECT] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0540 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut27')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut27_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut27_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0440
     * @tc.name   : DragPreviewMode to undefined and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0440 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut28')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut28_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut28_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DRAG_GRAYOUT_0510
     * @tc.name   : [DragPreviewMode.AUTO, DragPreviewMode.ENABLE_DEFAULT_SHADOW] and drag column
     * @tc.desc   : Verify drag grayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DRAG_GRAYOUT_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0510 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceDragGrayOut/AceDragGrayOut29')
      let driver:Driver=Driver.create();
      let column: Component = await driver.waitForComponent(ON.id('AceDragGrayOut29_01'),1000);
      let column2: Component = await driver.waitForComponent(ON.id('AceDragGrayOut29_02'),1000);
      await column.dragTo(column2);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DRAG_GRAYOUT_0510 finish.`);
      done()
    })
  })
}