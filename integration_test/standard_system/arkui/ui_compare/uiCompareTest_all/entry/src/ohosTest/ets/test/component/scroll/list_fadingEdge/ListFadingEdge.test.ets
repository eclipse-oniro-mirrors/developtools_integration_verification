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

export default function listFadingEdgeTest () {

  describe('listFadingEdgeTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0040
     * @tc.name   : List component sets fadingEdgeLength parameter to 20vp
     * @tc.desc   : Verify list tv fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0040 start.`);
      Settings.createWindow('testability/pages/component/scroll/list_fadingEdge/listFadingEdge01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - List应该显示渐隐效果
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0040_01')
      await Utils.sleep(1000)
      
      // 步骤2: 滚动到顶部，观察渐隐效果
      let scrollToTopButton: Component = await driver.waitForComponent(ON.text('滚动到顶部'), 1000);
      await scrollToTopButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0040_02')
      await Utils.sleep(1000)
      
      // 步骤3: 滚动到底部，观察渐隐效果
      let scrollToBottomButton: Component = await driver.waitForComponent(ON.text('滚动到底部'), 1000);
      await scrollToBottomButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0040_03')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0030
     * @tc.name   : List component sets fadingEdge parameter to undefined
     * @tc.desc   : Verify list tv fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0030 start.`);
      Settings.createWindow('testability/pages/component/scroll/list_fadingEdge/listFadingEdge02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - List应该没有渐隐效果
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0030_01')
      await Utils.sleep(1000)
      
      // 步骤2: 滚动到顶部，观察无渐隐效果
      let scrollToTopButton: Component = await driver.waitForComponent(ON.text('滚动到顶部'), 1000);
      await scrollToTopButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0030_02')
      await Utils.sleep(1000)
      
      // 步骤3: 滚动到底部，观察无渐隐效果
      let scrollToBottomButton: Component = await driver.waitForComponent(ON.text('滚动到底部'), 1000);
      await scrollToBottomButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0030_03')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0100
     * @tc.name   : List component with ListItemGroup sets fadingEdge effect
     * @tc.desc   : Verify list tv fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0100 start.`);
      Settings.createWindow('testability/pages/component/scroll/list_fadingEdge/listFadingEdge03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - ListItemGroup应该显示渐隐效果
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0100_01')
      await Utils.sleep(1000)
      
      // 步骤2: 滚动到顶部，观察渐隐效果
      let scrollToTopButton: Component = await driver.waitForComponent(ON.text('滚动到顶部'), 1000);
      await scrollToTopButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0100_02')
      await Utils.sleep(1000)
      
      // 步骤3: 滚动到底部，观察渐隐效果
      let scrollToBottomButton: Component = await driver.waitForComponent(ON.text('滚动到底部'), 1000);
      await scrollToBottomButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0100_03')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0050
     * @tc.name   : List component sets fadingEdgeLength parameter to greater than half of list height
     * @tc.desc   : Verify list tv fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0050 start.`);
      Settings.createWindow('testability/pages/component/scroll/list_fadingEdge/listFadingEdge04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - 渐隐效果长度应该是二分之一的list高
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0050_01')
      await Utils.sleep(1000)
      
      // 步骤2: 滚动到顶部，观察渐隐效果
      let scrollToTopButton: Component = await driver.waitForComponent(ON.text('滚动到顶部'), 1000);
      await scrollToTopButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0050_02')
      await Utils.sleep(1000)
      
      // 步骤3: 滚动到底部，观察渐隐效果
      let scrollToBottomButton: Component = await driver.waitForComponent(ON.text('滚动到底部'), 1000);
      await scrollToBottomButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0050_03')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0070
     * @tc.name   : List component sets fadingEdgeLength parameter to undefined
     * @tc.desc   : Verify list tv fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0070 start.`);
      Settings.createWindow('testability/pages/component/scroll/list_fadingEdge/listFadingEdge05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - 渐隐效果长度应该是默认值32vp
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0070_01')
      await Utils.sleep(1000)
      
      // 步骤2: 滚动到顶部，观察渐隐效果
      let scrollToTopButton: Component = await driver.waitForComponent(ON.text('滚动到顶部'), 1000);
      await scrollToTopButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0070_02')
      await Utils.sleep(1000)
      
      // 步骤3: 滚动到底部，观察渐隐效果
      let scrollToBottomButton: Component = await driver.waitForComponent(ON.text('滚动到底部'), 1000);
      await scrollToBottomButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0070_03')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0060
     * @tc.name   : List component sets fadingEdgeLength parameter to negative value
     * @tc.desc   : Verify list tv fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0060 start.`);
      Settings.createWindow('testability/pages/component/scroll/list_fadingEdge/listFadingEdge06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - 渐隐效果长度应该是默认值32vp
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0060_01')
      await Utils.sleep(1000)
      
      // 步骤2: 滚动到顶部，观察渐隐效果
      let scrollToTopButton: Component = await driver.waitForComponent(ON.text('滚动到顶部'), 1000);
      await scrollToTopButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0060_02')
      await Utils.sleep(1000)
      
      // 步骤3: 滚动到底部，观察渐隐效果
      let scrollToBottomButton: Component = await driver.waitForComponent(ON.text('滚动到底部'), 1000);
      await scrollToBottomButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0060_03')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0090
     * @tc.name   : List component with ListItem sets fadingEdge effect
     * @tc.desc   : Verify list tv fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0090 start.`);
      Settings.createWindow('testability/pages/component/scroll/list_fadingEdge/listFadingEdge07')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - ListItem应该显示渐隐效果
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0090_01')
      await Utils.sleep(1000)
      
      // 步骤2: 滚动到顶部，观察渐隐效果
      let scrollToTopButton: Component = await driver.waitForComponent(ON.text('滚动到顶部'), 1000);
      await scrollToTopButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0090_02')
      await Utils.sleep(1000)
      
      // 步骤3: 滚动到底部，观察渐隐效果
      let scrollToBottomButton: Component = await driver.waitForComponent(ON.text('滚动到底部'), 1000);
      await scrollToBottomButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0090_03')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0110
     * @tc.name   : List component with ListItemGroup and ListItem spacing layout sets fadingEdge effect
     * @tc.desc   : Verify list tv fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0110 start.`);
      Settings.createWindow('testability/pages/component/scroll/list_fadingEdge/listFadingEdge08')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - 混合布局应该显示渐隐效果
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0110_01')
      await Utils.sleep(1000)
      
      // 步骤2: 滚动到顶部，观察渐隐效果
      let scrollToTopButton: Component = await driver.waitForComponent(ON.text('滚动到顶部'), 1000);
      await scrollToTopButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0110_02')
      await Utils.sleep(1000)
      
      // 步骤3: 滚动到底部，观察渐隐效果
      let scrollToBottomButton: Component = await driver.waitForComponent(ON.text('滚动到底部'), 1000);
      await scrollToBottomButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0110_03')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0150
     * @tc.name   : List component with modifier sets fadingEdge effect
     * @tc.desc   : Verify list tv fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0150 start.`);
      Settings.createWindow('testability/pages/component/scroll/list_fadingEdge/listFadingEdge09')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - modifier场景应该显示渐隐效果
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0150_01')
      await Utils.sleep(1000)
      
      // 步骤2: 滚动到顶部，观察渐隐效果
      let scrollToTopButton: Component = await driver.waitForComponent(ON.text('滚动到顶部'), 1000);
      await scrollToTopButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0150_02')
      await Utils.sleep(1000)
      
      // 步骤3: 滚动到底部，观察渐隐效果
      let scrollToBottomButton: Component = await driver.waitForComponent(ON.text('滚动到底部'), 1000);
      await scrollToBottomButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0150_03')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0320
     * @tc.name   : List component sliding to bottom shows top edge fading and no bottom edge fading
     * @tc.desc   : Verify list tv fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0320 start.`);
      Settings.createWindow('testability/pages/component/scroll/list_fadingEdge/listFadingEdge10')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0320_01')
      await Utils.sleep(1000)
      
      // 步骤2: 滑动到列表底部，查看列表上下边缘的展示情况
      let scrollToBottomButton: Component = await driver.waitForComponent(ON.text('滚动到底部'), 1000);
      await scrollToBottomButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0320_02')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0330
     * @tc.name   : List component initial state and sliding to top shows different edge fading effects
     * @tc.desc   : Verify list tv fadingedge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0330 start.`);
      Settings.createWindow('testability/pages/component/scroll/list_fadingEdge/listFadingEdge11')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      
      // 等待页面加载完成
      await Utils.sleep(1000);
      
      // 步骤1: 观察初始状态 - 不滑动列表，查看列表上下边缘的展示情况
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0330_01')
      await Utils.sleep(1000)
      
      // 步骤2: 向下滑动列表
      let scrollDownButton: Component = await driver.waitForComponent(ON.text('向下滑动'), 1000);
      await scrollDownButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0330_02')
      await Utils.sleep(1000)
      
      // 步骤3: 再滑到列表顶部，查看列表上下边缘的展示情况
      let scrollToTopButton: Component = await driver.waitForComponent(ON.text('滑动到顶部'), 1000);
      await scrollToTopButton.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0330_03')
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_TV_FADINGEDGE_0330 finish.`);
      done()
    })

  })
}