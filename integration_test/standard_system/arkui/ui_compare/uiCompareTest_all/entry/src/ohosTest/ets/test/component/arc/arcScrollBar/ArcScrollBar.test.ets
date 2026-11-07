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

export default function arcScrollBarTest () {

  describe('arcScrollBarTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err:BusinessError) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0010
     * @tc.name   : ArcScrollBar binds same scroller with List, Grid, Scroll
     * @tc.desc   : Verify crown arcscrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0010 start.`);
      Settings.createWindow('testability/pages/component/arc/arcScrollBar/arcScrollBar01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - ArcScrollBar与List绑定相同scroller
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0010_01')
      await Utils.sleep(1000)
      
      // 步骤2: 滑动List组件，观察ArcScrollBar联动效果
      let scrollButton: Component = await driver.waitForComponent(ON.text('滑动List'), 1000);
      await scrollButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0010_02')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0020
     * @tc.name   : ArcScrollBar not binds same scroller with List, Grid, Scroll
     * @tc.desc   : Verify crown arcscrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0020 start.`);
      Settings.createWindow('testability/pages/component/arc/arcScrollBar/arcScrollBar02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - ArcScrollBar不与List绑定相同scroller
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0020_01')
      await Utils.sleep(1000)
      
      // 步骤2: 滑动List组件，观察ArcScrollBar无联动效果
      let scrollButton: Component = await driver.waitForComponent(ON.text('滑动List'), 1000);
      await scrollButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0020_02')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0030
     * @tc.name   : ArcScrollBar sets state to On
     * @tc.desc   : Verify crown arcscrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0030 start.`);
      Settings.createWindow('testability/pages/component/arc/arcScrollBar/arcScrollBar03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - ArcScrollBar state为On，应该常驻显示
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0030_01')
      await Utils.sleep(1000)
      
      // 步骤2: 等待2秒后观察滚动条是否仍然显示
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0030_02')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0040
     * @tc.name   : ArcScrollBar sets state to Auto
     * @tc.desc   : Verify crown arcscrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0040 start.`);
      Settings.createWindow('testability/pages/component/arc/arcScrollBar/arcScrollBar04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - ArcScrollBar state为Auto
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0040_01')
      await Utils.sleep(1000)
      
      // 步骤2: 滑动组件触发滚动条显示
      let scrollButton: Component = await driver.waitForComponent(ON.text('滑动触发'), 1000);
      await scrollButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0040_02')
      await Utils.sleep(1000)
      
      // 步骤3: 等待2秒后观察滚动条是否消失
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0040_03')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0050
     * @tc.name   : ArcScrollBar sets state to Off
     * @tc.desc   : Verify crown arcscrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0050 start.`);
      Settings.createWindow('testability/pages/component/arc/arcScrollBar/arcScrollBar05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - ArcScrollBar state为Off，应该不显示
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0050_01')
      await Utils.sleep(1000)
      
      // 步骤2: 滑动组件，观察滚动条仍然不显示
      let scrollButton: Component = await driver.waitForComponent(ON.text('滑动测试'), 1000);
      await scrollButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0050_02')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0060
     * @tc.name   : ArcScrollBar dynamically changes state
     * @tc.desc   : Verify crown arcscrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0060 start.`);
      Settings.createWindow('testability/pages/component/arc/arcScrollBar/arcScrollBar06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0060_01')
      await Utils.sleep(1000)
      
      // 步骤2: 切换到On状态
      let onButton: Component = await driver.waitForComponent(ON.text('切换到On'), 1000);
      await onButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0060_02')
      await Utils.sleep(1000)
      
      // 步骤3: 切换到Off状态
      let offButton: Component = await driver.waitForComponent(ON.text('切换到Off'), 1000);
      await offButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0060_03')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0070
     * @tc.name   : ArcScrollBar not sets state
     * @tc.desc   : Verify crown arcscrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0070 start.`);
      Settings.createWindow('testability/pages/component/arc/arcScrollBar/arcScrollBar07')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - ArcScrollBar不设置state，默认按需显示
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0070_01')
      await Utils.sleep(1000)
      
      // 步骤2: 滑动触发滚动条显示
      let scrollButton: Component = await driver.waitForComponent(ON.text('滑动触发'), 1000);
      await scrollButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0070_02')
      await Utils.sleep(1000)
      
      // 步骤3: 等待2秒后观察滚动条是否消失
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0070_03')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0080
     * @tc.name   : List and Grid call scrollTo and scrollToIndex
     * @tc.desc   : Verify crown arcscrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0080 start.`);
      Settings.createWindow('testability/pages/component/arc/arcScrollBar/arcScrollBar08')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0080_01')
      await Utils.sleep(1000)
      
      // 步骤2: List调用scrollTo跳转
      let listScrollButton: Component = await driver.waitForComponent(ON.text('List跳转'), 1000);
      await listScrollButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0080_02')
      await Utils.sleep(1000)
      
      // 步骤3: Grid调用scrollToIndex跳转
      let gridScrollButton: Component = await driver.waitForComponent(ON.text('Grid跳转'), 1000);
      await gridScrollButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0080_03')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0100
     * @tc.name   : Use crown rotation to scroll List, Grid, Scroll
     * @tc.desc   : Verify crown arcscrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0100 start.`);
      Settings.createWindow('testability/pages/component/arc/arcScrollBar/arcScrollBar09')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0100_01')
      await Utils.sleep(1000)
      
      // 步骤2: 模拟表冠旋转滚动List
      let listCrownButton: Component = await driver.waitForComponent(ON.text('表冠滚动List'), 1000);
      await listCrownButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0100_02')
      await Utils.sleep(1000)
      
      // 步骤3: 模拟表冠旋转滚动Grid
      let gridCrownButton: Component = await driver.waitForComponent(ON.text('表冠滚动Grid'), 1000);
      await gridCrownButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0100_03')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT__CROWN_ARCSCROLLBAR_0100 finish.`);
      done()
    })

  })
}