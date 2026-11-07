/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';
import { Driver, ON, Component } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function listComponentContentTest() {
  describe('listComponentContentTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
      }
      Settings.windowClass.destroyWindow((err: BusinessError) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`);
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      });
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0010
     * @tc.name   : ComponentContent类型的header、footer深浅色切换
     * @tc.desc   : Verify listandgrid list component interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0010 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listComponentContent01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、点击"Change"按钮切换深浅色
      let changeButton: Component = await driver.waitForComponent(ON.id('changeColorButton_01'), 1000);
      await changeButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0010')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0030
     * @tc.name   : footerComponent或者headerComponent_创建和删除
     * @tc.desc   : Verify listandgrid list component interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0030 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listComponentContent03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、点击"Test++"按钮可以完成Component的创建和删除切换测试
      let testButton: Component = await driver.waitForComponent(ON.id('testButton_03'), 1000);
      await testButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0030')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0040
     * @tc.name   : footerComponent或者headerComponent_sticky属性遍枚举值
     * @tc.desc   : Verify listandgrid list component interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0040 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listComponentContent04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、点击"Sticky"按钮实现吸顶或吸底效果
      // 遍历StickyStyle枚举值：Header -> Footer -> Header | Footer -> Header
      let stickyButton: Component = await driver.waitForComponent(ON.id('stickyButton_04'), 1000);
      
      // 第一次点击：Header -> Footer
      await stickyButton.click();
      await driver.waitForIdle(1000, 2000);
      
      // 第二次点击：Footer -> Header | Footer
      await stickyButton.click();
      await driver.waitForIdle(1000, 2000);
      
      // 第三次点击：Header | Footer -> Header
      await stickyButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0040')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0060
     * @tc.name   : footerComponent或者headerComponent_结合ListItemGroupStyle
     * @tc.desc   : Verify listandgrid list component interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0060 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listComponentContent06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、为ListItemGroup设置卡片样式
      // 页面已设置ListItemGroupStyle.CARD，直接截图验证
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0060')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0090
     * @tc.name   : footerComponent或者headerComponent_事件回调
     * @tc.desc   : Verify listandgrid list component interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0090 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listComponentContent09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、滑动页面触发onScrollIndex，onReachStart，onReachEnd，onScrollStart，onScrollStop，onScrollVisibleContentChange
      let list: Component = await driver.waitForComponent(ON.id('listComponentContent_09'), 1000);
      let rect = await list.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let startY = rect.top + (rect.bottom - rect.top) * 0.8;
      let endY = rect.top + (rect.bottom - rect.top) * 0.2;

      // 向下滑动
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(1000, 2000);

      // 继续滑动到底部
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(1000, 2000);

      // 向上滑动到顶部
      await driver.swipe(centerX, endY, centerX, startY, 1000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0090')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0100
     * @tc.name   : 新增或者删除footerComponent或者headerComponent,所有scroller跳转正常
     * @tc.desc   : Verify listandgrid list component interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0100 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listComponentContent10')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、测试scrollTo，scrollEdge，fling，scrollPage，scrollToIndex，scrollBy，scrollToItemInGroup
      // 这些操作在页面中通过按钮触发
      let scrollToButton: Component = await driver.waitForComponent(ON.id('scrollToButton_10'), 1000);
      await scrollToButton.click();
      await driver.waitForIdle(1000, 2000);

      let scrollByButton: Component = await driver.waitForComponent(ON.id('scrollByButton_10'), 1000);
      await scrollByButton.click();
      await driver.waitForIdle(1000, 2000);

      let scrollToIndexButton: Component = await driver.waitForComponent(ON.id('scrollToIndexButton_10'), 1000);
      await scrollToIndexButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0100')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0110
     * @tc.name   : footerComponent或者headerComponent_基于lazyforeach或者repeat滑动测试
     * @tc.desc   : Verify listandgrid list component interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0110 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listComponentContent11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、滑动lazyforeach或者repeat的页面，观察head和foot
      // 预期效果：head和foot显示正常
      let listComponent: Component = await driver.waitForComponent(ON.id('listComponentContent_11'), 1000);
      
      // 向下滑动到底部，观察footer
      await listComponent.scrollToBottom(2000);
      await driver.waitForIdle(500, 2000);
      
      // 向上滑动到顶部，观察header
      await listComponent.scrollToTop(2000);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0110')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0120
     * @tc.name   : footerComponent或者headerComponent_结合chidrenmainsize属性
     * @tc.desc   : Verify listandgrid list component interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0120 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listComponentContent12')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、给list和listitemgroup设置ChildrenMainSize
      // 页面已设置，直接验证滑动是否正常
      // 预期效果：页面滑动正常
      let listComponent: Component = await driver.waitForComponent(ON.id('listComponentContent_12'), 1000);
      
      // 向下滑动到底部
      await listComponent.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      
      // 向上滑动到顶部
      await listComponent.scrollToTop(2000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0120')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0070
     * @tc.name   : ListItemGroup中设置Footer吸底
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0070 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listInterface07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、创建List组件嵌套ListItemGroup组件
      // 2、sticky属性设置StickyStyle.Footer
      // 3、编译hap包
      // 页面已设置，直接截图验证
      // 预期效果：ListItemGroup的footer吸底，header不吸底
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0070')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0090
     * @tc.name   : ListItemGroup中设置Header吸顶
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0090 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listInterface09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、创建List组件嵌套ListItemGroup组件
      // 2、sticky属性设置StickyStyle.Header
      // 3、编译hap包
      // 页面已设置，直接截图验证
      // 预期效果：ListItemGroup的header吸顶，footer不吸底
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0090')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0230
     * @tc.name   : List的space参数设置为10lpx
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0230 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listInterface23')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、space参数设置为10lpx
      // 2、编译hap包
      // 页面已设置，直接截图验证
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0230')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1230
     * @tc.name   : 滚动条状态设置为Auto
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1230 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listInterface123')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、设置scrollBar(BarState.Auto)
      // 2、编译hap包
      // 页面已设置，直接截图验证
      // 预期效果：按需显示(触摸时显示，2s后消失)
      // 使用scrollToBottom触发滚动条显示
      let listComponent: Component = await driver.waitForComponent(ON.id('listInterface_123'), 1000);
      await listComponent.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1230')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1460
     * @tc.name   : 设置组件滑动效果为阴影效果
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1460 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listInterface146')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、设置EdgeEffect.Fade
      // 2、编译hap包
      // 页面已设置，直接截图验证
      // 预期效果：List组件滑动到存在半圆阴影效果
      // 滑动列表到底部以触发边缘阴影效果
      let listComponent: Component = await driver.waitForComponent(ON.id('listInterface_146'), 1000);
      await listComponent.scrollToBottom(2000);
      await driver.waitForIdle(500, 2000);
      
      // 滑动到顶部以触发顶部边缘阴影效果
      await listComponent.scrollToTop(2000);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1460')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1510
     * @tc.name   : List组件friction属性测试
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1510 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listInterface151')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、创建List组件
      // 2、设置friction(0.6)
      // 3、编译hap包
      // 页面已设置，直接验证滑动是否正常
      // 预期效果：手指滑动组件可以正常滑动
      let listComponent: Component = await driver.waitForComponent(ON.id('listInterface_151'), 1000);
      
      // 向下滑动到底部
      await listComponent.scrollToBottom(2000);
      await driver.waitForIdle(500, 2000);
      
      // 向上滑动到顶部
      await listComponent.scrollToTop(2000);
      await driver.waitForIdle(500, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1510')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_1510 finish.`);
      done()
    })
  })
}
